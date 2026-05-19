USE bank_loan_analysis

----GOOD LOAN ISSUED

SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id 
END) * 100.0) /  
 	COUNT(id) AS Good_Loan_Percentage 
FROM bank_loan_data 

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT 
ROUND(
(SUM(total_payment)*100.0) / SUM(loan_amount),2
) AS Good_Loan_Recovery_Rate
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current');

----BAD LOAN ISSUED

SELECT 
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /  
 	COUNT(id) AS Bad_Loan_Percentage 
FROM bank_loan_data 

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data 
WHERE loan_status = 'Charged Off' 

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data 
WHERE loan_status = 'Charged Off' 

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data 
WHERE loan_status = 'Charged Off' 

SELECT 
SUM(loan_amount - total_payment) AS Estimated_Loss
FROM bank_loan_data
WHERE loan_status = 'Charged Off';







