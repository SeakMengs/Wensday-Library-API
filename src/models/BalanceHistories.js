import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'balance_histories';
const attributes = {
    balance_history_id: {
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
    paid_to_admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'admins',
            key: 'admin_id'
        },
        allowNull: false,
    },
    paid_amount: {
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
    tableName: "balance_histories",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

//* NOTE: sequelize.define(modelName, attributes, options)
const BalanceHistories = sequelize.define(modelName, attributes, options);

export default BalanceHistories;
