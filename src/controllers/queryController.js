/*
 * Reference: 
 * https://sequelize.org/docs/v6/core-concepts/model-querying-finders/
 * https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/
 */

import { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users } from "../models/Relationship.js";
import { Sequelize } from "sequelize";
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
        res.status(200).json({ categories: categories })
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllBook = async (req, res) => {
    try {
        const books = await Books.findAll({
            order: [['created_at', 'DESC']],
            include: [
                {
                    model: Publication,
                    as: 'publication',
                    include: [
                        {
                            model: Publisher,
                            as: 'publisher',
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
                            as: 'publisher',
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
            order: [
                ['balance_histories', 'created_at', 'DESC'],
                ['user_borrow_histories', 'created_at', 'DESC'],
                ['active_borrows', 'created_at', 'DESC']
            ],
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
                    order: [['created_at', 'DESC']],
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

export const createPublisher = async (req, res) => {
    try {
        const existPublisher = await Publisher.findOne({
            where: { name: req.body.name }
        })

        if (existPublisher) {
            res.status(401).json({ message: "Publisher already exist" })
            return
        }

        const publisher = await Publisher.create({
            name: req.body.name,
            admin_id: req.body.admin_id,
            address: req.body.city,
        })

        if (publisher) {
            res.status(200).json({
                message: "Create Publisher Success",
                publisher: publisher
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

        const balance = await Users.findOne({
            where: { user_id: user_id }
        })

        if (balance.balance + amount < 0) {
            res.status(401).json({ message: "Not enough balance" })
            return
        }
        if (balance.debt + amount < 0) {
            res.status(401).json({ message: "The amount of deduction is beyond current user's debt" })
            return
        }

        let updateLogic = {
            balance: Sequelize.literal(`balance + ${amount}`),
        }

        if (amount < 0) {
            // we also + debt with amount   
            updateLogic.debt = Sequelize.literal(`debt + ${amount}`)
        }

        const user = await Users.update(
            updateLogic,
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

export const getAllAuthor = async (req, res) => {
    try {
        const authors = await Author.findAll();

        if (authors) {
            res.status(200).json({
                authors: authors
            })
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllPublisher = async (req, res) => {
    try {
        const publishers = await Publisher.findAll();

        if (publishers) {
            res.status(200).json({
                publishers: publishers
            })
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const addBook = async (req, res) => {
    //Docs: https://sequelize.org/docs/v6/other-topics/transactions/
    // First, we start a transaction from your connection and save it into a variable
    const t = await sequelize.transaction();
    try {

        const { book, publication } = req.body

        const existBook = await Books.findOne({
            where: { title: book.title }
        })

        if (existBook) {
            res.status(401).json({ message: "Book already exist" })
            return
        }

        const savePublication = await Publication.create({
            publish_year: publication.publish_year,
            series_title: publication.series_title,
            volume: publication.volume,
            edition: publication.edition,
            number_of_volumes: publication.number_of_volumes,
            number_of_pages: publication.number_of_pages,
            publisher_id: publication.publisher_id,
        }, { transaction: t });

        const saveBook = await Books.create({
            title: book.title,
            description: book.description,
            cover_image: book.cover_image,
            language: book.language,
            has_active_borrow_requests: false,
            user_borrow_count: 0,
            category_id: book.category_id,
            author_id: book.author_id,
            add_by_admin_id: book.add_by_admin_id,
            publication_id: savePublication.publication_id
        }, { transaction: t });

        // If the execution reaches this line, no errors were thrown.
        // We commit the transaction.
        // throw new Error('Rollback test');

        await t.commit();
        if (saveBook) {
            res.status(200).json({
                message: "Create Book Success",
                book: saveBook
            })
        }

    } catch (error) {
        // If the execution reaches this line, an error was thrown.
        // We rollback the transaction.
        await t.rollback();

        console.log("rollback")

        res.status(500).json({ message: error.message });
    }
}

export const updateReturnBook = async (req, res) => {
    try {
        const { active_borrow_id } = req.params;

        const returnBook = await sequelize.query(`CALL insert_user_borrow_history(:activeBorrowId)`, {
            // this is the way to pass parameter to stored procedure
            replacements: { activeBorrowId: active_borrow_id }
        })

        res.status(200).json({
            message: "Return Book Success",
            returnBook: returnBook
        })
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const borrowBook = async (req, res) => {
    try {
        const { book_id, user_id } = req.body

        console.log(book_id, user_id)

        if (!book_id || !user_id) {
            res.status(401).json({ message: "Book id or user id is empty" })
            return
        }

        const active_borrow = await ActiveBorrow.create({
            book_id: book_id,
            user_id: user_id,
            borrow_date: new Date(),
            // one week from now
            // 7 days * 24 hours * 60 minutes * 60 seconds * 1000 milliseconds
            date_to_be_return: new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000),
        })

        if (active_borrow) {
            const updateBookAvailablity = await Books.update(
                { has_active_borrow_requests: true },
                { where: { book_id: book_id } }
            );

            res.status(200).json({
                message: "Borrow Book Success",
                active_borrow: active_borrow
            })
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}