import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'publication';
const attributes = {
    publication_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    publish_year: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    series_title: {
        type: DataTypes.STRING,
    },
    volume: {
        type: DataTypes.TINYINT,
    },
    edition: {
        type: DataTypes.TINYINT,
    },
    number_of_volumes: {
        type: DataTypes.TINYINT,
    },
    number_of_pages: {
        type: DataTypes.TINYINT,
    },
    publisher_id: {
        type: DataTypes.BIGINT,
        references: {
            model: 'publisher',
            key: 'publisher_id',
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
    tableName: "publication",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Publication = sequelize.define(modelName, attributes, options);

export default Publication;