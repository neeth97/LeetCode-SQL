
### 1. Conditional Value Assignment
You can assign different values to a column based on conditions.
```SELECT product_name,
       CASE 
         WHEN price > 100 THEN 'Expensive'
         ELSE 'Affordable'
       END AS price_category
FROM products;
```
In this example, products with a price over 100 are labeled as 'Expensive', otherwise, they're labeled 'Affordable'.

### 2. Grouping or Categorizing Data
When you want to group data into categories based on certain conditions.
```SELECT 
  CASE 
    WHEN age < 18 THEN 'Minor'
    WHEN age >= 18 AND age <= 65 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS count
FROM people
GROUP BY 
  CASE 
    WHEN age < 18 THEN 'Minor'
    WHEN age >= 18 AND age <= 65 THEN 'Adult'
    ELSE 'Senior'
  END;
```
### 3. Complex Conditional Aggregation
You can use CASE with aggregate functions to sum or count based on certain conditions.
```
SELECT 
  SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_orders,
  SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_orders
FROM orders;
```
### 4. Filtering Rows with Conditional Logic
Use CASE inside a WHERE clause to apply conditional filtering.
```
SELECT * 
FROM employees
WHERE 
  CASE 
    WHEN department = 'HR' THEN salary > 50000
    ELSE salary > 30000
  END;
```
### 5. Creating Conditional Sort Order
When sorting data conditionally, CASE can define how rows should be ordered.
```
SELECT * 
FROM products
ORDER BY 
  CASE 
    WHEN category = 'Electronics' THEN price
    ELSE sales
  END DESC;
```
### Syntax Overview:
```
CASE 
  WHEN condition THEN result
  [WHEN condition THEN result]
  [ELSE result]
END
```
### Key Points:
You can use multiple WHEN clauses to handle different conditions.

The ELSE clause is optional but recommended for handling default cases.

CASE can be used in SELECT, WHERE, ORDER BY, and even GROUP BY clauses.


It’s a powerful tool for simplifying queries and applying logic directly within SQL statements!
