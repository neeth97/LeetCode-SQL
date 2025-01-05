# Write your MySQL query statement below
select score, dense_rank() over(order by score desc) as 'rank'
from Scores;

# DENSE_RANK():
# A window function that assigns a rank to each distinct score. Tied scores share the same rank, and no ranks are skipped.

# OVER (ORDER BY score DESC):
# Ranks scores in descending order, with the highest score receiving rank 1.
