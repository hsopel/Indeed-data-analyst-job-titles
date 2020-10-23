SELECT COUNT (*)
FROM data_analyst_jobs;

--1. 1793

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--2. ExxonMobil

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';
--WHERE location IN ('TN', 'KY'); alternate approach
--GROUP BY location
--3. TN: 21; TN or KY: 27

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

--4. TN, >4: 3 jobs

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--5. 151 postings

SELECT location AS state, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL
GROUP BY state
HAVING AVG(star_rating) IS NOT NULL
ORDER BY avg_rating DESC;

--6. Highest average star rating: NE 4.2 

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--7. Unique job titles: 881 (crazy!)

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--8. Unique job titles in CA: 230

SELECT company, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT null
GROUP BY company;

SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000 and company IS NOT null;

--9. Companies with review_count > 5000: 40

SELECT company, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT null
GROUP BY company
ORDER BY avg_rating DESC
LIMIT 1;

--10. General Motors 4.19999 - tied with Unilever, Microsoft, Nike, American Express, Kaiser Permanente

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--11. Title with word 'Analyst': 774

SELECT title 
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' 
AND title NOT LIKE '%Analytics%';

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%';

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';

/*
12.
39 job titles; These either contain analyst or analytics, 
but written in all capital letters or the title 
includes data visualization or data science
*/

SELECT domain, COUNT(title) AS hard_to_fill
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND skill LIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC;

/*
BONUS 
"Internet and Software"	62
"Banks and Financial Services"	61
"Consulting and Business Services"	57
"Health Care"	52
*/

SELECT ROUND(star_rating,2)
FROM data_analyst_jobs
LIMIT 5;

SELECT *
FROM data_analyst_jobs
LIMIT 5;