use moviesdb;


SELECT 
    *, YEAR(CURDATE()) - birth_year AS Age
FROM
    actors;
    
    
-- Financials //

SELECT 
    *, (revenue - budget) AS profit
FROM
    moviesdb.financials;
    
-- convert financial unit in a standard inr revenue
-- use if condition

SELECT 
    *,
    IF(currency = 'USD',
        revenue * 77,
        revenue) AS revenue_inr
FROM
    moviesdb.financials;
SELECT 
    *,
    CASE
        WHEN unit = 'thousands' THEN renvenue / 1000
        WHEN unit = 'billions' THEN revenue * 1000
        WHEN unit = 'millions' THEN revenue
    END AS revenue_in_millions
FROM
    moviesdb.financials;
    
-- exercise 
-- print profit % for all the movies

SELECT 
    *,
    (revenue - budget) AS profit,
    ((revenue / budget) * 100) / budget AS profit_percentage
FROM
    moviesdb.financials;


  -- JOINS --  
-- WHEN YOU don't specify what type of join operation you are performing. It is by default an inner-join.
use moviesdb;

SELECT 
    m.movie_id, m.title, f.budget, f.revenue, f.currency, f.unit
FROM
    movies m
        JOIN
    financials f ON m.movie_id = f.movie_id;

-- INNER JOIN - ONLY MATCHING PARAMETERS FROM BOTH THE TABLES 
-- IN our movies table we have movie id 106,112 (Sholey and Inception) respectively;
-- these two movie_ids are not avialable in the finanical
-- if we want to include these two we can use left join

SELECT 
    m.movie_id,
    m.title,
    m.imdb_rating,
    f.budget,
    f.revenue,
    f.currency,
    f.unit
FROM
    movies m
        LEFT JOIN
    financials f ON m.movie_id = f.movie_id
ORDER BY m.imdb_rating;
    
-- Right Join --
SELECT 
    f.movie_id,
    m.title,
    m.imdb_rating,
    f.budget,
    f.revenue,
    f.currency,
    f.unit
FROM
    movies m
        RIGHT JOIN
    financials f ON m.movie_id = f.movie_id
ORDER BY m.imdb_rating;
    
    -- Full Join
    
SELECT 
    m.movie_id, title, budget, revenue, currency
FROM
    movies m
        LEFT JOIN
    financials f ON m.movie_id = f.movie_id 
UNION SELECT 
    m.movie_id, title, budget, revenue, currency
FROM
    movies m
        RIGHT JOIN
    financials f ON m.movie_id = f.movie_id;
    
    
-- using CLAUSE --
SELECT 
    movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        LEFT JOIN
    financials f USING (movie_id);

SELECT 
    movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        RIGHT JOIN
    financials f USING (movie_id);
    
-- EXCERCISE

SELECT 
    m.title, l.name
FROM
    movies m
        JOIN
    languages l USING (language_id)
ORDER BY movie_id;

-- 2 Show all Telugu movie names (assuming you don't know the language_id for Telugu)
SELECT 
    m.title, l.name
FROM
    movies m
        LEFT JOIN
    languages l ON l.language_id = m.language_id
WHERE
    l.name = 'Telugu'
ORDER BY movie_id;


-- 3. Show the language and number of movies released in that language

SELECT 
    l.name, COUNT(m.movie_id) AS count_of_movies
FROM
    movies m
        RIGHT JOIN
    languages l ON m.language_id = l.language_id
GROUP BY l.name
ORDER BY count_of_movies DESC;
-- CROSS JOIN 
-- will solve later


-- SHOW movies with actors name

SELECT
    m.title,
    GROUP_CONCAT(a.name SEPARATOR ' | ') AS actors
FROM
    movies m
INNER JOIN movie_actor ma 
    ON ma.movie_id = m.movie_id
INNER JOIN actors a 
    ON a.actor_id = ma.actor_id
GROUP BY
    m.movie_id;

-- SHOW ACTORS AND their movies

SELECT 
    a.name,
    GROUP_CONCAT(m.title) AS Movies,
    COUNT(m.title) AS Movie_Count
FROM
    actors a
        JOIN
    movie_actor ma ON ma.actor_id = a.actor_id
        JOIN
    movies m ON m.movie_id = ma.movie_id
GROUP BY a.name
ORDER BY movie_count DESC;

-- 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
-- Print movie name, revenue, currency, and unit

SELECT 
    m.title, f.revenue, f.currency, f.unit
FROM
    languages l
        JOIN
    movies m ON m.language_id = l.language_id
        JOIN
    financials f ON f.movie_id = m.movie_id
WHERE
    l.name = 'Hindi' and f.unit="Millions"
GROUP BY m.title , f.revenue , f.currency , f.unit
ORDER BY f.revenue DESC;


