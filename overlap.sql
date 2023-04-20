create table hall_events
(
hall_id integer,
start_date date,
end_date date
);

insert into hall_events values 
(1,'2023-01-13','2023-01-14')
,(1,'2023-01-14','2023-01-17')
,(1,'2023-01-15','2023-01-17')
,(1,'2023-01-18','2023-01-25')
,(2,'2022-12-09','2022-12-23')
,(2,'2022-12-13','2022-12-17')
,(3,'2022-12-01','2023-01-30');

select * from hall_events






with cte as(
select *,lag(end_date) over(partition by hall_id order by start_date) as prev_end_date
from hall_events
)
select hall_id,min(start_date) as start_date,max(end_date) as end_date
from cte
where prev_end_date is null or start_date < prev_end_date
group by hall_id
union 
select hall_id,start_date,end_date
from cte where start_date>prev_end_date
order by hall_id,start_date;