select * 
from(
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 1
) as Jan_jobs;


-- get the result of those company names associated with requiring no degree
select name as company_name, company_id
from company_dim
where company_id in (
        select company_id
        from job_postings_fact
        where job_no_degree_mention = TRUE
)
order by company_id;

-- create a CTE that shows the number of job postings from each company
with company_job_count as (
     select company_id, count(*)
     from job_postings_fact
     group by company_id
)

select *
from company_job_count;

-- find the company that has the most job
with company_job_count as (
     select company_id, count(*) as job_count
     from job_postings_fact
     group by company_id
)
select c1.company_id, c1.name, c2.job_count
from company_dim as c1
left join company_job_count as c2
on c1.company_id = c2.company_id
order by c2.job_count desc;

-- below soution does the simiar (not use CTE)
select c1.company_id, c1.name, count(c2.job_id) as job_count
from company_dim as c1
left join job_postings_fact as c2
on c1.company_id = c2.company_id
group by c1.company_id, c1.name
order by job_count desc;
