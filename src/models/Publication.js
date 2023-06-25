import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const model = 'publication';
const attributes = {
    publication_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    year: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    series_title: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    volume: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    edition: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    number_of_volumes: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    numbrt_of_pages: {
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
    }
}

const options = {
    tableName: "publication",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Publication = sequelize.define(modelName, attributes, options);