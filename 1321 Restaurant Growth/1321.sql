# Write your MySQL query statement below
with DaySum as (
    select 
        visited_on,
        sum(amount) as day_amount
    from Customer
    group by visited_on
)
# we use the above CTE to aggregate and calculate 
# the total amount spent by customers on each day

select 
    a.visited_on,
    round(sum(b.day_amount), 2) as amount,
    round(avg(b.day_amount), 2) as average_amount
from DaySum a, DaySum b
where datediff(a.visited_on, b.visited_on) between 0 and 6
group by a.visited_on
having count(*) > 6
order by a.visited_on asc

# we could use window functions but it is not
# effecient to use lag or lead for 7 day streak
# so we achive this by a simple join and a where clause
# paired with a having clause.
