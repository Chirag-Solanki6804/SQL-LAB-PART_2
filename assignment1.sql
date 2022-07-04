create database chirag_21010101183;
create table MST_CITY(
CITYID INT PRIMARY KEY,
CITYNAME VARCHAR(250) NOT NULL,
PINCODE VARCHAR(6) NULL,
STATEID INT NOT NULL,
CITYREMARKS VARCHAR(500) NULL
);
SELECT*FROM MST_CITY;
--Q.1
CREATE Procedure PR_MST_CITY_SELECTALL
AS 
BEGIN
  SELECT
  MST_CITY.CITYID,
  MST_CITY.CITYNAME,
  MST_CITY.PINCODE,
  MST_CITY.CityRemarks, 
  MST_CITY.StateID, 
  MST_CITY.STATENAME
  FROM MST_CITY
   INNER JOIN MST_STATE
	 ON MST_CITY.STATEID=MST_STATE.STATEID
END

--Q.2  [DBO].[PR_MST_CITY_INSERT] 1,'PORBANDAR','360570',123,NULL
CREATE Procedure PR_MST_CITY_INSERT 
      @CityID       Int,
      @CityName     Varchar(250),
      @Pincode      Varchar(6),
      @StateID      Int,
      @CityRemarks  Varchar(500)
AS
BEGIN
     INSERT INTO MST_CITY
	 VALUES
	 (
	 CITYID,
	 CITYNAME,
	 PINCODE,
	 STATEID,
	 CITYREMARKS
	 )
END
SELECT*FROM MST_CITY;
--Q.3 [DBO].[PR_MST_CITY_UPDATE]
CREATE Procedure PR_MST_CITY_UPDATE
      @CityID       Int,
      @CityName     Varchar(250),
      @Pincode      Varchar(6),
      @StateID      Int,
      @CityRemarks  Varchar(500)
AS 
BEGIN
      UPDATE MST_CITY 
	       SET
		    @CityID      =  CITYID,
            @CityName    =  CITYNAME,
            @Pincode     =  PINCODE,
            @StateID     =  STATEID,
            @CityRemarks =  CITYREMARKS
END
---Q.4
--[DBO].[PR_MST_CITY_DELETE]
CREATE Procedure PR_MST_CITY_DELETE
     @CITYID INT
AS 
BEGIN
    DELETE 
	FROM MST_CITY
	WHERE CITYID=@CITYID
END
--Q.5 [DBO].[PR_MST_CITY_SELECTBYPK]
CREATE Procedure PR_MST_CITY_SELECTBYPK
   @CITYID INT
AS 
BEGIN
     SELECT*FROM
	 MST_CITY WHERE CITYID=@CITYID
END
---Q.6 [dbo].[SelectByPincodeStartWith360]
CREATE Procedure PR_MST_CITY_SelectByPincodeStartWith360
     PINCODE VARCHAR(6)
AS 
BEGIN
   SELECT*FROM MST_CITY
   WHERE PINCODE LIKE'360%';
END
---Q.7
--[DBO].[SelectByCityNamePincode]CREATE PROCEDURE PR_MST_CITY_SelectByCityNamePincodeAS BEGINEND





			 






