import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'admins';
const attributes = {
    admin_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    password: {
        type: DataTypes.STRING,
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
    tableName: "admins",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    // defaultScope: {
    //     attributes: { exclude: ['password'] },
    // },
}

const Admins = sequelize.define(modelName, attributes, options);

export default Admins;