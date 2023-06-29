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

Books.belongsTo(Publication, {
    foreignKey: 'publication_id',
    as: 'publication'
});

Publication.belongsTo(Publisher, {
    foreignKey: 'publisher_id',
    as: 'publisher'
});

Publisher.belongsTo(Admins, {
    foreignKey: 'admin_id',
    as: 'admin'
});

Publisher.hasMany(Publication, {
    foreignKey: 'publisher_id',
    as: 'publications'
});

Books.belongsTo(Categories, {
    foreignKey: 'category_id',
    as: 'category'
});

Books.belongsTo(Admins, {
    foreignKey: 'add_by_admin_id',
    as: 'admin'
});

Books.hasMany(ActiveBorrow, {
    foreignKey: 'book_id',
    as: 'active_borrow'
});

ActiveBorrow.belongsTo(Books, {
    foreignKey: 'book_id',
    as: 'book'
});

ActiveBorrow.belongsTo(Users, {
    foreignKey: 'user_id',
    as: 'user'
});

Users.hasMany(BalanceHistories, {
    foreignKey: 'user_id',
    as: 'balance_histories'
});

BalanceHistories.belongsTo(Users, {
    foreignKey: 'user_id',
});

Users.hasMany(ActiveBorrow, {
    foreignKey: 'user_id',
    as: 'active_borrows'
});

ActiveBorrow.belongsTo(Users, {
    foreignKey: 'user_id',
})

Users.hasMany(UserBorrowHistory, {
    foreignKey: 'user_id',
    as: 'user_borrow_histories'
});

UserBorrowHistory.belongsTo(Users, {
    foreignKey: 'user_id',
});

Categories.belongsTo(Admins, {
    foreignKey: 'add_by_admin_id',
    as: 'admin'
});

BalanceHistories.belongsTo(Admins, {
    foreignKey: 'paid_to_admin_id',
    as: 'admin'
});

UserBorrowHistory.belongsTo(Books, {
    foreignKey: 'book_id',
    as: 'book'
});

Author.hasMany(Books, {
    foreignKey: 'author_id',
    as: 'books'
});

Books.belongsTo(Author, {
    foreignKey: 'author_id',
    as: 'author'
});

//* End of Relationship

export { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users };