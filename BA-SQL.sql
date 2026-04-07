use bankdata;

#KPI-1 (Year wise loan amount Stats)
select issue_year as year, sum(loan_amnt) as `Total Loan Amount` from finance_1 
group by issue_year order by issue_year ;

#KPI-2 (Grade and sub grade wise revol_bal)
select f1.grade, f1.sub_grade , sum(f2.revol_bal) from finance_1 f1 join finance_2 f2 on f1.id=f2.id 
group by f1.grade, f1.sub_grade order by f1.grade, f1.sub_grade ;

#KPI-3 (Total Payment for Verified Status Vs Total Payment for Non Verified Status)
select f1.verification_status, sum(f2.total_pymnt) from finance_1 f1 join finance_2 f2 on f1.id=f2.id
group by f1.verification_status;

#KPI-4 (State wise and last_credit_pull_d wise loan status)
select f1.addr_state, f1.loan_status, count(f2.last_credit_pull_d) as `Total Count` from Finance_1 f1 join finance_2 f2
on f1.id = f2.id
group by f1.addr_state, f1.loan_status
order by f1.addr_state, f1.loan_status;

#KPI-5 (Home ownership Vs last payment date stats)
select f1.home_ownership, count(f2.last_pymnt_d) as `Last Payment Day Count` from finance_1 f1 join finance_2 f2
on f1.id = f2.id
group by f1.home_ownership;

#==================================================================================================================================================
delimiter $$
create procedure Year_wise_loan_amount_Stats()
begin
select issue_year as year, sum(loan_amnt) as `Total Loan Amount` from finance_1 
group by issue_year order by issue_year ;
end $$
delimiter ;

#===================================================================================================================================================
delimiter $$
create procedure Grade_subgrade_wise_revol_bal()
begin
select f1.grade, f1.sub_grade , sum(f2.revol_bal) from finance_1 f1 join finance_2 f2 on f1.id=f2.id 
group by f1.grade, f1.sub_grade order by f1.grade, f1.sub_grade ;
end $$
delimiter ;

#======================================================================================================================================================
delimiter $$
create procedure Verified_NonVerified_Total_Payment()
begin
select f1.verification_status, sum(f2.total_pymnt) from finance_1 f1 join finance_2 f2 on f1.id=f2.id
group by f1.verification_status;
end $$
delimiter ;

#========================================================================================================================================================

delimiter $$
create procedure State_wise_last_credit_pull_d_wise_loan_status()
begin
select f1.addr_state, f1.loan_status, count(f2.last_credit_pull_d) as `Total Count` from Finance_1 f1 join finance_2 f2
on f1.id = f2.id
group by f1.addr_state, f1.loan_status
order by f1.addr_state, f1.loan_status;
end $$
delimiter ;

#==========================================================================================================================================================

delimiter $$
create procedure Home_Ownership_Vs_lastPayment_date_stats()
begin
select f1.home_ownership, count(f2.last_pymnt_d) as `Last Payment Day Count` from finance_1 f1 join finance_2 f2
on f1.id = f2.id
group by f1.home_ownership;
end $$
delimiter ;
call Home_Ownership_Vs_lastPayment_date_stats();
