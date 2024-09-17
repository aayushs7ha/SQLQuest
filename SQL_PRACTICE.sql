/* WILDCARD 
This query would select all movies whose title starts with "thor". */
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    title LIKE 'thor%';

/* This query would select all movies whose title ends with "%life".*/
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    title LIKE '% life';

/* This query would select all movies whose title contains with "%thor" anywhere.*/
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    title LIKE '%thor%';
    
    
/* 1. Print all movie titles and release year for all Marvel Studios movies. */
SELECT 
    title, release_year
FROM
    moviesdb.movies
WHERE
    studio = 'Marvel Studios';


/* 2. Print all movies that have Avenger in their name. */
SELECT
	*
FROM
	moviesdb.movies
WHERE
	title
LIKE 
	'%AVENGERS%';

/* 3. Print the year when the movie "The Godfather" was released. */
SELECT
	release_year
FROM
	moviesdb.movies
WHERE
	title = 'The Godfather';
/* 4) Print all distinct movie studios on Bollywood industry */
SELECT
	DISTINCT
		studio
	FROM
		moviesdb.movies
	WHERE
		industry = 'Bollywood';
/* This query would select all movies whose rating is greater than 8.5, it won't include 8.5
to include use >=  */
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    imdb_rating > 8.5;
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    imdb_rating >= 8.5;

/* SELECT ALL Movies details whose ratings are more than 6 and less than 8 */
SELECT
	*
FROM
	moviesdb.movies
WHERE
	imdb_rating 
BETWEEN
	6 AND 8;


/* SELECT ALL Movies details which released in 2018 2019 and 2022*/
SELECT
	*
FROM
	moviesdb.movies
WHERE
	release_year IN (2018,2019,2022);
    
/* Find the details of movies where imdb_rating is not available */
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    imdb_rating IS NULL;
    
/* Excercise 2 */

-- 1. Print all movies in the order of their release year (latest first)

SELECT 
    *
FROM
    moviesdb.movies
ORDER BY release_year DESC;

-- 2. All movies released in the year 2022

SELECT 
    *
FROM
    moviesdb.movies
WHERE release_year = 2022;

-- 3. Now all the movies released after 2020

SELECT 
    *
FROM
    moviesdb.movies
WHERE release_year > 2020;

-- 4. All movies after the year 2020 that have more than 8 rating
SELECT 
    *
FROM
    moviesdb.movies
WHERE release_year > 2020 AND imdb_rating > 8;


-- 5. Select all movies that are by Marvel studios and Hombale Film

SELECT 
    *
FROM
    moviesdb.movies
WHERE studio IN ('Marvel Studios','Hombale Films');


-- 6. Select all THOR movies by their release year
SELECT 
    *
FROM
    moviesdb.movies
WHERE
    title LIKE '%Thor%'
ORDER BY release_year ASC;

-- 7. Select all movies that are not from Marvel Studios
SELECT 
    *
FROM
    moviesdb.movies
WHERE studio NOT IN ('Marvel Studios');

