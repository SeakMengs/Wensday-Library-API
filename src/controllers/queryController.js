import connection from "../services/database.js";

export const getOneTaskById = ((req, res) => {
    const taskId = req.params.id;
    const query = `SELECT * FROM task WHERE id = ${taskId}`;

    connection.query(query, (err, result) => {
        if (err) throw err;

        if (result.length === 0) {
            res.status(404).json({ message: "Task not found!" });
            return;
        }

        res.json(result[0]);
    });
});