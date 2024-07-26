# Write your MySQL query statement below

with insurance_temp_table as ( 
    select *,
    count(*) over(partition by tiv_2015) as count_tiv_2015,
    count(*) over(partition by lat, lon) as count_lat_lon
    from insurance
)

select round(sum(tiv_2016), 2) as tiv_2016
from insurance_temp_table
where count_tiv_2015 > 1 and count_lat_lon = 1

# select *
# from insurance_temp_table
