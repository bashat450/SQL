Use BashatParween;
select * from [dbo].[order];
--1) Get the total number of records in the orders table. 
select Count(*) As TotalRecords From [order];
-- 2) Retrieve unique job titles from the employees table.
alter table Employees Add JobTitle varchar(100);
select * from [dbo].[Employees];
Update Employees Set JobTitle = 'Manager' Where RegId = 1;
Update Employees Set JobTitle = 'Developer' Where RegId = 2;
Update Employees Set JobTitle = 'HR' Where RegId = 3;
Update Employees Set JobTitle = 'Analyst' Where RegId = 4;
Update Employees Set JobTitle = 'Staff' Where RegId = 5;
Update Employees Set JobTitle = 'Manager' Where RegId = 6;
Update Employees Set JobTitle = 'Developer' Where RegId = 7;
Update Employees Set JobTitle = 'Analyst' Where RegId = 8;
Update Employees Set JobTitle = 'Staff' Where RegId = 9;
Update Employees Set JobTitle = 'Staff' Where RegId = 11;
Update Employees Set JobTitle = 'Staff' Where RegId = 12;

Select Distinct JobTitle from Employees;
-- 3) Find employees whose salary is more than 50000.
Select * from Employees 
Where Salary > 50000;
--4) Write query all types of joins
--i) Inner Join (Matching records from both tables)[dbo].[Department]
Select e.FullName  as EmployeeName,
d.DepName as DepartmentName
From Employees e
Inner Join
Department d
On e.RegId = d.DepId;
--ii)Left Join  (All records from left table and matched records from the right table)
Select e.FullName as EmployeeName,
d.DepName
From Employees e
Left Join
Department d
On e.RegId = d.DepId;

--iii)Right Join  (All records from Right table and matched records from the left table)
Select e.FullName as EmployeeName,
d.DepName as DepartmentName
From Employees e
Right Join
Department d
On e.RegId = d.DepId;

--iii)Right Join  (All records when there is a match in either left or right table)
Select e.FullName as EmployeeName,
d.DepName as DepartmentName 
From Employees e
Full Join
Department d
On e.RegId = d.DepId;
--iv)Cross Join
Select e.FullName as EmployeeName,
d.DepName as DepartmentName
From Employees e
Cross Join
Department d ;

--6) Find the second highest salary from the employees table. 
select Distinct Salary
From Employees
Order By Salary desc
Offset 1 row 
fetch
next 1 row only;
--7) Display employees along with their department names using a JOIN.
Select e.FullName as EmployeeName,
d.DepName as DepartmentName 
From Employees e
Join
Department d
On e.RegId = d.DepId;

--8) Group employees by department and get the average salary per department. 
Select DepId as Department_Id,
Avg(Salary) as [Average salary]
From Employees
Group By DepId;

--9) Get the top 3 highest paid employees.
select Distinct top 3  
FullName as EmployeeName,
Salary 
from Employees
Order By Salary desc;

--10) . List departments that have more than 5 employees.
select DepId as Department_Id, 
Count(*) as TotalEmployees
From Employees
Group By DepId
having Count(*) > 5;

Select d.DepName as DepartmentName, 
Count(e.RegId) as TotalEmployees 
From Employees e
Join
Department d
On e.RegId = d.DepId
Group By DepName
Having Count(RegId) > 5 ;

--13)  Fetch employees who do not have any Department
SELECT e.RegId as Employee_Id,
e.FullName as EmployeeName,
d.DepName as DepartmentName
FROM Employees e
LEFT JOIN
Department d 
ON e.RegId = d.DepId
WHERE d.DepId IS NULL; 

--14)  Find employees who joined in the last 30 days.
select FullName as EmployeeName,
Currentdate as [Joining Date]
From Employees 
Where CurrentDate  >= DateADD(Day, -30, GetDate());

--15) Retrieve the employee with the nth highest salary. (e.g. 3rd highest); 
select FullName as EmployeeName,
Salary as TotalSalary
from Employees s1
Where (
select Count(Distinct s2.Salary)    -- Use BashatParween
From Employees s2
Where s2.Salary > s1.Salary
) = 3 ; 
--16)Subquery to find Employee with Salary Higher than Avg Salary
select FullName as EmployeeName,
Salary as TotalSalary
from Employees
Where Salary >
(Select Avg(Salary)
From Employees);

--17)  Write a Query Concatenate of two  column.
select Concat(FirstName, '  ', LastName) from Student3;

--18)   Find pattern matching ‘A’ ?
Select FullName as EmployeeName From Employees
where FullName Like 'A%';
Select FullName as EmployeeName From Employees
where FullName Like '%h';
Select FullName as EmployeeName From Employees
where FullName Like '_a';
--19)  Write a query  Delete,Drop and truncate.
Drop table Students2;
Truncate Table Students2;
insert into Students2 values (1,'Pooja');
Delete From Students2 Where StudentID =1;

--20) Write  a query insert, update,Delete query using stored procedure.
create procedure spGetEmployees
--with encryption
as
begin
select * from Employees;
end
-- Exec spGetEmployees;
sp_helpText spGetEmployees;
 ---Stored Procedure Insert Query
Create Proc spInsertStudent
@StudentID int,
@StudentName varchar(50)
As
Begin
Insert into [dbo].[Students2](StudentID,StudentName) Values
(@StudentID,@StudentName);
End;

Exec spInsertStudent @StudentID = 2, @StudentName = 'Neha';
sp_helpText spInsertStudent;

-- Stored Procedure Update Query
Create Proc spUpdateStudent
@StudentID int,
@StudentName varchar(50)
As
Begin
Update [dbo].[Students2]
Set StudentName = @StudentName
Where StudentID = @StudentID;
End;

Exec spUpdateStudent @StudentID = 2, @StudentName = 'Komal';
sp_helpText spUpdateStudent;
---- Stored Procedure Delete Query
Create Proc spDeleteStudent
@StudentID int,
@StudentName varchar(50)
As
Begin
Delete From [dbo].[Students2]
Where StudentID = @StudentID;
End;

Exec spDeleteStudent @StudentID = 2, @StudentName = 'Komal';
sp_helpText spDeleteStudent;
