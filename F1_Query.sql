/*This Query Shows the number of Pole positions a driver has gotten*/
SELECT (CONCAT_WS(' ',[Driver's forename],[Driver's surname])) AS Full_Name, COUNT(grid) AS Pole_Position
FROM results$
WHERE grid = 1
GROUP BY grid,[Driver's forename],[Driver's surname]
ORDER BY Pole_Position DESC


--- This Query Shows the top 10 most succesful drivers based on their wins ---
SELECT (CONCAT_WS(' ',[Driver's forename],[Driver's surname])) AS Full_Name, COUNT(position) AS RACE_WINS_
FROM results$
WHERE positionOrder = 1
GROUP BY [Driver's forename],[Driver's surname]
ORDER BY WINS_ DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

/* This Query shows the top 10 drivers with the most podiums*/
 
SELECT (CONCAT_WS(' ',[Driver's forename],[Driver's surname])) AS Full_Name, COUNT(position) AS Podiums_
FROM results$
WHERE positionOrder = 1 OR positionOrder = 2 OR positionOrder= 3
GROUP BY [Driver's forename],[Driver's surname]
ORDER BY Podiums_ DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;


--- This Query Shows the top 10 most successful Teams/Constructors based on their wins ---
SELECT [Constructor name], COUNT(positionOrder) AS RACE_WINS
FROM results$
WHERE positionOrder = 1
GROUP BY [Constructor name]
ORDER BY WINS DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

/* This Query shows the top 10 constructors with the most podiums*/

SELECT [Constructor name], COUNT(positionOrder) AS Podiums
FROM results$
WHERE positionOrder = 1 OR positionOrder = 2 OR positionOrder= 3
GROUP BY [Constructor name]
ORDER BY Podiums DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;


--- This Query Shows How many times a driver from a specific nationality took part in a race ---
SELECT [Driver''s nationality], COUNT([Driver's nationality]) AS Races_done
FROM results$
GROUP BY [Driver's nationality]
ORDER BY Races_done DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;

--- This Query Shows All the Grands Prix Taken place as well as how many times said Grands Prix have taken place ---
SELECT [Event name],COUNT (DISTINCT([Event date])) AS Total
FROM results$
GROUP BY [Event name]

--- This Query Shows Total number of Constructors, Drivers, Venues, Number of races and Years in F1 History ---- 
SELECT COUNT(DISTINCT(CONCAT_WS(' ',[Driver's forename],[Driver's surname]))) AS Number_of_drivers,
       COUNT(DISTINCT([Constructor name])) AS Number_of_Constructors, 
       COUNT (DISTINCT([Event date])) AS Number_of_races,
       DATEDIFF(yy,'1950/05/13','2021/12/12') AS Years_of_F1,
       COUNT(DISTINCT([Event name])) AS Venues
FROM results$
                                      
 /* This Query shows and counts how many Driver nationalities have competed in the sport*/                                     
SELECT DISTINCT([Driver's nationality]), COUNT(DISTINCT((CONCAT_WS(' ', [Driver's forename],[Driver's surname])))) AS Nationality_Appearance
FROM results$
GROUP BY [Driver's nationality]
ORDER BY Nationality_Appearance DESC
            
 /*This Query Shows How many different constructor nationalities have competed*/              
SELECT DISTINCT([constructor's nationality]),COUNT(DISTINCT([Constructor name])) Nationality_Appearance_Constructors
FROM results$
GROUP BY [constructor's nationality]
ORDER BY Nationality_Appearance_Constructors DESC


/*This Query shows how many races in a season in all years of F1*/
SELECT year, COUNT(DISTINCT([Event name])) AS Number_of_races
FROM results$
GROUP BY year
ORDER BY Number_of_races                


/*This query shows which nationality has the most wins for drivers*/
SELECT DISTINCT([Driver's nationality]), COUNT([Driver's nationality]) AS nationality_wins
FROM results$
WHERE positionOrder = 1
GROUP BY [Driver's nationality]'
ORDER BY nationality_wins DESC

/*This query shows which nationality has the most wins for constructors*/
SELECT DISTINCT([constructor's nationality]), COUNT([constructor's nationality]) AS nationality_wins
FROM results$
WHERE positionOrder = 1
GROUP BY [constructor's nationality]
ORDER BY nationality_wins DESC
