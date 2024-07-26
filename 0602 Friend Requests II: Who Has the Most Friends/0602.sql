# Write your MySQL query statement below

with base as (
    select requester_id id from RequestAccepted
    union all
    select accepter_id id from RequestAccepted
)

# the above code combines the requester_id column with accepter_id column
# cause who ever sent the request, they are friends with each other
# at the end of day. after that it is just a simple group by and order sql query

select id, count(id) num 
from base 
group by id 
order by num desc
limit 1
