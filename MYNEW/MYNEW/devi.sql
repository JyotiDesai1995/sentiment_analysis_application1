create table puzzle1(id int,
formula varchar(10),
value int
)
insert into puzzle1 values (1,'1+4',10),(2,'2+1',5),(3,'3-2',40),(4,'4-1',20),(5,'3-1',30);
select * from puzzle1

with cte as(
select left(formula,1)as no1, right(formula,1)as no2, substring(formula,2,1)as operator
from puzzle1)
select cte.id, cte.value, cte.formula, cte.operator, p1.value as value1, p2.value as value2,
case when cte.operator='+' then p1.value+p2.value else p1.value-p2.value end as total
from cte 
inner join puzzle1 p1 on cte.no1=p1.id
inner join puzzle1 p2 on cte.no2=p2.id