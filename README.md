# Netflix Content Analysis — SQL Case Study

## Project Overview
This project performs a business case study on Netflix's content library 
of 8,907 titles using MySQL. The goal is to help Netflix understand their 
content distribution and make better acquisition decisions.

## Tools Used
- MySQL Workbench
- SQL (Joins, Group By, Aggregations, String Functions, Date Functions)

## Dataset
- Source: Kaggle — Netflix Movies and TV Shows
- Size: 8,907 rows, 12 columns
- Fields: Title, Type, Director, Country, Date Added, Rating, Duration, Genre

## Business Questions Answered
1. What is the ratio of Movies vs TV Shows on Netflix?
2. Which countries produce the most Netflix content?
3. Which years had the highest content additions?
4. Who are the top 10 most prolific directors on Netflix?
5. What are the most common content ratings?
6. How has content addition grown year over year?
7. What are the most common genres on Netflix?
8. How does Movies vs TV Shows distribution vary by country?
9. How many Movies vs TV Shows were added each year?
10. What is the average movie duration by rating category?

## Key Findings
- Netflix has 6,131 Movies vs 2,676 TV Shows — a 70:30 ratio
- United States leads with 2,818 titles; India is 2nd with 972 titles
- 2019 was the peak year with 2,016 titles added in a single year
- TV-MA is the most common rating with 3,207 titles
- Rajiv Chilaka is the most prolific director with 19 titles
- Dramas and International Movies is the most common genre combination
- NC-17 rated movies have the longest average duration at 125 minutes

## SQL Concepts Used
- GROUP BY and aggregate functions (COUNT, AVG)
- WHERE clause with NULL handling
- ORDER BY and LIMIT
- STR_TO_DATE for date parsing
- REPLACE and CAST for string manipulation
- Filtering with LIKE

## Project Structure
netflix_analysis.sql — all 10 SQL queries with comments
