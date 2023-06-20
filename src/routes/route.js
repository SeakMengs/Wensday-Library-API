import express from "express";
import { getOneUserById, getAllCompaniesByUserId } from "../controllers/queryController.js";

const router = express.Router();

router.get('/test', (req, res) => {
    res.json({ message: "Hello World" });
});

router.get("/companyUser/:id", getOneUserById);

router.get("/companyUser/:id/companies", getAllCompaniesByUserId);

export default router;