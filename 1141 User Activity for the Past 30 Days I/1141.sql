# Write your MySQL query statement below
select activity_date as day, count(Distinct user_id) as active_users
from Activity
where datediff('2019-07-27', activity_date) >= 0 and
datediff('2019-07-27', activity_date) < 30  
group by activity_date 


# if a user_id is in the table, that means that the user was active on that day
# so we just count all the distinct user_ids per day
