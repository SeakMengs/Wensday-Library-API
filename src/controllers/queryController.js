/*
 * Reference: 
 * https://sequelize.org/docs/v6/core-concepts/model-querying-finders/
 * https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/
 */

import { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users } from "../models/Relationship.js";
import { Sequelize } from "sequelize";

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
        res.status(200).json({ categories: categories })
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
                    as: 'category',
                },
                {
                    model: Admins,
                    as: 'admin',
                    attributes: ['admin_id', 'username']
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
                    as: 'author',
                }
            ]
        });
        res.status(200).json({ books: books });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllBookById = async (req, res) => {
    const { id: book_id } = req.params;
    try {
        const book = await Books.findOne({
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
                    as: 'category',
                },
                {
                    model: Admins,
                    as: 'admin',
                    attributes: ['admin_id', 'username']
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
                    as: 'author',
                }
            ]
        });
        res.status(200).json({ book: book });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getOneAdminById = async (req, res) => {
    const { id: admin_id } = req.params;
    try {
        const admin = await Admins.findOne({
            where: { admin_id: admin_id },
        });

        if (admin) {
            res.status(200).json({ admin_data: admin });
        }
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
                            attributes: ['admin_id', 'username']
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
            ],
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
                            attributes: ['admin_id', 'username']
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
        if (!req.body.username) {
            res.status(401).json({ message: "Username cannot be empty" })
            return
        }
        if (!req.body.email) {
            res.status(401).json({ message: "Email cannot be empty" })
            return
        }
        if (!req.body.password) {
            res.status(401).json({ message: "Password cannot be empty" })
            return
        }

        const findUserEmail = await Users.findOne({
            where: { email: req.body.email }
        })

        if (findUserEmail) {
            res.status(401).json({ message: "Email already exist" })
            return
        }

        const findUserName = await Users.findOne({
            where: { username: req.body.username }
        })

        if (findUserName) {
            res.status(401).json({ message: "Username already exist" })
            return
        }

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

export const createCategory = async (req, res) => {
    try {
        const existCategory = await Categories.findOne({
            where: { name: req.body.category_name }
        })

        if (existCategory) {
            res.status(401).json({ message: "Category already exist" })
            return
        }

        const category = await Categories.create({
            name: req.body.category_name,
            add_by_admin_id: req.body.add_by_admin_id
        })

        if (category) {
            res.status(200).json({
                message: "Create Category Success",
                category: category
            })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const createAuthor = async (req, res) => {
    try {
        const existAuthor = await Author.findOne({
            where: { name: req.body.author_name }
        })

        if (existAuthor) {
            res.status(401).json({ message: "Author already exist" })
            return
        }

        const author = await Author.create({
            name: req.body.author_name,
            admin_id: req.body.admin_id
        })

        if (author) {
            res.status(200).json({
                message: "Create Author Success",
                author: author
            })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllActiveBorrow = async (req, res) => {
    try {
        const active_borrows = await ActiveBorrow.findAll({
            include: [
                {
                    model: Users,
                    as: 'user',
                    attributes: { exclude: ['password'] }
                },
                {
                    model: Books,
                    as: 'book',
                },
            ],
        });

        if (active_borrows) {
            res.status(200).json({
                active_borrows: active_borrows
            })
        }

    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const updateBalance = async (req, res) => {
    try {
        const { user_id, amount, admin_id } = req.body

        const user = await Users.update(
            {
                balance: Sequelize.literal(`balance + ${amount}`),
            },
            {
                where: { user_id: user_id }
            }
        )
        // when console.log user, it will return [1] if success
        if (user[0] === 1) {
            // store history
            const history = await BalanceHistories.create({
                user_id: user_id,
                paid_amount: amount,
                paid_to_admin_id: admin_id
            })

            if (history) {
                res.status(200).json({
                    message: "Update Balance Success",
                    user: user
                })
                return
            }
        }

        res.status(401).json({ message: "Update Balance Failed" })
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const returnBook = async (req, res) => {
    try {
        
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}