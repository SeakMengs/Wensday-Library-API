import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'publisher';
const attributes = {
    publisher_id : {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    city: {
        type: DataTypes.STRING,
    },
    admin_id: {
        type: DataTypes.BIGINT,
        references: {
            model: 'admin',
            key: 'admin_id',
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
    tableName: "publisher",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

const Publisher = sequelize.define(modelName, attributes, options);

export default Publisher;