# Write your MySQL query statement below

# select round(count(distinct b.player_id) / count(distinct a.player_id), 2) as fraction from 
# (select player_id, min(event_date) as event_date 
# from activity
# group by player_id) a 
# left join activity b 
# on a.player_id = b.player_id and datediff(b.event_date, a.event_date) = 1

WITH temp AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity 
    GROUP BY player_id
)

SELECT 
    ROUND(
        COUNT(DISTINCT t.player_id) / COUNT(DISTINCT a.player_id), 2
    ) AS fraction
FROM Activity a
LEFT JOIN temp t 
ON a.player_id = t.player_id AND DATEDIFF(a.event_date, t.first_login_date) = 1;
