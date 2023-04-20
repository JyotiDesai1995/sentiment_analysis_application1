--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [emp_id]
--      ,[action]
--      ,[time]
--  FROM [jyoti].[dbo].[hospital]

-- select * from
--(select emp_id, action, DENSE_RANK()over(partition by emp_id order by time desc)rnk from hospital)a
--where rnk=1



----suren Surendar
--8 monthsz

--create table brands 
--(
--category varchar(20),
--brand_name varchar(20)
--);
--insert into brands values
--('chocolates','5-star')
--,(null,'dairy milk')
--,(null,'perk')
--,(null,'eclair')
--,('Biscuits','britannia')
--,(null,'good day')
--,(null,'boost');

--select * from brands

with CTE as (
Select category, brand_name,
ROW_NUMBER () over (order by (select 'a')) as rn
from brands)
select brand_name,rn, min(category) over (order by rn) as New_Category from CTE