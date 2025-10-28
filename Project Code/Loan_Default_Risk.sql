CREATE DATABASE loan_db;
USE loan_db;

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    borrower_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    annual_income DECIMAL(12,2),
    loan_amount DECIMAL(12,2),
    loan_term_months INT,
    interest_rate DECIMAL(5,2),
    repayment_history VARCHAR(20),
    credit_score INT,
    risk_category VARCHAR(10)
);

USE loan_db;

SELECT * FROM loans LIMIT 10;

-- Overall Loan Default Rate

SELECT repayment_history, 
       COUNT(*) AS total_loans,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM loans),2) AS percent
FROM loans
GROUP BY repayment_history;

-- High-Risk Borrowers Identification

SELECT loan_id, borrower_name, credit_score, repayment_history, loan_amount
FROM loans
WHERE credit_score < 600 OR repayment_history = 'Poor'
ORDER BY credit_score ASC;

-- Average Loan Amount by Risk Category

SELECT risk_category, 
       COUNT(*) AS total_loans, 
       ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM loans
GROUP BY risk_category
ORDER BY avg_loan_amount DESC;

-- Risk Segmentation by Credit Score

SELECT risk_category, 
       COUNT(*) AS total_loans
FROM (
    SELECT CASE 
               WHEN credit_score >= 750 THEN 'Low Risk'
               WHEN credit_score BETWEEN 600 AND 749 THEN 'Medium Risk'
               ELSE 'High Risk'
           END AS risk_category
    FROM loans
) AS subquery
GROUP BY risk_category
ORDER BY total_loans DESC;

-- Loan Amount vs Risk Category

SELECT risk_category,
       COUNT(*) AS total_loans,
       ROUND(SUM(loan_amount),2) AS total_loan_amount,
       ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM loans
GROUP BY risk_category
ORDER BY total_loan_amount DESC;
