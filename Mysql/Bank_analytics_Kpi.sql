-- Key Performance Indicaters (KPI)

-- Total loan Accounts
select count(account_id) as total_loan_accounts
from fact_loan;

-- Total Funded Amount
select sum(funded_amount) as total_funded_amount
from fact_loan;

-- Total Interest Received
select sum(total_rrec_int) as total_interest_received
from fact_loan;

-- Average Interest Rate
select round(avg(int_rate)*100,2) as avg_interest_rate
from fact_loan;

-- Delinquent Loans 
select count(Is_Delinquent_Loan) as Delinquent_loans
from fact_loan
where is_delinquent_loan = 'Yes';

-- Default Loan Rate
select round(
			sum(Is_Default_Loan = 'Yes')*100/ count(*),2) as Default_Loan_rate
from fact_loan;

-- unverified loans 
select count(Verification_Status ) as unverified_loans
from fact_loan
where Verification_Status = 'Not verified'

