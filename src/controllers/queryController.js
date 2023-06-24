/*
 * Reference: 
 * https://sequelize.org/docs/v6/core-concepts/model-querying-finders/
 * https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/
 */

import { CompanyUser, Company, Feedback, Service } from "../models/Relationship.js";

export const getOneUserById = async (req, res) => {
    const { id: user_id } = req.params;

    try {
        const user = await CompanyUser.findOne({
            where: { id: user_id },
        });

        res.status(200).json()
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}

export const getAllCompaniesByUserId = async (req, res) => {
    const { id: user_id } = req.params;

    try {
        const user = await CompanyUser.findOne({
            where: { id: user_id },
            // join company table and feedback table join with company table
            include: [
                {
                    model: Company,
                    as: 'companies',
                    include: [
                        {
                            model: Feedback,
                            as: 'feedbacks',
                        },
                        {
                            model: Service,
                            as: 'services',
                        }
                    ]
                },
            ],
        })

        res.status(200).json(user)
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
}