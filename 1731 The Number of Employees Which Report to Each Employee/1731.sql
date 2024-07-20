# Write your MySQL query statement below
select r.employee_id, r.name, count(e.employee_id) as reports_count, round(avg(e.age)) as average_age
from employees e join employees r
on e.reports_to = r.employee_id
group by r.employee_id
order by r.employee_id
