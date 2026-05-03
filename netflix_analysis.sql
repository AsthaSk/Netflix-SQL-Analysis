-- Database and table creation
CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE netflix (
    show_id VARCHAR(10),
    typ VARCHAR(10),
    title VARCHAR(200),
    director VARCHAR(300),
    cast_members TEXT,
    country VARCHAR(200),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(200),
    descrp TEXT
);
-- Loading Data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles.csv'
INTO TABLE netflix
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select count(*) from netflix;

-- QUERIES:
-- q1: count of movies vs tv shows 
select typ, count(*) as Total from netflix
GROUP BY typ; 
-- q2: top 10 countries producing most content
select country,  count(*) as total 
from netflix
where country is not null
group by country
order by total desc
limit 10;

-- q3: which year was most content added?
SELECT year(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added,
       COUNT(*) AS total
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY total DESC
LIMIT 5;
-- q4: top 10 directors with most titles
select director, count(*) as titles
from netflix
where director is not null
group by director
order by titles desc
limit 10;
-- q5: most common ratings
select rating, COUNT(*) as total
from netflix
where rating IS NOT NULL
group by rating
order by total DESC;
-- q6: content added each year trend
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added,
       COUNT(*) AS total_content
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;
-- q7: Top 10 most common genres
SELECT listed_in, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
-- q8:  Movies vs TV Shows by country (top 5 countries):
SELECT country, typ, COUNT(*) AS total
FROM netflix
WHERE country IS NOT NULL
AND country != ''
GROUP BY country, typ
ORDER BY total DESC
LIMIT 10;
-- q9 How many movies vs shows added each year?
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added, typ, COUNT(*) AS total
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added, typ
ORDER BY year_added DESC;
-- q10 Average duration of movies by rating
SELECT rating, COUNT(*) AS total_movies, AVG(CAST(REPLACE(duration, ' min', '') AS UNSIGNED)) 
AS avg_duration_mins
FROM netflix
WHERE typ = 'Movie' AND duration LIKE '%min%' AND rating IS NOT NULL
GROUP BY rating
ORDER BY avg_duration_mins DESC;