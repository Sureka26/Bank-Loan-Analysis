USE bank_loan_analysis

SELECT * FROM bank_loan_data 

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data 

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data 
WHERE MONTH(issue_date) = 12 

SELECT COUNT(id) AS Total_Applications FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data 
WHERE MONTH(issue_date) = 12 

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 


SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data 

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data 
WHERE MONTH(issue_date) = 12 

SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data 

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data 
WHERE MONTH(issue_date) = 12 

SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 

SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data 

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data 
WHERE MONTH(issue_date) = 12

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data 
WHERE MONTH(issue_date) = 11 

-- 1. BAD LOAN RATE KPI

SELECT 
    ROUND(
        (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) 
        / COUNT(id), 2
    ) AS Bad_Loan_Percentage
FROM bank_loan_data;

-- 2. RECOVERY RATE KPI

SELECT 
    ROUND(
        (SUM(total_payment) * 100.0) 
        / SUM(loan_amount), 2
    ) AS Recovery_Rate
FROM bank_loan_data;

-- 3. VERIFIED vs NON-VERIFIED LOAN PERFORMANCE

SELECT 
    verification_status,
    
    COUNT(id) AS Total_Loans,

    SUM(CASE 
            WHEN loan_status = 'Fully Paid' 
            THEN 1 
            ELSE 0 
        END) AS Fully_Paid_Loans,

    SUM(CASE 
            WHEN loan_status = 'Charged Off' 
            THEN 1 
            ELSE 0 
        END) AS Charged_Off_Loans,

    ROUND(
        (SUM(CASE 
                WHEN loan_status = 'Charged Off' 
                THEN 1 
                ELSE 0 
             END) * 100.0)
        / COUNT(id), 2
    ) AS Bad_Loan_Rate

FROM bank_loan_data
GROUP BY verification_status;

-- 4. STATE WITH HIGHEST LOAN AMOUNT

SELECT TOP 10
    address_state,
    SUM(loan_amount) AS Total_Loan_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY Total_Loan_Amount DESC;

-- 5. MOST COMMON LOAN PURPOSE

SELECT TOP 10
    purpose,
    COUNT(id) AS Total_Applications
FROM bank_loan_data
GROUP BY purpose
ORDER BY Total_Applications DESC;

-- 6. HIGH RISK CUSTOMERS KPI

SELECT 
    COUNT(id) AS High_Risk_Customers
FROM bank_loan_data
WHERE dti > 0.20
AND int_rate > 0.15
AND loan_status = 'Charged Off';




