WITH RankedEmployees AS (
    SELECT 
        Department.name AS Department, 
        Employee.name AS Employee, 
        Employee.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY Employee.departmentId ORDER BY Employee.salary DESC) AS DenseRank
    FROM Employee
    JOIN Department ON Employee.departmentId = Department.id
)
SELECT Department, Employee, Salary
FROM RankedEmployees
WHERE DenseRank <= 3
ORDER BY Department, Salary DESC;
