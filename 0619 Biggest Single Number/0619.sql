with BSN as (
    select num, count(*) as _count
    from MyNumbers
    group by num
)

select max(num) as num
from BSN
where _count = 1
