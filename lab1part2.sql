create database CRS21010101183;
create table Person(
PersonId INT,
PersonName VARCHAR(50),
Salary DATETIME,
JoiningDate Datetime ,
City Varchar(100) ,
Age Int ,
BirthDate Datetime
)
create table PersonLog(
PLogID Int, 
PersonID Int,
PersonName Varchar(250),
Operation Varchar (50),
UpdatedDate Datetime
);
---Q-1
create proc pr_insert_parson
@PersonId INT,
@PersonName VARCHAR(50),
@Salary DATETIME,
@JoiningDate Datetime ,
@City Varchar(100) ,
@Age Int ,
@BirthDate Datetime
As
Begin
insert into person
values(@PersonId,@PersonName,@Salary,@JoiningDate,@City,@Age,@BirthDate);
END

exec pr_insert_parson 101,'chiarg solanki',200000,'2001-12-12','rajkot',18,'2004-12-12'
select*from Person;
----------------------------------------

create proc pr_Update_parson
@PersonId INT,
@PersonName VARCHAR(50)
As
Begin
update Person
set PersonName=@PersonName
where PersonId=@PersonId;
END

exec pr_Update_parson 101,'abhi solanki';
select*from Person;

----------------------------------------------
create proc pr_delete_parson
@PersonId INT
As
Begin
delete from Person where personId=@PersonId;
END
exec pr_delete_parson 101
select*from Person;

-----------------------------------------------------------------------------------

----Query 2
/*2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that, 
create a new table PersonLog to log (enter) all operations performed on the Person table.*/
----------------------------------------------------------------------------------
create trigger tr_per_insert_for
on person
after insert
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from inserted
	select @personName=personName from inserted

insert into LOG values(@personid,@personName,'insret',getdate())
end
select * from Person
insert into Person values(2,'xyz',200000,'2001-12-12','rajkot',18,'2004-12-12')
select * from log
select*from PersonLog;

------------------------------------------------------
alter trigger tr_per_update_for
on person
after update
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from inserted
	select @personName=personName from inserted

insert into LOG values(@personid,@personName,'update',getdate())
end


select * from Person


update Person set PersonName='Abhi ' where PersonId=2;
select*from LOG;

----------------------------------------------------------------
alter trigger tr_per_delete_for
on person
after delete
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from deleted
	select @personName=personName from deleted

insert into LOG values(@personid,@personName,'delete',getdate())
end

select*from Person;
delete from person where personid=2;
select*from LOG;
-----------------------------------------------------------------------------------
/*3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person table.
For that, log all operation performed on the Person table into PersonLog.*/
alter trigger tr_per_insert_INSTEAD_OF
on person
INSTEAD OF insert
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from inserted
	select @personName=personName from inserted

insert into LOG values(@personid,@personName,'insret',getdate())
end

select * from Person
insert into Person values(102,'xyz',200000,'2001-12-12','rajkot',18,'2004-12-12')
select * from log
---------------------------------------------------------------------------------------------------------------------
alter trigger tr_per_update_INSTEAD_OF
on person
INSTEAD OF update
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from inserted
	select @personName=personName from inserted

insert into LOG values(@personid,@personName,'insret',getdate())
end

select * from Person
update Person set PersonName='Abhi ' where PersonId=2;
select*from LOG;
select * from log
-----------------------------------------------------------------------------
create trigger tr_per_delete_INSTEAD_OF
on person
INSTEAD OF delete
as 
begin
	declare @personid int;
	declare @personName varchar(50);
	select @personid=personid from inserted
	select @personName=personName from inserted

insert into LOG values(@personid,@personName,'delete',getdate())
end

select*from Person;
update Person set PersonName='Abhi ' where PersonId=2;
select*from LOG;
delete from person where personName='Abhi';

--------------------------------------------------------------------------
/*4. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
‘Record deleted successfully from PersonLog’.*/
alter trigger tr_delete_log
on personlog
for delete
as 
begin
 print ('Record deleted successfully from PersonLog')
end
delete from LOG where personName='abhi solanki';

---------------------------------------------------------------
/*5. Create INSERT trigger on person table, which calculates the age and update that age in Person table.*/



