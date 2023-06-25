import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const model = 'Admins';
const attributes = {
    admin_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    user_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
    }
}

const options = {
    tableName: "Admins",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

const Admins = sequelize.define(modelName, attributes, options);