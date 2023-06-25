import ActiveBorrow from './ActiveBorrow.js';
import Admins from './Admins.js';
import Author from './Author.js';
import BalanceHistories from './BalanceHistories.js';
import Books from './Books.js';
import Categories from './Categories.js';
import Publication from './Publication.js';
import Publisher from './Publisher.js';
import UserBorrowHistory from './UserBorrowHistory.js';
import Users from './Users.js';

// TODO: Relationship Here

// example
// CompanyUser.hasMany(Company, {
    // foreignKey: 'companyuser_id',
    // as: 'companies'
// });
Books.hasMany(Publication,{
    foreignKey: 'publication_id',
    as: 'publication'
});

Publication.hasMany(Publisher, {
    foreignKey: 'publisher_id',
    as : 'publishers'
});

Books.hasMany(Categories, {
    foreignKey: 'category_id',
    as : 'categories'
});

Books.hasOne(Admins,{
    foreignKey: 'admin_id',
    as : 'admin'
});

Books.hasMany(ActiveBorrow, {
    foreignKey: 'active_borrow_id',
    as : 'active_borrow'
});

ActiveBorrow.hasOne(Users,{
    foreignKey: 'user_id',
    as : 'user'
});

Books.hasMany(Author, {
    foreignKey: 'author_id',
    as: 'authors'
});

Users.hasMany(BalanceHistories,{
    foreignKey: 'balance_history_id',
    as : 'balance_histories'
});

Users.hasMany(ActiveBorrow, {
    foreignKey: 'active_borrow_id',
    as: 'active_borrows'
});

Users.hasMany(UserBorrowHistory, {
    foreignKey: 'user_borrow_history_id',
    as: 'user_borrow_histories'
});

//* End of Relationship

export { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users };