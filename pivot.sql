create table city1(name varchar(20), city varchar(20),salary int not null )

insert into city1 values('pooja', 'Mumbai', 20000),('mansi', 'Mumbai',25000),('Shravan', 'benglore',30000),('omi', 'pune',40000),('Anu', 'benglore',25000)

select * from city1

select player_groups, 
max(case when city='benglore' then name end) as benglore,
max(case when city='Mumbai' then name end) as Mumbai,
max(case when city='Pune' then name end)as Pune
from
(select *, row_number()over (partition by city order by name, salary)as player_groups 
from city1)a
group by player_groups
order by player_groups