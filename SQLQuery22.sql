select * from A;

delete from A where id=1
select * from B;

select * from A inner join B on A.id=B.id
select * from A left outer join B n A.id=B.id
select * from A left outer join B n A.id=B.id
select A.id, B.id from A right outer join B on A.id=B.id

select * from A, B
select * from B
alter table B ADD salary bigint 
 
update B set salary =30000 where id=1
update B set salary =50000 where id=2
update B set salary =60000 where id=3
update B set salary =30000 where id=4
update B set salary =40000 where id=5
update B set salary =40000 where id=8
insert into B   

select *, ROW_NUMBER() over (partition by id, name, salary order by id)row_number from B






