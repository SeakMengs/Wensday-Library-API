import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'authors';
const attributes = {
    author_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'admins',
            id: 'admin_id'
        },
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
    tableName: "authors",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Authors = sequelize.define(modelName, attributes, options);

export default Authors;