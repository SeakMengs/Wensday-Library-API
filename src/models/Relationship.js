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

//* End of Relationship

export { ActiveBorrow, Admins, Author, BalanceHistories, Books, Categories, Publication, Publisher, UserBorrowHistory, Users };