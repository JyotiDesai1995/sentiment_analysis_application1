/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Date]
      ,[Plant]
      ,[State]
      ,[Country]
      ,[OrderType]
      ,[Customer]
      ,[CustomerLocation]
      ,[SalesType]
      ,[ProductGroup]
      ,[Sales]
      ,[Budget]
      ,[Plan]
  FROM [employee].[dbo].[Trans_Table]

CREATE TABLE students (
  id INTEGER NOT NULL,
  name VARCHAR(30) NOT NULL,
  gender CHAR(1) NOT NULL,
  salary INTEGER NOT NULL
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M',30000);
INSERT INTO students VALUES (2, 'Joanna', 'F',50000);
INSERT INTO students VALUES (3, 'mini', 'M',35000);
INSERT INTO students VALUES (4, 'John', 'F',55000);
INSERT INTO students VALUES (5, 'Riya', 'F',37000);
INSERT INTO students VALUES (6, 'Jenny', 'F',52000);
INSERT INTO students VALUES (5, 'Ri', 'F',38000);
INSERT INTO students VALUES (6, 'Je', 'F',52000);
-- fetch some values


select * from students;



SELECT  name,M,F FROM     
(SELECT  gender, name, salary FROM students ) AS Tab1    
PIVOT    
(SUM(salary) FOR gender IN (M, F)) AS Tab2    
