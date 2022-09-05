Create database LAB2_274;
CREATE TABLE PersonLog(
PLogID Int ,
PersonName Varchar(250),
Operation Varchar (50),
UpdatedDate Datetime
);
INSERT INTO PersonLog VALUES(1,'CHIRAG','CODER','2020/12/12');
Select*from PersonLog;
--From the above given table perform the following queries: 
--1. Print message like - Error Occur that is: Divide by zero error encountered.
Begin try
Select 1/0;
End try
begin catch
select 'Error Occur that is:'+ERROR_MESSAGE() AS ERROR_MSG;
End Catch

/*2. Print error message in insert statement using Error_Message () function: Conversion failed when 
--converting datetime from character string.*/
BEGIN TRY
--DECLARE @DATE_TIME_VALUE VARCHAR(100)='10/16/2015 21:02:04'
DECLARE @DATE_TIME_VALUE VARCHAR(100)='2010/12/12 21:02:04'
SELECT CONVERT(DATETIME, @DATE_TIME_VALUE,103)AS Uk_date_time_style
END Try
BEGIN CATCH
select 'Error Occur that is:'+ERROR_MESSAGE() AS ERROR_MSG;
END CATCH

/*3. Create procedure which prints the error message that “The PLogID is already taken. Try another 
one”.*/
Alter proc Plog_taken
@PLogID Int,
@PName Varchar(250)
As 
begin
Begin try
Insert into PersonLog values(@PLogID,@PName,'insert',Getdate())
End try
Begin catch
--select 'Error Occur that is:'+ERROR_MESSAGE() AS ERROR_MSG;
print 'The PLogID is already taken. Try another one';
End Catch
End;

Exec Plog_taken 1,xyz
select *from PersonLog

/*
4. Create procedure that print the sum of two numbers: take both number as integer & handle 
exception with all error functions if any one enters string value in numbers otherwise print result.*/
Create Proc Add_Two_Num
@num1 varchar(5),
@num2 int,
@sum int OUTPUT
Begin 
    Begin Try
	SET @sum=@num1+@num2;
	END TRY
	BEGIN CATCH
	select 
	ERROR_SEVERITY() as ERROR_SEVERITY,
	ERROR_LINE() as ERROR_LINE,
	ERROR_MESSAGE() as ERROR_MESSAGE,
	ERROR_NUMBER() as ERROR_NUMBER,
	ERROR_PROCEDURE() as ERROR_PROCEDURE,
	ERROR_STATE() as ERROR_STATE
	END CATCH
	End 

	declare @r int;
	Exec Add_Two_Num 'a',2,@r output;
/*
5. Throw custom exception using stored procedure which accepts PLogID as input & that throws 
Error like no plogid is available in database.*/
Alter PROC FINTLOG
@PLOGID INT
AS
BEGIN
IF EXISTS(SELECT*FROM PersonLog WHERE PLogID=@PLogID)
PRINT('plogid is available in database')
ELSE
THROW 5005,'error! No plogid with this id ',1
END;

EXEC FINTLOG 1

/*6. Create cursor with name per_cursor which takes PLogID & PersonName as variable and produce 
combine output with PLogID & Person Name.*/
Declare 
    @PLogID int,
	@PersonName varchar(250);
declare pre_cursor CURSOR
FOR SELECT 
       PLogID,
	   PersonName
	 FROM
	   PersonLog;
OPEN pre_cursor;
FETCH NEXT FROM pre_cursor INTO
@PLogID,
@PersonName
WHILE @@FETCH_STATUS=0
begin
print cast(@plogid as varchar)+'-'+@personName;
FETCH NEXT FROM pre_cursor INTO
@PLogID,
@PersonName
END;
CLOSE pre_cursor
DEALLOCATE pre_cursor;


/*7. Use Table Student (Id, Rno, EnrollmentNo, Name, Branch, University) - Create cursor that updates 
enrollment column as combination of branch & Roll No. like SOE22CE0001 and so on. (22 is 
admission year)*/

CREATE TABLE STUDENT(
ID INT,
RNO INT,
EnrollmentNo VARCHAR(50),
Name VARCHAR(50),
Branch VARCHAR(50),
University VARCHAR(50)
);

INSERT INTO STUDENT VALUES(1,1,1183,'CHIRAG','CE','DU');
INSERT INTO STUDENT VALUES(1,2,1183,'RAMESH','CE','DU')
INSERT INTO STUDENT VALUES(1,3,1183,'KEYUR','CE','DU')
INSERT INTO STUDENT VALUES(1,4,1183,'AJAY','CE','DU')
INSERT INTO STUDENT VALUES(1,5,1183,'RAJ','CE','DU')
INSERT INTO STUDENT VALUES(1,6,1183,'MANISH','CE','DU')
SELECT *FROM STUDENT;


DECLARE 
    @RNO INT,
	@BRACH VARCHAR(50),
	EnrollmentNo VARCHAR(50)
	DECLARE STUDENT_CURSOR INTO
	FOR SELECT 
	RNO,
	BRACH
	FROM
	STUDENT
OPEN STUDENT_CURSOR;
FETCH NEXT FROM STUDENT_CURSOR INTO
@RNO,
@BRACH
WHILE @@FETCH_STATUS=0
begin
UPDATE STUDENT SET 
FETCH NEXT FROM STUDENT_CURSOR INTO
@RNO,
@BRACH
END;
CLOSE STUDENT_CURSOR
DEALLOCATE STUDENT_CURSOR;
