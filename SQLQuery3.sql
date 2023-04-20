/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Customer_No]
      ,[Card_type]
      ,[Date]
      ,[Category]
      ,[Transaction_Type]
      ,[Amount]
  FROM [AdventureWorksDW2017].[dbo].[personal_transactions]

SELECT Customer_No
FROM personal_transactions
GROUP BY Customer_No;

select * from personal_transactions;

select distinct (Customer_No), Card_type from personal_transactions where Customer_No between '1000501' and '1000531'

select count(Amount) as Amt from personal_transactions where Transaction_type ='debit'

select sum(Amount) as total, Category from personal_transactions
where Category='Restaurants' or Transaction_type ='debit'
group by Category

select sum(Amount) as total from personal_transactions
where Category='Restaurants'


SELECT  sum(Amount) as count, Customer_No
FROM personal_transactions GROUP BY  Transaction_type
 Having sum(Amount) > 500

