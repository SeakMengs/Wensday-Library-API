import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'user_borrow_history';
const attributes = {
    user_borrow_history_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    user_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'users',
            key: 'user_id'
        },
        allowNull: false,
    },
    book_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'books',
            key: 'book_id'
        },
        allowNull: false,
    },
    borrow_date: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    return_date: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    date_to_be_return: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    total_borrow_day: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
    },
    updated_at: {
        type: DataTypes.DATE,
    },
}   

const options = {
    tableName: "user_borrow_history",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

const UserBorrowHistory = sequelize.define(modelName, attributes, options);

export default UserBorrowHistory;