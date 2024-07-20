# Write your MySQL query statement below
with temp as
(select d.name Department, e.name Employee, e.salary Salary, rank() over(partition by e.departmentId order by e.salary desc) as rankNum
from Department d join Employee e on e.departmentId = d.id)

select Department, Employee, Salary
from temp
where rankNum = 1
