import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const model = 'balance_histories';
const attributes = {
    balance_history_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    user_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Users',
            key: 'user_id'
        }
    },
    paid_to_admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Admins',
            key: 'admin_id'
        }
    },
    paid_amount: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
    }
}

const options = {
    tableName: "balance_histories",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const BalanceHistories = sequelize.define(modelName, attributes, options);
