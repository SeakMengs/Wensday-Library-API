import mysql from "mysql2";
import mysqlConfig from "../configs/mysql.js";

// create the connection to database
const connection = mysql.createConnection({
    host: mysqlConfig.host,
    user: mysqlConfig.user,
    password: mysqlConfig.password,
    database: mysqlConfig.database,
    port: mysqlConfig.port,
});

console.log("mysqlConfig", mysqlConfig, '\n');

// open the MySQL connection
connection.connect(error => {
    if (error) throw error;
    console.log("Successfully connected to the database.");
});

export default connection;