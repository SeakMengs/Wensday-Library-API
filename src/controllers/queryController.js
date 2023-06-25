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