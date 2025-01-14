/*
Question: what skills are required for these top-paying jobs?
Thought process:
- still, analyzing across two parts, remote & hybrid and on-site
- this is similar with question 1, the only issue here is that the skills section is in another table
- use CTE function to simplify the coding process
*/

-- remote & hybrid jobs

with top_paying_jobs as (
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
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id;


-- on-site jobs
with top_paying_jobs_onsite as (
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
LIMIT 10
)

SELECT 
    top_paying_jobs_onsite.*,
    skills_dim.skills
FROM top_paying_jobs_onsite
INNER JOIN skills_job_dim
    ON top_paying_jobs_onsite.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id;