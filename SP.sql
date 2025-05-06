Use College;
Select * from [dbo].[Students];

-- Get All Details
Create Procedure GetAllStudentsDetails_SP
As
Begin
Select * From Students;
End
Go

Execute GetAllStudentsDetails_SP;

                       -- Insert Values in Students tables using Sp
Alter Proc InsertValuesInStudents_SP
@Id int,
@Name varchar(100),
@City varchar(100),
@State varchar(100),
@Fees int,
@JoiningDate DateTime
As
Begin
Insert into Students(Id, Name, City, State, Fees, JoiningDate) 
Values
(@Id, @Name, @City, @State, @Fees, @JoiningDate);
End;
Go
 --Insert valus
Execute InsertValuesInStudents_SP 
@Id = 105,
@Name = 'Ayeza', 
@City = 'Simri BakhtiyarPur', 
@State = 'Bihar', 
@Fees = 6700, 
@JoiningDate = '2025-05-05';

-- Display All Details
Execute GetAllStudentsDetails_SP;

-- Update Students Values using SP
Create Procedure UpadateStudentValues_SP
@Id int,
@Name varchar(100), 
@City varchar(100), 
@State varchar(100), 
@Fees int, 
@JoiningDate DateTime
AS
Begin
Update Students
Set
Name = @Name,
City = @City,
State = @State,
Fees = @Fees,
JoiningDate = @JoiningDate
Where Id = @Id;
End;
Go

                                                --Execute Update Values
Execute UpadateStudentValues_SP
@Id = 102,
@Name = 'Myra',
@City = 'Vasai Road',
@State = 'UP',
@Fees = 56000,
@JoiningDate = '2025-04-05';

-- Display All Details
Execute GetAllStudentsDetails_SP;


-- Delete Student Values in SP
Create Procedure DeleteStudentValues_SP
@Id int
As
Begin
Delete From Students Where Id = @Id;
End;
Go

--call Delete values
Execute DeleteStudentValues_SP @Id = 105;

-- Display All Details
Execute GetAllStudentsDetails_SP;