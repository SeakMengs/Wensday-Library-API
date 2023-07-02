import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'languages';
const attributes = {
    language_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true, 
    },
    language: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    admin_id: {
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
    tableName: "languages",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

const Languages = sequelize.define(modelName, attributes, options);

export default Languages;