
/*SELECT (CONCAT_WS(' ',[Driver's forename],[Driver's surname])) AS Full_Name, COUNT(position) AS WINS_
FROM results$
WHERE positionOrder = 1
GROUP BY [Driver's forename],[Driver's surname]
ORDER BY WINS_ DESC*/


/*SELECT [Constructor name], COUNT(positionOrder) AS WINS
FROM results$
WHERE positionOrder = 1
GROUP BY [Constructor name]
ORDER BY WINS DESC*/

/*SELECT [Driver's nationality], COUNT([Driver's nationality]) AS Races_done
FROM results$
GROUP BY [Driver's nationality]
ORDER BY Races_done DESC*/

SELECT [Event name],COUNT (DISTINCT([Event date])) AS Total
FROM results$
GROUP BY [Event name]


SELECT COUNT(DISTINCT(CONCAT_WS(' ',[Driver's forename],[Driver's surname]))) AS Number_of_drivers,
	   COUNT (DISTINCT([Event date])) AS Number_of_races,
	   DATEDIFF(yy,'1950/05/13','2021/12/12') AS Years_of_F1,
	   COUNT(DISTINCT([Event name])) AS Venues
FROM results$



