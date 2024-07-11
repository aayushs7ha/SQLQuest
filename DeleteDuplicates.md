-- DELETE DUPLICATE ROWS IN SQL 

```
Create table EMP_Duplicates
(
     ID int,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO

Insert into EMP_Duplicates values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into EMP_Duplicates values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into EMP_Duplicates values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into EMP_Duplicates values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into EMP_Duplicates values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into EMP_Duplicates values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into EMP_Duplicates values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into EMP_Duplicates values (3, 'Ben', 'Hoskins', 'Male', 70000)
```
![image](https://github.com/user-attachments/assets/259069f9-286d-49f1-a10f-d5cfc05758fd)

```
SELECT * FROM EMP_Duplicates;

WITH empCTE AS 
(
    SELECT *, ROW_NUMBER() OVER(Partition BY ID order by ID) as RowNumber
    FROM EMP_Duplicates
)
DELETE FROM empCTE
WHERE RowNumber > 1;
```
![image](https://github.com/user-attachments/assets/ce5bda70-06a8-4ced-b9a5-c9ab7558c3b2)
