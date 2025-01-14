-- label the job locations
-- if a job location is anywhere, label it as 'remote'
-- if it's in NYC, label it as 'local'
-- if it's in other states, label it as 'onsite'
select 
    job_title_short,
    job_location,
    case
        when job_location = 'Anywhere' then 'remote'
        when job_location = 'New York, NY' then 'local'
        else 'on_site'
    end as location_category
from job_postings_fact;

-- I want more granular results
select 
    job_title_short,
    job_location,
    count(job_id) as job_counts,
    case
        when job_location = 'Anywhere' then 'remote'
        when job_location = 'New York, NY' then 'local'
        else 'on_site'
    end as location_category
from job_postings_fact
group by job_title_short, job_location, 
    case
        when job_location = 'Anywhere' then 'remote'
        when job_location = 'New York, NY' then 'local'
        else 'on_site'
    end;

-- I want to know the specific job types Data Analyst's caterogy, posting location, etc
select job_location,
        count(job_id),
        CASE
            when job_location = 'Anywhere' then 'remote'
            when job_location = 'New York, NY' then 'local'
            else 'on_site'
        end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by job_location,
    CASE
            when job_location = 'Anywhere' then 'remote'
            when job_location = 'New York, NY' then 'local'
            else 'on_site'
        end

-- i don't want to see the locations, I only want to see how many DA jobs there are under three location categories
select 
        count(job_id),
        CASE
            when job_location = 'Anywhere' then 'remote'
            when job_location = 'New York, NY' then 'local'
            else 'on_site'
        end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by
    CASE
            when job_location = 'Anywhere' then 'remote'
            when job_location = 'New York, NY' then 'local'
            else 'on_site'
        end