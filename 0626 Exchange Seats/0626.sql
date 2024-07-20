# Write your MySQL query statement below
select if(id < (select max(id) from Seat),
            IF(id % 2 = 0, id-1, id+1),
            IF(id % 2 = 0, id-1, id)) as id, student 
from seat
order by id
