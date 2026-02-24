
--SELECT * FROM covid19alex..CovidDeaths
--ORDER BY 3,4

--SELECT * FROM covid19alex..CovidVaccinations
--ORDER BY 3,4

------EXPLORING THE COLUMNS WE'LL WORK ON------

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid19alex..CovidDeaths
ORDER BY 1,2

------FINDING HOW FATAL IT'S BEEN FOR DIFFERENT COUNTRIES AROUND THE WORLDN------

SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) AS mortality_rate
FROM covid19alex..CovidDeaths
ORDER BY mortality_rate DESC

-----LET'S SEE HOW IT WAS FOR CANADA------
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) AS mortality_rate
FROM covid19alex..CovidDeaths
WHERE location = 'Canada'
ORDER BY mortality_rate DESC

-------What about the number of deaths? When was that the highest in Canada?------------
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) AS mortality_rate
FROM covid19alex..CovidDeaths
WHERE location = 'Canada'
ORDER BY CAST(total_deaths AS INT) DESC

-----What about Bangladesh? When was its highest mortality rate??------------
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) AS mortality_rate
FROM covid19alex..CovidDeaths
WHERE location = 'Bangladesh'
ORDER BY mortality_rate DESC

-----And What about the number of deaths? When was that the highest in Bangladesh?------------
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) AS mortality_rate
FROM covid19alex..CovidDeaths
WHERE location = 'Bangladesh'
ORDER BY CAST(total_deaths AS INT) DESC