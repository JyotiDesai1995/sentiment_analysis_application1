CREATE TABLE booking_table(
   Booking_id       VARCHAR(3) NOT NULL 
  ,Booking_date     date NOT NULL
  ,User_id          VARCHAR(2) NOT NULL
  ,Line_of_business VARCHAR(6) NOT NULL
);
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b1','2022-03-23','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b2','2022-03-27','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b3','2022-03-28','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b4','2022-03-31','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b5','2022-04-02','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b6','2022-04-02','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b7','2022-04-06','u5','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b8','2022-04-06','u6','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b9','2022-04-06','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b10','2022-04-10','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b11','2022-04-12','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b12','2022-04-16','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b13','2022-04-19','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b14','2022-04-20','u5','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b15','2022-04-22','u6','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b16','2022-04-26','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b17','2022-04-28','u2','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b18','2022-04-30','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b19','2022-05-04','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b20','2022-05-06','u1','Flight');
;
CREATE TABLE user_table(
   User_id VARCHAR(3) NOT NULL
  ,Segment VARCHAR(2) NOT NULL
);
INSERT INTO user_table(User_id,Segment) VALUES ('u1','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u2','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u3','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u4','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u5','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u6','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u7','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u8','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u9','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u10','s3');


select *  from booking_table
select * from user_table


select u.segment,count(distinct u.User_id)as no_of_user
,count(distinct case when b.Line_of_business='Flight' and b.Booking_date between '2022-04-01' and '2022-04-30' then b.User_id end)as 
user_who_booked_flight_march2022 
from user_table u 
left join  booking_table b on u.User_id=b.User_id
group by u.segment

select * from
(select *, rank()over(partition by User_id order by Booking_date) as rn from Booking_table )a
where rn=1 and Line_of_business = 'Hotel'

select distinct User_id from 
(select * ,
first_value(Line_of_Business)over(partition by User_id order by Booking_date)as first_booking from Booking_table)a
where first_booking= 'hotel'

--write query to calculate the days between first and last booking of each other,
select user_id, Datediff( day, min(booking_date), max(booking_date)) from booking_table group by user_id

select user_id,min(booking_date), max(booking_date),
Datediff( day, min(booking_date), max(booking_date)) as no_of_days from booking_table group by user_id

--write a query to count the number of flight and hotels booking in each of the user segments for the year 2022
select segment,
sum(case when Line_of_business='Hotel' then 1 else 0 end)as Hotel_booking,
sum(case when Line_of_business='Flight' then 1 else 0 end) as Flight_booking
from Booking_table b inner join User_table u on b.user_id = u.user_id 
where datepart(year, booking_date)=2022
group by segment

--Q---FIND NEW AND REPEAT CUSTOMER
--how to approach complex query step by step
--how to use CASE WHEN with SUM
--how to use common table expression (CTE)

create table customer_order(
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_order
insert into customer_order values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;
with first_visit as
(select customer_id, min(order_date) as first_visit_date from customer_order
group by customer_id)
select co.order_date,  
sum(case when co.order_date=fv.first_Visit_date then 1 else 0 end) as first_visiting_date,
sum(case when co.order_date!=fv.first_Visit_date then 1 else 0 end) as repeat_date
from customer_order co inner join first_visit fv on co.customer_id=fv.customer_id
order by co.order_id



--2nd method

WITH CTE AS(
select *,CASE WHEN(DENSE_RANK()OVER(PARTITION BY customer_id ORDER BY order_date)=1) THEN 'New' 
ELSE 'Repeat' END AS IND_CUSTOMER  
from customer_order 
)
SELECT order_date,count(CASE WHEN IND_CUSTOMER='New' THEN order_id END) AS no_new_customer,
count(CASE WHEN IND_CUSTOMER='Repeat' THEN order_id END) AS no_repeat_customer
FROM CTE
GROUP BY order_date	

---users who purchased different product on different date

create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012'),(1,2,'23-01-2012'),(1,3,'25-01-2012'),(2,1,'23-01-2012')
,(2,2,'23-01-2012'),(2,2,'25-01-2012'),(2,4,'25-01-2012'),(3,4,'23-01-2012')
,(3,1,'23-01-2012'),(4,1,'23-01-2012'),(4,2,'25-01-2012')
;

select * from purchase_history

WITH all_data AS(
SELECT *,DENSE_RANK()OVER(PARTITION BY userid,productid ORDER BY purchasedate ASC) AS rn
FROM purchase_history)
SELECT userid
FROM all_data
GROUP BY userid
HAVING max(rn)=1 AND count(distinct purchasedate)>1

select userid from purchase_history
group by userid
having count(1)=count(distinct productid) and count(distinct purchasedate)>1

create table employee(
emp_id integer,
emp_name varchar(20),
department varchar(20),
salary integer,
dob date,
gender varchar(20),
);
insert into  employee values(1,'Ankit','comp',10000,'1983-12-02','M');
insert into  employee values(2,'Mohit','comp',15000,'1974-12-02','M');
insert into  employee values(3,'Vikas','market',10000,'1985-12-02','M');
insert into  employee values(4,'Rohit','civil',5000,'2006-12-02','M');
insert into  employee values(6,'Anu','market',10000,'1967-12-02','F');
insert into  employee values(7,'aditi','market',10000,'1985-12-02','F');
insert into  employee values(8,'Rohit','civil',50000,'2006-06-02','F');
insert into  employee values(9,'Mudit','market',15000,'1967-02-02','M');

select * from employee

---2nd highest salary
select * from(select *, rank()over(partition by department order by salary) as rn from  employee)a
where rn=1
 
 --department wise max salary
select department, max(salary) as max_Sal from  employee group by department 

---replace gender
update employee set gender = (case when gender='M' then 'F' when  gender= 'F' then 'M' end) from employee

select * from employee


 









