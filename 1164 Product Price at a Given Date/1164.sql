# Write your MySQL query statement below
with cte as (
    select *, rank() over(partition by product_id order by change_date desc) as r
    from Products
    where change_date <= '2019-08-16')

# the above calculates the rank of all the prices
# for each product. we can use this to find the
# latest price of each product before the change date

select product_id, new_price as price
from cte
where r = 1

# we now need to take care of products that did not have
# had their first price change before 16th Aug

union

select product_id, 10 as price
from Products
# where change_date > '2019-08-16' this does not work because we want
# all product ids not in the above part of the code and NOT all products
# that have had a change date after 16th Aug
where product_id not in (select product_id from cte)
