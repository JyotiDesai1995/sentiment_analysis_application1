create table event_status
(
event_time varchar(10),
status varchar(10)
);
insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');

select * from event_status
--with cte as
--(select *,right(event_time,2) - row_number() over() as time 
--from event_status)
--select min(event_time) as login,max(event_time) as logout,count(*)-1 as cnt
--from cte
--group by time;

SELECT
  MIN(event_time) AS start_time,
  off_time AS end_time
 FROM event_status e1
CROSS APPLY (SELECT
                    MIN(e2.event_time) AS off_time
                          FROM event_status e2
                            WHERE e2.event_time > e1.event_time
                              AND e1.status = 'on'
                              AND e2.status = 'off'

) t
WHERE off_time IS NOT NULL
GROUP BY off_time

