import { sequelize, DataTypes } from "./model.js";
import User from "./user.js";

const Fund = sequelize.define('fund', {
    Date: { type: DataTypes.DATE, allowNull: false },
    Description: {type: DataTypes.STRING, allowNull: false},
    Total: { type: DataTypes.DECIMAL, allowNull: false },
    Supply: { type: DataTypes.DECIMAL, allowNull: true, defaultValue: 0 },
    Status: {type: DataTypes.TINYINT, allowNull: false},
    UserID: { type: DataTypes.INTEGER, allowNull: true }
}, {
    updatedAt: false,
    createdAt: false,
    tableName: "Fund"
});

Fund.belongsTo(User, {foreignKey: 'UserID'});


export default Fund;