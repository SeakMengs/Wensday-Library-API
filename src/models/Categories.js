import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";
import Users from "./Users.js"

const model = 'Categories';
const attributes = {
    category_id: {
        type: DataTypes.BIGINT,
        primarykey: true,
        autoIncrement: true, 
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    add_by_admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Admins',
            key: 'admin_id'
        },
    },
    created_at: {
        type: DataTypes.DATE,
    }
};

const options = {
    tableName: "Categories",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

const Categories = sequelize.define(modelName, attributes, options);