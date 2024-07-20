# Write your MySQL query statement below
select Signups.user_id, coalesce(round(avg(case when action = 'confirmed' then 1 else 0 end), 2), 0) as confirmation_rate
from Confirmations right join Signups on Confirmations.user_id = Signups.user_id
group by Signups.user_id
