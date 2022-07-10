create database chirag_21010101183;
create table MST_CITY(
CITYID INT PRIMARY KEY,
CITYNAME VARCHAR(250) NOT NULL,
PINCODE VARCHAR(6) NULL,
STATEID INT NOT NULL,
CITYREMARKS VARCHAR(500) NULL
);
SELECT*FROM MST_CITY;
----------------Q.1 select All------------
create proc PR_MST_City_SelectAll
as
begin
select cityid,cityname,pincode,cityremarks,MST_city.stateid 
from
MST_City inner join MST_State 
on
MST_State.stateid=MST_City.stateid
end
exec PR_MST_City_SelectAll
----------------------Q.2 Insert-----------------
create proc PR_MST_City_Insert
@cityid int,
@cityname varchar(50),
@pincode varchar(6),
@stateid int,
@cityremarks varchar(500)
as
begin
Insert into MST_City
(
cityid,
cityname,
pincode ,
stateid,
cityremarks
)
values
(
@cityid,
@cityname,
@pincode,
@stateid,
@cityremarks
)
end
exec PR_MST_City_Insert 105,porbandar,360570,1,'Excellent'
----------------------------Q.3 UPDATE----------------------
alter proc PR_MST_City_Update
@cityid int,
@cityname varchar(50)
as
begin
update MST_City
set
cityname=@cityname
where
cityid=@cityid
end
exec PR_MST_City_Update 105,abcd
--------------------Q.4 Delete----------------------------------
create proc PR_MST_City_Delete
@cityid int
as
begin
delete from
MST_City 
where
cityid=@cityid 
end
exec PR_MST_City_Delete 105
----------------------Q.5 SelectByPK--------------------------
create proc PR_MST_City_SelectByPK
@cityid int
as
begin
select *
from MST_City 
where
cityid=@cityid 
end
exec PR_MST_City_SelectByPK 1
-------------------Q.6 SelectByPincodeStartWith360--------------------------
create proc SelectByPincodeStartWith360
as
begin
select *
from MST_City 
where
pincode like '360%'
end
exec SelectByPincodeStartWith360
------------------------Q.7 SelectBycitynamePincode-------------------------
create proc SelectBycitynamePincode
@cityname varchar(50),
@pincode varchar(6)
as
begin
select *
from MST_City 
where
cityname=@cityname and pincode=@pincode
end
exec SelectBycitynamePincode Rajkot,360001
-----------------------Q.8 SelectBycityremarks----------------------
create proc SelectBycityremarks
@cityremarks varchar(50)
as
begin
select *
from MST_City 
where
cityremarks=@cityremarks
end
exec SelectBycityremarks good
-------------------------Q.9 SelectBystateid------------------------
create proc SelectBystateid
@stateid int
as
begin
select *
from MST_City 
where
stateid=@stateid
end
exec SelectBystateid 1
--------------------------------Q.10 SelectBycityidstateid--------------------
create proc SelectBycityidstateid
@stateid int,
@cityid int
as
begin
select *
from MST_City 
where stateid=@stateid 
and
cityid=@cityid
end
exec SelectBycityidstateid 1,1
