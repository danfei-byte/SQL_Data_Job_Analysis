-- playaround with date functiona
-- three key functions:
    -- ::DATE: convert to a date format by removing the time portion
    -- AT TIME ZONE: convert a timestamp to a specified time zone
    -- EXTRACT

select job_id, job_title_short as title, 
        job_location as location, job_posted_date :: date as date -- if I only need the dates
from job_postings_fact;

-- if I want to show the time zones
-- the original time zone is UTC 
select job_id, job_title_short as title, 
        job_location as location, job_posted_date at time zone 'UTC' at time zone 'EST' as date
from job_postings_fact
limit 5;

select job_id, job_title_short as title, 
        job_location as location, job_posted_date at time zone 'UTC' at time zone 'EST' as date,
        extract(month from job_posted_date) as posted_month,
        extract(year from job_posted_date) as posted_year
from job_postings_fact
limit 5;

-- how many jobs posted each month? to see the trend
select 
        extract(month from job_posted_date) as posted_month,
        count(job_id) as numbers
from job_postings_fact
group by posted_month;

-- how many job posted each month and what are their titles?
select 
        extract(month from job_posted_date) as posted_month,
        count(job_id) as numbers,
        job_title_short as job_title
from job_postings_fact
group by extract(month from job_posted_date),
        job_title_short
order by posted_month;

-- in terms of the data analyst job position, how is the posting trend?
select extract(month from job_posted_date) as month,
        count(job_id) as job_counts
from job_postings_fact
where job_title_short = 'Data Analyst'
group by extract(month from job_posted_date)
order by month;

-- create three tables showing job postings in January, February, and March
create table Jan_jobs as
        select *
        from job_postings_fact
        where extract(month from job_posted_date) = 1;

create table Feb_jobs as
        select *
        from job_postings_fact
        where extract(month from job_posted_date) = 2;

create table Mar_jobs as
        select *
        from job_postings_fact
        where extract(month from job_posted_date) = 3;

