import { getOneTaskById} from "../controllers/queryController.js";
import express from "express";

const router = express.Router();

router.get('/test', (req, res) => {
    res.json({ message: "Hello World" });
});

router.get("/task/:id", getOneTaskById);

export default router;