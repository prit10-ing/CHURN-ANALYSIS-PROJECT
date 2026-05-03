-- ================================
-- CUSTOMER CHURN ANALYSIS VIEWS
-- ================================

-- 1. Total Customers
CREATE VIEW total_customers_view AS
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Churn Distribution
CREATE VIEW churn_distribution AS
SELECT
churn,
COUNT(*) AS total_customers
FROM customers
GROUP BY churn;

-- 3. Overall Churn Rate
CREATE VIEW churn_rate_view AS
SELECT
ROUND(
COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM customers;

-- 4. Avg Monthly Charges (Churn vs Non-Churn)
CREATE VIEW avg_monthly_charges AS
SELECT
churn,
ROUND(AVG(monthlycharges), 2) AS avg_monthly_charges
FROM customers
GROUP BY churn;

-- 5. Churn Count by Contract
CREATE VIEW churn_by_contract AS
SELECT
contract,
COUNT(*) AS churn_count
FROM customers
WHERE churn = 'Yes'
GROUP BY contract;

-- 6. Churn Rate by Contract
CREATE VIEW churn_rate_by_contract AS
SELECT
contract,
ROUND(
COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM customers
GROUP BY contract;

-- 7. Total Customers by Contract
CREATE VIEW customers_by_contract AS
SELECT
contract,
COUNT(*) AS total_customers
FROM customers
GROUP BY contract;

-- 8. Churn by Internet Service
CREATE VIEW churn_by_internet AS
SELECT
internetservice,
churn,
COUNT(*) AS total
FROM customers
GROUP BY internetservice, churn;

-- 9. Avg Total Charges by Contract
CREATE VIEW avg_total_charges_contract AS
SELECT
contract,
ROUND(AVG(totalcharges), 2) AS avg_total_charges
FROM customers
GROUP BY contract;

-- 10. Churn by Payment Method
CREATE VIEW churn_by_payment AS
SELECT
paymentmethod,
churn,
COUNT(*) AS total
FROM customers
GROUP BY paymentmethod, churn;

-- 11. Avg Tenure by Churn
CREATE VIEW avg_tenure_by_churn AS
SELECT
churn,
ROUND(AVG(tenure), 2) AS avg_tenure
FROM customers
GROUP BY churn;

-- 12. High Value Customer Distribution
CREATE VIEW high_value_distribution AS
SELECT
highvaluecustomer,
COUNT(*) AS total
FROM customers
GROUP BY highvaluecustomer;

-- 13. Churn by Total Services
CREATE VIEW churn_by_services AS
SELECT
totalservices,
churn,
COUNT(*) AS total
FROM customers
GROUP BY totalservices, churn;

-- 14. High Monthly Charge Customers (>80)
CREATE VIEW high_charge_customers AS
SELECT
COUNT(*) AS high_charge_customers
FROM customers
WHERE monthlycharges > 80;

-- 15. Churn Rate by Payment Method
CREATE VIEW churn_rate_by_payment AS
SELECT
paymentmethod,
ROUND(
COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM customers
GROUP BY paymentmethod;
