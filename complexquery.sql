CREATE TABLE Product (
    Product_name varchar(255),
    price int);

insert into Product values('milk', 10)
insert into Product values('biscuit', 20)
insert into Product values('bread', 30)
insert into Product values('ice', 60)

select * from Product;

select product_name, price, sum(price)over(order by price) inventory_count from product

CREATE TABLE subject1 ( id int,  student_name varchar(255), subject varchar(255));
insert into subject1 values(1001, 'pooja', 'maths')
insert into subject1 values(1001, 'pooja','maths')
insert into subject1 values(1002, 'om','english')
insert into subject1 values(1002, 'om','english')
insert into subject1 values(1003, 'arti','c++')
insert into subject1 values(1003, 'arti','c++')

select * from subject1
select id, student_name, STRING_AGG(subject,',') from subject1 group by id,student_name

--select id,names,STRING_AGG(sub,',') from teacher group by id,names

