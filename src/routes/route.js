import express from "express";
import { getAllCategory, userLogin, getAllBook, getAllBookById, getOneUserById, getAllActiveBorrow, adminLogin, userSignup, createCategory, createAuthor, getOneAdminById, updateBalance, getAllAuthor, createPublisher, getAllPublisher, addBook, updateReturnBook, borrowBook } from "../controllers/queryController.js";

const router = express.Router();

//*-------------------------Get Routes-------------------------
router.get('/author/all', getAllAuthor);
router.get('/publisher/all', getAllPublisher);
router.get('/category/all', getAllCategory);
router.get('/book/all', getAllBook);
router.get('/book/:id', getAllBookById);
router.get('/user/:id', getOneUserById);
router.get('/admin/:id', getOneAdminById);
router.get('/activeBorrows', getAllActiveBorrow);
//*-------------------------End of Get Routes-------------------------


//*-------------------------Post Routes-------------------------
router.post('/user/login', userLogin);
router.post('/user/signup', userSignup);
router.post('/admin/login', adminLogin);
router.post('/createCategory', createCategory);
router.post('/createPublisher', createPublisher);
router.post('/createAuthor', createAuthor);
router.post('/updateBalance', updateBalance);
router.post('/addBook', addBook);
router.post('/updateActiveBorrow/:active_borrow_id', updateReturnBook);
router.post('/borrowBook/:book_id', borrowBook);
//*-------------------------End of Post Routes-------------------------


export default router;