# Write your MySQL query statement below
select product_name, sum(Orders.unit) as unit 
from Products join Orders
on Products.product_id = Orders.product_id
where month(Orders.order_date) = '02' and year(Orders.order_date) = '2020'
group by Products.product_name
having unit >= 100
