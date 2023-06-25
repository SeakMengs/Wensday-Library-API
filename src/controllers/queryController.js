/*
 * Reference: 
 * https://sequelize.org/docs/v6/core-concepts/model-querying-finders/
 * https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/
 */

import { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users } from "../models/Relationship.js";

export const getAllCategory = async (req, res) => {
    try {
        const categories = await Categories.findAll();
        res.status(200).json(categories)
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
                    as : 'publication',
                    include: [
                        {
                            model: Publisher,
                            as : 'publishers',
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
        res.status(200).json(books);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

export const getAllBookById = async (req, res) => {
    const { id : book_id } = req.params;
    try {
        const books = await Books.findOne({
            where: {book_id : book_id},
            include: [
                {
                    model: Publication,
                    as : 'publication',
                    include: [
                        {
                            model: Publisher,
                            as : 'publishers',
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
        res.status(200).json(books);
    } catch (error) {
        res.status(500).json({ message: error.message});
    }
}

export const getAllUserById = async (req, res) => {
    const { id : user_id } = req.params;
    try{
        const users = await Users.findOne({
            where: { user_id : user_id},
            include: [
                {
                    model: BalanceHistories,
                    as: 'balance_histories',
                },
                {
                    model: ActiveBorrow,
                    as: 'active_borrows',
                },
                {
                    model: UserBorrowHistory,
                    as: 'user_borrow_histories',
                }
            ]
        });
        res.status(200).json(users);
    }catch(error){
        res.status(500).json({ message: error.message});
    }
}
export const userLogin = async (req, res) => {
    try {
        const { email, password } = req.body

        const emailFromDatabase = 'test@gmail.com'
        const passwordFromDatabase = '123456'

        // console.log('email', email, 'password', password)

        // compare email and password here

        if (emailFromDatabase === email && passwordFromDatabase === password) {
            res.status(200).json({ message: "Login Success" })
        } else {
            res.status(401).json({ message: "Login Failed" })
        }

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