import sequelize from "../services/sequelize.js";
import { DataTypes } from "sequelize";

const model = 'Books';
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
            model: 'Categories',
            id: 'categories_id'
        }
    },
    add_by_admin_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'Admins',
            id: 'admin_id'
        }
    },
    active_borrow_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'active_borrows',
            id: 'active_borrow_id'
        }
    },
    publication_id: {
        type: DataTypes.BIGINT,
        reference: {
            model: 'publication',
            id: 'publication_id'
        }
    },
    created_at: {
        type: DataTypes.DATE,
    }
}

const options = {
    tableName: "Books",
    // If timestamps are true, Sequelize will create createdAt and updatedAt columns for your database table.
    // timestamps: false,
    createdAt: 'create_at',
    updatedAt: false,
}

const Books = sequelize.define(modelName, attributes, options);