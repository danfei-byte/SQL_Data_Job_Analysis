/*
Question: what skills are most in demand for data analyst?
Thought process:
- A skill is considered more in demand if it is quoted more frequently, so counting the occurrences of each skill is a key step.
- Count the number of occurrences of each skill for data analyst jobs.
- Join the relevant skills tables to get the necessary data.
- include only the skill names and their respective counts in the result.
*/

select  skills,
        count(skills_dim.skill_id) AS Skill_Count 
from job_postings_fact
inner join skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim
on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY Skill_Count DESC
LIMIT 20;
