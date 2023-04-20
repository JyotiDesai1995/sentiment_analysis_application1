create database jyoti
use jyoti

create table A(id bigint not null, name varchar(20))
insert into A values(1, 'pooja')
insert into A values(1, 'Arti')
insert into A values(2, 'Manasi')
insert into A values(2, null)
insert into A values(3, 'pooja')
insert into A values(5, 'arti')
insert into A values(6, 'omi')

SELECT * FROM A;

create table B(id bigint not null, name varchar(20))
insert into B values(1, 'omi')
insert into B values(2, 'Ankur')
insert into B values(3, 'Manasi')
insert into B values(4, null)
insert into B values(5, 'Aman')
insert into B values(7, 'Manasi')
insert into B values(8, 'omi')

select * from B;