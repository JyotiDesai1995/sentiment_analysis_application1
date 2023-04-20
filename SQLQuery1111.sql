/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[name]
      ,[salary]
  FROM [jyoti].[dbo].[B]
 
 
 Delete T from 
  (Select Id,Name,Salary,ROW_NUMBER() over (Partition by Id, Salary order by Salary)RowNumber From B)T where RowNumber >1

 