-- top 10 states by loan amount
select b.State_Name as state_name, 
		sum(l.Loan_Amount) as loan_amount
from fact_loan as l
left join dim_branch as b 
on l.Center_ID = b.Center_Id
group by b.State_Name
order by sum(l.Loan_Amount) desc
limit 10;

-- monthly loan funding
select d.Month_Name as month,
		sum(l.Funded_Amount) as loan_amount
from fact_loan as l
left join dim_date as d
on l.Disbursement_Date = d.disbursement_date
group by d.Month_Name
order by sum(l.Funded_Amount) desc;

-- top 5 branches by loan amount
select b.branch_name as branch_name,
		sum(l.Funded_Amount) as loan_amount
from fact_loan as l
left join dim_branch as b
on l.center_id = b.Center_Id
group by b.Branch_Name
order by sum(l.Funded_Amount) desc
limit 5;
	
--  top 5 loan distribution by purpose
select purpose_category as purpose,
		sum(funded_amount) as loan_amount
from fact_loan
group by Purpose_Category
order by sum(Funded_Amount) desc
limit 5;

-- loan amount by religion
select c.religion as religion ,
		sum(l.Funded_Amount) as loan_amount
from fact_loan as l 
left join dim_customer as c
on c.Client_ID = l.Client_ID
group by c.Religion
order by sum(l.Funded_Amount) desc;

-- top 5 regions by loan amount
select b.Region_Name as region,
		sum(l.Funded_Amount) as loan_amount
from fact_loan  as l
left join  dim_branch as b
on b.center_id = l.center_id
group by b.Region_Name
order by Loan_Amount desc
limit 5;















