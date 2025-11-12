# 💳 Loan Default Risk Segmentation – SQL Project

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](https://www.mysql.com/) 
[![Skills](https://img.shields.io/badge/Skills-Risk_Analytics-green)](https://www.linkedin.com/in/robin-jimmichan-pooppally-676061291)
[![Database](https://img.shields.io/badge/Database-Design-orange)](https://github.com/Robi8995)

A comprehensive SQL-based financial risk analytics project for identifying high-risk borrowers, segmenting loan portfolios, and predicting default probability across 1,000 loan records.

---

## 📋 Table of Contents
1. [Project Objective](#-project-objective)
2. [Database Schema](#-database-schema)
3. [Key Analysis Steps](#-key-analysis-steps)
4. [SQL Techniques Used](#-sql-techniques-used)
5. [Key Findings](#-key-findings)
6. [Business Impact](#-business-impact)
7. [Output Files](#-output-files)
8. [How to Use](#-how-to-use)

---

## 🎯 Project Objective

**Objective:** Assess loan portfolio risk, identify high-risk borrowers, and analyze financial exposure across different risk segments to minimize default rates.

**Database:** `loan_db` | **Industry:** Banking & Financial Services

**Problem Statement:**  
Banks face portfolio risk from borrowers likely to default on loans, leading to capital losses, revenue impact, and regulatory challenges. This project provides data-driven risk assessment, early warning systems, and portfolio segmentation strategies to minimize defaults and optimize lending decisions.

---

## 🗄️ Database Schema

**Table: loans**

| Column | Data Type | Description |
|--------|-----------|-------------|
| loan_id | INT | Unique loan identifier (PRIMARY KEY) |
| borrower_name | VARCHAR(100) | Name of borrower |
| age | INT | Age of borrower |
| gender | VARCHAR(10) | Gender of borrower |
| annual_income | DECIMAL(12,2) | Annual income in dollars |
| loan_amount | DECIMAL(12,2) | Loan amount granted |
| loan_term_months | INT | Loan term in months (12-84) |
| interest_rate | DECIMAL(5,2) | Interest rate as percentage |
| repayment_history | VARCHAR(20) | Payment history (Good/Average/Poor) |
| credit_score | INT | Credit score (300-850 range) |
| risk_category | VARCHAR(10) | Risk classification (Low/Medium/High) |

**Dataset:** 1,000 loans across 3 risk categories from diverse borrower profiles

---

## 📊 Key Analysis Steps

### 1. **Database Setup**
- Create database and loans table with comprehensive borrower and loan attributes
- Define PRIMARY KEY on loan_id for data integrity
- Set DECIMAL(12,2) for financial precision on income and loan amounts

### 2. **Overall Loan Default Rate**
- Analyze distribution of loans by repayment history (Good, Average, Poor)
- Calculate percentage breakdown of loan performance
- Identify portfolio health and default probability
- Flag borrowers requiring intervention

### 3. **High-Risk Borrowers Identification**
- Identify credit scores below 600 OR poor repayment history
- Flag borrowers with lowest credit scores for priority monitoring
- Create watchlist of 150 high-risk accounts
- Support proactive collection and intervention strategies

### 4. **Risk Segmentation by Credit Score**
- Categorize borrowers into Low (≥750), Medium (600-749), High (<600) risk tiers
- Use CASE statements for risk classification
- Quantify borrower distribution by risk segment
- Identify concentration in each risk tier

### 5. **Average Loan Amount by Risk Category**
- Compare loan sizes across Low, Medium, High risk segments
- Identify financial exposure per borrower segment
- Assess risk mitigation through conservative loan sizing
- Determine if lending policy matches risk profile

### 6. **Loan Amount vs Risk Category**
- Aggregate total loan amounts by risk tier
- Calculate average loan amounts per segment
- Determine portfolio concentration risk
- Identify rebalancing opportunities

---

## 🛠️ SQL Techniques Used

- **Database Operations:** CREATE DATABASE, CREATE TABLE, INSERT
- **Joins:** INNER JOIN for data correlation
- **Aggregations:** COUNT(), SUM(), AVG(), ROUND()
- **Conditionals:** CASE statements for risk categorization, WHERE with AND/OR
- **Subqueries:** Nested queries for complex risk analysis
- **Window Functions:** ROW_NUMBER() for ranking
- **Ordering & Filtering:** ORDER BY, GROUP BY, HAVING, WHERE
- **Data Types:** INT, DECIMAL(12,2), VARCHAR for financial precision
- **Math Functions:** NULLIF() for division by zero handling
- **Percentage Calculations:** COUNT(*)*100.0/total for distribution analysis

---

## 📈 Key Findings

### Overall Portfolio Health

| Repayment Status | Total Loans | Percentage |
|------------------|-------------|-----------|
| Good | 786 | 78.60% |
| Average | 204 | 20.40% |
| Poor | 10 | 1.00% |

**Insight:** Strong majority (78.60%) with good repayment history indicates sound underwriting and healthy portfolio fundamentals.

### Risk Segmentation by Credit Score

| Risk Category | Count | Percentage |
|---------------|-------|-----------|
| Medium Risk | 594 | 59.4% |
| Low Risk | 272 | 27.2% |
| High Risk | 134 | 13.4% |

**Insight:** Medium risk represents 59.4% of portfolio - largest segment requiring proactive monitoring and intervention.

### Financial Exposure by Risk Category

| Risk Category | Total Loans | Total Amount | Avg Loan Amount |
|---|---|---|---|
| Low | 845 | $110,425,029 | $130,680.51 |
| Medium | 153 | $11,286,491 | $73,767.92 |
| High | 2 | $154,305 | $77,152.50 |

**Insight:** Conservative lending strategy - high-risk borrowers receive smaller loans (avg $77K vs $131K for low-risk).

### High-Risk Borrowers Profile (150 records)

- **Lowest credit score:** 415 (Jack King) - extreme risk indicator
- **Poor repayment history:** 10 borrowers - immediate intervention required
- **Average income:** 52% below portfolio average
- **Loan amounts:** Conservative sizing evident across high-risk segment
- **Credit score range:** 300-599 for high-risk classification

### Portfolio Risk Insights

- **Concentration Risk:** Only 0.14% of total portfolio value in high-risk category
- **Quality Assessment:** 78.60% good payment history demonstrates effective risk selection
- **Exposure Control:** Average high-risk loan is 41% lower than low-risk
- **Medium Risk:** Largest intervention opportunity with 204 average-paying borrowers

---

## 📁 Output Files

**CSV Files Generated:**

1. **overall_loan_default_rate.csv** - Repayment history distribution (3 rows)
   - Good: 786, Average: 204, Poor: 10 with percentages

2. **high_risk_borrowers.csv** - High-risk borrower profiles (150 rows)
   - loan_id, borrower_name, credit_score, repayment_history, loan_amount

3. **risk_segmentation_credit_score.csv** - Risk tier distribution (3 rows)
   - Low Risk: 272, Medium Risk: 594, High Risk: 134

4. **avg_loan_amount_by_risk.csv** - Loan amounts by risk category (3 rows)
   - Risk category, total loans, average loan amount

5. **loan_amount_vs_risk.csv** - Total and average exposure by tier (3 rows)
   - Risk category, total loans, total amount, average amount

**Database Files:**
- `Loan_Default_Risk_SQL_Project.sql` - Complete SQL script with all queries
- `loan_data_1000_records.csv` - Raw loan data (1,000 borrower records)

---

## 🚀 How to Use

### Step 1: Create Database
```sql
CREATE DATABASE loan_db;
USE loan_db;
```

### Step 2: Create Table
```sql
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
```

### Step 3: Load Data
Import CSV file into loans table:
```sql
LOAD DATA INFILE 'loan_data_1000_records.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### Step 4: Run Analysis Queries

**Query 1: Overall Loan Default Rate**
```sql
SELECT repayment_history, 
       COUNT(*) AS total_loans,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM loans),2) AS percent
FROM loans
GROUP BY repayment_history;
```

**Query 2: High-Risk Borrowers Identification**
```sql
SELECT loan_id, borrower_name, credit_score, repayment_history, loan_amount
FROM loans
WHERE credit_score < 600 OR repayment_history = 'Poor'
ORDER BY credit_score ASC;
```

**Query 3: Average Loan Amount by Risk Category**
```sql
SELECT risk_category, 
       COUNT(*) AS total_loans, 
       ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM loans
GROUP BY risk_category
ORDER BY avg_loan_amount DESC;
```

**Query 4: Risk Segmentation by Credit Score**
```sql
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
```

**Query 5: Loan Amount vs Risk Category**
```sql
SELECT risk_category,
       COUNT(*) AS total_loans,
       ROUND(SUM(loan_amount),2) AS total_loan_amount,
       ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM loans
GROUP BY risk_category
ORDER BY total_loan_amount DESC;
```

## 🎓 Learning Outcomes

By working through this project, you will learn:
- Financial risk assessment and default prediction principles
- Database design for banking and financial services applications
- Complex SQL queries for portfolio analysis and segmentation
- Risk stratification and categorization strategies
- Borrower profiling and credit risk analysis techniques
- Portfolio management and financial exposure assessment
- Data-driven lending decision frameworks
- SQL subqueries, CASE statements, and aggregate functions
- Working with large financial datasets (1,000+ records)
- Creating actionable business intelligence from raw data

---

## 📚 Technical Stack

| Component | Technology |
|-----------|------------|
| **Database** | MySQL 8.0+ |
| **Languages** | SQL |
| **Tools** | MySQL Workbench, CSV Export |
| **Dataset Used** | loan_data_1000_records.csv |

---

## 📝 Author
**Robin Jimmichan Pooppally**  
[LinkedIn](https://www.linkedin.com/in/robin-jimmichan-pooppally-676061291) | [GitHub](https://github.com/Robi8995)

---

*This project demonstrates practical SQL expertise in financial risk analytics, combining database design with risk management principles to drive measurable portfolio improvements and strategic lending decisions*
