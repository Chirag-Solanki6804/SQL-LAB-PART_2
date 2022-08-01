CREATE DATABASE WORKER_INFO_274;
--------------------------------------------------------------------------------------------
CREATE PROCEDURE PR_DEPARTMENT1_INSERT
    @DEPARTMENTID INT,
	@DEPARTMENTNAME VARCHAR(100)
AS 
BEGIN
INSERT INTO DEPARTMENT1
(
DEPARTMENTID,
DEPARTMENTNAME
)
VALUES
(
@DEPARTMENTID,
@DEPARTMENTNAME
)
END
EXEC PR_DEPARTMENT1_INSERT 1,ADMIN;
EXEC PR_DEPARTMENT1_INSERT 2,IT;
EXEC PR_DEPARTMENT1_INSERT 3,HR;
EXEC PR_DEPARTMENT1_INSERT 4,ACCOUNT;

SELECT*FROM DEPARTMENT1;

-----------------------------------------------------------------------------------------------------
CREATE PROCEDURE PR_DESIGNATION_INSERT
    @DESIGNATIONID INT,
	@DESIGNATIONNAME VARCHAR(100)
AS 
BEGIN
INSERT INTO DESIGNATION
(
DESIGNATIONID,
DESIGNATIONNAME
)
VALUES
(
@DESIGNATIONID,
@DESIGNATIONNAME
)
END

EXEC PR_DESIGNATION_INSERT 11,JOBBER;
EXEC PR_DESIGNATION_INSERT 12,WELDER;
EXEC PR_DESIGNATION_INSERT 13,CLERK;
EXEC PR_DESIGNATION_INSERT 14,MANAGER;
EXEC PR_DESIGNATION_INSERT 15,CEO;

SELECT*FROM DESIGNATION;

------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE PR_PARSON_INSERT

	@FIRSTNAME VARCHAR(100),
	@LASTNAME VARCHAR(100),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPARMENTID INT,
	@DESIGNATIONID INT
AS 
BEGIN
INSERT INTO PARSON
(

	FIRSTNAME,
	LASTNAME,
	SALARY,
	JOININGDATE,
	departmentid,
	DESIGNATIONID
)
VALUES
(

	@FIRSTNAME,
	@LASTNAME,
	@SALARY,
	@JOININGDATE,
	@DEPARMENTID,
	@DESIGNATIONID
 )
END

EXEC PR_PARSON_INSERT 'RAHUL','ANSHU',56000,'01-01-1990',1,12;
EXEC PR_PARSON_INSERT  'HARDIK','HINSU',18000,'1990-09-25',2,11;
EXEC PR_PARSON_INSERT 'BHAVIN','KAMANI',25000,'1991-05-14',NULL,11;
EXEC PR_PARSON_INSERT 'BHOOMI','Patel',39000,'2014-02-20',1,13;
EXEC PR_PARSON_INSERT 'rohit','rajgor',17000,'1990-07-23',2,15;
EXEC PR_PARSON_INSERT 'priya','mehta',25000,'1990-10-18',2,null;
EXEC PR_PARSON_INSERT 'neha','trivedi',18000,'2014-02-20',3,15;

SELECT*FROM PARSON;

----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE PR_DEPARTMENT1_UPDATE
    @DEPARTMENTID INT,
	@DEPARTMENTNAME VARCHAR(100)
AS 
UPDATE DEPARTMENT1
SET
         DEPARTMENTID=@DEPARTMENTID,
         DEPARTMENTNAME=@DEPARTMENTNAME
WHERE 
         DEPARTMENTID=@DEPARTMENTID

EXEC PR_DEPARTMENT1_UPDATE 1,ADMIN1

SELECT*FROM DEPARTMENT1;

--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE PR_DESIGNATION_UPDATE
    @DESIGNATIONID INT,
	@DESIGNATIONNAME VARCHAR(100)
AS 
UPDATE DESIGNATION
SET
         DESIGNATIONID=@DESIGNATIONID,
         DESIGNATIONNAME=@DESIGNATIONNAME
WHERE 
         DESIGNATIONID=@DESIGNATIONID

EXEC PR_DESIGNATION_UPDATE 11,JOBBER1

SELECT*FROM DESIGNATION;

-----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE PR_PARSON_UPDATE
    @WORKERID INT,
    @FIRSTNAME VARCHAR(100),
	@LASTNAME VARCHAR(100),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPARTMENTID INT,
	@DESIGNATIONID INT
AS 
UPDATE PARSON
SET
    FIRSTNAME=@FIRSTNAME,
	LASTNAME=@LASTNAME,
	SALARY=@SALARY,
	JOININGDATE=@JOININGDATE,
	DEPARTMENTID=@DEPARTMENTID,
	DESIGNATIONID=@DESIGNATIONID        
