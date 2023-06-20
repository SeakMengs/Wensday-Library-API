import dotenv from 'dotenv';

dotenv.config();

const mysqlConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USERNAME || 'root',
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    port: process.env.DB_PORT || 3306,
    dialect: process.env.DB_CONNECTION || 'mysql',
}

export default mysqlConfig;