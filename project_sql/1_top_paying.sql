/*
Question: what are the top-paying data analyst jobs?
Thought process:
- I want to break down the analysis to two parts across the location type, either remote or on-site
- Want to include full job title, job title in short, job location, job post date, average yearly salaries in the result
- Remove the NULL values in the average yearly salaries field
*/

-- Remote and hybrid data analyst job market
SELECT job_id,
        job_title, 
        job_title_short, 
        job_location, 
        job_posted_date :: DATE AS posted_date, 
        salary_year_avg, 
        company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_location = 'Anywhere'
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

-- Non remote data analyst job market
SELECT job_id,
        job_title, 
        job_title_short, 
        job_location, 
        job_posted_date :: DATE AS posted_date, 
        salary_year_avg, 
        company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_location != 'Anywhere'
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;


