CREATE TABLE [dbo].[Teacher](
	[Id] [int] NOT NULL,
	[Name] [varchar](100) NULL)

GO
ALTER Procedure [dbo].[AllTeachersDetail_SP]
As
Begin
Select * from Teacher;
End;

GO
ALTER Procedure [dbo].[InsertRecords_SP]
@Id int,
@Name varchar(100)
As
Begin
Insert into Teacher(Id,Name) values(@Id,@Name)
End;

GO
ALTER procedure [dbo].[UpdateRecords_SP]
@Id int,
@Name varchar(100)
As
Begin
Update Teacher set Id = @Id , Name = @name
Where Id = @Id;
End;


GO
ALTER Procedure [dbo].[DeleteRecord_SP]
@Id int
As
Begin
Delete from Teacher where Id = @Id;
End;