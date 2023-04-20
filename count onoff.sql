create table event_status1
(
event_time varchar(10),
status varchar(10)
);
insert into event_status1 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');

select * from event_status1

select 
min(event_time) as start_time,
off_time as end_time 
from event_status1 e1
  cross apply(select 
				  min(event_time) as off_time
				  from event_status1 e2
				  where e2.event_time > e1.event_time
				  and e1.status='on'
				  and e2.status='off'
)t
where off_time is not null
group by off_time

      
