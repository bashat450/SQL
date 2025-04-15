use Bashat_Test10;
Create table Student_Details(
Id int primary key identity,
Name varchar(50) not null,
Gender varchar(20) not null,
Class int ,
Fees int);
insert into Student_Details values ('Bashat','Female',15,54000);
insert into Student_Details values ('Ali','Male',14,44000);
insert into Student_Details values ('Maheen','Female',04,34000);
insert into Student_Details values ('Hasnain','Male',12,52000);
insert into Student_Details values ('Amna','Female',10,22000);
insert into Student_Details values ('Arbaaz','Male',12,32000);
insert into Student_Details values ('Zyna','Female',13,42000);
insert into Student_Details values ('Manal','Female',14,40000);


CREATE TABLE Student_Log (
    Id INT,
    Name NVARCHAR(100),
    InsertedDate DATETIME
)
select * from Student_Log;
select * from Student_Details;
/*
Trigger when inserted values
*/
create trigger trGetStudent
on Student_Details
after insert
as
begin
print 'One Row is inserted right now...';
end
create trigger trGetStudent1
on Student_Details
after insert
as
begin
print 'One Row is inserted right now...';
end

create trigger trGetStudent2
on Student_Details
after insert
as
begin
print 'One Row is inserted right now...';
end

alter trigger trGetStudent
on Student_Details
after insert
as
begin 
select * from inserted
end

ALTER TRIGGER trGetStudent2
ON Student_Details
AFTER INSERT
AS
BEGIN
    INSERT INTO Student_Log (Id, Name, InsertedDate)
    SELECT Id, Name, GETDATE()
    FROM inserted
END
