create table segmetriq11(id int, name varchar(20), salary varchar(20), create_timestamp date)
insert into  segmetriq11 values(1001,'ankit', 30000, getdate())
insert into  segmetriq11 values(1002,'omi', 25000, getDate())
insert into  segmetriq11 values(1004,'omant', 25000, getDate())

insert into  segmetriq11 values(1003,'jelly', 35000, getDate())
insert into  segmetriq11 values(1002,'pooja', 30000, getDate())
insert into  segmetriq11 values(1005,'ankit', 45000, getDate())
insert into  segmetriq11 values(1004,'omant', 40000, getDate())


select * from segmetriq11
select id, count(1) from segmetriq11 group by id having count(1)>1
select id, min(salary)as minmumsalary from segmetriq11 group by id having count(1)>1

with cte as(
select id, min(salary)as minmumsalary from segmetriq11 group by id, salary having count(1)>1)a
delete   salary from cte

