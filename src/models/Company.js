/*
 * This is just a sample data model. Feel free to delete it. after you create your own real data model -- Seakmeng
 * Docs: https://sequelize.org/docs/v6/core-concepts/model-basics/
 */
import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";
import Feedback from "./Feedback.js";

const modelName = "company";
const attributes = {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    companyuser_id: {
        type: DataTypes.INTEGER,
        /*
         * This is a reference to another model, it's table name not object name
         * Docs: https://sequelize.org/docs/v6/other-topics/constraints-and-circularities/#enforcing-a-foreign-key-reference-without-constraints
         */
        references: {
            // Can be both a string representing the table name or a Sequelize model
            model: 'companyuser',
            key: 'id'
        },
    }
}
const options = {
    tableName: "company",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    timestamps: false,
}

//* NOTE: sequelize.define(modelName, attributes, options)
const Company = sequelize.define(modelName, attributes, options);

Company.hasMany(Feedback, {
    foreignKey: 'company_id',
    as: 'feedbacks'
});

export default Company;