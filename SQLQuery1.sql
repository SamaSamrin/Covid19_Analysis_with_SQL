
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

--------Let's now focus on the highest infection counts  per country ---------
SELECT location, MAX(total_cases) AS MaxInfection
FROM covid19alex..CovidDeaths
GROUP BY location
ORDER BY MaxInfection DESC

-------Unfortunately, looks like the "location" column has non-country values like "World" and different contintent names
--let's skip those values by using NOT IN with WHERE for country-based counts only-----------
SELECT location, MAX(total_cases) AS MaxInfection
FROM covid19alex..CovidDeaths
WHERE location NOT IN ('World', 'Europe', 'Asia', 'European Union', 'North America', 'South America', 'Africa')
GROUP BY location 
ORDER BY MaxInfection DESC 

------Another way to avoid continents--------
SELECT location, MAX(total_cases) AS MaxInfection
FROM covid19alex..CovidDeaths
WHERE continent IS NOT null
GROUP BY location 
ORDER BY MaxInfection DESC
---This works because the continent-named "location" values have "continent" as NULL in the sheet

------ How about maximum deaths per country? ------
SELECT location, MAX(CAST(total_deaths AS INT)) AS MaxDeaths
FROM covid19alex..CovidDeaths
WHERE continent IS NOT null
GROUP BY location 
ORDER BY MaxDeaths DESC

------ Let's now focus on the continents only -----
SELECT continent, MAX(CAST(total_deaths AS INT)) AS MaxDeaths
FROM covid19alex..CovidDeaths
WHERE continent IS NOT null
GROUP BY continent
ORDER BY MaxDeaths DESC

---- Now, what is we use "location" named under a continent to find the same thing?
SELECT location, MAX(CAST(total_deaths AS INT)) AS MaxDeaths
FROM covid19alex..CovidDeaths
WHERE continent IS null
GROUP BY location
ORDER BY MaxDeaths DESC

----Total death per continent, based on its population-----
SELECT continent, MAX(CAST(population AS INT)) AS max_population, MAX(CAST(total_deaths AS INT)) AS max_deaths
FROM covid19alex..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY max_deaths DESC
--WHERE continent IS NOT NULL
--GROUP BY continent

----Highest Total death per continent, based on its population-----
SELECT continent, CAST(population AS INT) AS population_, CAST(total_deaths AS INT) AS total_deaths_
FROM covid19alex..CovidDeaths
WHERE continent IS NOT NULL AND total_deaths IS NOT NULL
ORDER BY total_deaths DESC

----Let's see the same thing as a percentage----
SELECT continent, CAST(population AS INT) AS population_, CAST(total_deaths AS INT) AS total_deaths_, ROUND((total_deaths/population)*100, 2) AS death_percentage
FROM covid19alex..CovidDeaths
WHERE continent IS NOT NULL AND total_deaths IS NOt NULL
ORDER BY death_percentage DESC
--this is turning out to be quite time-consuming, and we can't use the GROUP BY clause this way due to population and total_deaths not being aggregates
--so, let's try something different, to find similar statistics, but grouped per continent

SELECT 
	continent,
	MAX(CAST(population AS INT)) AS total_population,
	MAX(CAST(total_deaths AS INT)) AS total_deaths_,
	(MAX(CAST(total_deaths AS FLOAT))/MAX(CAST(population AS FLOAT)))*100 AS death_percentage
	--ROUND((CAST(total_deaths AS INT)/CAST(population AS INT))*100,2) AS death_percentage
FROM covid19alex..CovidDeaths
WHERE continent IS NOT NULL AND total_deaths IS NOT NULL
GROUP BY continent
ORDER BY death_percentage DESC
--here we changed the numbers to FLOAT for the percentage calculation, because they're very minuscule (less than 0.001)


SELECT *
FROM covid19alex..CovidDeaths AS deaths
JOIN covid19alex..CovidVaccinations AS vaccines
ON deaths.location = vaccines.location AND deaths.date = vaccines.date

--deaths.iso_code, deaths.continent, deaths.location, deaths.date, deaths.population, deaths.total_cases, deaths.total_deaths, 
--	vaccines.extreme_poverty, vaccines.life_expectancy, vaccines.total_vaccinations


--Now, let's focus on certain columns only--
SELECT 
	deaths.iso_code, deaths.location, deaths.date, 
	deaths.new_cases, deaths.total_cases,
	vacc.new_tests, vacc.total_tests, vacc.new_vaccinations, vacc.total_vaccinations
FROM covid19alex..CovidDeaths AS deaths
JOIN covid19alex..CovidVaccinations AS vacc
ON deaths.date = vacc.date AND deaths.location = vacc.location
--WHERE vacc.total_tests IS NOT NULL
ORDER BY deaths.location, deaths.date