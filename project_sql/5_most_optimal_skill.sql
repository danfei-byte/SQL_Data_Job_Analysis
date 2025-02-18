/*
Question: what are most optimal skills to learn?
Thought process:
- we can combine the demand and salaries of the skills together to get insights of those most optimal skills to learn
- specifically, to determine a threshold that, when the frequence of the skill is no less than 20 times, then we consider it a high demand skill
- also combine insights from skill required for those top-10 paying data analyst jobs
*/

SELECT skills,
        ROUND(AVG(salary_year_avg), 0) AS Avg_salary,
        COUNT(skills_dim.skill_id) AS Skill_Count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills
HAVING COUNT(skills_dim.skill_id) >= 20
ORDER BY Avg_salary DESC,
        Skill_Count DESC
LIMIT 20;