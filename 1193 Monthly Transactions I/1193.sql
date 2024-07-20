# Write your MySQL query statement below
SELECT  date_format(trans_date, '%Y-%m') AS month, 
        country, 
        count(*) AS trans_count,
        count(IF(state = 'approved', 1, NULL)) AS approved_count, 
        sum(amount) AS trans_total_amount,
        sum(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY country, month
