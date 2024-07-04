import { sequelize, DataTypes } from "./model.js";
import Supplier from "./supplier.js";
import ReturProduct from "./returProduct.js";
import Purchase from "./purchases.js";


const Retur = sequelize.define('retur', {
    id: {type: DataTypes.STRING, allowNull: false, primaryKey: true},
    ReturDate: {type: DataTypes.DATE, allowNull: false},
    Total: {type: DataTypes.DECIMAL, allowNull: false},
    SupplierID: {type: DataTypes.STRING, allowNull: false},
}, {
    updatedAt: false,
    createdAt: false,
    tableName: "returpurchases"
});

Retur.hasMany(ReturProduct, {foreignKey: 'ReturID'});
Retur.belongsTo(Supplier, {foreignKey: 'SupplierID'});

export default Retur;