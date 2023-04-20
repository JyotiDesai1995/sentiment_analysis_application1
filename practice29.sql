/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Name]
      ,[Personal_Mobile]
      ,[Home_Mobile]
      ,[office_no]
  FROM [AdventureWorksDW2017].[dbo].[Shravan_Mobileinfo]


 SELECT Personal_Mobile + ' ' +Home_Mobile+ ' '  + office_no  Mobile_no FROM Shravan_Mobileinfo ;

 select Name, coalesce (Personal_Mobile, Home_Mobile, office_no) from Shravan_Mobileinfo

 select concat('Personal_Mobile', 'Home_Mobile', 'office_no') from Shravan_Mobileinfo

