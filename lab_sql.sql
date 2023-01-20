-- Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * FROM sakila.actor WHERE first_name= "Scarlett";
-- How many films (movies) are available for rent and how many films have been rented?
SELECT count(inventory_id) as available_films FROM sakila.rental;
-- 16044 Available films

select * from rental order by return_date asc;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duratio
select min(length) as min_duration, max(length) as max_duration from film ;

-- What's the average movie duration expressed in format (hours, minutes)?
select format(avg(length), "hh:mm:ss")  from film;

-- 115

-- How many distinct (different) actors' last names are there?
SELECT count(distinct last_name)  FROM sakila.actor;

-- 121

-- DOUBT Since how many days has the company been operating (check DATEDIFF() function)?

select min(rental_date) from rental; 
select datediff("2005-05-24",  '2023/01/18') as datediff;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT  *, EXTRACT(MONTH FROM rental_date) as month,  weekday(rental_date) from rental limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN weekday(rental_date)  = 6 then 'weekend'
WHEN weekday(rental_date)  = 7 then 'weekend'

ELSE 'workday'
END AS 'rental_date',rental_date AS 'day_type'
FROM sakila.rental;

-- Get release years.
SELECT  distinct release_year  FROM sakila.film;

-- Get all films with ARMAGEDDON in the title.
SELECT *  FROM sakila.film where title like "%ARMAGEDDON%";

-- Get all films which title ends with APOLLO
SELECT *  FROM sakila.film where title like "%APOLLO";

-- Get 10 the longest films
SELECT title, length  FROM sakila.film ORDER BY LENGTH desc LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT count(film_id)  FROM sakila.film where special_features <> " ";