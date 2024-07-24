import express from "express";
import Product from "../models/product.js";
import Predict from "../models/predict.js";
import Sale from "../models/sales.js";
import SaleProduct from "../models/saleProduct.js";
import { sequelize } from "../models/model.js";
import { Op } from "sequelize";
import moment from "moment";


const router = express.Router();

router.get('/predict', (req, res) => {
    Product.findAll().then((pro) => {
        res.render("prediksi_penjualan", { i_user: req.session.user || "", products: pro });
    })
});

router.get('/api/predict/:kode', async (req, res) => {
    const productCode = req.params.kode;

    try {
        const results = await sequelize.query(
            `
            SELECT DATE_FORMAT(sales.OrderDate, '%M %Y') AS month, 
                   SUM(saleproducts.Qnt) AS totalQuantity
            FROM saleproducts
            JOIN sales ON saleproducts.SalesID = sales.id
            WHERE saleproducts.ProductCode = :productCode
            GROUP BY month
            ORDER BY month DESC
            `,
            {
                replacements: { productCode },
                type: sequelize.QueryTypes.SELECT
            }
        );

        res.json({ status: 200, error: null, Response: results });
    } catch (err) {
        res.json({ status: 502, error: err });
    }
});

router.get('/api/predictTrend/:kode/:startDate/:endDate', (req, res) => {
    Predict.findAll({
        where: {
            ProductCode: req.params.kode,
            Date: {
                [Op.between]: [req.params.startDate, req.params.endDate]
            }
        }
    }).then((results) => {
        res.json({ status: 200, error: null, response: results });
    });
});

router.get('/api/predictSale/:kode/:startDate/:endDate', (req, res) => {
    Sale.findAll({
        where: {
            OrderDate: {
                [Op.between]: [req.params.startDate, req.params.endDate]
            }
        },
        include: [
            { model: SaleProduct, include: [{ model: Product }] },
        ]
    }).then((results) => {
        const qntTotals = {};

        results.forEach((sale) => {
            const month = moment(sale.OrderDate).format('YYYY-MM');

            if (!qntTotals[month]) {
                qntTotals[month] = 0;
            }
            if (sale.saleproducts && sale.saleproducts.length > 0) {
                sale.saleproducts.forEach((saleProduct) => {
                    if (saleProduct.ProductCode == req.params.kode) {
                        qntTotals[month] += parseInt(saleProduct.Qnt);
                    }
                });
            }

        });
        res.json({ status: 200, error: null, response: results, qnt: qntTotals });
    });
});

export default router;