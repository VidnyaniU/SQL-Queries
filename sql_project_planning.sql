
-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, 
-- then order by the start date of the project.
select a.start_date, min(b.end_date)
from
(select p1.start_date 
from projects p1 left join projects p2
on p1.start_date = p2.end_date 
where p2.end_date is null)a,
(select p2.end_date
from projects p1 right join projects p2
on p1.start_date = p2.end_date 
where p1.start_date is null)b
where a.start_date < b.end_date
group by a.start_date
order by datediff(min(b.end_date),a.start_date), a.start_date asc