WHERE 
         WORKERID=@WORKERID

EXEC PR_PARSON_UPDATE 
---------------------------------------------------------------
---select 1
create procedure Pr_designation_selectAll
as
begin
     select designationId,designationName from designation
end

exec Pr_designation_selectAll; 


--select 2
create procedure Pr_department1_selectAll
as
begin
     select departmentid,departmentName from department1
end

exec Pr_department1_selectAll;

--select 3

alter procedure pr_person_selectAll
as 
begin
select
     PARSON.WORKERID,
	 PARSON.FIRSTNAME,
	 PARSON.LASTNAME,
	 PARSON.SALARY,
	 PARSON.JOININGDATE,
	 department1.departmentname,
	 designation.DESIGNATIONNAME
	 from PARSON inner join department1
	 on
	 PARSON.DEPARTMENTID=department1.departmentid
	 inner join designation
	 on
	 PARSON.DESIGNATIONID=designation.DESIGNATIONID
end

exec pr_person_selectAll
 

-----3.selectbypk
--1
create procedure pr_designation_selectPk
    @designationid int
as
begin
select 
    designationid,
	designationName
from designation
where designationid=@designationid
end

exec pr_designation_selectPk 11

--2
create procedure pr_department_selectPk
    @departmentid int
as
begin
select 
    departmentid,
	departmentName
from department1
where departmentid=@departmentid
end

exec pr_department_selectPk 1

--3
create procedure pr_parson1_selectPk
    @WORKERID INT
as
begin
select 
    WORKERID,
    FIRSTNAME,
	LASTNAME,
	SALARY,
	JOININGDATE,
	DEPARTMENTID,
	DESIGNATIONID 
   
from PARSON
where WORKERID=@WORKERID
end

exec pr_parson1_selectPk 101
----------------------------------------------
---4
create procedure pr_parson_selectBydesignationDepartmentName
    @deparmentName varchar(200),
    @designationname varchar(250)
as
begin
select 
    PARSON.WORKERID,
    PARSON.FIRSTNAME,
	PARSON.LASTNAME,
	PARSON.SALARY,
	PARSON.JOININGDATE,
	department1.departmentname,
	designation.DESIGNATIONID 
   
from PARSON
left outer join department1
on department1.departmentid=PARSON.DESIGNATIONID
LEFT OUTER JOIN designation 
ON DESIGNATION.DESIGNATIONID=PARSON.DESIGNATIONID
where designationNAME=@designationname
AND
departmentname=@deparmentName
end

EXEC pr_parson_selectBydesignationDepartmentName IT,WELDER

-------------------------------------------------------------------------------------------------------
--5
create procedure pr_parson_selectByNAME
    @FIRSTNAME VARCHAR(200)
as
begin
select 
    PARSON.WORKERID,
    PARSON.FIRSTNAME,
	PARSON.LASTNAME,
	PARSON.SALARY,
	PARSON.JOININGDATE,
	department1.departmentname,
	designation.DESIGNATIONID 
   
from PARSON
left outer join department1
on department1.departmentid=PARSON.DESIGNATIONID
LEFT OUTER JOIN designation 
ON DESIGNATION.DESIGNATIONID=PARSON.DESIGNATIONID
where FIRSTNAME=@FIRSTNAME
end

EXEC pr_parson_selectByNAME rahul

---------------------------------------------------------------------------------------
--6
alter procedure pr_person_selectAll_Min_Max_sum_salary
as
begin
select department1.departmentname,max(parson.salary) as max_salary,min(parson.salary) as Min_salary,sum(parson.salary)as sum_salary
from PARSON inner join department1
on
department1.departmentid=PARSON.DEPARTMENTID
group by department1.departmentname
end


exec pr_person_selectAll_Min_Max_sum_salary;
---------------------------------------------------------------------
-------------view-----------
create view first100_worker_detail
as select top 100
    WORKERID,
    FIRSTNAME,
	LASTNAME,
	SALARY,
	JOININGDATE,
	DEPARTMENTID,
	DESIGNATIONID 
	from PARSON

select*from first100_worker_detail

--------------------------------------
--2

create view desigantionWise_max_min_sum_salary
as select
designation.DESIGNATIONNAME,
max(parson.salary) as max_salary,
min(parson.salary) as min_salary,
sum(parson.salary) as sum_salary
from parson
inner join designation
on 
designation.designationid=parson.designationid
group by
designation.designationName


select*from desigantionWise_max_min_sum_salary

---3
 
