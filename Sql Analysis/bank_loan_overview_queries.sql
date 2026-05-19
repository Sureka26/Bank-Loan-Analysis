USE bank_loan_analysis

SELECT  
 	MONTH(issue_date) AS Month_Munber,  
 	DATENAME(MONTH, issue_date) AS Month_name,  
 	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date) 
ORDER BY MONTH(issue_date) 

SELECT  
 	address_state AS State,   	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY address_state
ORDER BY address_state

SELECT  
 	term AS Term,  
 	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY term
ORDER BY term

SELECT  
 	emp_length AS Employee_Length,   	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY emp_length
ORDER BY emp_length

SELECT  
 	purpose AS PURPOSE,   	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY purpose 
ORDER BY purpose 

SELECT  
 	home_ownership AS Home_Ownership,   	COUNT(id) AS Total_Loan_Applications, 
 	SUM(loan_amount) AS Total_Funded_Amount, 
 	SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data 
GROUP BY home_ownership
ORDER BY home_ownership

SELECT TOP 5
address_state,
SUM(total_payment) AS Total_Recovery
FROM bank_loan_data
GROUP BY address_state
ORDER BY Total_Recovery DESC;

SELECT
purpose,
COUNT(id) AS Charged_Off_Count
FROM bank_loan_data
WHERE loan_status='Charged Off'
GROUP BY purpose
ORDER BY Charged_Off_Count DESC;

