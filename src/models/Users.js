import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'users';
const attributes = {
    user_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    profile_url: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    balance: {
        type: DataTypes.BIGINT,
        allowNull: false,
        defaultValue: 0
    },
    title: {
        type: DataTypes.STRING,
    },
    gender: {
        type: DataTypes.STRING,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    contact_number: {
        type: DataTypes.STRING,
    },
    debt: {
        type: DataTypes.BIGINT,
    },
    created_at: {
        type: DataTypes.DATE,
    },
    updated_at: {
        type: DataTypes.DATE,
    },
}

const options = {
    tableName: "users",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    // defaultScope: {
    //     attributes: { exclude: ['password'] },
    // },
}

const Users = sequelize.define(modelName, attributes, options);

export default Users;