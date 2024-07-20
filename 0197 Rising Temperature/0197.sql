# Write your MySQL query statement below
select w1.id 
from Weather w1 join Weather w2
on datediff(w1.recordDate, w2.recordDate) = 1 #on w1.id = w2.id + 1
where w1.temperature > w2.temperature;
