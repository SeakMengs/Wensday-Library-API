import sequelize from "../services/sequelize.js";
import { DATE, DataTypes } from "sequelize";

const model = 'Authors';
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
    book_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Books',
            key: 'book_id'
        }
    },
    created_at: {
        type: DataTypes.DATE,
    }
}

const options = {
    tableName: "Authors",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Authors = sequelize.define(modelName, attributes, options);