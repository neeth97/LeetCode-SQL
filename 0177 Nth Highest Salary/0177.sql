CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
Set N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
       select distinct salary
       from Employee
       order by salary desc
       limit 1 offset N
  );
# you can't do calculations in the return function
# use disticnt in salary!!!!!!
END