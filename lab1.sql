create database s3lab1;
--------------------------------------------------------------------------
create table student_info(
StuID Int,
Name Varchar(100),
EnrollmentNo Varchar(12),
Division Varchar(50),
Sem Int,
BirthDate Datetime,
Email Varchar(100),
ContactNo Varchar(50)
);
-----------------------------------------------------------------------------------------------------
insert into student_info values(
101,'Naimish Patel ','090200107051',' BCX-3', 3 ,'1992-12-06', 'naimishp49@gmail.com','8866205253');
insert into student_info values(
102,'Firoz A. S.','090200107090', 'BCY-3' ,3,'1994-05-03','Firoz.me@gmail.com',' 8885999922');
insert into student_info values(
103,'Krunal Vyas','090243107101','BCZ-5',5,' 1984-03-01',' Krunal.vyas@gmail.com',' 9990888877');
insert into student_info values(
104,'Vijay Patel','090200107102','BCX-5',5,'1985-02-15','Vijay.patel123@gmail.com','8787878787');
insert into student_info values(
105,'Vimal Trivedi','090200107103','BCY-3',3,'1988-01-20','Maulik123@gmail.com','8789564512');
------------------------------------------------------------------------------------------------------
select*from student_info;
--Q.1 
select name from student_info where sem=3 or sem=5;
--Q.2 
select name,EnrollmentNo  from student_info where StuID between 103 and 105;
--Q.3
select name,EnrollmentNo,Email from student_info where sem=5;
--Q.4
select top 3 * from student_info;
--Q.5
select top 30percent  name,EnrollmentNo from student_info where  ContactNo like '%7';
--Q.6
select distinct sem from student_info;
--Q.7
select*from student_info where EnrollmentNo is null;
--Q.8
select*from student_info where name not like 'v%';
--Q.9
select*from student_info where Email like '%3@g%' and email like '______';
--Q.10
select*from student_info where name like 'f_r%';
--Q,11
select*from student_info where EnrollmentNo like '%887%';
--Q.12
select name from student_info where sem=3 and ContactNo not like '%[8,9]%';
--Q.13
select*from student_info where BirthDate<01-01-1990;
--Q.14
--update student_info set name='Firoz Sherasiya' WHERE student_info.EmailAddress='Firoz.Me@Gmail.Com' and ContactNo='8885999922';
--Q.15
alter table student_info add city varchar(50) null;
--Q.16
alter table student_info add City Varchar (50);
select*from student_info;
--Q.17
delete from student_info where Division ='BCX-3';
select*from student_info;
--Q.18
--sp_rename 'student_info.Email','student_info.EmailAddress''column';
select*from student_info;
--Q.19

--Q.20
truncate table student_info;
----------------------------------------------------------------------------------------------------

