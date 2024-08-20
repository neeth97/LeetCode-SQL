# Write your MySQL query statement below
select e1.employee_id
from Employees e1
where salary < 30000 and 
e1.manager_id not in (
    select e2.employee_id
    from Employees e2)
order by e1.employee_id
