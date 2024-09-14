# Write your MySQL query statement below
#with SalaryCategory as (
#select account_id,
#    case
#        when income < 20000 then 'Low Salary'
#        when income >= 20000 and income <= 50000 then 'Average Salary'
#        else 'High Salary'
#    end as category
#from Accounts)
#select distinct category,
#    count(*) over(partition by category) as accounts_count
#from SalaryCategory

# the above code does not work ONLY
# when count is 0 for one of the categories. 
select 'High Salary' as category, 
       sum(case when income > 50000 then 1 else 0 end) as accounts_count 
from accounts
union
select 'Low Salary' as category, 
       sum(case when income < 20000 then 1 else 0 end) as accounts_count 
from accounts
union
select 'Average Salary' as category, 
       sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as accounts_count 
from accounts 
order by accounts_count desc;
