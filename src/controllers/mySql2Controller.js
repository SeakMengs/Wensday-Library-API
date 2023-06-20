//! This controller is deprecated. I keep it here for reference. only.

// import connection from "../services/database.js";

// export const getOneUserById = ((req, res) => {
//     const company_user_id = req.params.id;
//     const query = `SELECT * FROM companyUser WHERE id = ${company_user_id}`;
//     connection.query(query, (err, result) => {
//         if (err) throw err;

//         if (result.length === 0) {
//             res.status(404).json({ message: "User not found!" });
//             return;
//         }

//         res.json(result[0]);
//     });
// });

// Path: src\routes\route.js
// import { getOneUserById} from "../controllers/mySql2Controller.js";
// router.get("/companyUser/:id", getOneUserById);
