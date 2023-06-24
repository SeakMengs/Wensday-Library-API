import Company from "./Company.js";
import Feedback from "./Feedback.js";
import Service from "./Service.js";
import CompanyUser from "./CompanyUser.js";

CompanyUser.hasMany(Company, {
    foreignKey: 'companyuser_id',
    as: 'companies'
});

Company.hasMany(Feedback, {
    foreignKey: 'company_id',
    as: 'feedbacks'
});

Company.hasMany(Service, {
    foreignKey: 'company_id',
    as: 'services'
});

Feedback.belongsTo(Company, {
    foreignKey: 'company_id',
    as: 'company'
});

export { CompanyUser, Company, Feedback, Service }