# Write your MySQL query statement below

select salary as SecondHighestSalary
from Employee
order by salary desc
limit 1 offset 1;

# with limit we can limit the number of rows 
# that are outputted and with offset we control 
# the number of rows to skip from the top.
# I like this solution MORE.
  
select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from employee);

# the idea here is to query all salaries that are
# less than the max salary and find the greatest of 
# the remaining salaries. NOT very elegant or efficient.
