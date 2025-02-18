/*
Question: which skills are associated with high salaries of thos data analyst jobs?
Thought process:
- we can conclude from comparing average salaries associated with each skill, this can be done by
- taking the avg of the salary_year_avg and then grouping by skills
- join two skills tables to locate the skills names
- ranking skills by average salary
*/

SELECT skills,
        ROUND(AVG(salary_year_avg), 0) AS Avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY Avg_salary DESC
LIMIT 20;

