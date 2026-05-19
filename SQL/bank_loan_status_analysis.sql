USE bank_loan_analysis


SELECT 
        loan_status, 
        COUNT(id) AS LoanCount, 
        SUM(total_payment) AS Total_Amount_Received, 
        SUM(loan_amount) AS Total_Funded_Amount, 
        AVG(int_rate * 100) AS Interest_Rate, 
        AVG(dti * 100) AS DTI     FROM 
        bank_loan_data     GROUP BY         loan_status 

        SELECT  
 	loan_status,  
 	SUM(total_payment) AS MTD_Total_Amount_Received,  
 	SUM(loan_amount) AS MTD_Total_Funded_Amount  
FROM bank_loan_data 
WHERE MONTH(issue_date) = 12  
GROUP BY loan_status 

SELECT 
loan_status,
COUNT(id) AS Total_Loans,
ROUND(
COUNT(id)*100.0 /
(SELECT COUNT(*) FROM bank_loan_data),2
) AS Percentage
FROM bank_loan_data
GROUP BY loan_status;

