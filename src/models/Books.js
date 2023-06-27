import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const modelName = 'books';
const attributes = {
    book_id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
    },
    title: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    cover_image: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    language: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    has_active_borrow_requests:{
        type: DataTypes.TINYINT,
        allowNull: false,
    },
    user_borrow_count: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    publish_year: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    category_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'categories',
            id: 'categories_id'
        },
        allowNull: false,
    },
    add_by_admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'admins',
            id: 'admin_id'
        },
        allowNull: false,
    },
    active_borrow_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'active_borrows',
            id: 'active_borrow_id'
        },
        allowNull: false,
    },
    publication_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'publication',
            id: 'publication_id'
        },
        allowNull: false,
    },
    author_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'author',
            id: 'author_id'
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
    tableName: "Books",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
}

const Books = sequelize.define(modelName, attributes, options);

export default Books;