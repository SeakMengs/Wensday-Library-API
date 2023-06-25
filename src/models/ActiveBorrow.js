import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const model = 'active_borrow';
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
        }
    },
    user_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Users',
            key: 'user_id'
        }
    },
    borrow_date: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    date_to_be_teturn: {
        type: DataTypes.DATE,
        allowNull: false,
    },
}

const options = {
    tableName: "active_borrows",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const ActiveBorrow = sequelize.define(modelName, attributes, options);