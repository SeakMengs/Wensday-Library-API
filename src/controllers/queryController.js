/*
 * Reference: 
 * https://sequelize.org/docs/v6/core-concepts/model-querying-finders/
 * https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/
 */

import { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users } from "../models/Relationship.js";
import sequelize from "../services/sequelize.js";

export const getAllCategory = async (req, res) => {
    try {
        const categories = await Categories.findAll({
            include: [{
                model: Admins,
                as: 'admin',
                attributes: ['admin_id', 'username']
            },
        ]
        });
        res.status(200).json({categories: categories})
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllActiveBorrow = async (req, res) => {
    try {
        const activeBorrow = await ActiveBorrow.findAll();
        res.status(200).json(activeBorrow)
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllBook = async (req, res) => {
    try {
        const books = await Books.findAll({
            include: [
                {
                    model: Publication,
                    as: 'publication',
                    include: [
                        {
                            model: Publisher,
                            as: 'publishers',
                        }
                    ]
                },
                {
                    model: Categories,
                    as: 'categories',
                },
                {
                    model: Admins,
                    as: 'admin',
                },
                {
                    model: ActiveBorrow,
                    as: 'active_borrow',
                    include: [
                        {
                            model: Users,
                            as: 'user',
                        }
                    ]
                },
                {
                    model: Author,
                    as: 'authors',
                }
            ]
        });
        res.status(200).json({books: books});
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllBookById = async (req, res) => {
    const { id: book_id } = req.params;
    try {
        const books = await Books.findOne({
            where: { book_id: book_id },
            include: [
                {
                    model: Publication,
                    as: 'publication',
                    include: [
                        {
                            model: Publisher,
                            as: 'publishers',
                        }
                    ]
                },
                {
                    model: Categories,
                    as: 'categories',
                },
                {
                    model: Admins,
                    as: 'admin',
                },
                {
                    model: ActiveBorrow,
                    as: 'active_borrow',
                    include: [
                        {
                            model: Users,
                            as: 'user',
                            attributes: ['username']
                        }
                    ]
                },
                {
                    model: Author,
                    as: 'authors',
                }
            ]
        });
        res.status(200).json(books);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getOneUserById = async (req, res) => {
    const { id: user_id } = req.params;
    try {
        const user = await Users.findOne({
            where: { user_id: user_id },
            include: [
                {
                    model: BalanceHistories,
                    as: 'balance_histories',
                    include: [
                        {
                            model: Admins,
                            as: 'admin',
                            attributes: ['admin_id','username']
                        }
                    ],
                },
                {
                    model: ActiveBorrow,
                    as: 'active_borrows',
                    include: [
                        {
                            model: Books,
                            as: 'book',
                        },
                    ],
                },
                {
                    model: UserBorrowHistory,
                    as: 'user_borrow_histories',
                    include: [
                        {
                            model: Books,
                            as: 'book',
                        }
                    ],
                }
            ]
        });
        res.status(200).json({
            user_data: user
        });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const userLogin = async (req, res) => {
    try {
        const { email, password } = req.body

        const user = await Users.findOne({
            where: { email: email },
            include: [
                {
                    model: BalanceHistories,
                    as: 'balance_histories',
                    include: [
                        {
                            model: Admins,
                            as: 'admin',
                            attributes: ['admin_id','username']
                        }
                    ],
                },
                {
                    model: ActiveBorrow,
                    as: 'active_borrows',
                    include: [
                        {
                            model: Books,
                            as: 'book',
                        },
                    ],
                },
                {
                    model: UserBorrowHistory,
                    as: 'user_borrow_histories',
                    include: [
                        {
                            model: Books,
                            as: 'book',
                        }
                    ]
                }
            ]
        });

        if (user?.password === password) {
            res.status(200).json({
                message: "Login Success",
                user_data: user
            })
        } else {
            res.status(401).json({ message: "Login Failed" })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const adminLogin = async (req, res) => {
    try {
        const { email: username, password } = req.body

        const user = await Admins.findOne({
            where: { username: username },
        });

        if (user?.password === password) {
            res.status(200).json({
                message: "Login Success",
                user_data: user
            })
        } else {
            res.status(401).json({ message: "Login Failed" })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const userSignup = async (req, res) => {
    try {
        if (!req.body.username) res.status(401).json({ message: "Username cannot be empty" })
        if (!req.body.email) res.status(401).json({ message: "Email cannot be empty" })
        if (!req.body.password) res.status(401).json({ message: "Password cannot be empty" })

        const findUserEmail = await Users.findOne({
            where: { email: req.body.email }
        })
        if (findUserEmail) res.status(401).json({ message: "Email already exist" })

        const findUserName = await Users.findOne({
            where: { username: req.body.username }
        })
        if (findUserName) res.status(401).json({ message: "Username already exist" })

        const user = Users.create(req.body)

        if (user) {
            res.status(200).json({
                message: "Signup Success",
                user_data: user
            })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}