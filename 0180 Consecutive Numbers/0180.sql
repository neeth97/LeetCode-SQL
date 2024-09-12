# Write your MySQL query statement below

#select distinct l1.num as ConsecutiveNums from Logs l1
#join Logs l2 on l1.id = l2.id + 1 and l1.num = l2.num
#join Logs l3 on l2.id = l3.id + 1 and l3.num = l2.num

# can also use lag and lead window functions
WITH ConsecutiveNumAnalysis
AS (
	SELECT Id,
        Num AS CurrNum,
		lag(Num) OVER (
			ORDER BY Id
			) AS PrevNum,
		lead(Num) OVER (
			ORDER BY Id
			) AS NextNum
	FROM Logs
	)
SELECT DISTINCT CurrNum AS ConsecutiveNums
FROM ConsecutiveNumAnalysis
WHERE CurrNum = PrevNum AND CurrNum = NextNum
