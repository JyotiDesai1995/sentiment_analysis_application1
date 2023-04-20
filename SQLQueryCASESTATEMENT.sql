create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India'); 
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ'); 
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

select team_name,
COUNT(1)as matchsplayed,
SUM(flag)as no_of_wins,
COUNT(1)-SUM(flg)as no_of_lose from( select team_1 as team_name,
CASe when Team_1=winner then 1 else 0 end flg from icc_world_cup union all select Team_2 as team_name,
CASe when Team_2=winner then 1 else 0 end flg from icc_world_cup)a group by team_name;

select Team_name,
count(1)as Matchplayed,
sum(flag)as no_of_wins,
count(1)-sum(flag)as no_of_lose from(select Team_1 as Team_name,
case when Team_1 = Winner then 1 else 0 end as flag from icc_world_cup union all select Team_2 as Team_name,
case when Team_2 = Winner then 1 else 0 end as flag from icc_world_cup)a group by Team_name;

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),
(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100),
(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),
(6,500,cast('2022-01-02' as date),2700) ,(7,100,cast('2022-01-03' as date),3000),
(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000) ;

select * from customer_orders


select order_id, customer_id, order_date, rank()over (partition by customer_id order by order_id)rank from customer_orders order by order_id


select customer_id, min(order_date)as first_visit_date from customer_orders group by customer_id





 2








