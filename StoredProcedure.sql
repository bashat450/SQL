Use Bashat_Test10;

create table Employee_details(
Id int primary key identity , Name varchar(50), Gender varchar(20), salary int not null, City varchar(50));

insert into Employee_details values
('Ali','Male',45000,'Mumbai'),
('Neha','female',65000,'Chennai'),
('Riya','Female',55000,'Mumbai'),
('Ali','Male',75000,'Patna'),
('Armaan','Male',75000,'Patna'),
('Afzal','Male',95000,'Mumbai');

select * from Employee_details;
/*
-- ************* stored Procedure **************  
i)  Performance Optimization
        Stored procedures are precompiled and cached by SQL Server, which means they execute faster than ad-hoc queries.
        Execution plans are reused, saving time on parsing and optimizing queries repeatedly.
ii) Code Reusability and Modularity
    You can write a piece of SQL logic once in a stored procedure and reuse it wherever needed.
    It helps in modularizing your code, making large applications easier to manage and update.
iii) Security and Access Control
       Stored procedures allow you to restrict direct access to the tables.
       You can grant permissions to execute a stored procedure without giving access to the underlying tables.
iV)  Reduced Network Traffic
        Instead of sending multiple SQL statements over the network, a stored procedure call reduces round trips 
         and data transfer, especially with complex operations.
v)    Error Handling and Control
         Stored procedures support TRY...CATCH blocks, so you can include error handling directly in the procedure logic.

vi)   Support for Complex Business Logic
          You can include loops, conditions (IF, WHILE), and even call other procedures or functions within a stored procedure.
*/
create procedure spGetEmployee
as
begin
select * from Employee_details;
end
Exec spGetEmployee;

--  Employee Details [Print all values]
create procedure spGetEmployeesDetails1
as
begin
select * from Employee_details;
end
-- Print Name and Gender Column
create procedure spGetEmployee1
as
begin
select Name,Gender from Employee_details;
end
--     put Single Parameter in SP
create proc spGetEmployeesByID
@id int
as
begin
select * from Employee_details where Id = @id
end
-- Put multiple parameter
create proc spGetEmployeesNAMEGENSAL
@name varchar(50),
@gender varchar(20),
@salary int
as
begin
select * from Employee_details where Name = @name and Gender = @gender and salary = @salary;
end
--  Employee Details [Print all values]
Exec spGetEmployeesDetails1;

-- Print Name and Gender Column
Exec spGetEmployee1;

--     Execute Single Parameter in SP
Execute spGetEmployeesByID  2;

-- Execute multiple parameter
exec spGetEmployeesNAMEGENSAL 'Afzal','Male',95000 ;

-- Update Values   // Alter
--         ALTER        only works if the procedure already exists.
alter proc spGetEmployeesDetails1
@id int,
@name varchar(50)
as 
begin
select Name, Salary from Employee_details where Id = @id and Name = @name;
end
exec spGetEmployeesDetails1 @id = 1,@name = 'Zeba';
/*
-- Hide Stored Procedure File
-- Db=>Bashat_Test10 > Programmability > Stored Procedures  >  dbo.spGetEmployeeHIDE
*/
create procedure spGetEmployeeHIDE
with encryption
as
begin
select * from Employee_details;
end
execute spGetEmployeeHIDE;

sp_helptext spGetEmployeesDetails1;

select * from Employee_details;


-- Output Parameter
create proc spGetEmployeesByGender
@Gender varchar(20),
@EmployeeCount int output
as
begin
select @EmployeeCount = Count(Id) from Employee_details
where Gender = @Gender
end
-- Declare OutPut variable
/*
Declare @TotalEmployee int
execute spGetEmployeesByGender 'male', @TotalEmployee output
select @TotalEmployee as Total_Male_Employee;
*/
Declare @TotalEmployee int
execute spGetEmployeesByGender 'Female', @TotalEmployee output
select @TotalEmployee as [Total female Employee];

