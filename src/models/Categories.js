import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'categories';
const attributes = {
    category_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
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
    },
    updated_at: {
        type: DataTypes.DATE,
    },
};

const options = {
    tableName: "categories",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

const Categories = sequelize.define(modelName, attributes, options);

export default Categories;