## Project Overview

This project serves as a practice aim using SQL and data visualization skills to analyze top-paid and in-demand skills of the data analyst job market in 2023.
The questions are be answered through my SQL queries are:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analyst?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

The dataset can be found [here](https://drive.google.com/drive/folders/1egWenKd_r3LRpdCf4SsqTeFZ1ZdY3DNx).

## Database Description
The database structure as seen below consists of four tables: company_dim, job_postings_fact, skills_dim, skills_job_dim, with a total row count of 787686 records.
![data description](visuals/Data_Structure.jpg)

## Tools I Used

## Key Findings
### 1. Top paying data analyst jobs
![data description](visuals/query_1.1.png)
![data description](visuals/query_1.2.png)
- **Wide salary range & gap**:
    - Top 10 data analyst jobs in both on-site and remote & hybrid job market show a broad salary range, spanning from $184,000 to $650,000 for on-site roles and $245,000 to $400,000 for remote & hybrid roles. This indicates significant earning potencial in the field.
    - Generally, on-site job positions offer higher average yearly salaries compared to remote & hybrid positions. A key factor behind this gap may be seniority levels - in both cases, half or more of the top roles carry titles like Seniors, Head, or Director. This pattern indicates a salary stratification within data analyst roles, where more senior, specialized, or managerial positions - particulary those on-site - are compensated at a premium level.



