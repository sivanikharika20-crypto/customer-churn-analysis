-- Showing tables
USE churn_data;
SHOW TABLES;
SELECT COUNT(DISTINCT customerID)
FROM customer_churn;

-- Churned customers
SELECT Churn, COUNT(*) AS customers
FROM customer_churn
GROUP BY Churn;

-- Churn rate
SELECT ROUND( SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100/ COUNT(*),2) AS churn_rate
FROM customer_churn;

-- Which contract type cause the most churn

SELECT Contract, COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND( SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2 ) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Churn by internet service

SELECT InternetService, COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- Churn by payment method 
SELECT PaymentMethod, COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- Do customers with higher monthly charges churn more?
SELECT Churn, ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM customer_churn
GROUP BY Churn;

-- Do new customers churn more than loyal customers? 
SELECT Churn, ROUND(AVG(tenure),2) AS avg_tenure
FROM customer_churn
GROUP BY Churn;