import express from "express";
import { getAllCategory, userLogin, getAllBook, getAllBookById, getOneUserById, getAllActiveBorrow, adminLogin, userSignup } from "../controllers/queryController.js";

const router = express.Router();

router.get('/hello', (req, res) => {
    res.json({ message: "Hello World" });
});

// check req.body compare email and password
// return status 200 if success, 401 if failed
router.post('/user/login', userLogin);
router.post('/user/signup', userSignup); 

// query by username
router.post('/admin/login', adminLogin); 

// TODO: Query Here Bro

// query all category
router.get('/category/all', getAllCategory);

// query all books join with 
// 1. hasMany publication, publication hasMany publisher
// 2. hasMany categories
// 3. hasOne admin
// 4. hasOne active_borrows. active_borrows hasOne user
// 5. hasMany authors
router.get('/book/all', getAllBook);

// same as above but get only one book by id
router.get('/book/:id', getAllBookById);

// get user by id join with
// 1. balance_histories
// 2. active_borrows
// 3. borrow_histories (all hasMany)
router.get('/user/:id', getOneUserById);

// get all active borrows
router.get('/active-borrows', getAllActiveBorrow);

//*--------------------------------------- End of Query

export default router;