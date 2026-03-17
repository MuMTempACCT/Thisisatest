
/* ============================================================
   DONE – SupplyChain Schema Fully Populated
   ============================================================ */

CREATE VIEW SupplyChain.vw_SupplierRiskInsights
AS
SELECT
    s.SupplierID,
    s.SupplierName,
    sp.OnTimeDeliveryRate,
    sp.QualityScore,
    sp.RiskScore,
    CASE
        WHEN sp.RiskScore >= 40 THEN 'High Risk'
        WHEN sp.RiskScore BETWEEN 20 AND 39 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskCategory
FROM
    SupplyChain.Suppliers s
    INNER JOIN SupplyChain.SupplierPerformance sp
        ON s.SupplierID = sp.SupplierID;

GO

