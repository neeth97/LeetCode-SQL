# Write your MySQL query statement below

with LPFB as (
    select person_id, person_name, sum(weight) over(order by turn) as cumulative_sum
    from Queue
)

select person_name
from LPFB
where cumulative_sum <= 1000
order by cumulative_sum desc
limit 1
