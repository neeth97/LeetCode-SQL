# Write your MySQL query statement below

#sub-query

#select email from
#(select email, count(email) as c
#from Person
#group by email) as temp
#where c > 1

#having
#having can be used on aggregates
select email
from Person
group by email 
having count(email) > 1;

#self-join

#select distinct p1.email
#from Person p1 join Person p2 on p1.email = p2.email and p1.id != p2.id;
