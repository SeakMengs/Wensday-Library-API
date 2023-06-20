/*
 * This is just a sample data model. Feel free to delete it. after you create your own real data model -- Seakmeng
 * Docs: https://sequelize.org/docs/v6/core-concepts/model-basics/
 */
import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";
import Company from "./Company.js";

const modelName = "company_user";
const attributes = {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    }
}
const options = {
    tableName: "companyuser",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    timestamps: false,
    // hide attributes
    defaultScope: {
        attributes: { exclude: ['password'] },
    }
}

//* NOTE: sequelize.define(modelName, attributes, options)
const CompanyUser = sequelize.define(modelName, attributes, options);

CompanyUser.hasMany(Company, {
    foreignKey: 'companyuser_id',
    as: 'companies'
});

export default CompanyUser;