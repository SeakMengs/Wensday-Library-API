/*
 * This is just a sample data model. Feel free to delete it. after you create your own real data model -- Seakmeng
 * Docs: https://sequelize.org/docs/v6/core-concepts/model-basics/
 */
import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = "service";
const attributes = {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    service: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    company_id: {
        type: DataTypes.INTEGER,
        /*
         * This is a reference to another model, it's table name not object name
         * Docs: https://sequelize.org/docs/v6/other-topics/constraints-and-circularities/#enforcing-a-foreign-key-reference-without-constraints
         */
        references: {
            // Can be both a string representing the table name or a Sequelize model
            model: 'company',
            key: 'id'
        },
    }
}
const options = {
    tableName: "service",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    timestamps: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Service = sequelize.define(modelName, attributes, options);

export default Service;