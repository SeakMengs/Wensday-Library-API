import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'active_borrows';
const attributes = {
    active_borrow_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    book_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Books',
            key: 'book_id'
        },
        allowNull: false,
    },
    user_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Users',
            key: 'user_id'
        },
        allowNull: false,
    },
    borrow_date: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    date_to_be_return: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    updated_at: {
        type: DataTypes.DATE,
        allowNull: false,
    }
}

const options = {
    tableName: "active_borrows",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

//* NOTE: sequelize.define(modelName, attributes, options)
const ActiveBorrow = sequelize.define(modelName, attributes, options);

export default ActiveBorrow;