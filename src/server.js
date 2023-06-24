import express from "express";
import dotenv from "dotenv";
import router from "./routes/route.js";
import mysqlConfig from "./configs/mysql.js";
import sequelize from "./services/sequelize.js";

// Load environment variables from .env file
dotenv.config()

const app = express();
const port = process.env.SERVER_PORT || 8080;

// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// default route
app.get("/", (req, res) => {
    res.json({ message: "Welcome to WENSDAY API." });
});

// Routes
app.use(router);

try {
    console.log('\nDatabase Config:', mysqlConfig)
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
} catch (error) {
    console.error('Unable to connect to the database:', error);
}

app.listen(port, () => {
    console.log(`Server is listening on port http://127.0.0.1:${port} 🚀`);
});

export default app;