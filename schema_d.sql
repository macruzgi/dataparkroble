USE [master]
GO
/****** Object:  Database [Datapark]    Script Date: 30/12/2019 07:30:02 ******/
CREATE DATABASE [Datapark] ON  PRIMARY 
( NAME = N'Datapark', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLDESA08\MSSQL\DATA\Datapark.mdf' , SIZE = 10485760KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Datapark_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLDESA08\MSSQL\DATA\Datapark_log.LDF' , SIZE = 395392KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Datapark] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Datapark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Datapark] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Datapark] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Datapark] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Datapark] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Datapark] SET ARITHABORT OFF 
GO
ALTER DATABASE [Datapark] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Datapark] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Datapark] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Datapark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Datapark] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Datapark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Datapark] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Datapark] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Datapark] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Datapark] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Datapark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Datapark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Datapark] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Datapark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Datapark] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Datapark] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Datapark] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Datapark] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Datapark] SET  MULTI_USER 
GO
ALTER DATABASE [Datapark] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [Datapark] SET DB_CHAINING OFF 
GO
USE [Datapark]
GO
/****** Object:  User [WIN-9159P9SB718\DPOperators]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [WIN-9159P9SB718\DPOperators]
GO
/****** Object:  User [WIN-9159P9SB718\DPManagers]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [WIN-9159P9SB718\DPManagers]
GO
/****** Object:  User [WIN-9159P9SB718\DpAdmins]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [WIN-9159P9SB718\DpAdmins]
GO
/****** Object:  User [tas]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [tas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PxPUser]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [PxPUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT Service\svcChargeByUsage]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\svcChargeByUsage]
GO
/****** Object:  User [NT Service\DPUMS]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\DPUMS]
GO
/****** Object:  User [NT SERVICE\DPMonitorSrv]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT SERVICE\DPMonitorSrv]
GO
/****** Object:  User [NT Service\DPLSM]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\DPLSM]
GO
/****** Object:  User [NT Service\DPLPRMW]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\DPLPRMW]
GO
/****** Object:  User [NT Service\DPIntegrationAgent]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\DPIntegrationAgent]
GO
/****** Object:  User [NT Service\DPCounterSvr]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\DPCounterSvr]
GO
/****** Object:  User [NT Service\CredWCOM]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT Service\CredWCOM]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[db_owner]
GO
/****** Object:  User [IIS APPPOOL\DPWebServicePool]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [IIS APPPOOL\DPWebServicePool]
GO
/****** Object:  User [IIS APPPOOL\DPMonitorAppPool]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [IIS APPPOOL\DPMonitorAppPool]
GO
/****** Object:  User [IIS APPPOOL\DPCCT]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [IIS APPPOOL\DPCCT]
GO
/****** Object:  User [Groble]    Script Date: 30/12/2019 07:30:02 ******/
CREATE USER [Groble] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'WIN-9159P9SB718\DPOperators'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'WIN-9159P9SB718\DPOperators'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'WIN-9159P9SB718\DPOperators'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'WIN-9159P9SB718\DPManagers'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'WIN-9159P9SB718\DPManagers'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'WIN-9159P9SB718\DPManagers'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'WIN-9159P9SB718\DpAdmins'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'WIN-9159P9SB718\DpAdmins'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'WIN-9159P9SB718\DpAdmins'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'tas'
GO
sys.sp_addrolemember @rolename = N'db_accessadmin', @membername = N'tas'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PxPUser'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\svcChargeByUsage'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\svcChargeByUsage'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\svcChargeByUsage'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\DPUMS'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\DPUMS'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\DPUMS'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT SERVICE\DPMonitorSrv'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT SERVICE\DPMonitorSrv'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT SERVICE\DPMonitorSrv'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\DPLSM'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\DPLSM'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\DPLSM'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\DPLPRMW'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\DPLPRMW'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\DPLPRMW'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\DPIntegrationAgent'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\DPIntegrationAgent'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\DPIntegrationAgent'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\DPCounterSvr'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\DPCounterSvr'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\DPCounterSvr'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT Service\CredWCOM'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT Service\CredWCOM'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT Service\CredWCOM'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'NT AUTHORITY\SYSTEM'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT AUTHORITY\SYSTEM'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT AUTHORITY\SYSTEM'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'IIS APPPOOL\DPWebServicePool'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'IIS APPPOOL\DPWebServicePool'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'IIS APPPOOL\DPMonitorAppPool'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'IIS APPPOOL\DPMonitorAppPool'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Groble'
GO
sys.sp_addrolemember @rolename = N'db_accessadmin', @membername = N'Groble'
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTimePeriodFunc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  FUNCTION [dbo].[CalculateTimePeriodFunc]
						(@dtStartDate  datetime
						,@dtEndDate datetime
						,@intInterval int )
						RETURNS @tblTimePeriods  TABLE
						(
							dtDate datetime
									,strDate  nvarchar(10)
									,strHours nvarchar(10)
									,intDateTimeInMin  int
									,intInterval int
						)
						  BEGIN
						  WHILE @dtStartDate < @dtEndDate 
											BEGIN 
											SET @dtStartDate =  DATEADD(minute,@intInterval,@dtStartDate)
											INSERT @tblTimePeriods
											SELECT @dtStartDate
											,CONVERT(nvarchar(10), @dtStartDate, 101)
											,CONVERT(nvarchar(10), @dtStartDate, 108)
											,DateDiff(DAY,'2000-01-01', @dtStartDate)*1440 + DATEPART(HOUR, @dtStartDate)*60 + DATEPART(Minute, @dtStartDate)
											,@intInterval
											END
										RETURN
							END
GO
/****** Object:  UserDefinedFunction [dbo].[cardmngGetCardFacCode]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cardmngGetCardFacCode]
(@strCardNumber nvarchar(256),
@intFacCode int )
RETURNS int
AS
BEGIN
IF @intFacCode > 0 RETURN @intFacCode
DECLARE @intRetVal int
SELECT  @intRetVal = intFacility FROM Cards WHERE CONVERT(NVARCHAR(256),[Card Number])= @strCardNumber
RETURN ISNULL( @intRetVal ,1)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cardmngGetCardMediaType]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cardmngGetCardMediaType]
(@strCardNumber nvarchar(256),
@intMediaType int)
RETURNS int
AS
BEGIN
IF @intMediaType > 0 RETURN @intMediaType
DECLARE @intRetVal int
SELECT  @intRetVal = intMediaType FROM Cards WHERE CONVERT(NVARCHAR(256),[Card Number])= @strCardNumber
RETURN ISNULL( @intRetVal ,1)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetAreaID]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cfgGetAreaID]
(@intBoardNumber int) 
RETURNS int AS 
BEGIN 
IF @intBoardNumber IS NULL RETURN 0 
RETURN ISNULL((SELECT TOP 1 intAreaID FROM cfgAreas INNER JOIN cfgBoards ON cfgAreas.intAreaUID = cfgBoards.intAreaUID WHERE BoardNumber = @intBoardNumber),0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetAreaIdentificator]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cfgGetAreaIdentificator] (@intBoardNumber int) RETURNS int AS BEGIN IF @intBoardNumber IS NULL RETURN 0 DECLARE @intAreaID AS int DECLARE @intGateID AS int DECLARE @intAreaUID AS int SET @intGateID = (SELECT MIN(intLaneUID) FROM cfgVarGates WHERE  intPropertyID = 314 AND CAST(varValue AS int)  = @intBoardNumber) IF @intGateID IS NULL RETURN 0 SET @intAreaUID  = (SELECT MIN(intAreaUID) FROM cfgVarLanes WHERE  intLaneUID = @intGateID) IF @intAreaUID IS NULL RETURN 0
					SET @intAreaID=(SELECT  CAST([varValue] AS int)   FROM [dbo].[cfgVarAreas] WHERE intAreaUID =  @intAreaUID AND intPropertyID =502)
					RETURN ISNULL(@intAreaID,0)
					END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetAreaProperty]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cfgGetAreaProperty] 
(@intBoardNumber INT
,@intPropertyID INT) 
RETURNS nvarchar(max)
AS BEGIN 
IF @intBoardNumber IS NULL RETURN 0
DECLARE @strAreaProperty AS nvarchar(max)
DECLARE @intGateID AS int 
DECLARE @intAreaUID AS int 
SET @intGateID = (SELECT MIN(intLaneUID) FROM cfgVarGates WHERE  intPropertyID = 314 AND CAST(varValue AS int)  = @intBoardNumber) 
IF @intGateID IS NULL RETURN 0 
SET @intAreaUID  = (SELECT MIN(intAreaUID) FROM cfgVarLanes WHERE  intLaneUID = @intGateID) IF @intAreaUID IS NULL RETURN 0
SET @strAreaProperty=(SELECT  CAST([varValue] AS nvarchar(max)) FROM [dbo].[cfgVarAreas] WHERE intAreaUID =  @intAreaUID AND intPropertyID =@intPropertyID)
RETURN ISNULL(@strAreaProperty,0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetDPAreasConfiguration]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cfgGetDPAreasConfiguration]()
RETURNS @tblDPAreasInfo TABLE 
(
[intAreaID] [int] NULL,
[intAreaUID] [int] NULL,
[strAreaName] [nvarchar](256) NULL,
[dtDateModified] [datetime] NULL
)
BEGIN

IF (SELECT COUNT(BoardNumber) FROM cfgBoards WHERE intAreaUID IS NULL ) > 0 
BEGIN
INSERT INTO @tblDPAreasInfo
SELECT
-1 AS intAreaID
,-1 AS [intAreaUID]
,'UNDEFINED' AS strAreaName
,GETDATE() AS [dtDateModified]
END


INSERT INTO @tblDPAreasInfo
SELECT
0 AS intAreaID
,0 AS [intAreaUID]
,'DPMS' AS strAreaName
,GETDATE() AS [dtDateModified]


INSERT INTO @tblDPAreasInfo
SELECT
intAreaID
,[intAreaUID]
,strAreaName
,[dtDateModified]
FROM cfgAreas WHERE ISNULL(intAreaID,0) > 0

RETURN 

END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetDPLanesConfiguration]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cfgGetDPLanesConfiguration](@strSelectedAreaIDs NVARCHAR(MAX) = NULL)
RETURNS @tblDBBoardInfo TABLE 
(
intBoardNumber INT NULL
,intLaneLocation INT NULL
,intLaneType INT NULL
,[Poll] INT NULL
,[Version] decimal(10,0) NULL
,[strLaneDesc] nvarchar(256) NULL
,[IsActive] INT NULL
,[intLocationID] INT NULL
,[intAreaUID] INT NULL
,[strAreaName] nvarchar(256) NULL
,[intAreaID] INT NULL
,[strBoardShortName] nvarchar(256) NULL
,[strBoardLongName] nvarchar(256) NULL
)
BEGIN

/*-----------------------------Manual Add/Override Virtual reporting lanes 0(CCUtil) and 63(CBU Card Mng.)--------------------------*/
INSERT INTO @tblDBBoardInfo
SELECT
0 AS intBoardNumber
,2 AS intLaneLocation
,8 AS intLaneType 
,0 AS [Poll]
,0 AS [Version]
,'SystemLane CCU' AS [Description]
,1 AS [IsActive]
,0 AS [intLocationID]
,0 AS [intAreaUID]
,'DPMS' AS strAreaName
,0 AS intAreaID
,'SystemLane CCU (0)'
,'DPMS:SystemLane CCU (0)'
UNION ALL
SELECT
63 AS intBoardNumber
,2 AS intLaneLocation
,8 AS intLaneType 
,0 AS [Poll]
,0 AS [Version]
,'SystemLane CM' AS [Description]
,1 AS [IsActive]
,0 AS [intLocationID]
,0 AS [intAreaUID]
,'DPMS' AS strAreaName
,0 AS intAreaID
,'SystemLane CM (63)'
,'DPMS:SystemLane CM (63)'




INSERT INTO @tblDBBoardInfo
SELECT 
[BoardNumber] AS intBoardNumber
,[EntryExit] AS intLaneLocation
,intLaneType = CASE WHEN [LaneType] = 0 THEN Terminal_1 ELSE LaneType END 
,[Poll]
,[Version]
,[Description]
,[IsActive]
,[intLocationID]
,ISNULL([cfgBoards].[intAreaUID],-1) AS [intAreaUID]
,ISNULL([cfgAreas].strAreaName, 'UNDEFINED') AS strAreaName
,ISNULL([cfgAreas].intAreaID, -1) AS intAreaID
, CASE WHEN CONVERT(nvarchar(10),BoardNumber) <>  [Description] THEN  [Description]+' ('+CONVERT(nvarchar(10),BoardNumber)+')' ELSE [Description] END
,CASE WHEN CONVERT(nvarchar(10),BoardNumber) <>  [Description] THEN ISNULL(strAreaName, 'UNDEFINED') + ':'  + [Description]+'('+CONVERT(nvarchar(10),BoardNumber)+')' ELSE ISNULL(strAreaName, 'UNDEFINED') + ':'  + [Description] END
FROM [dbo].[cfgBoards]
LEFT JOIN cfgAreas ON [cfgBoards].intAreaUID = cfgAreas.intAreaUID
WHERE BoardNumber NOT IN (0,61,62,63)    -- Manual Exclude(if configured) of Virtual reporting lanes 0(CCUtil) and 63(CBU Card Mng.)
ORDER BY [cfgBoards].[intAreaUID],BoardNumber



IF @strSelectedAreaIDs IS NOT NULL BEGIN 
IF (SELECT COUNT(strValue) FROM dbo.Split(@strSelectedAreaIDs,',') WHERE ISNUMERIC(strValue) > 0 ) > 0
BEGIN 
DELETE FROM @tblDBBoardInfo WHERE intAreaID NOT IN (SELECT CONVERT(INT,strValue) FROM dbo.Split(@strSelectedAreaIDs,',') WHERE ISNUMERIC(strValue) > 0)
END
END

RETURN 

END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetPayTypeCode]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cfgGetPayTypeCode] (@intPayMode int, @intPayStat int) 
RETURNS int AS BEGIN 
DECLARE @intRes AS INT
SET @intRes = 0
SET @intRes = (SELECT TOP 1 intPayCode FROM cfgPaymentTypeCodes WHERE 
intPaymentMode=@intPayMode 
AND intPaymentStatus = @intPayStat
AND LEN(strPaymentRate) = 0
AND byOperator = 0
 )
RETURN ISNULL(@intRes,0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetPayTypeCodeByRate]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[cfgGetPayTypeCodeByRate] (@intPayMode int, @intPayStat int, @strRate nvarchar(10)) 
RETURNS int AS BEGIN 
DECLARE @intRes AS INT
DECLARE @strRateKey AS NVARCHAR(10)
SET @strRateKey = CASE 
WHEN @strRate IS NULL THEN  ''
WHEN ISNULL((SELECT COUNT(ID) FROM cfgPaymentTypeCodes WHERE strPaymentRate IN (@strRate) ),0) = 0 THEN ''
ELSE @strRate END

SET @intRes = 0
SET @intRes = (SELECT TOP 1 intPayCode FROM cfgPaymentTypeCodes WHERE 
intPaymentMode=@intPayMode 
AND intPaymentStatus = @intPayStat
AND strPaymentRate IN (@strRateKey)
AND byOperator IN (0))

RETURN ISNULL(@intRes,0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[cfgGetPayTypeCodeByRateEx]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cfgGetPayTypeCodeByRateEx] (@intPayMode int, @intPayStat int, @strRate nvarchar(10), @intOperator int, @mnAmount money) 
RETURNS int AS BEGIN 
DECLARE @intRes AS INT
DECLARE @strRateKey AS NVARCHAR(10)
DECLARE @intByOperator AS NVARCHAR(10)

DECLARE @tblAmountFilter TABLE (intRevStatus INT NULL)
IF @mnAmount IS NULL INSERT INTO @tblAmountFilter SELECT -1 UNION ALL SELECT 0  UNION ALL SELECT 1 
IF @mnAmount >=0 INSERT INTO @tblAmountFilter SELECT 0  UNION ALL SELECT 1 
IF @mnAmount < 0 INSERT INTO @tblAmountFilter SELECT -1


SET @strRateKey = CASE 
WHEN @strRate IS NULL THEN  ''
WHEN ISNULL((SELECT COUNT(ID) FROM cfgPaymentTypeCodes WHERE strPaymentRate IN (@strRate) ),0) = 0 THEN ''
ELSE @strRate END

SET @intByOperator = CASE WHEN @intOperator = 0 THEN 0 
WHEN @intOperator > 0 AND ISNULL((SELECT COUNT(ID) FROM cfgPaymentTypeCodes WHERE intPaymentMode=@intPayMode 
AND intPaymentStatus = @intPayStat AND byOperator IN (1) ),0) = 0 THEN 0
ELSE 1 END

SET @intRes = 0
SELECT TOP 1 @intRes =  intPayCode FROM cfgPaymentTypeCodes WHERE 
intPaymentMode=@intPayMode 
AND intPaymentStatus = @intPayStat
AND strPaymentRate IN (@strRateKey)
AND byOperator IN (@intByOperator)
AND intRevenueStatus IN (SELECT intRevStatus FROM @tblAmountFilter )

IF @intRes = 0 BEGIN
SELECT TOP 1  @intRes = intPayCode FROM cfgPaymentTypeCodes WHERE 
intPaymentMode= @intPayMode
AND intPaymentStatus = @intPayStat 
AND strPaymentRate IN (@strRateKey)
AND byOperator IN (@intByOperator)
END


RETURN ISNULL(@intRes,0)
END 
GO
/****** Object:  UserDefinedFunction [dbo].[ChargeType]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function ChargeType;0.                                                    */


/*setuser N'dbo'
GO*/

CREATE FUNCTION [dbo].[ChargeType]
	(
	/*
	@parameter1 datatype = default value,
	@parameter2 datatype
	*/
	@Memo varchar(255)
	)
RETURNS varchar(255)/* datatype */
AS
	BEGIN
	DECLARE @retStr varchar(255)
	IF(@Memo = NULL) or (SUBSTRING(@Memo,3,1)<>'_')  
		BEGIN
		SET @Memo ='Manual ('+@Memo+')'
		END	/* sql statement ... */
	ELSE 
		SET @Memo =Left(@Memo,2)
	 
	RETURN @Memo /* value */
	END






GO
/****** Object:  UserDefinedFunction [dbo].[cmAsBigint]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cmAsBigint](@value nvarchar(256))
			RETURNS bigint
			AS
			BEGIN
				RETURN CASE WHEN 
					dbo.cmIsInteger(@value)=1 AND (len(@value)<19) 
					THEN convert(bigint, @value) 
					ELSE 9223372036854775807 
					END
			END
GO
/****** Object:  UserDefinedFunction [dbo].[cmCardNumberInRange]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		CREATE FUNCTION [dbo].[cmCardNumberInRange] ( @CardNumber nvarchar(256), @from int, @to int ) 
			RETURNS bit as
			BEGIN
				declare @CardNumberAsInt int 
	
				if (dbo.cmIsInteger(@CardNumber)=1) begin 
					set @CardNumberAsInt = convert(int, @CardNumber)
					RETURN CASE WHEN (@CardNumberAsInt >= @from) and (@CardNumberAsInt <= @to) THEN 1 ELSE 0 END
				end
				else 
				begin
					declare @fromAsStr nvarchar(256)
					set @fromAsStr = convert(nvarchar, @from) + '%'
					declare @toAsStr nvarchar(256)
					set @toAsStr = convert(nvarchar(256), @to) + '%'
					if @fromAsStr > @toAsStr begin
					  declare @t nvarchar(256)
					  set @t = @fromAsStr
					  set @fromAsStr = @toAsStr
					  set @toAsStr = @t
					end
					RETURN CASE WHEN (@CardNumber >= @fromAsStr) and (@CardNumber <= @toAsStr) THEN 1 ELSE 0 END
				end

				return 0	
			END
		
GO
/****** Object:  UserDefinedFunction [dbo].[cmDateInRange]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

					CREATE FUNCTION [dbo].[cmDateInRange] ( @value DateTime, @from DateTime, @to DateTime ) 
					RETURNS bit as
					BEGIN
						RETURN 
							CASE WHEN (@value >= @from) and (@value <= @to) 
							THEN 1 
							ELSE 0 END
					END
GO
/****** Object:  UserDefinedFunction [dbo].[cmFindEntryByExit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cmFindEntryByExit]
	(
		@strCardNumber nvarchar(256)
		, @intMediaType int
		, @intFacility int
		, @dtExit datetime
		, @idExit int
	)
	RETURNS datetime
	AS
	BEGIN
		DECLARE cursorTrCard CURSOR -- Declare cursor
		 LOCAL SCROLL STATIC
		 FOR
		SELECT TOP 2 dtTrDate, intBoardType
		FROM trCard 
		WHERE (dtTrDate <= @dtExit)
		AND intBoardType in (0,1)
		AND intCardNumber=@strCardNumber and intFacilityCode=@intFacility
		and strCardType in ('0', '2')
		and (@idExit is NULL OR ID<=@idExit)
		ORDER BY dtTrDate DESC,ID DESC


		OPEN cursorTrCard

		declare @dtTrDate datetime, @intBoardType int
		FETCH Next FROM cursorTrCard INTO @dtTrDate, @intBoardType

		-- did we find the exit itself?
		IF(@@FETCH_STATUS <> 0 OR @dtTrDate is NULL OR @intBoardType<>1 OR @dtTrDate<>@dtExit) 
		BEGIN
			--- no, exit func 
			CLOSE cursorTrCard
			DEALLOCATE cursorTrCard
			RETURN NULL
		END

		FETCH NEXT FROM cursorTrCard INTO @dtTrDate, @intBoardType
		IF(@@FETCH_STATUS <> 0 OR @intBoardType IS NULL OR @intBoardType<>0)
			SET @dtTrDate = NULL;

		CLOSE cursorTrCard
		DEALLOCATE cursorTrCard

		-- Return the result of the function
		RETURN @dtTrDate

	END
GO
/****** Object:  UserDefinedFunction [dbo].[cmGetCardChargeRateOrCode]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cmGetCardChargeRateOrCode]
(@strCardNumber nvarchar(256),  @strRate nvarchar(10) )
RETURNS nvarchar(50)
AS
BEGIN

DECLARE @strRetVal AS nvarchar(10)

IF  @strRate IS NOT NULL AND LEN(@strRate) > 0 
SET @strRetVal =@strRate

ELSE BEGIN 

DECLARE @intCardType AS int

DECLARE @intChargeByCode AS int
DECLARE @intChargeByRate AS int
DECLARE @strChargeRate AS nvarchar(10)
DECLARE @intChargeCode AS int

SELECT  @intCardType = UsageCard
,@strChargeRate= Rate
,@intChargeCode = Code
FROM Cards 
WHERE CONVERT(NVARCHAR(256),[Card Number])= @strCardNumber

SELECT  
@intChargeByCode = isChargeCodeBased
,@intChargeByRate = isRateBased
FROM cmMapCardType WHERE intCardType=@intCardType

IF @intChargeByCode = 1  SET @strRetVal = CONVERT(nvarchar(50),@intChargeCode)
IF @intChargeByRate = 1  SET @strRetVal = @strChargeRate
END 
RETURN ISNULL( @strRetVal ,'Undefined')
END
GO
/****** Object:  UserDefinedFunction [dbo].[cmGetCardTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[cmGetCardTypeDesc]
		(@intCardType int )
		RETURNS nvarchar(255)
		AS
		BEGIN
		DECLARE @strRetVal AS nvarchar(255)
		SELECT  @strRetVal = strDescription FROM cmMapCardType WHERE intCardType=@intCardType
		RETURN ISNULL( @strRetVal ,'Undefined')
		END
GO
/****** Object:  UserDefinedFunction [dbo].[cmIsInteger]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[cmIsInteger](@value nvarchar(25))
				Returns BIT
				AS
				BEGIN
				RETURN
				(CASE WHEN @value not like '%[^0-9]%' AND LEN(@value)<=10
				THEN (case when convert(bigint, @value)<2147483647 then 1 else 0 end) ELSE 0 END 
				) 
				END
		
GO
/****** Object:  UserDefinedFunction [dbo].[cmPeriodsIntersect]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

					CREATE FUNCTION [dbo].[cmPeriodsIntersect]
					(
						@from1 DateTime,
						@to1 DateTime,
						@from2 DateTime,
						@to2 DateTime
					)
					RETURNS bit
					AS
					BEGIN
						DECLARE @ResultVar bit

						IF(dbo.cmDateInRange(@from1, @from2, @to2)=1 
							or dbo.cmDateInRange(@to1, @from2, @to2)=1 
							or dbo.cmDateInRange(@from2, @from1, @to1)=1 
							or dbo.cmDateInRange(@to2, @from1, @to1)=1
						)
							SET @ResultVar = 1
						ELSE
							SET @ResultVar = 0

						RETURN @ResultVar

					END
GO
/****** Object:  UserDefinedFunction [dbo].[CompareAbsoluteStrings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CompareAbsoluteStrings]
(
	@firstString NVARCHAR(255),
	@secondString NVARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @intRes AS INT
	DECLARE	@intMaxLen int

	SET @intRes = -1;
	IF @firstString IS NULL RETURN @intRes;
	IF @secondString IS NULL RETURN @intRes;

	IF @firstString = @secondString BEGIN 
	SET @intRes = 0;
	RETURN @intRes;
	END
	
	
	DECLARE @tblfirstString AS TABLE (intRow int Null,strChar nvarchar(1) NULL )
DECLARE @tblsecondString AS TABLE (intRow int Null,strChar nvarchar(1) NULL )
DECLARE @i INT
SET @i = 1
while @i <= LEN(@firstString) begin
INSERT INTO @tblfirstString SELECT @i, SUBSTRING(@firstString, @i,  1)
SET @i = @i + 1
END


SET @i = 1
while @i <= LEN(@secondString) begin
INSERT INTO  @tblsecondString SELECT @i, SUBSTRING(@secondString, @i,  1)
SET @i = @i + 1
END

SET @intRes = 0;

SELECT @intRes = COUNT(strFChar) FROM (
SELECT strFChar, strSChar FROM (
SELECT F.strChar AS strFChar, S.strChar AS strSChar
FROM @tblfirstString AS F
LEFT JOIN @tblsecondString AS S
ON F.strChar = S.strChar
UNION ALL
SELECT F.strChar AS strFChar, S.strChar AS strSChar
FROM @tblsecondString AS F
LEFT JOIN @tblfirstString AS S
ON F.strChar = S.strChar
) AS DDD
WHERE strFChar IS NULL OR strSChar IS NULL
GROUP BY strFChar, strSChar
) AS DDDD

IF @intRes = 0 AND LEN(@firstString)<>LEN(@secondString) SET @intRes =ABS(LEN(@firstString)-LEN(@secondString))
IF @intRes = 0 AND LEN(@firstString) = LEN(@secondString) SET @intRes = 1000


RETURN @intRes;
END
GO
/****** Object:  UserDefinedFunction [dbo].[CompareExactStrings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CompareExactStrings]
(
	@firstString NVARCHAR(255),
	@secondString NVARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @intRes AS INT
	DECLARE	@intMaxLen int

	SET @intRes = -1;
	IF @firstString IS NULL RETURN @intRes;
	IF @secondString IS NULL RETURN @intRes;

	IF @firstString = @secondString BEGIN 
	SET @intRes = 0;
	RETURN @intRes;
	END
	
	
DECLARE @tblfirstString AS TABLE (intRow int Null,strChar nvarchar(1) NULL )
DECLARE @tblsecondString AS TABLE (intRow int Null,strChar nvarchar(1) NULL )
DECLARE @i INT
SET @i = 1
while @i <= LEN(@firstString) begin
INSERT INTO @tblfirstString SELECT @i, SUBSTRING(@firstString, @i,  1)
SET @i = @i + 1
END


SET @i = 1
while @i <= LEN(@secondString) begin
INSERT INTO  @tblsecondString SELECT @i, SUBSTRING(@secondString, @i,  1)
SET @i = @i + 1
END

SET @intRes = 0;

SELECT @intRes = COUNT(intRow) FROM (
SELECT COUNT(intRow) AS intRow FROM (
SELECT  * FROM (
SELECT  F.intRow ,F.strChar AS strFChar, S.strChar AS strSChar
FROM @tblfirstString AS F
LEFT JOIN @tblsecondString AS S
ON F.strChar = S.strChar AND F.intRow = S.intRow
UNION ALL
SELECT F.intRow,F.strChar AS strFChar, S.strChar AS strSChar
FROM @tblsecondString AS F
LEFT JOIN @tblfirstString AS S
ON F.strChar = S.strChar AND F.intRow = S.intRow
) AS DDD
WHERE strFChar IS NULL OR strSChar IS NULL
GROUP BY intRow ,strFChar, strSChar
) AS DDDD
GROUP BY intRow )
AS DDDDD

RETURN @intRes;
END
GO
/****** Object:  UserDefinedFunction [dbo].[cwGetBatchStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[cwGetBatchStatus]
				(
					
					@cwStatCode int
				)
				RETURNS nvarchar(1024)
				AS
				BEGIN
					
					DECLARE @retVal nvarchar(1024)
									
					SELECT @retVal = strDescription FROM cwCCMapBatchStatus WHERE intCWBatchStatusCode=@cwStatCode
					
					RETURN ISNULL( @retVal ,'Undefined Status')
				END
GO
/****** Object:  UserDefinedFunction [dbo].[cwGetCommand]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create FUNCTION [dbo].[cwGetCommand]
					(
						
						@cwCommandCode int
					)
					RETURNS nvarchar(1024)
					AS
					BEGIN
						
						DECLARE @retVal nvarchar(1024)
						
						SELECT @retVal = strDescription FROM cwCCMapCommand WHERE intCommand=@cwCommandCode
						
						RETURN ISNULL( @retVal ,'Undefined Command')
					END
GO
/****** Object:  UserDefinedFunction [dbo].[cwGetInnerCommand]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
Create FUNCTION [dbo].[cwGetInnerCommand]
					(
						
						@cwInnerCommandCode int
					)
					RETURNS nvarchar(1024)
					AS
					BEGIN
						
						DECLARE @retVal nvarchar(1024)
						
						SELECT @retVal = strDescription FROM cwCCMapCommand WHERE intInnerCommand=@cwInnerCommandCode
						
						RETURN ISNULL( @retVal ,'Undefined Command')
					END
GO
/****** Object:  UserDefinedFunction [dbo].[cwGetTranStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[cwGetTranStatus]
					(
						
						@cwStatCode int
					)
					RETURNS nvarchar(1024)
					AS
					BEGIN
						
						DECLARE @retVal nvarchar(1024)
												
						SELECT @retVal = strDescription FROM cwCCMapTranStatus WHERE intCWStatusCode=@cwStatCode
						
						RETURN ISNULL( @retVal ,'Undefined Status')
					END
GO
/****** Object:  UserDefinedFunction [dbo].[DAccount]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function DAccount;0.                                                      */


CREATE FUNCTION [dbo].[DAccount]
	(
	/*
	@parameter1 datatype = default value,
	@parameter2 datatype
	*/
	@COMobject int,
	@strAccount varchar(255)
	)
RETURNS  VARCHAR(255)/* datatype */
AS
	BEGIN
	DECLARE @Method as varchar(255)
	DECLARE @dstrAccount as varchar(255)
	DECLARE @hr as int
	
	SET @Method='Decrypt("'+ @strAccount+ '")'
	
    EXEC @hr = sp_OAMethod @COMobject,@Method ,@dstrAccount OUTPUT
		
		
		 
	RETURN @dstrAccount
	END






GO
/****** Object:  UserDefinedFunction [dbo].[DolarAmount]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function DolarAmount;0.                                                   */


CREATE FUNCTION [dbo].[DolarAmount]
	(
	/*
	@parameter1 datatype = default value,
	@parameter2 datatype
	*/
	@strAmnt nvarchar(11),
	@strStatus nvarchar(2)
	
	)
	
RETURNS  float /* datatype */
AS
	BEGIN
	DECLARE @fltAmount AS float
	SET @fltAmount=0
		/* sql statement ... */
		IF (@strStatus='V') AND (CAST(@strAmnt as float)>0 )
		BEGIN
		SET @fltAmount=CAST(@strAmnt as float)*(-1)
		END 
		ELSE BEGIN
		SET @fltAmount=CAST(@strAmnt as float)
		END 
		
		 
	RETURN @fltAmount /* value */
	END






GO
/****** Object:  UserDefinedFunction [dbo].[feeGetFCOperatorName]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[feeGetFCOperatorName]
(@intOperatorNumber int)
RETURNS nvarchar(255)
AS
BEGIN
DECLARE @retVal nvarchar(255)
IF @intOperatorNumber = 0 RETURN 'Undefined';

SELECT @retVal = strOperName FROM cfgSystemOps WHERE intOperNumber=@intOperatorNumber 
RETURN ISNULL( @retVal ,'Undefined')
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetJanusSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetJanusSettings]( @strKey nvarchar(255))
RETURNS sql_Variant
AS
BEGIN
DECLARE @varVal as sql_variant
SET @varVal = (SELECT CASE
WHEN sysType LIKE 'int' THEN CONVERT(int,varValue )
WHEN sysType LIKE 'bigint' THEN CONVERT(bigint,varValue )
WHEN sysType LIKE 'nvarchar' THEN CONVERT(nvarchar(255),varValue )
WHEN sysType LIKE 'bit' THEN CONVERT(bit,varValue )
ELSE varValue END FROM cfgJanusSettings WHERE strName = @strKey)
RETURN  @varVal
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetBaseTimeInMin]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[GetBaseTimeInMin]
(
	@dtDate  DateTime
)
RETURNS INT
AS
BEGIN
	RETURN
	DateDiff(DAY,'2000-01-01', @dtDate)*1440 
	+ DATEPART(HOUR, @dtDate)*60 + DATEPART(Minute, @dtDate)
END
GO
/****** Object:  UserDefinedFunction [dbo].[LevensteinStringCompare]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LevensteinStringCompare]( @firstString NVARCHAR(MAX), @secondString NVARCHAR(MAX) )
RETURNS INT AS
BEGIN
DECLARE 
@strTemp NVARCHAR(MAX)
,@intRes INT
,@secondStringLen INT
,@firstStringLen INT
,@i INT
,@j INT
,@s_i NCHAR(1)
,@t_j NCHAR(1)
,@cost INT
,@min int

  --Step 1
  SET @firstStringLen = LEN(@firstString)
  SET @secondStringLen = LEN(@secondString)
  SET @strTemp = REPLICATE(NCHAR(0),(@firstStringLen+1)*(@secondStringLen+1))
  IF @firstStringLen = 0
  BEGIN
    SET @intRes = @secondStringLen
   GOTO returnResult
  END
  IF @secondStringLen = 0
  BEGIN
    SET @intRes = @firstStringLen
    GOTO returnResult
  END

  --Step 2
  SET @i = 0
  WHILE @i <= @firstStringLen BEGIN
    SET @strTemp = STUFF(@strTemp,@i+1,1,NCHAR(@i))     
    SET @i = @i+1
  END

  SET @i = 0
  WHILE @i <= @secondStringLen BEGIN
    SET @strTemp = STUFF(@strTemp,@i*(@firstStringLen+1)+1,1,NCHAR(@i))    
    SET @i = @i+1
  END

  --Step 3
  SET @i = 1
  WHILE @i <= @firstStringLen BEGIN
    SET @s_i = SUBSTRING(@firstString,@i,1)

    --Step 4
    SET @j = 1
    WHILE @j <= @secondStringLen BEGIN
      SET @t_j = SUBSTRING(@secondString,@j,1)
      --Step 5
      IF @s_i = @t_j
        SET @cost = 0
      ELSE
        SET @cost = 1
      --Step 6
	  set @min = UNICODE(SUBSTRING(@strTemp,@j*(@firstStringLen+1)+@i-1+1,1))+1
	  if (UNICODE(SUBSTRING(@strTemp,(@j-1)*(@firstStringLen+1)+@i+1,1))+1) < @min set @min =  (UNICODE(SUBSTRING(@strTemp,(@j-1)*(@firstStringLen+1)+@i+1,1))+1)
	  if ( UNICODE(SUBSTRING(@strTemp,(@j-1)*(@firstStringLen+1)+@i-1+1,1))+@cost) < @min set @min = ( UNICODE(SUBSTRING(@strTemp,(@j-1)*(@firstStringLen+1)+@i-1+1,1))+@cost)
      SET @strTemp = STUFF(@strTemp,@j*(@firstStringLen+1)+@i+1,1,NCHAR(@min))
      SET @j = @j+1
    END
    SET @i = @i+1
  END      

  --Step 7
  SET @intRes = UNICODE(SUBSTRING(@strTemp,@firstStringLen*(@secondStringLen+1)+@secondStringLen+1,1))

returnResult:
  RETURN @intRes
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmGetMediaTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmGetMediaTypeDesc]
(@intMediaType int)
RETURNS nvarchar(255)
AS
BEGIN
DECLARE @retVal nvarchar(255)
SELECT @retVal = strName FROM cfgCardsMediaDesc WHERE intMediaType=@intMediaType
RETURN ISNULL( @retVal ,'Undefined')
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmGetUsageAreaRate]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmGetUsageAreaRate]
(@strCardNumber nvarchar(256)
,@intMediaType  INT
,@intFacCode  INT
,@intUsageType INT
,@intSubUsageType INT

)
RETURNS nvarchar(255)
AS
BEGIN

DECLARE @strResult nvarchar(255)

DECLARE  @tblDurationData AS  TABLE
(
intRowNumber int NULL
,strCardNumber nvarchar(256) NULL
,intAreaID int NULL
,[intEntryBoard] [int] NULL
,[dtEntryDate] [datetime] NULL
,[intExitBoard] [int] NULL
,[dtExitDate] [datetime] NULL
,intDuration [int] NULL
,intMinDuration [int] NULL
)

INSERT INTO @tblDurationData
SELECT * FROM [dbo].[lsmTrackCardDuration] (
@strCardNumber 
,@intMediaType
,@intFacCode
,0
,@intUsageType
,@intSubUsageType)


DELETE FROM @tblDurationData WHERE strCardNumber<>'Total'

DELETE FROM @tblDurationData WHERE ISNULL(intDuration,0) < intMinDuration

SET @strResult = (SELECT strRateKey FROM cfgAreaChargeRates WHERE ID IN (
SELECT TOP 1 ID FROM (
SELECT ID , intAreaPriceIndex FROM cfgAreaChargeRates WHERE intAreaCode IN (SELECT DISTINCT intAreaID FROM @tblDurationData)
AND intUsageType = @intUsageType AND intSubUsageType = @intSubUsageType) AS DDD ORDER BY intAreaPriceIndex
))

RETURN @strResult
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmGetUsageAreaRateForAssistantCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[lsmGetUsageAreaRateForAssistantCard]
(@strCardNumber nvarchar(256)
,@intMediaType  INT
,@intFacCode  INT
,@intUsageType INT
,@intSubUsageType INT
,@intBoardNumber INT
,@intOperationNumber INT
)
RETURNS nvarchar(255)
AS
BEGIN

SET @intUsageType = ISNULL(@intUsageType, 0)
SET @intSubUsageType = ISNULL(@intSubUsageType, 0)

DECLARE @strResult nvarchar(255)

;WITH cte_trQueryData AS (
SELECT 
trnCardQuery.ID
,strCardNum
,trnCardQuery.intMediaType
,ISNULL(lsmCard.intFacility ,0) AS intFacility
,ISNULL(lsmCard.intUsageType ,0) AS intUsageType
,ISNULL(lsmCard.intSubUsageType,0) AS intSubUsageType
FROM trnCardQuery 
LEFT JOIN lsmCard ON strCardNum = strCardNumber AND trnCardQuery.intMediaType = lsmCard.intMediaType
WHERE intBoardNumber = @intBoardNumber 
AND trnCardQuery.intOperationNumber = @intOperationNumber 
AND intPaymentStatus = 1
AND intUsageType = 2
) 



SELECT @strCardNumber = strCardNum
,@intMediaType  = intMediaType
,@intFacCode  = intFacility
FROM cte_trQueryData WHERE ID IN (SELECT MAX(ID) FROM cte_trQueryData)


DECLARE  @tblDurationData AS  TABLE
(
intRowNumber int NULL
,strCardNumber nvarchar(256) NULL
,intAreaID int NULL
,[intEntryBoard] [int] NULL
,[dtEntryDate] [datetime] NULL
,[intExitBoard] [int] NULL
,[dtExitDate] [datetime] NULL
,intDuration [int] NULL
,intMinDuration [int] NULL
)

INSERT INTO @tblDurationData
SELECT * FROM [dbo].[lsmTrackCardDuration] (
@strCardNumber 
,@intMediaType
,@intFacCode
,0
,@intUsageType
,@intSubUsageType)


DELETE FROM @tblDurationData WHERE strCardNumber<>'Total'

DELETE FROM @tblDurationData WHERE ISNULL(intDuration,0) < intMinDuration

SET @strResult = (SELECT strRateKey FROM cfgAreaChargeRates WHERE ID IN (
SELECT TOP 1 ID FROM (
SELECT ID , intAreaPriceIndex FROM cfgAreaChargeRates WHERE intAreaCode IN (SELECT DISTINCT intAreaID FROM @tblDurationData)
AND intUsageType = @intUsageType AND intSubUsageType = @intSubUsageType) AS DDD ORDER BY intAreaPriceIndex
))

RETURN @strResult
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmGetUsageTypeByCardNumberAndMediaType]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmGetUsageTypeByCardNumberAndMediaType]
(@strCardNumber nvarchar(256),
@intMediaType int)
RETURNS int
AS
BEGIN
DECLARE @retVal int
SELECT TOP 1 @retVal = intUsageType FROM lsmCardHistory WHERE strCardNumber = @strCardNumber AND intMediaType = @intMediaType ORDER BY ID DESC
RETURN ISNULL( @retVal ,0)
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmGetUsageTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmGetUsageTypeDesc]
(@intUsageType int)
RETURNS nvarchar(255)
AS
BEGIN
DECLARE @retVal nvarchar(255)
SELECT @retVal = strName FROM cfgCardsUsageDesc WHERE intUsageType=@intUsageType
RETURN ISNULL( @retVal ,'Undefined')
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmTrackCardDuration]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmTrackCardDuration]
(@strCardNumber nvarchar(256)
,@intMediaType  INT
,@intFacCode  INT
,@bShowAllMovement BIT 
,@intUsageType INT
,@intSubUsageType INT

 )
RETURNS  @tblDurationData  TABLE
(
intRowNumber int NULL
,strCardNumber nvarchar(256) NULL
,intAreaID int NULL
,[intEntryBoard] [int] NULL
,[dtEntryDate] [datetime] NULL
,[intExitBoard] [int] NULL
,[dtExitDate] [datetime] NULL
,intDuration [int] NULL
,intMinDuration [int] NULL
)
BEGIN



SET @intUsageType = ISNULL(@intUsageType, 0)
SET @intSubUsageType = ISNULL(@intSubUsageType, 0)
SET @bShowAllMovement = ISNULL(@bShowAllMovement, 0)


DECLARE @tblTrDate AS TABLE (
ID int NULL
,intRowNumber int NULL
,strCardNumber nvarchar(256) NULL
,intModifyReason int NULL
,intLane int NULL
,dtTrDate dateTime null
,intAreaID int NULL )


INSERT INTO @tblTrDate
(
ID
,intRowNumber 
,strCardNumber
,intModifyReason
,intLane 
,dtTrDate
)
SELECT 
ID
,ROW_NUMBER() OVER (ORDER BY strCardNumber, dtModified)
,strCardNumber
,intModifyReason
,intLane = CASE
WHEN intModifyReason = 1 THEN intEntryLane
WHEN intModifyReason = 2 THEN intExitLane
WHEN intModifyReason = 4 THEN intPassThruLane
ELSE 0 END
,dtTrDate = CASE
WHEN intModifyReason = 1 THEN dtTimeEntry
WHEN intModifyReason = 2 THEN dtTimeExit
WHEN intModifyReason = 4 THEN dtPassThruDate
ELSE NULL END
FROM lsmCardHistory
WHERE 
strCardNumber = @strCardNumber
AND intMediaType = @intMediaType
AND (intUsageType = @intUsageType OR @intUsageType = 0 )
AND ISNULL(intSubUsageType,0) = @intSubUsageType
AND intFacility = @intFacCode
AND intModifyReason IN (1,2,4)
AND ID >= (SELECT MAX(ID) FROM lsmCardHistory WHERE 
strCardNumber = @strCardNumber
AND intMediaType = @intMediaType
AND (intUsageType = @intUsageType OR @intUsageType = 0 )
AND ISNULL(intSubUsageType,0) = @intSubUsageType
AND intFacility = @intFacCode
AND intModifyReason IN (1))
ORDER BY strCardNumber, dtModified

UPDATE @tblTrDate SET intAreaID = dbo.cfgGetAreaID(intLane)

DECLARE @intRowNumber AS INT 
DECLARE @intCount AS int
DECLARE @intMaxDurationID AS int
SET @intCount = (SELECT COUNT(intRowNumber) FROM @tblTrDate)

SET @intRowNumber = 1
WHILE @intRowNumber <= @intCount BEGIN 

IF (@intRowNumber%2) = 1 BEGIN

IF @intRowNumber> 1 BEGIN 
UPDATE @tblDurationData SET [intExitBoard] =  intLane 
,[dtExitDate] = [dtTrDate]
FROM @tblDurationData AS A INNER JOIN @tblTrDate AS B ON 
( A.intRowNumber ) =B.intRowNumber-1
UPDATE @tblDurationData SET intDuration = DATEDIFF(MINUTE, dtEntryDate, dtExitDate)
END 

INSERT INTO @tblDurationData
(intRowNumber 
,strCardNumber
,intAreaID
,[intEntryBoard] 
,[dtEntryDate] 
)
SELECT 
intRowNumber 
,strCardNumber
,intAreaID
,intLane 
,dtTrDate 
FROM @tblTrDate  WHERE intRowNumber = @intRowNumber
END
ELSE BEGIN 

UPDATE @tblDurationData SET [intExitBoard] =  intLane 
,[dtExitDate] = [dtTrDate]
FROM @tblDurationData AS A INNER JOIN @tblTrDate AS B ON 
( A.intRowNumber +1) =B.intRowNumber
UPDATE @tblDurationData SET intDuration = DATEDIFF(MINUTE, dtEntryDate, dtExitDate)

INSERT INTO @tblDurationData
(intRowNumber 
,strCardNumber
,intAreaID
,[intEntryBoard] 
,[dtEntryDate] 
)
SELECT 
intRowNumber 
,strCardNumber
,intAreaID
,intLane 
,dtTrDate 
FROM @tblTrDate  WHERE intRowNumber = @intRowNumber

END 
SET @intRowNumber =  @intRowNumber +1
END

UPDATE @tblDurationData SET intMinDuration = intMinDurationInMinutes
FROM @tblDurationData AS DurationData  INNER JOIN cfgAreaChargeRates
ON intAreaID = cfgAreaChargeRates.intAreaCode
AND cfgAreaChargeRates.intUsageType = @intUsageType
AND cfgAreaChargeRates.intSubUsageType = intSubUsageType

UPDATE @tblDurationData SET dtExitDate = GETDATE(), intDuration = DATEDIFF(MINUTE, dtEntryDate, GETDATE())
WHERE intRowNumber = (SELECT MAX(intRowNumber) FROM @tblDurationData)
AND dtExitDate IS NULL

INSERT INTO  @tblDurationData
(intRowNumber 
,strCardNumber
,intAreaID
,intDuration
,intMinDuration
)
SELECT 
MAX(intRowNumber)
,'Total'
,intAreaID
,SUM(intDuration)
,MAX(intMinDuration)
FROM @tblDurationData
GROUP BY intAreaID

IF @bShowAllMovement =  0 DELETE FROM @tblDurationData WHERE ISNULL(intDuration,0) < intMinDuration

RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[lsmValidateExit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[lsmValidateExit] (@intMediaType int,@intExitLane int, @intCardPassCode int, @intModifyReson int) 
RETURNS int AS BEGIN 
DECLARE @intRes AS INT
DECLARE @intCfgLaneID AS INT
SET @intRes = 1
IF @intMediaType NOT IN (2,3) RETURN @intRes;
IF @intModifyReson IS NULL OR @intModifyReson NOT IN (2) RETURN @intRes;
IF @intExitLane IS NULL OR @intExitLane = 0 RETURN @intRes;
IF @intCardPassCode IS NULL OR @intCardPassCode NOT IN (1016) RETURN @intRes;
SET @intCfgLaneID = (SELECT MIN(ID) FROM dpcCfgLanes WHERE intLaneNumber =@intExitLane )
IF @intCfgLaneID IS NULL RETURN @intRes;

IF @intMediaType = 2 AND (SELECT bIgnoreFeeTransactions FROM dpcCfgLanes WHERE ID = @intCfgLaneID ) = 1 AND @intCardPassCode = 1016 RETURN 0;
IF @intMediaType = 3 AND (SELECT bIgnoreBarcodeTransientPaidTransactions FROM dpcCfgLanes WHERE ID = @intCfgLaneID ) = 1 AND @intCardPassCode = 1016 RETURN 0;

RETURN ISNULL(@intRes,1)
END
GO
/****** Object:  UserDefinedFunction [dbo].[MemoToBoard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[MemoToBoard]
		(
		/*
		@parameter1 datatype = default value,
		@parameter2 datatype
		*/
			@memo nvarchar(255)
		)
		RETURNS  int/* datatype */
		AS
		BEGIN
			/* sql statement ... */
			DECLARE @ans as int
			IF @memo=NULL 
				BEGIN
				SET @ans=0
				END 
			ELSE
				SET @ans=CAST(LEFT(@memo,2) AS int)
						
			
			RETURN @ans/* value */
		END
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split]
(
@strSearchString VARCHAR(MAX),
@strSeparator VARCHAR(5)
)
RETURNS @tblResult TABLE (intIndex int, strValue varchar(MAX))
AS
BEGIN
DECLARE
@tmpStr VARCHAR(MAX),
@intSeparatorLength INT,
@intIndex INT

INSERT INTO @tblResult VALUES (1,@strSearchString );

IF @strSearchString IS NULL RETURN;
IF LEN(@strSearchString) = 0   RETURN;
IF @strSeparator IS NULL  RETURN ;
IF LEN(@strSeparator) = 0  RETURN;

DELETE FROM @tblResult

SET @intSeparatorLength = LEN(@strSeparator) SET @intIndex = 1 SET @tmpStr = @strSearchString IF CHARINDEX(@strSeparator,@tmpStr) < 1 INSERT INTO @tblResult VALUES (@intIndex,@tmpStr ) ELSE BEGIN WHILE 1=1 BEGIN INSERT INTO @tblResult VALUES (@intIndex, SUBSTRING(@tmpStr, 0 ,CHARINDEX(@strSeparator,@tmpStr)))
SET @tmpStr = SUBSTRING(@tmpStr,CHARINDEX(@strSeparator,@tmpStr)+LEN(@strSeparator),LEN(@tmpStr))
SET @intIndex = @intIndex + 1
IF CHARINDEX(@strSeparator,@tmpStr) < 1
BREAK
END
INSERT INTO @tblResult VALUES (@intIndex,@tmpStr ) END RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[StringToDate]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  FUNCTION [dbo].[StringToDate]
				(
				
				@strDate nvarchar(10),
				@strTime nvarchar(8)
				)
				RETURNS  datetime/* datatype */
				AS
				BEGIN
				DECLARE @strTMP as nvarchar(20)
				SET @strTMP = RIGHT(@strDate,2)+'-'+LEFT(@strDate,2)+'-'+SUBSTRING(@strDate,3,2)   
				SET @strTMP = @strTMP +' '+LEFT(@strTime,2) +':'+ RIGHT(@strTime,2)
					/* sql statement ... */
				RETURN  CONVERT(datetime,@strTMP,2) /* value */
				END
GO
/****** Object:  UserDefinedFunction [dbo].[Type]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function Type;0.                                                          */


CREATE FUNCTION [dbo].[Type]
	(
	/*
	@parameter1 datatype = default value,
	@parameter2 datatype
	*/
	@strStatus nvarchar(1)
	)
RETURNS int/* datatype */
AS
	BEGIN
	DECLARE @intRes as int
	SET @intRes=0
	IF (@strStatus='C') SET @intRes=1
	
		/* sql statement ... */
	RETURN @intRes/* value */
	END






GO
/****** Object:  UserDefinedFunction [dbo].[Val]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function Val;0.                                                           */


CREATE FUNCTION [dbo].[Val]
	(
	/*
	@parameter1 datatype = default value,
	@parameter2 datatype
	*/
	@strVal nvarchar(10)
	)
RETURNS INT/* datatype */
AS
	BEGIN
		/* sql statement ... */
	RETURN CAST(@strVal as int)/* value */
	END






GO
/****** Object:  Table [dbo].[AccountLoad]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountLoad](
	[AccountNumber] [varchar](16) NOT NULL,
	[DateTimeMade] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[UserID] [float] NOT NULL,
 CONSTRAINT [PK_AccountLoad] PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC,
	[DateTimeMade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Account Number] [nvarchar](50) NOT NULL,
	[Account Name] [nvarchar](64) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Home Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Bill City] [nvarchar](50) NULL,
	[Bill State] [nvarchar](50) NULL,
	[Bill ZIP] [nvarchar](50) NULL,
	[Bill Address] [nvarchar](50) NULL,
	[Credit Card Type] [nvarchar](50) NULL,
	[Credit Card Number] [nvarchar](128) NULL,
	[Credit Card Expire Date] [datetime] NULL,
	[Last Modified Date] [datetime] NULL,
	[Last Modified User] [nvarchar](50) NULL,
	[Notes] [ntext] NULL,
	[AccountBalance] [money] NULL,
	[Invoice] [bit] NOT NULL,
	[NoPayDeactivate] [bit] NOT NULL,
	[DeactivateLimit] [money] NULL,
	[AutoPrint] [bit] NOT NULL,
	[CreditCardDirect] [bit] NOT NULL,
	[Multiple] [bit] NOT NULL,
	[CarPool] [int] NULL,
	[GracePeriod] [smallint] NULL,
	[PenaltyRate] [nvarchar](50) NULL,
	[MultiusageFreeHours] [datetime] NULL,
	[Email] [ntext] NULL,
	[CryptID] [int] NULL,
	[AutoCharge] [bit] NULL,
	[AdvanceBilling] [float] NULL,
	[PrintMethod] [smallint] NULL,
	[VoidMethod] [smallint] NULL,
	[BalanceLow] [money] NULL,
	[BalanceHigh] [money] NULL,
	[AccessLevel] [int] NULL,
	[CarpoolType] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intAccountType] [int] NOT NULL,
	[intJMSCardPoolID] [int] NULL,
	[bToApplySurcharge] [bit] NULL,
	[bUseCreditToken] [bit] NULL,
	[strCreditToken] [nvarchar](256) NULL,
	[intCreditTokenType] [int] NULL,
	[dtCreditTokenIssueDate] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgedDebtors]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgedDebtors](
	[Account Number] [varchar](16) NOT NULL,
	[Account Name] [varchar](64) NULL,
	[Current] [money] NULL,
	[Month1] [money] NULL,
	[Month2] [money] NULL,
	[Month3] [money] NULL,
	[Older] [money] NULL,
 CONSTRAINT [PK_AgedDebtors] PRIMARY KEY CLUSTERED 
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApprovalList]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalList](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Amount] [money] NULL,
	[ApprovedCharge] [bit] NULL,
	[ApprovedPrint] [bit] NULL,
	[ChargeHandled] [bit] NULL,
	[PrintHandled] [bit] NULL,
	[ManagerName] [nvarchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateHandled] [datetime] NULL,
	[InvNo] [int] NULL,
	[Notes] [ntext] NULL,
	[intLocationID] [int] NOT NULL,
	[intTaxType] [tinyint] NULL,
	[mnTax] [money] NULL,
 CONSTRAINT [PK_ApprovalList] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authApplications]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authApplications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[txtAppName] [nvarchar](100) NULL,
	[txtDescription] [nvarchar](max) NULL,
	[txtPath] [nvarchar](max) NULL,
	[bDel] [bit] NULL,
 CONSTRAINT [PK_authApplications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authGroups]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[txtGroupName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authLogs]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authLogs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[txtUserName] [nvarchar](50) NULL,
	[txtApplication] [nvarchar](max) NULL,
	[bSuccess] [bit] NULL,
	[dtTime] [datetime] NULL,
	[txtComments] [nvarchar](max) NULL,
 CONSTRAINT [PK_authLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authRights]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intUserID] [int] NOT NULL,
	[intAppID] [int] NOT NULL,
	[intRights] [int] NOT NULL,
	[intGroupID] [int] NOT NULL,
 CONSTRAINT [PK_authRights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authSystemOpsLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authSystemOpsLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtDate] [datetime] NULL,
	[intLogType] [int] NULL,
	[strLog] [nvarchar](1024) NULL,
	[strUser] [nchar](50) NULL,
	[intProcID] [int] NULL,
	[intThrID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authUsers]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[txtSID] [nvarchar](max) NULL,
	[txtUserName] [nvarchar](50) NULL,
	[txtDomain] [nvarchar](max) NULL,
 CONSTRAINT [PK_authUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoardReasignation]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardReasignation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoarNumberDP] [decimal](10, 0) NULL,
	[BoardNumberMH] [decimal](10, 0) NULL,
	[LaneType] [decimal](10, 0) NULL,
	[DescriptionBoard] [char](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoardToMerchantAccount]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardToMerchantAccount](
	[BoardNum] [decimal](10, 0) NOT NULL,
	[MerchantAccountID] [smallint] NOT NULL,
 CONSTRAINT [BoardToMerchantAccount_PK] PRIMARY KEY CLUSTERED 
(
	[BoardNum] ASC,
	[MerchantAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BreakdownTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BreakdownTemp](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[Card Number] [float] NULL,
	[Account Number] [varchar](20) NULL,
	[Name] [varchar](20) NULL,
	[CardType] [smallint] NULL,
	[M1] [money] NULL,
	[M2] [money] NULL,
	[M3] [money] NULL,
	[M4] [money] NULL,
	[M5] [money] NULL,
	[M6] [money] NULL,
	[M7] [money] NULL,
	[M8] [money] NULL,
	[M9] [money] NULL,
	[M10] [money] NULL,
	[M11] [money] NULL,
	[M12] [money] NULL,
 CONSTRAINT [PK_BreakdownTemp] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[Card Number] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[UsageCard] [smallint] NOT NULL,
	[Account Number] [nvarchar](50) NULL,
	[From Date] [datetime] NOT NULL,
	[To Date] [datetime] NULL,
	[Payment Due] [money] NOT NULL,
	[First Name] [nvarchar](16) NULL,
	[Last Name] [nvarchar](16) NULL,
	[Issue] [smallint] NOT NULL,
	[Auto Expire] [bit] NULL,
	[Enable Passback] [bit] NULL,
	[VIP] [bit] NOT NULL,
	[Stall] [int] NULL,
	[Message] [nvarchar](16) NULL,
	[Driving Licence] [nvarchar](10) NULL,
	[Driving Licence Exp.] [nvarchar](10) NULL,
	[Notes] [ntext] NULL,
	[Code] [int] NULL,
	[BillingPeriod] [float] NULL,
	[NextBillDate] [datetime] NULL,
	[LastBillDate] [datetime] NULL,
	[LastInvNo] [int] NULL,
	[AutoDeactivated] [bit] NULL,
	[LocID] [int] NULL,
	[Rate] [nvarchar](2) NULL,
	[CCNumber] [nvarchar](20) NULL,
	[CCExpire] [datetime] NULL,
	[CCDiscount] [smallint] NULL,
	[ParkerNumber] [nvarchar](50) NULL,
	[CardSubtype] [int] NULL,
	[CardSubtypeData] [image] NULL,
	[Rate2] [nvarchar](2) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intParisTimeZoneID] [int] NOT NULL,
	[strPhone] [nvarchar](50) NULL,
	[dtCreated] [datetime] NULL,
	[dtModified] [datetime] NULL,
	[strModifiedByUser] [nvarchar](50) NULL,
	[strReplacedCard] [nvarchar](256) NULL,
	[intReplacedFacility] [int] NULL,
	[intReplacedMediaType] [int] NULL,
	[intTimeDebitBalance] [int] NULL,
	[intCardNumber] [bigint] NULL,
	[strContractNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Card Number] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardsExtensions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardsExtensions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intTimeZoneID] [int] NOT NULL,
	[intAccessLevelID] [int] NOT NULL,
	[bValid] [bit] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intCardStatusCode] [int] NOT NULL,
	[strCardStatusDescription] [nvarchar](256) NULL,
	[intTempInlotStatus] [int] NULL,
	[strCardRate] [nvarchar](32) NULL,
	[intDPNesting] [int] NULL,
 CONSTRAINT [PK_CardsExtensions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardsTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardsTemp](
	[Card Number] [int] NOT NULL,
	[Account Number] [varchar](16) NULL,
	[Next Bill Date] [datetime] NULL,
	[Charge Code] [int] NULL,
	[Billing Period] [smallint] NULL,
 CONSTRAINT [PK_CardsTemp] PRIMARY KEY CLUSTERED 
(
	[Card Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardsTemp2]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardsTemp2](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[Card Number] [int] NULL,
	[Account Number] [varchar](16) NULL,
	[Name] [varchar](40) NULL,
	[Phone] [varchar](12) NULL,
	[License] [varchar](8) NULL,
	[Sticker] [varchar](5) NULL,
	[Stall] [varchar](5) NULL,
	[Valid] [bit] NULL,
	[TimeZone] [smallint] NULL,
	[AccessLevel] [smallint] NULL,
	[Old Card] [varchar](10) NULL,
	[Rep Date] [varchar](10) NULL,
	[Location] [varchar](20) NULL,
	[AutoDeactivated] [bit] NULL,
	[ParkerNumber] [varchar](20) NULL,
	[Code] [int] NULL,
	[Make] [varchar](20) NULL,
 CONSTRAINT [PK_CardsTemp2] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarPoolViol]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarPoolViol](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[Entry] [datetime] NOT NULL,
	[Exit] [datetime] NULL,
	[Rate] [nvarchar](2) NULL,
	[Amount] [money] NULL,
	[CardsIn] [ntext] NULL,
	[intLocationID] [int] NOT NULL,
	[textCardsVoided] [ntext] NULL,
 CONSTRAINT [PK_CarPoolViol_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strState] [nchar](2) NOT NULL,
	[strLicensePlate] [nvarchar](16) NOT NULL,
	[strMake] [nvarchar](32) NULL,
	[strColor] [nvarchar](32) NULL,
	[strModel] [nvarchar](32) NULL,
	[intYear] [int] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCStatus](
	[Card Number] [int] NOT NULL,
	[Status] [smallint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_CCStatus] PRIMARY KEY CLUSTERED 
(
	[Card Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCUOperations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCUOperations](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ulCWID] [bigint] NOT NULL,
	[dtOperationDate] [datetime] NOT NULL,
	[strUserName] [nvarchar](50) NOT NULL,
	[intOperationType] [int] NOT NULL,
	[strOperationType] [nvarchar](50) NOT NULL,
	[strMaskAccount] [nvarchar](50) NULL,
	[strAccountType] [nvarchar](50) NOT NULL,
	[strExpirDate] [nvarchar](4) NOT NULL,
	[mnAmount] [money] NOT NULL,
	[strMemo] [nvarchar](200) NOT NULL,
	[intMerchantID] [int] NOT NULL,
	[intResultCode] [int] NOT NULL,
	[strResultDesc] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_CCUOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCURefunds]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCURefunds](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strClientName] [nvarchar](255) NOT NULL,
	[intCCChargeID] [bigint] NOT NULL,
	[intCCRefundId] [bigint] NOT NULL,
	[mnRefundAmount] [money] NOT NULL,
	[dtSystemDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CCURefunds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveExcludeTablesFilter]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveExcludeTablesFilter](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strTableName] [nvarchar](256) NOT NULL,
	[dtModified] [datetime] NULL,
	[strModifyUser] [nvarchar](256) NULL,
 CONSTRAINT [PK_cfgArchiveExcludeTablesFilter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveFiltersSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveFiltersSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strTableName] [nvarchar](256) NOT NULL,
	[strFilterValue] [nvarchar](256) NOT NULL,
	[strExcludeColumnsList] [nvarchar](max) NOT NULL,
	[dtModified] [datetime] NULL,
	[strModifyUser] [nvarchar](256) NULL,
 CONSTRAINT [PK_cfgArchiveFiltersSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveInventory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveInventory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strArchiveServerName] [nvarchar](256) NOT NULL,
	[strArchiveDatabaseName] [nvarchar](256) NOT NULL,
	[dtArchivePeriodStart] [datetime] NOT NULL,
	[dtArchivePeriodEnd] [datetime] NOT NULL,
	[dtModified] [datetime] NULL,
	[strModifyUser] [nvarchar](256) NULL,
	[intIsValidSegment] [int] NULL,
 CONSTRAINT [PK_dbLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveOperationsLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveOperationsLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtLogDate] [datetime] NOT NULL,
	[strLogText] [nvarchar](max) NOT NULL,
	[strLogStatus] [nvarchar](max) NULL,
	[dtModified] [datetime] NOT NULL,
	[strModifyUser] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_cfgArchiveOperationsLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strSettingName] [nvarchar](256) NULL,
	[strSettingValue] [nvarchar](256) NULL,
	[intAllowEdit] [int] NULL,
	[dtModified] [datetime] NULL,
	[strModifyUser] [nvarchar](256) NULL,
	[sysType] [nvarchar](50) NULL,
 CONSTRAINT [PK_cfgArchiveSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgArchiveTempDataClearFiltersSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgArchiveTempDataClearFiltersSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strTableName] [nvarchar](256) NOT NULL,
	[strFilterValue] [nvarchar](256) NULL,
	[dtModified] [datetime] NULL,
	[strModifyUser] [nvarchar](256) NULL,
 CONSTRAINT [PK_cfgArchiveTempDataClearFiltersSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgAreaChargeRates]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgAreaChargeRates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intAreaCode] [int] NOT NULL,
	[strRateKey] [nvarchar](255) NOT NULL,
	[intMinDurationInMinutes] [int] NULL,
	[intAreaPriceIndex] [int] NULL,
	[intUsageType] [int] NULL,
	[intSubUsageType] [int] NULL,
 CONSTRAINT [PK_cfgAreaChargeRates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgAreas]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgAreas](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intAreaUID] [int] NULL,
	[strAreaName] [nvarchar](256) NULL,
	[dtDateModified] [datetime] NULL,
	[intAreaID] [int] NULL,
	[intEntityID] [bigint] NOT NULL,
	[intCounterCfgNumber] [int] NOT NULL,
	[bIsVirtual] [bit] NOT NULL,
 CONSTRAINT [PK_cfgAreas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgBoards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardNumber] [decimal](10, 0) NULL,
	[SegmentCode] [smallint] NOT NULL,
	[EntryExit] [decimal](10, 0) NULL,
	[LaneType] [decimal](10, 0) NULL,
	[PassBack] [decimal](10, 0) NULL,
	[Poll] [decimal](10, 0) NULL,
	[PortNumber] [decimal](10, 0) NULL,
	[Priority] [decimal](10, 0) NULL,
	[Terminal_1] [decimal](10, 0) NULL,
	[Terminal_2] [decimal](10, 0) NULL,
	[Terminal_3] [decimal](10, 0) NULL,
	[Terminal_4] [decimal](10, 0) NULL,
	[Version] [decimal](10, 0) NULL,
	[Description] [nvarchar](255) NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intAreaUID] [int] NULL,
	[intEntityID] [bigint] NOT NULL,
	[intLotNumber] [bigint] NOT NULL,
	[intEntityType] [int] NOT NULL,
	[bUseCC] [bit] NOT NULL,
	[intMaxDiscCoup] [int] NOT NULL,
	[bPrepaidTickets] [bit] NOT NULL,
	[bIsLprUnit] [bit] NOT NULL,
	[bIsHotelEncoder] [bit] NOT NULL,
	[bIsVirtual] [bit] NOT NULL,
	[bIsController] [bit] NOT NULL,
	[bIsNested] [bit] NOT NULL,
	[iNestedLocation] [int] NOT NULL,
 CONSTRAINT [PK_Boards3] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsCleanupOperationTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsCleanupOperationTypeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardCleanupOperationType] [int] NOT NULL,
	[strCardCleanupOperationTypeDesc] [nvarchar](260) NOT NULL,
	[strCleanupTaskName] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsCleanupOperationTypeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsCommunicationStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsCommunicationStatusDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardCommunicationStatus] [int] NOT NULL,
	[strCardCommunicationStatusDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsCommunicationStatusDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsInlotCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsInlotCodeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardInlotCode] [int] NOT NULL,
	[strCardInlotCodeDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsInlotCodeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsLprStatusCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsLprStatusCodeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardLprStatusCode] [int] NOT NULL,
	[strCardLprStatusCodeDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsLprStatusCodeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsMediaDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsMediaDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[strName] [nvarchar](255) NOT NULL,
	[intJanusMediaType] [int] NULL,
	[strJanusName] [nvarchar](255) NULL,
 CONSTRAINT [PK_cfgCardsMediaDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsModifyReasonDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsModifyReasonDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardModifyCode] [int] NOT NULL,
	[strCardModifyDescription] [nvarchar](1024) NULL,
 CONSTRAINT [PK_cfgCardsModifyReasonDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsPassbackModeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsPassbackModeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardPassbackMode] [int] NOT NULL,
	[strCardPassbackModeDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsPassbackModeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsPassCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsPassCodeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardPassCode] [int] NOT NULL,
	[strCardPassDescription] [nvarchar](1024) NULL,
	[bIsAccepted] [bit] NOT NULL,
	[intJanusValidationResultCode] [int] NULL,
	[strJanusValidationResultName] [nvarchar](1024) NULL,
	[intEntranceTypeCode] [int] NULL,
	[strEntranceTypeCodeDesc] [nvarchar](1024) NULL,
	[intExitTypeCode] [int] NULL,
	[strExitTypeCodeDesc] [nvarchar](1024) NULL,
	[bitIsJanusSend] [bit] NULL,
 CONSTRAINT [PK_cfgCardsPassCodeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsPassCodeTransactionMap]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsPassCodeTransactionMap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[strTransactionType] [nvarchar](50) NULL,
	[strTransactionStatusCode] [nvarchar](50) NULL,
	[intCardPassCode] [int] NULL,
	[strStatusDescription] [nvarchar](1024) NULL,
	[strTransactionDescription] [nvarchar](1024) NULL,
	[strOperationDescription] [nvarchar](1024) NULL,
	[intBoardType] [int] NULL,
 CONSTRAINT [PK_cfgCardsPassCodeTransactionMap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsPaymentTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsPaymentTypeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardPaymentType] [int] NOT NULL,
	[strCardPaymentTypeDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsPaymentTypeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsRangePossessorDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsRangePossessorDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardsRangePossessor] [int] NOT NULL,
	[strCardsRangePossessorDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsRangePossessorDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsRanges]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsRanges](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intFromCard] [int] NOT NULL,
	[intToCard] [int] NOT NULL,
	[intRangeUsageType] [int] NOT NULL,
	[intRangeMediaType] [int] NOT NULL,
	[strRate] [nvarchar](50) NULL,
	[intTimeZone] [int] NULL,
	[intAccLevel] [int] NULL,
	[intDaysValidity] [int] NULL,
	[intDiscount] [int] NULL,
	[dtValidFromDate] [datetime] NULL,
	[dtValidToDate] [datetime] NULL,
	[bitCheckUsageCount] [bit] NULL,
	[intMaxUsageCount] [int] NULL,
	[intRangePossessor] [int] NULL,
	[intFlowingCard] [int] NULL,
	[strPrefix] [nvarchar](50) NULL,
	[intSubUsageType] [int] NULL,
 CONSTRAINT [PK_cfgCardRanges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsTargetControllerIdDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsTargetControllerIdDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardTargetControllerId] [int] NOT NULL,
	[strCardTargetControllerIdDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cfgCardsTargetControllerIdDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsUsageDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsUsageDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intUsageType] [int] NOT NULL,
	[strName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cfgCardsUsageDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgCardsValidCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgCardsValidCodeDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCardValidCode] [int] NOT NULL,
	[strCardValidCodeDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgCardsValidCodeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgDataparkMerchants]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgDataparkMerchants](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMerchantID] [int] NOT NULL,
	[strMerchantName] [nvarchar](256) NULL,
 CONSTRAINT [cfgDataparkMerchants_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgDiscountFacilityCodes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgDiscountFacilityCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCode] [int] NOT NULL,
	[txtName] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgDPLPRMWStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgDPLPRMWStatusDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intStatus] [int] NOT NULL,
	[strDesc] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_cfgDPLPRMWStatusDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgEnabledAccLvls]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgEnabledAccLvls](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intGateUID] [int] NOT NULL,
	[intAccessLvl] [int] NOT NULL,
	[dtDateModified] [datetime] NULL,
 CONSTRAINT [PK_cfgEnabledAccLvls] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgEventPayments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgEventPayments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[intAreaUIID] [int] NOT NULL,
	[intAreaName] [nvarchar](256) NOT NULL,
	[strEventName] [nvarchar](256) NOT NULL,
	[intPaymentKey1] [int] NOT NULL,
	[mnPaymentAmount1] [money] NOT NULL,
	[intPaymentKey2] [int] NOT NULL,
	[mnPaymentAmount2] [money] NOT NULL,
	[dtEventExpiration] [datetime] NOT NULL,
	[strSignText] [nvarchar](256) NULL,
	[bScrollText] [bit] NOT NULL,
	[bPermanentText] [bit] NOT NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[intEventID] [bigint] NULL,
 CONSTRAINT [PK_cfgEventPayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgFacilityCodes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgFacilityCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCode] [int] NULL,
	[txtDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgJanusSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgJanusSettings](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strName] [nvarchar](255) NOT NULL,
	[varValue] [sql_variant] NOT NULL,
	[sysType] [nvarchar](255) NOT NULL,
	[strDescription] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_cfgJanusSettings] UNIQUE NONCLUSTERED 
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgLotInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgLotInfo](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intLotID] [int] NOT NULL,
	[strName] [nvarchar](50) NOT NULL,
	[strDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_cfgLotInfo] PRIMARY KEY CLUSTERED 
(
	[intLotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgLPRStatusCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgLPRStatusCodeDesc](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intLPRStatusCode] [int] NOT NULL,
	[strLPRStatusDescription] [nvarchar](1024) NULL,
 CONSTRAINT [PK_cfgLPRStatusCodeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgMultilanguageLanguages]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgMultilanguageLanguages](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[intLanguageID] [int] NOT NULL,
	[txtDescription] [nvarchar](255) NULL,
	[imgImage] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgMultilanguageMessages]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgMultilanguageMessages](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[intMsgID] [int] NOT NULL,
	[txtID] [nvarchar](255) NULL,
	[intType] [int] NOT NULL,
	[txtDescription] [nvarchar](512) NULL,
	[intRules] [int] NOT NULL,
	[intLanguageID] [int] NOT NULL,
	[txtLine1Default] [nvarchar](255) NULL,
	[txtLine2Default] [nvarchar](255) NULL,
	[txtLine3Default] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgMultilanguageMessagesData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgMultilanguageMessagesData](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[intControllerUID] [int] NOT NULL,
	[intMsgID] [int] NOT NULL,
	[intLanguageID] [int] NOT NULL,
	[txtLine1] [nvarchar](255) NULL,
	[txtLine2] [nvarchar](255) NULL,
	[txtLine3] [nvarchar](255) NULL,
	[txtDescription] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgNestingCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgNestingCards](
	[ID] [int] NOT NULL,
	[CardNumber] [decimal](10, 0) NOT NULL,
	[AccessLevel] [smallint] NOT NULL,
	[OperatorID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsActiveRecord] [smallint] NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_NestingCards5] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgNestingCfg]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgNestingCfg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [decimal](10, 0) NULL,
	[FromCard] [decimal](10, 0) NULL,
	[Lanes] [binary](4) NULL,
	[LanesType] [binary](4) NULL,
	[NestingAccess] [decimal](10, 0) NULL,
	[SoftNesting] [decimal](10, 0) NULL,
	[TempDisabled] [decimal](10, 0) NULL,
	[TimeIn] [decimal](10, 0) NULL,
	[TimeOut] [decimal](10, 0) NULL,
	[ToCard] [decimal](10, 0) NULL,
	[UseNestingTable] [decimal](10, 0) NULL,
	[OperatorID] [int] NULL,
	[Date] [datetime] NULL,
	[IsActiveRecord] [smallint] NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_Nesting4] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgPaymentTypeCodes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgPaymentTypeCodes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intPaymentMode] [int] NOT NULL,
	[intPaymentStatus] [int] NOT NULL,
	[intPayCode] [int] NOT NULL,
	[strPaymentRate] [nvarchar](10) NULL,
	[byOperator] [bit] NULL,
	[intRevenueStatus] [int] NULL,
 CONSTRAINT [PK_cfgPaymentTypeCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgPaymentTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgPaymentTypeDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intPayCode] [int] NOT NULL,
	[intRevenueStatus] [int] NOT NULL,
	[strPaymentDesc] [nvarchar](255) NOT NULL,
	[intJanusPayCode] [int] NOT NULL,
	[strJanusPayDesc] [nvarchar](255) NOT NULL,
	[isForStandartReporting] [int] NULL,
	[intJanusPayOperationCode] [int] NULL,
	[strJanusPayOperationDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_cfgPaymentTypeDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgPayStationBalanceReasonCodesDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgPayStationBalanceReasonCodesDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBalanceReasonCodes] [int] NOT NULL,
	[strDescription] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cfgPayStationBalanceReasonCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgSegments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgSegments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SegmentCode] [smallint] NOT NULL,
	[BaudRate] [decimal](10, 0) NULL,
	[BoardDelay] [decimal](10, 0) NULL,
	[BoardsNum] [decimal](10, 0) NULL,
	[COM] [nvarchar](255) NULL,
	[Convertor] [decimal](10, 0) NULL,
	[Name] [nvarchar](255) NULL,
	[PacketTimeOut] [decimal](10, 0) NULL,
	[SleepTime] [decimal](10, 0) NULL,
	[Date] [datetime] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_Segments2] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgSelectedMessageLanguages]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgSelectedMessageLanguages](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[intLanguageID] [int] NOT NULL,
	[intLanguageIndex] [int] NOT NULL,
	[intControllerUID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgSmartCardStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgSmartCardStatusDesc](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intSmartCardStatusCode] [int] NOT NULL,
	[strSmartCardStatus] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cfgSmartCardStatusDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgSystemOps]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgSystemOps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intOperNumber] [int] NOT NULL,
	[strOperName] [nvarchar](256) NOT NULL,
	[strOperInfo] [nvarchar](256) NOT NULL,
	[dtDateAdd] [datetime] NULL,
	[bIsActive] [bit] NULL,
	[intLocationID] [int] NOT NULL,
	[dtLastModifyDate] [datetime] NULL,
	[strEditorName] [nvarchar](256) NOT NULL,
	[bStandartOperatorType] [bit] NOT NULL,
	[bHotelOperatorType] [bit] NOT NULL,
	[strPassword] [nvarchar](50) NOT NULL,
	[bArchived] [bit] NOT NULL,
	[intRights] [bigint] NOT NULL,
 CONSTRAINT [PK_cfgSystemOps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgSystemSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgSystemSettings](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strName] [nvarchar](50) NOT NULL,
	[varValue] [sql_variant] NOT NULL,
	[sysType] [nvarchar](50) NOT NULL,
	[strDescription] [nvarchar](256) NOT NULL,
	[bMigrated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_cfgSystemSettings] UNIQUE NONCLUSTERED 
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgTimeZonesDescriptions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgTimeZonesDescriptions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intTimeZoneID] [int] NOT NULL,
	[strDescription] [nvarchar](256) NULL,
	[bitJanusInUse] [bit] NULL,
 CONSTRAINT [PK_cfgTimeZonesDescriptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgValetExit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgValetExit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[strDescription] [nvarchar](1024) NOT NULL,
	[strValetExitIndex] [nvarchar](4) NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_cfgValetExit] PRIMARY KEY CLUSTERED 
(
	[strValetExitIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarAreas]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarAreas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[dtDateModified] [datetime] NULL,
	[intAreaUID] [int] NOT NULL,
 CONSTRAINT [PK_cfgVarAreas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarControllersData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarControllersData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intControllerType] [tinyint] NULL,
	[intPropertyID] [int] NULL,
	[intControllerID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[intSegmentUID] [tinyint] NULL,
	[dtDateModified] [datetime] NULL,
	[intControllerUID] [int] NULL,
	[intCommunicationType] [int] NOT NULL,
 CONSTRAINT [PK_cfgVarControllersData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarGates]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarGates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLaneUID] [int] NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[intGateID] [int] NOT NULL,
	[dtDateModified] [datetime] NULL,
	[intGateUID] [int] NOT NULL,
 CONSTRAINT [PK_cfgVarGates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarLanes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarLanes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intAreaUID] [int] NOT NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[intLaneUID] [int] NULL,
	[dtDateModified] [datetime] NULL,
 CONSTRAINT [PK_cfgVarLanes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarProperties]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarProperties](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[intGroupType] [tinyint] NULL,
	[intPropertyType] [tinyint] NULL,
	[strPropertyName] [nvarchar](50) NULL,
	[strPropertyDescription] [nvarchar](50) NULL,
	[strValueType] [nvarchar](50) NULL,
	[bDynamic] [bit] NOT NULL,
	[strDynamicCmndName] [nvarchar](255) NOT NULL,
	[strDynamicCmndFormat] [nvarchar](255) NOT NULL,
	[varDefaultValue] [sql_variant] NULL,
	[varValueMin] [sql_variant] NULL,
	[varValueMax] [sql_variant] NULL,
	[bIsRemoteCtrlProperty] [bit] NOT NULL,
	[intRemoteCtrlPropertyTrueType] [int] NOT NULL,
	[intRemoteCtrlPropertyType] [int] NOT NULL,
	[strPredefinedValuesTableName] [nvarchar](255) NULL,
	[strPredefinedValuesCodeColumn] [nvarchar](255) NULL,
	[strPredefinedValuesNameColumn] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarReaders]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarReaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intControllerUID] [int] NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[intReaderID] [int] NULL,
	[dtDateModified] [datetime] NULL,
	[intReaderUID] [int] NULL,
	[intReaderType] [int] NULL,
 CONSTRAINT [PK_cfgVarReaders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarSegments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarSegments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intSegmentID] [int] NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[dtDateModified] [datetime] NULL,
	[intSegmentUID] [int] NULL,
 CONSTRAINT [PK_cfgVarSegments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgVarSocketSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgVarSocketSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intPropertyID] [int] NULL,
	[varValue] [sql_variant] NULL,
	[dtDateModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cfgZXReportSequence]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cfgZXReportSequence](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intZXReportSequence] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Charges]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charges](
	[Code] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Amount] [money] NULL,
	[Billing Period] [float] NULL,
	[Fixed Bill] [bit] NULL,
	[DefAmt] [bit] NOT NULL,
	[AccountNo] [float] NULL,
	[Include Tax] [bit] NULL,
	[Tax] [float] NULL,
	[Inc Date] [datetime] NULL,
	[Inc Amount] [money] NULL,
	[Prev Inc Date] [datetime] NULL,
	[Prev Amount] [money] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[dtMultiusageFreeHours] [datetime] NULL,
	[intMultiusageRate] [int] NULL,
	[intMultiusageMethodOfCharge] [int] NULL,
	[intAccessLevel] [int] NULL,
	[intTimeZone] [int] NULL,
	[intSoftTimeZone] [int] NULL,
	[intSTZRate] [int] NULL,
	[intSTZMethodOfCharge] [int] NULL,
	[intSurchargeGroupID] [int] NULL,
	[intTimeZoneViolationRate] [int] NULL,
	[intNestingViolationRate] [int] NULL,
	[bTimeDebit] [bit] NULL,
	[intTimeDebitUsageTimePerRechargeSeconds] [int] NULL,
	[intTimeDebitRechargesPerPeriod] [int] NULL,
	[intTimeDebitOverageRate] [int] NULL,
	[intTimeDebitMaxOverusageTimeSeconds] [int] NULL,
	[bTimeDebitResetOnEndPeriod] [bit] NULL,
 CONSTRAINT [PK_Charges_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmAccountNotifies]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmAccountNotifies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[strAccountNumber] [nchar](16) NULL,
	[intNotifyId] [int] NULL,
	[intNotifyValue] [int] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_cmAccountNotifies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmAccountsHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmAccountsHistory](
	[intIDENT] [bigint] IDENTITY(1,1) NOT NULL,
	[Account Number] [nvarchar](50) NOT NULL,
	[Account Name] [nvarchar](64) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Home Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Bill City] [nvarchar](50) NULL,
	[Bill State] [nvarchar](50) NULL,
	[Bill ZIP] [nvarchar](50) NULL,
	[Bill Address] [nvarchar](50) NULL,
	[Credit Card Type] [nvarchar](50) NULL,
	[Credit Card Number] [nvarchar](128) NULL,
	[Credit Card Expire Date] [datetime] NULL,
	[Last Modified Date] [datetime] NULL,
	[Last Modified User] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[AccountBalance] [money] NULL,
	[Invoice] [bit] NOT NULL,
	[NoPayDeactivate] [bit] NOT NULL,
	[DeactivateLimit] [money] NULL,
	[AutoPrint] [bit] NOT NULL,
	[CreditCardDirect] [bit] NOT NULL,
	[Multiple] [bit] NOT NULL,
	[CarPool] [int] NULL,
	[GracePeriod] [smallint] NULL,
	[PenaltyRate] [nvarchar](50) NULL,
	[MultiusageFreeHours] [datetime] NULL,
	[Email] [nvarchar](max) NULL,
	[CryptID] [int] NULL,
	[AutoCharge] [bit] NULL,
	[AdvanceBilling] [float] NULL,
	[PrintMethod] [smallint] NULL,
	[VoidMethod] [smallint] NULL,
	[BalanceLow] [money] NULL,
	[BalanceHigh] [money] NULL,
	[AccessLevel] [int] NULL,
	[CarpoolType] [int] NULL,
	[ID] [int] NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intAccountType] [int] NOT NULL,
	[dtCreateDate] [datetime] NULL,
	[dtModifyDate] [datetime] NULL,
	[strOperationFlag] [nvarchar](50) NULL,
	[intJMSCardPoolID] [int] NULL,
	[bToApplySurcharge] [bit] NULL,
 CONSTRAINT [PK_cmAccountsHistory] PRIMARY KEY CLUSTERED 
(
	[intIDENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmCardArea]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmCardArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intAreaID] [int] NOT NULL,
	[intTimeZoneID] [int] NULL,
	[intSoftTimeZoneID] [int] NOT NULL,
 CONSTRAINT [PK_cmCardArea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmCardsHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmCardsHistory](
	[intIDENT] [bigint] IDENTITY(1,1) NOT NULL,
	[Card Number] [nvarchar](256) NOT NULL,
	[Account Number] [nvarchar](50) NULL,
	[From Date] [datetime] NOT NULL,
	[To Date] [datetime] NOT NULL,
	[Payment Due] [money] NULL,
	[First Name] [nvarchar](16) NULL,
	[Last Name] [nvarchar](16) NULL,
	[Issue] [smallint] NULL,
	[Auto Expire] [bit] NULL,
	[Enable Passback] [bit] NULL,
	[VIP] [bit] NULL,
	[Stall] [int] NULL,
	[Message] [nvarchar](16) NULL,
	[Driving Licence] [nvarchar](10) NULL,
	[Driving Licence Exp.] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
	[UsageCard] [smallint] NULL,
	[Code] [int] NULL,
	[BillingPeriod] [float] NULL,
	[NextBillDate] [datetime] NULL,
	[LastBillDate] [datetime] NULL,
	[LastInvNo] [int] NULL,
	[AutoDeactivated] [bit] NULL,
	[LocID] [int] NULL,
	[Rate] [nvarchar](2) NULL,
	[CCNumber] [nvarchar](20) NULL,
	[CCExpire] [datetime] NULL,
	[CCDiscount] [smallint] NULL,
	[ParkerNumber] [nvarchar](50) NULL,
	[CardSubtype] [int] NULL,
	[CardSubtypeData] [image] NULL,
	[Rate2] [nvarchar](2) NULL,
	[ID] [int] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intParisTimeZoneID] [int] NOT NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[strPhone] [nvarchar](50) NULL,
	[dtCreated] [datetime] NULL,
	[dtModified] [datetime] NULL,
	[strModifiedByUser] [nvarchar](50) NULL,
	[strReplacedCard] [nvarchar](256) NULL,
	[intReplacedFacility] [int] NULL,
	[intReplacedMediaType] [int] NULL,
	[dtCreateDate] [datetime] NULL,
	[dtModifyDate] [datetime] NULL,
	[strOperationFlag] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmCardsHistory] PRIMARY KEY CLUSTERED 
(
	[intIDENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmDebitMultiusage]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmDebitMultiusage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[intCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[dtMuPeriodBegin] [datetime] NULL,
	[dtMuPeriodEnd] [datetime] NULL,
	[dtEntry] [datetime] NULL,
	[dtExit] [datetime] NULL,
	[mAmount] [money] NULL,
 CONSTRAINT [PK_cmDebitMultiusage_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmInvoicesHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmInvoicesHistory](
	[RowNo] [int] IDENTITY(1,1) NOT NULL,
	[InvNo] [int] NULL,
	[ID] [nvarchar](2) NULL,
	[Account Number] [nvarchar](50) NULL,
	[InvDate] [datetime] NULL,
	[Code] [int] NULL,
	[Details] [nvarchar](30) NULL,
	[Qty] [float] NULL,
	[Amount] [float] NULL,
	[AmountDue] [float] NULL,
	[From Date] [datetime] NULL,
	[To Date] [datetime] NULL,
	[Months] [float] NULL,
	[Printed] [bit] NULL,
	[Paid] [float] NULL,
	[CardNumber] [nvarchar](256) NULL,
	[PrevAccBalance] [money] NULL,
	[RealUsageAmount] [money] NULL,
	[intLocationID] [int] NOT NULL,
	[BatchNumber] [int] NULL,
	[BatchText] [nvarchar](200) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[intRate] [tinyint] NULL,
	[intTaxType] [tinyint] NULL,
	[mnTax] [money] NULL,
	[dtDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_cmInvoicesHistory] PRIMARY KEY CLUSTERED 
(
	[RowNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmLacPaperPermitPrefix]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmLacPaperPermitPrefix](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strPrefix] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmLacPermitCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmLacPermitCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strPaperPermit] [nvarchar](256) NOT NULL,
	[intPermitMediaType] [int] NOT NULL,
	[intPermitFacility] [int] NOT NULL,
	[strCardNumber] [nvarchar](256) NULL,
	[intCardMediaType] [int] NULL,
	[intCardFacility] [int] NULL,
	[dtIssued] [datetime] NULL,
	[dtCanceled] [datetime] NULL,
	[bitEmpPub] [bit] NOT NULL,
	[bitCivic] [bit] NOT NULL,
	[intPermitType] [tinyint] NOT NULL,
 CONSTRAINT [PK_cmLacPermitCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMapCardType]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMapCardType](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intCardType] [int] NULL,
	[strDescription] [nvarchar](1024) NULL,
	[isChargeCodeBased] [int] NULL,
	[isRateBased] [int] NULL,
 CONSTRAINT [PK_cmMapCardType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERCashData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERCashData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMnlEntID] [int] NOT NULL,
	[intCashID] [int] NOT NULL,
	[intCashItemCount] [int] NOT NULL,
 CONSTRAINT [PK_cmMERCashBreakdown] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERCashDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERCashDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCashName] [nvarchar](200) NOT NULL,
	[mnCashValue] [money] NULL,
	[bHidden] [bit] NOT NULL,
 CONSTRAINT [PK_cmMERCashDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERCashierStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERCashierStatusDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCashierStatus] [nvarchar](256) NOT NULL,
	[bHidden] [bit] NOT NULL,
 CONSTRAINT [PK_cmMERCashierStatusDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCashierName] [nvarchar](256) NOT NULL,
	[intCashierStatusID] [int] NOT NULL,
	[intLaneID] [int] NULL,
	[dtDate] [datetime] NOT NULL,
	[intOpenLotID] [int] NOT NULL,
	[intStartingNumber] [int] NOT NULL,
	[intEndingNumber] [int] NOT NULL,
	[strNote] [ntext] NULL,
	[dtDateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_cmManualEnteredRevenue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERLaneDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERLaneDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strLaneTitle] [nvarchar](256) NOT NULL,
	[bHidden] [bit] NOT NULL,
 CONSTRAINT [PK_cmMERLaneDesc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMEROpenLotDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMEROpenLotDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strOpenLotName] [nvarchar](150) NOT NULL,
	[bHidden] [bit] NOT NULL,
 CONSTRAINT [PK_cmOpenLot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERTicketData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERTicketData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMnlEntID] [int] NOT NULL,
	[intTicketID] [int] NOT NULL,
	[intCount] [int] NOT NULL,
 CONSTRAINT [PK_cmMERTicketData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmMERTicketDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmMERTicketDesc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strTicketName] [nvarchar](100) NOT NULL,
	[mnTicketNominal] [money] NOT NULL,
	[bDailyRevenue] [bit] NOT NULL,
	[bHidden] [bit] NOT NULL,
 CONSTRAINT [PK_cmMERTicket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmOperationNumbersPerBoard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmOperationNumbersPerBoard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intLastMaxValue] [bigint] NOT NULL,
 CONSTRAINT [PK_cmOperationNumbersPerBoard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmPaymentsHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmPaymentsHistory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Account Number] [nvarchar](50) NULL,
	[Card Number] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[Due Date] [datetime] NULL,
	[Payment Date] [datetime] NULL,
	[Amount] [money] NULL,
	[Payment Method] [nvarchar](8) NULL,
	[Check/Card Number] [nvarchar](128) NULL,
	[Card Type] [nvarchar](16) NULL,
	[Payer] [nvarchar](32) NULL,
	[Notes] [nvarchar](32) NULL,
	[Batch Number] [float] NULL,
	[Billing Period] [float] NULL,
	[CryptID] [int] NULL,
	[CardType] [tinyint] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Rate] [int] NULL,
	[RefInvNo] [int] NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[dtDeletionDate] [datetime] NULL,
	[intBoardNumber] [int] NULL,
	[intTaxType] [tinyint] NULL,
	[mnTax] [money] NULL,
	[intReceiptNumber] [bigint] NULL,
	[intOperationNumber] [bigint] NULL,
	[mnSurcharge] [money] NULL,
 CONSTRAINT [PK_cmPaymentsHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmQueueToDpws]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmQueueToDpws](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intTaskType] [tinyint] NOT NULL,
	[intTaskSubType] [tinyint] NULL,
	[intStage] [tinyint] NOT NULL,
	[strCardNumber] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[strAccountNumber] [nvarchar](256) NULL,
	[intInvoiceNumber] [int] NULL,
	[intPaymentID] [int] NULL,
	[mnAccountBalance] [money] NULL,
	[intUsageCount] [int] NULL,
	[intCategoryId] [int] NULL,
	[intChargeCode] [int] NULL,
	[strCategoryName] [nvarchar](256) NULL,
	[bResync] [bit] NULL,
	[intCardStatusCode] [int] NULL,
	[strCardStatusDescription] [nvarchar](256) NULL,
	[dtAdded] [datetime] NOT NULL,
	[dtHandled] [datetime] NULL,
	[intSessionId] [int] NOT NULL,
	[intAppId] [tinyint] NOT NULL,
	[bUsageCountRelative] [bit] NULL,
 CONSTRAINT [PK_cmQueueToDpws] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmSurcharges]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmSurcharges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCreditCardType] [int] NOT NULL,
	[decimalPercent1] [decimal](8, 6) NOT NULL,
	[intGroupID] [int] NOT NULL,
	[intApplyType] [int] NOT NULL,
 CONSTRAINT [PK_cmSurcharges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmTimeDebitLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmTimeDebitLog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intOperation] [int] NOT NULL,
	[dtOperationTime] [datetime] NOT NULL,
	[tsTimeBalanceBefore] [int] NULL,
	[tsOperationTimeBalance] [int] NULL,
	[tsTimeBalanceAfter] [int] NULL,
	[intBoardNumber] [int] NULL,
	[intTrFeeNumber] [bigint] NULL,
 CONSTRAINT [PK_cmTimeDebitLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmTimeDebitLogOperationDescription]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmTimeDebitLogOperationDescription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[intOperationCode] [int] NOT NULL,
	[strOperationDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmTimeDebitLogOperationDescription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmUsageCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmUsageCards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intLowLevel] [int] NOT NULL,
	[bTimed] [bit] NOT NULL,
	[bRelAbs] [bit] NOT NULL,
	[dtTime] [datetime] NOT NULL,
	[intSetupUsageCount] [int] NULL,
 CONSTRAINT [PK_cmUsageCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmUsageCardsHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmUsageCardsHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NULL,
	[intCardNumber] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[dtEntry] [datetime] NULL,
	[dtExit] [datetime] NULL,
	[intUsageCount] [int] NULL,
	[intUsageCounterAfterDeduct] [int] NULL,
 CONSTRAINT [PK_cmUsageCardsHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[AutoGenerateType] [smallint] NULL,
	[AutoGenerateDays] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyAddress] [nvarchar](50) NULL,
	[CompanyState] [nvarchar](50) NULL,
	[CompanyZIP] [nvarchar](50) NULL,
	[CompanyPhone] [nvarchar](50) NULL,
	[CompanyFax] [nvarchar](50) NULL,
	[CompanyNumber] [nvarchar](50) NULL,
	[CompanyLogo] [nvarchar](70) NULL,
	[DeactivateType] [smallint] NULL,
	[DeactivateDays] [nvarchar](50) NULL,
	[Rounding] [smallint] NULL,
	[GracePeriod] [smallint] NULL,
	[CompanyCity] [nvarchar](50) NULL,
	[BusLic] [nvarchar](50) NULL,
	[CName] [nvarchar](50) NULL,
	[CAddr] [nvarchar](50) NULL,
	[CState] [nvarchar](50) NULL,
	[CCity] [nvarchar](50) NULL,
	[CZIP] [nvarchar](50) NULL,
	[CPhone] [nvarchar](50) NULL,
	[CFax] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strBSBNumber] [nvarchar](200) NULL,
	[strBankAccountNumber] [nvarchar](200) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cutTablesCollection]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cutTablesCollection](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strTableName] [nvarchar](100) NOT NULL,
	[strFilter] [nvarchar](500) NULL,
	[dtAddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cutTablesCollection] PRIMARY KEY CLUSTERED 
(
	[strTableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cutTablesLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cutTablesLog](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strObjectName] [nvarchar](100) NOT NULL,
	[strOpType] [nvarchar](100) NOT NULL,
	[strOpDesc] [nvarchar](1000) NOT NULL,
	[intRowsAffected] [int] NOT NULL,
	[intResCode] [int] NOT NULL,
 CONSTRAINT [PK_cutTablesLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCMapBatchStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCMapBatchStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCWBatchStatusCode] [smallint] NOT NULL,
	[strDescription] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_cwCCMapBatchStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCMapCommand]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCMapCommand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCommand] [int] NULL,
	[intInnerCommand] [int] NULL,
	[strDescription] [nvarchar](1024) NULL,
	[intRevenueStatus] [int] NULL,
	[bIsSale] [bit] NOT NULL,
	[bIsCredit] [bit] NOT NULL,
	[bIsVoid] [bit] NOT NULL,
 CONSTRAINT [PK_cwCCMapCommand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCMapName]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCMapName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intCCCode] [int] NOT NULL,
	[strCCName] [nvarchar](50) NOT NULL,
	[strCCDescription] [nvarchar](1024) NULL,
	[bitShowInCmUI] [bit] NOT NULL,
 CONSTRAINT [PK_cwCCMapName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCMapProviderTypes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCMapProviderTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strDPProviderCode] [nvarchar](100) NOT NULL,
	[intDPCreditCardCode] [int] NOT NULL,
	[strProviderCreditCardCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cwCCMapProviderTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCMapTranStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCMapTranStatus](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCWStatusCode] [smallint] NOT NULL,
	[strDescription] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_cwCCMapTranSatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCNashvilleExtraData]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCNashvilleExtraData](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCWID] [bigint] NOT NULL,
	[strSanitizedRawRequest] [nvarchar](4000) NULL,
	[strSanitizedRawResponse] [nvarchar](4000) NULL,
	[dtRequestDate] [datetime] NULL,
	[dtResponseDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCRefunds]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCRefunds](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strClientName] [nvarchar](255) NOT NULL,
	[intCCChargeCWID] [bigint] NOT NULL,
	[intCCRefundCWID] [bigint] NOT NULL,
	[mnRefundAmount] [money] NOT NULL,
	[dtSystemDate] [datetime] NOT NULL,
 CONSTRAINT [PK_cwCCRefunds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cwCCRequest]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cwCCRequest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCommand] [smallint] NOT NULL,
	[strAccount] [nvarchar](255) NOT NULL,
	[strExpDate] [nvarchar](50) NOT NULL,
	[mnAmount] [money] NOT NULL,
	[strOperatorID] [nvarchar](50) NULL,
	[intLane] [bigint] NULL,
	[strInvoiceNumber] [nvarchar](50) NULL,
	[intCardReader] [int] NULL,
	[strMemo] [nvarchar](50) NULL,
	[dtEntryDate] [datetime] NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[intFeeID] [bigint] NOT NULL,
	[intCCType] [int] NOT NULL,
	[intCryptID] [bigint] NULL,
	[intResultMessageNumber] [int] NULL,
	[strResponse] [nvarchar](1024) NULL,
	[intInnerResultMessageNumber] [int] NULL,
	[strInnerResponse] [nvarchar](1024) NULL,
	[dtResponseDate] [datetime] NULL,
	[intBatchNumber] [int] NULL,
	[intMerchantID] [int] NULL,
	[strClientName] [nvarchar](255) NULL,
	[intClientID] [bigint] NULL,
	[strClientNotes] [nvarchar](255) NULL,
	[intTranStatus] [smallint] NOT NULL,
	[intBatchStatus] [smallint] NOT NULL,
	[strReference] [nvarchar](255) NULL,
	[strAuthorization] [nvarchar](255) NULL,
	[intBatchSequence] [bigint] NULL,
	[intVoidedTrID] [bigint] NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intAdjustedAmountType] [int] NOT NULL,
	[mnRequestedAmount] [money] NOT NULL,
	[mnAmountDelta] [money] NOT NULL,
	[strReceipt] [nvarchar](1024) NULL,
	[intRequestType] [int] NOT NULL,
	[strToken] [nvarchar](255) NULL,
	[strTokenType] [nvarchar](50) NULL,
	[strAVS] [nvarchar](128) NULL,
	[strZIP] [nvarchar](50) NULL,
	[intRecurringOption] [int] NOT NULL,
	[intAVSResponseID] [int] NOT NULL,
	[intTokenIssueResponseID] [int] NOT NULL,
	[mnSurchargeAmount] [money] NULL,
	[strIssuedCHDToken] [nvarchar](1024) NULL,
	[strHubProviderTxtRef] [nvarchar](64) NULL,
	[strSpecificErrorCode] [nvarchar](64) NULL,
	[strSpecificErrorDescription] [nvarchar](256) NULL,
	[strTerminalID] [nvarchar](64) NULL,
	[strClientReceipt] [nvarchar](1024) NULL,
	[mnTaxAmount] [money] NULL,
	[intTaxType] [int] NULL,
 CONSTRAINT [PK_cwCCRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyLimited]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLimited](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dat] [datetime] NOT NULL,
	[Card] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[Enter] [datetime] NULL,
	[TimeStayed] [datetime] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_DailyLimited] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyLimitedHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLimitedHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Card] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[Entry] [datetime] NOT NULL,
	[Exit] [datetime] NOT NULL,
	[Amount] [float] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_DailyLimitedHistory_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbVersion]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strVersion] [nvarchar](255) NOT NULL,
	[fltVersion] [float] NOT NULL,
	[dtDate] [datetime] NOT NULL,
	[strNotes] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbVersion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dcmDiscountEventCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dcmDiscountEventCards](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intSerialNumber] [bigint] NOT NULL,
	[intBarCodeDiscTicket] [bigint] NOT NULL,
	[intDiscountNumber] [int] NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageRestriction] [int] NULL,
	[intUsageCount] [int] NULL,
	[intMaxUsageCount] [int] NULL,
	[dtIssueDate] [datetime] NOT NULL,
	[strIssueOperatorName] [nvarchar](100) NULL,
	[dtLastDateModified] [datetime] NOT NULL,
	[strModifyOperatorName] [nvarchar](100) NULL,
	[intEventID] [int] NOT NULL,
 CONSTRAINT [PK_lsmDiscountEventCards] PRIMARY KEY CLUSTERED 
(
	[intBarCodeDiscTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dcmDiscountEventInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dcmDiscountEventInfo](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strEventName] [nvarchar](255) NULL,
	[dtEventStartDate] [datetime] NULL,
	[dtEventEndDate] [datetime] NULL,
	[intIsActive] [smallint] NOT NULL,
	[dtEventRegistered] [datetime] NOT NULL,
	[strRegisterOperatorName] [nvarchar](100) NULL,
	[dtLastDateModified] [datetime] NOT NULL,
	[strModifyOpertorName] [nvarchar](100) NULL,
 CONSTRAINT [PK_lsmDiscountEventInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Debit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debit](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](256) NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[Enter] [datetime] NULL,
	[Exit] [datetime] NULL,
	[InvNum] [int] NULL,
	[intLocationID] [int] NOT NULL,
	[intEntryBoardNumber] [int] NULL,
	[intExitBoardNumber] [int] NULL,
 CONSTRAINT [PK_Debit] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defAutoApply]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defAutoApply](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intAutoApplyOnID] [bigint] NOT NULL,
	[intOrder] [int] NOT NULL,
	[intDiscountID] [bigint] NULL,
 CONSTRAINT [PK_defAutoApply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defAutoApplyOn]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defAutoApplyOn](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intRateID] [bigint] NULL,
 CONSTRAINT [PK_defAutoApplyOn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defBlackoutDates]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defBlackoutDates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intOrder] [int] NOT NULL,
	[bAnnual] [bit] NOT NULL,
	[intDayFrom] [int] NOT NULL,
	[intMonthFrom] [int] NOT NULL,
	[intYearFrom] [int] NULL,
	[intDayTo] [int] NOT NULL,
	[intMonthTo] [int] NOT NULL,
	[intYearTo] [int] NULL,
	[intMinMinutesOutside] [int] NOT NULL,
 CONSTRAINT [PK_defBlackoutDates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defCalcOptions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defCalcOptions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strKeyName] [nvarchar](256) NOT NULL,
	[varKeyValue] [sql_variant] NOT NULL,
	[sysKeyType] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_defCalcOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defChargeTables]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defChargeTables](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intChargeTableKey] [int] NOT NULL,
	[strTableName] [nvarchar](256) NOT NULL,
	[intMaximumAmount] [int] NULL,
 CONSTRAINT [PK_defChargeTables] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defChargeTableUnits]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defChargeTableUnits](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intChargeTableID] [bigint] NOT NULL,
	[intOrder] [int] NOT NULL,
	[intDurationInMinutes] [int] NOT NULL,
	[intAmount] [int] NOT NULL,
	[intRepeatCount] [int] NOT NULL,
 CONSTRAINT [PK_defChargeTableUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDayPatterns]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDayPatterns](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDayPatternKey] [int] NOT NULL,
	[strName] [nvarchar](256) NOT NULL,
	[intOption] [int] NOT NULL,
	[intDailyMaximum] [int] NULL,
 CONSTRAINT [PK_defDayPatterns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDayPatternTimeExtentChargeTables]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDayPatternTimeExtentChargeTables](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDayPatternTimeExtentID] [bigint] NOT NULL,
	[intChargeTableID] [bigint] NOT NULL,
 CONSTRAINT [PK_defDayPatternTimeExtentChargeTables] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDayPatternTimeExtents]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDayPatternTimeExtents](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDayPatternTimeLineConditionID] [bigint] NOT NULL,
	[intOrder] [int] NOT NULL,
	[intStartTimeHour] [int] NOT NULL,
	[intStartTimeMinute] [int] NOT NULL,
	[bCut] [bit] NOT NULL,
	[bOverlap] [bit] NOT NULL,
	[bCaseC] [bit] NULL,
	[bCaseD] [bit] NULL,
 CONSTRAINT [PK_defDayPatternTimeExtents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDayPatternTimeLineConditions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDayPatternTimeLineConditions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDayPatternID] [bigint] NOT NULL,
	[intOrder] [int] NOT NULL,
	[intMaximumAmount] [int] NULL,
	[bDefault] [bit] NOT NULL,
	[intFromEntryTimeHour] [int] NULL,
	[intFromEntryTimeMinute] [int] NULL,
	[intToEntryTimeHour] [int] NULL,
	[intToEntryTimeMinute] [int] NULL,
	[intFromExitTimeHour] [int] NULL,
	[intFromExitTimeMinute] [int] NULL,
	[intToExitTimeHour] [int] NULL,
	[intToExitTimeMinute] [int] NULL,
 CONSTRAINT [PK_defDayPatternTimeLineConditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscountApplianceApply]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscountApplianceApply](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDiscountAppliancesID] [bigint] NOT NULL,
	[intDiscountID] [bigint] NULL,
	[intRateID] [bigint] NULL,
 CONSTRAINT [PK_defDiscountApplianceApply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscountAppliances]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscountAppliances](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDiscountID] [bigint] NULL,
	[intRateID] [bigint] NULL,
 CONSTRAINT [PK_defDiscountAppliances] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscountBlackoutDates]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscountBlackoutDates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDiscountID] [bigint] NOT NULL,
	[intBlackoutDateID] [bigint] NOT NULL,
 CONSTRAINT [PK_defDiscountBlackoutDates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscounts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDiscountKey] [int] NOT NULL,
	[strDiscountName] [nvarchar](20) NOT NULL,
	[bIsStore] [bit] NOT NULL,
	[intDiscountType] [int] NOT NULL,
	[intSalePercent] [int] NOT NULL,
	[bExludeBlackoutDatePeriods] [bit] NOT NULL,
	[intMinStay] [int] NOT NULL,
	[bExcludeTaxes] [bit] NULL,
	[intDiscountAmount] [int] NULL,
	[intDiscountPercent] [int] NULL,
	[intDiscountMinutes] [int] NULL,
	[intDiscountDays] [int] NULL,
	[intRatesID] [bigint] NULL,
	[intDiscountsID1] [bigint] NULL,
	[intDiscountsID2] [bigint] NULL,
	[bIsForReservations] [bit] NOT NULL,
	[intUsage] [int] NOT NULL,
 CONSTRAINT [PK_defDiscounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscountsCollection]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscountsCollection](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intDiscountKey] [int] NOT NULL,
	[strDiscountName] [nvarchar](255) NOT NULL,
	[intDiscountTypeCode] [int] NOT NULL,
	[strDiscountType] [nvarchar](255) NOT NULL,
	[fltMoneyOrPrecentOrTime] [float] NOT NULL,
	[fltSalePercent] [float] NOT NULL,
	[intRateKey] [int] NOT NULL,
	[intRateIndex] [int] NOT NULL,
	[dtModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_defDiscountsCollection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defDiscountsCollectionHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defDiscountsCollectionHistory](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intDiscountKey] [int] NOT NULL,
	[strDiscountName] [nvarchar](255) NOT NULL,
	[intDiscountTypeCode] [int] NOT NULL,
	[strDiscountType] [nvarchar](255) NOT NULL,
	[fltMoneyOrPrecentOrTime] [float] NOT NULL,
	[fltSalePercent] [float] NOT NULL,
	[intRateKey] [int] NOT NULL,
	[intRateIndex] [int] NOT NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[dtDeleteDate] [datetime] NOT NULL,
 CONSTRAINT [PK_defDiscountsCollectionHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defHolidays]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defHolidays](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intHolidayID] [int] NOT NULL,
	[intDay] [int] NOT NULL,
	[intMonth] [int] NOT NULL,
	[intYear] [int] NULL,
	[bAnnual] [bit] NOT NULL,
	[strDescription] [nvarchar](256) NULL,
 CONSTRAINT [PK_defHolidays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRateConditionDayPattern]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRateConditionDayPattern](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intRateConditionID] [bigint] NOT NULL,
	[intDayPatternID] [bigint] NOT NULL,
 CONSTRAINT [PK_defRateConditionDayPattern] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRateConditionDaysInLot]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRateConditionDaysInLot](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intRateConditionID] [bigint] NOT NULL,
	[intDayIndex] [int] NOT NULL,
 CONSTRAINT [PK_defRateConditionDaysInLot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRateConditionHolidays]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRateConditionHolidays](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intHolidaysID] [bigint] NOT NULL,
	[intRateConditionsID] [bigint] NOT NULL,
 CONSTRAINT [PK_defRateConditionHolidays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRateConditions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRateConditions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intRatesID] [bigint] NOT NULL,
	[intOrderInRateCalculation] [int] NOT NULL,
 CONSTRAINT [PK_defRateConditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRateConditionWeekDays]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRateConditionWeekDays](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intRateConditionID] [bigint] NOT NULL,
	[intWeekDay] [int] NOT NULL,
 CONSTRAINT [PK_defRateConditionWeekDays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRates]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strRateKey] [nvarchar](2) NOT NULL,
	[intRateKey] [int] NOT NULL,
	[strName] [nvarchar](256) NOT NULL,
	[bApplyTax] [bit] NOT NULL,
	[intRateType] [int] NOT NULL,
	[bEndOfWeek] [bit] NOT NULL,
	[intWeekMaxAmount] [int] NULL,
	[intFixedAmount] [int] NULL,
	[bRelativeDays] [bit] NOT NULL,
	[intUsage] [int] NULL,
 CONSTRAINT [PK_defRates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRatesCollection]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRatesCollection](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intRateKey] [int] NOT NULL,
	[strRateKey] [nvarchar](10) NOT NULL,
	[strRateName] [nvarchar](255) NOT NULL,
	[mnRateAmount] [money] NOT NULL,
	[intIsFlat] [int] NOT NULL,
	[intApplyTax] [int] NOT NULL,
	[intIsDeposit] [int] NOT NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[intUsage] [int] NULL,
 CONSTRAINT [PK_defRatesCollection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defRatesCollectionHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defRatesCollectionHistory](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intRateKey] [int] NOT NULL,
	[strRateKey] [nvarchar](10) NOT NULL,
	[strRateName] [nvarchar](255) NOT NULL,
	[mnRateAmount] [money] NOT NULL,
	[intIsFlat] [int] NOT NULL,
	[intApplyTax] [int] NOT NULL,
	[intIsDeposit] [int] NOT NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[dtDeleteDate] [datetime] NOT NULL,
	[intUsage] [int] NULL,
 CONSTRAINT [PK_defRatesCollectionHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[defTaxes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defTaxes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intTaxKey] [int] NOT NULL,
	[strTaxName] [nvarchar](16) NOT NULL,
	[intTaxType] [int] NOT NULL,
	[intTaxCalculatedBy] [int] NOT NULL,
	[intTaxAmount] [int] NULL,
	[intTaxPercent] [int] NULL,
 CONSTRAINT [PK_defTaxes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disabledCustomer]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disabledCustomer](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strName] [nvarchar](128) NOT NULL,
	[strDisabledPermit] [nvarchar](32) NOT NULL,
	[strDisabledRegistration] [nvarchar](32) NOT NULL,
	[strDrivingLicense] [nvarchar](32) NOT NULL,
	[strDrivingLicenseState] [nvarchar](4) NULL,
	[dtDisabledPermitExpDate] [datetime] NULL,
 CONSTRAINT [PK_disabledCustomer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disabledPayments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disabledPayments](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtCreateTime] [datetime] NOT NULL,
	[intCustomerID] [numeric](18, 0) NOT NULL,
	[intCarID] [numeric](18, 0) NOT NULL,
	[intOperatorID] [int] NOT NULL,
	[strOperator] [nvarchar](50) NOT NULL,
	[intErrorCode] [int] NOT NULL,
	[intTicketNumber] [int] NOT NULL,
	[intTicketLot] [int] NOT NULL,
	[intTicketRate] [int] NOT NULL,
	[intEntryLane] [int] NOT NULL,
	[dtEntryTime] [datetime] NOT NULL,
	[intExitLane] [int] NOT NULL,
	[dtExitTime] [datetime] NOT NULL,
	[intStatusInfo] [int] NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intInvoiceInfo] [int] NOT NULL,
	[intDiscount] [int] NOT NULL,
	[strDiscountName] [nvarchar](128) NULL,
	[intStatusResult] [int] NOT NULL,
	[intInvoiceResult] [int] NOT NULL,
	[mnDiscountedAmount] [money] NOT NULL,
	[strNotes] [nvarchar](256) NULL,
	[strSnapshotName] [nvarchar](260) NULL,
	[intGarageID] [int] NOT NULL,
 CONSTRAINT [PK_disabledPayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCarryOvr]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCarryOvr](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtResetTime] [datetime] NOT NULL,
	[intCfgNum] [int] NOT NULL,
	[intLotCapacity] [bigint] NOT NULL,
 CONSTRAINT [PK_dpcCarryOvr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCarryOvrColumns]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCarryOvrColumns](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDpcCarryOvr_ID] [bigint] NOT NULL,
	[intColumnType] [int] NOT NULL,
	[intColumnNum] [int] NOT NULL,
	[strColumnName] [ntext] NOT NULL,
	[intColumnVal] [bigint] NOT NULL,
	[intRangeFrom] [bigint] NULL,
	[intRangeTo] [bigint] NULL,
	[bUseAccessLevels] [bit] NULL,
	[bCountByCardAccount] [bit] NULL,
	[intCardType] [int] NULL,
 CONSTRAINT [PK_dpcCarryOvrColumns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCfgColumns]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCfgColumns](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dpcCfgGeneral_ID] [bigint] NOT NULL,
	[strColumnName] [nvarchar](256) NOT NULL,
	[bAdjustable] [bit] NOT NULL,
	[strColumnGUID] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dpcCfgColumns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCfgDeletedColumns]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCfgDeletedColumns](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strColumnGUID] [nvarchar](256) NOT NULL,
	[bProcessed] [bit] NULL,
 CONSTRAINT [PK_dpcCfgDeletedColumns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCfgGeneral]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCfgGeneral](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCfgNum] [int] NOT NULL,
	[bLoadOnStart] [bit] NOT NULL,
	[bRunning] [bit] NOT NULL,
	[strGarageName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dpcCfgGeneral] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcCfgLanes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcCfgLanes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dpcCfgGeneral_ID] [bigint] NOT NULL,
	[intLaneNumber] [int] NOT NULL,
	[strLaneName] [nvarchar](256) NOT NULL,
	[intLaneType] [int] NOT NULL,
	[bIgnoreTicketTransactions] [bit] NOT NULL,
	[bIgnoreFeeTransactions] [bit] NOT NULL,
	[bIgnoreBarcodeTransientPaidTransactions] [bit] NOT NULL,
 CONSTRAINT [PK_dpcCfgLanes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcColumnAccessLevels]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcColumnAccessLevels](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDpcCarryOvrColumns_ID] [bigint] NOT NULL,
	[intColumnAccessLevel] [int] NOT NULL,
 CONSTRAINT [PK_dpcColumnAccessLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcColumnCardAccounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcColumnCardAccounts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDpcCarryOvrColumns_ID] [bigint] NOT NULL,
	[strCardAccount] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_dpcColumnCardAccounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcColumnEvents]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcColumnEvents](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDpcCarryOvrColumns_ID] [bigint] NOT NULL,
	[intColumnEvent] [int] NOT NULL,
 CONSTRAINT [PK_dpcColumnEvents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcColumnTypes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcColumnTypes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intColumnType] [int] NOT NULL,
	[strColumnTypeDesc] [ntext] NOT NULL,
 CONSTRAINT [PK_dpcColumnTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcEventNonResetableColl]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcEventNonResetableColl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intEventCode] [int] NOT NULL,
	[strEventDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_dpcEventNonResetableColl] PRIMARY KEY CLUSTERED 
(
	[intEventCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcEventNonResetableCounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcEventNonResetableCounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intNormalEvent] [int] NULL,
	[intEventCode] [int] NULL,
	[intNonResCount] [bigint] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intAdjust] [int] NULL,
 CONSTRAINT [PK_dpcEventNonResetableCounts] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpcManualAdjustments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpcManualAdjustments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCfgNum] [int] NOT NULL,
	[dtDateTime] [datetime] NOT NULL,
	[strGarageName] [nvarchar](255) NOT NULL,
	[intFreeSpaces] [bigint] NOT NULL,
	[intCapacity] [bigint] NOT NULL,
	[strDisplayStatus] [nvarchar](255) NOT NULL,
	[intGarageID] [bigint] NOT NULL,
	[strAdjustmentType] [nvarchar](255) NOT NULL,
	[intAdjustmentValue] [bigint] NOT NULL,
	[strUserName] [nvarchar](255) NULL,
 CONSTRAINT [PK_dpcManualAdjustments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpEncoderOperationCodes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpEncoderOperationCodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intOperationCode] [int] NOT NULL,
	[strOperationDesc] [nvarchar](150) NULL,
	[intLocationID] [int] NULL,
 CONSTRAINT [PK_dpEncoderOperationCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpEncoderOperations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpEncoderOperations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strOpName] [nvarchar](50) NOT NULL,
	[intOpNumber] [int] NULL,
	[intOperationType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intFacilityCode] [int] NULL,
	[intLotNumber] [int] NULL,
	[strRateKey] [nvarchar](2) NULL,
	[intBatchNumber] [int] NULL,
	[intCarrierNumber] [int] NULL,
	[intDiscountNumber] [int] NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intValidityPeriodInMinutes] [bigint] NULL,
	[intUsageCount] [int] NULL,
	[mnUsageAmount] [money] NULL,
	[strTextToPrint] [nvarchar](50) NULL,
	[intLocationID] [int] NULL,
	[intEncoderID] [int] NULL,
	[intMerchantID] [int] NULL,
	[intMediaType] [int] NULL,
	[intUsageType] [int] NULL,
 CONSTRAINT [PK_dpEncoderOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpErrorLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpErrorLog](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtLogDate] [datetime] NOT NULL,
	[strSenderName] [nvarchar](255) NOT NULL,
	[strLogMessage] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_dpErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpiDownloadedCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpiDownloadedCards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](100) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[dtDownloadDateTime] [datetime] NOT NULL,
	[strOwnerFirstName] [nvarchar](100) NULL,
	[strOwnerLastName] [nvarchar](100) NULL,
	[intDP11000Response] [int] NOT NULL,
 CONSTRAINT [PK_dpiDownloadedCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpiEZPassTags]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpiEZPassTags](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intTagAgencyID] [int] NOT NULL,
	[intTagSerialNumber] [int] NOT NULL,
	[dtLastUsed] [datetime] NULL,
 CONSTRAINT [PK_dpiEZPassTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpiEZPassTagsTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpiEZPassTagsTemp](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intTagAgencyID] [int] NOT NULL,
	[intTagSerialNumber] [int] NOT NULL,
	[dtLastUsed] [datetime] NULL,
 CONSTRAINT [PK_dpiEZPassTagsTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpiHotelCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpiHotelCards](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[strCardNumber] [nvarchar](50) NOT NULL,
	[strRoomNumber] [nvarchar](50) NOT NULL,
	[bShareFlag] [bit] NOT NULL,
	[intParkerType] [int] NOT NULL,
	[strTransientNumber] [nvarchar](50) NOT NULL,
	[strBarCodeValetNumber] [nvarchar](50) NOT NULL,
	[strClassOfService] [nvarchar](50) NULL,
	[strProfileNumber] [nvarchar](50) NOT NULL,
	[dtArrivalDate] [datetime] NOT NULL,
	[dtDepartureDate] [datetime] NOT NULL,
	[strGuestFirstName] [nvarchar](50) NULL,
	[strGuestGroupNumber] [nvarchar](50) NULL,
	[strGuestName] [nvarchar](50) NULL,
	[strGuestTitle] [nvarchar](50) NULL,
	[strGuestVIPStatus] [nvarchar](50) NULL,
	[strWorkStationID] [nvarchar](50) NULL,
	[bIsCheckOut] [bit] NOT NULL,
	[dtCheckOutDate] [datetime] NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[intRecordType] [int] NOT NULL,
	[bIsChanged] [bit] NOT NULL,
	[intPostingRequestNumber] [int] NOT NULL,
	[strOldRoomNumber] [nvarchar](50) NULL,
	[strOldRoomShareFlag] [nvarchar](10) NULL,
	[bIsCheckOutByRoom] [bit] NOT NULL,
	[intEncoderType] [int] NULL,
	[intEntryLane] [int] NULL,
	[intMediaType] [int] NULL,
	[intUsageType] [int] NULL,
	[strOperatorID] [nvarchar](256) NULL,
	[strOperatorName] [nvarchar](256) NULL,
	[intFacilityCode] [int] NULL,
	[intOverNightsCount] [int] NULL,
 CONSTRAINT [PK_dpiHotelCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpiUnProcessedMessages]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpiUnProcessedMessages](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intIntegrationFlag] [bigint] NOT NULL,
	[strRawMessage] [nvarchar](2048) NOT NULL,
	[intProccesMessageCode] [int] NOT NULL,
 CONSTRAINT [PK_dpiUnProcessedMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dprCashReconciliation]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dprCashReconciliation](
	[intUNQ_ID] [int] IDENTITY(1,1) NOT NULL,
	[dtPDATE_Added] [datetime] NOT NULL,
	[dtPDATE_Start] [datetime] NOT NULL,
	[dtPDATE_End] [datetime] NOT NULL,
	[intMACHINEID] [int] NULL,
	[intAUDIT_NO] [int] NULL,
	[fltPREVIOUS_HOPPER_TOTAL] [float] NULL,
	[fltCURRENT_HOPPER_TOTAL] [float] NULL,
	[fltHOPPER_VARIANCE] [float] NULL,
	[intSERVICE_CARD] [int] NULL,
	[intDATA_SOURCE] [int] NULL,
	[intBCOINS05] [int] NULL,
	[intBCOINS10] [int] NULL,
	[intBCOINS20] [int] NULL,
	[intBCOINS25] [int] NULL,
	[intBCOINS50] [int] NULL,
	[intBCOINS100] [int] NULL,
	[intBCOINS200] [int] NULL,
	[intB_SAFE_COINS05] [int] NULL,
	[intB_SAFE_COINS10] [int] NULL,
	[intB_SAFE_COINS20] [int] NULL,
	[intB_SAFE_COINS25] [int] NULL,
	[intB_SAFE_COINS50] [int] NULL,
	[intB_SAFE_COINS100] [int] NULL,
	[intB_SAFE_COINS200] [int] NULL,
	[intBNOTES1] [int] NULL,
	[intBNOTES2] [int] NULL,
	[intBNOTES5] [int] NULL,
	[intBNOTES10] [int] NULL,
	[intBNOTES20] [int] NULL,
	[intBNOTES50] [int] NULL,
	[intBNOTES100] [int] NULL,
	[intECOINS05] [int] NULL,
	[intECOINS10] [int] NULL,
	[intECOINS20] [int] NULL,
	[intECOINS25] [int] NULL,
	[intECOINS50] [int] NULL,
	[intECOINS100] [int] NULL,
	[intECOINS200] [int] NULL,
	[intE_SAFE_COINS05] [int] NULL,
	[intE_SAFE_COINS10] [int] NULL,
	[intE_SAFE_COINS20] [int] NULL,
	[intE_SAFE_COINS25] [int] NULL,
	[intE_SAFE_COINS50] [int] NULL,
	[intE_SAFE_COINS100] [int] NULL,
	[intE_SAFE_COINS200] [int] NULL,
	[intENOTES1] [int] NULL,
	[intENOTES2] [int] NULL,
	[intENOTES5] [int] NULL,
	[intENOTES10] [int] NULL,
	[intENOTES20] [int] NULL,
	[intENOTES50] [int] NULL,
	[intENOTES100] [int] NULL,
	[intBDISPNOTES1] [int] NULL,
	[intBDISPNOTES5] [int] NULL,
	[intBDISPNOTES10] [int] NULL,
	[intBDISPNOTES20] [int] NULL,
	[intEDISPNOTES1] [int] NULL,
	[intEDISPNOTES5] [int] NULL,
	[intEDISPNOTES10] [int] NULL,
	[intEDISPNOTES20] [int] NULL,
	[intZREPORT_NO] [int] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_UNQ_ID] PRIMARY KEY CLUSTERED 
(
	[intUNQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dprHopperBalance]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dprHopperBalance](
	[intID] [int] IDENTITY(1,1) NOT NULL,
	[intID_IN_CR] [int] NOT NULL,
	[intHOPP_NOMINAL_1] [int] NULL,
	[intHOPP_NOMINAL_2] [int] NULL,
	[intHOPP_NOMINAL_3] [int] NULL,
	[intHOPP_NOMINAL_4] [int] NULL,
	[intHOPP_NOMINAL_5] [int] NULL,
	[intHOPP_NOMINAL_6] [int] NULL,
	[intHOPP_NOMINAL_7] [int] NULL,
	[intHOPP_NOMINAL_8] [int] NULL,
	[intB_HOPP_CNT_1] [int] NULL,
	[intB_HOPP_CNT_2] [int] NULL,
	[intB_HOPP_CNT_3] [int] NULL,
	[intB_HOPP_CNT_4] [int] NULL,
	[intB_HOPP_CNT_5] [int] NULL,
	[intB_HOPP_CNT_6] [int] NULL,
	[intB_HOPP_CNT_7] [int] NULL,
	[intB_HOPP_CNT_8] [int] NULL,
	[intE_HOPP_CNT_1] [int] NULL,
	[intE_HOPP_CNT_2] [int] NULL,
	[intE_HOPP_CNT_3] [int] NULL,
	[intE_HOPP_CNT_4] [int] NULL,
	[intE_HOPP_CNT_5] [int] NULL,
	[intE_HOPP_CNT_6] [int] NULL,
	[intE_HOPP_CNT_7] [int] NULL,
	[intE_HOPP_CNT_8] [int] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dprZReports]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dprZReports](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intZReportNum] [bigint] NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intStructCode] [int] NULL,
	[strCodeDesc] [nvarchar](100) NULL,
	[vtValue] [sql_variant] NULL,
	[vtNominal] [sql_variant] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intBoardType] [int] NULL,
	[intReportType] [int] NULL,
	[intReportSequenceID] [bigint] NULL,
 CONSTRAINT [PK_dprZReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpWebJobAgent]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpWebJobAgent](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strOperationType] [nvarchar](50) NULL,
	[strOperationDetails] [nvarchar](1024) NULL,
	[strStorageFileName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dpWebJobAgent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpWebJobAgentDownloadedCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpWebJobAgentDownloadedCards](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strEntryID] [nvarchar](50) NOT NULL,
	[dtEntryPublishedDate] [datetime] NOT NULL,
	[dtEntryUpdatedDate] [datetime] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[strCardNumber] [nvarchar](50) NOT NULL,
	[strCardStatus] [nvarchar](20) NOT NULL,
	[dtEntryDate] [datetime] NOT NULL,
	[dtExitDate] [datetime] NOT NULL,
	[strFirstName] [nvarchar](50) NOT NULL,
	[strLastName] [nvarchar](50) NOT NULL,
	[strFacilityID] [nvarchar](50) NOT NULL,
	[strRCSLotID] [nvarchar](50) NOT NULL,
	[strOrderID] [nvarchar](50) NOT NULL,
	[strLotID] [nvarchar](50) NOT NULL,
	[strProductID] [nvarchar](50) NOT NULL,
	[mnPermitValue] [money] NOT NULL,
	[strVehicleMake] [nvarchar](50) NOT NULL,
	[strVehicleModel] [nvarchar](50) NOT NULL,
	[strVehicleColor] [nvarchar](50) NOT NULL,
	[strVehiclePlate] [nvarchar](50) NOT NULL,
	[strVehicleState] [nvarchar](50) NOT NULL,
	[strValidationCode] [nvarchar](50) NOT NULL,
	[intDPDiscountKey] [int] NOT NULL,
	[intUsageCount] [int] NOT NULL,
	[intStatus] [int] NOT NULL,
	[intDownloadInfoID] [int] NOT NULL,
 CONSTRAINT [PK_dpWebJobAgentDownloadedCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dpWebJobAgentDownloadInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dpWebJobAgentDownloadInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intAvailableCards] [int] NOT NULL,
	[intNewCards] [int] NOT NULL,
	[intUpdatedCards] [int] NOT NULL,
	[intIntegrationType] [int] NULL,
	[intDPWebResponseCode] [int] NOT NULL,
 CONSTRAINT [PK_dpWebJobAgentDownloadInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDCards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](255) NOT NULL,
	[intFacility] [int] NOT NULL,
	[dtExpDate] [datetime] NOT NULL,
	[intStatusCode] [int] NOT NULL,
	[intRateNumber] [int] NOT NULL,
 CONSTRAINT [GDCards_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDCStays]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDCStays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](255) NOT NULL,
	[intFacility] [int] NOT NULL,
	[bInlot] [bit] NOT NULL,
	[bBlackListed] [bit] NOT NULL,
	[bPaid] [bit] NOT NULL,
	[bBalancePresent] [bit] NOT NULL,
	[dtEntryTime] [datetime] NOT NULL,
	[dtPaymentTime] [datetime] NOT NULL,
	[dtExitTime] [datetime] NOT NULL,
	[intEntryLaneNumber] [int] NOT NULL,
	[intPaymentLaneNumber] [int] NOT NULL,
	[intExitLaneNumber] [int] NOT NULL,
	[intEntryRateNumber] [int] NOT NULL,
	[intPaymentRateNumber] [int] NOT NULL,
	[intOriginalStaysLogID] [int] NOT NULL,
 CONSTRAINT [GDCStays_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDCStaysLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDCStaysLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](255) NOT NULL,
	[intFacility] [int] NOT NULL,
	[bInlot] [bit] NOT NULL,
	[bBlackListed] [bit] NOT NULL,
	[bPaid] [bit] NOT NULL,
	[bBalancePresent] [bit] NOT NULL,
	[dtEntryTime] [datetime] NOT NULL,
	[dtPaymentTime] [datetime] NOT NULL,
	[dtExitTime] [datetime] NOT NULL,
	[intEntryLaneNumber] [int] NOT NULL,
	[intPaymentLaneNumber] [int] NOT NULL,
	[intExitLaneNumber] [int] NOT NULL,
	[intEntryRateNumber] [int] NOT NULL,
	[intPaymentRateNumber] [int] NOT NULL,
	[intOriginalStaysLogID] [int] NOT NULL,
 CONSTRAINT [GDCStaysLog_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[RowNo] [int] IDENTITY(1,1) NOT NULL,
	[InvNo] [int] NULL,
	[CardNumber] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[ID] [nvarchar](2) NULL,
	[Account Number] [nvarchar](50) NULL,
	[InvDate] [datetime] NULL,
	[Code] [int] NULL,
	[Details] [nvarchar](30) NULL,
	[Qty] [float] NULL,
	[Amount] [money] NULL,
	[AmountDue] [money] NULL,
	[From Date] [datetime] NULL,
	[To Date] [datetime] NULL,
	[Months] [float] NULL,
	[Printed] [bit] NULL,
	[Paid] [float] NULL,
	[PrevAccBalance] [money] NULL,
	[RealUsageAmount] [money] NULL,
	[intLocationID] [int] NOT NULL,
	[BatchNumber] [int] NULL,
	[BatchText] [nvarchar](200) NULL,
	[intRate] [tinyint] NULL,
	[intTaxType] [tinyint] NULL,
	[mnTax] [money] NULL,
	[strContractNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[RowNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocID] [int] NOT NULL,
	[Location] [varchar](40) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[DateTime] [datetime] NULL,
	[Card Number] [nvarchar](256) NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[UserID] [smallint] NULL,
	[Mask] [int] NULL,
	[Stat] [float] NULL,
	[OldStat] [float] NULL,
	[Text] [ntext] NULL,
	[intSessionId] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_LogCBU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTemp](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NULL,
	[Lane No] [smallint] NULL,
	[Lane Type] [varchar](10) NULL,
	[User] [varchar](30) NULL,
	[Card Number] [varchar](10) NULL,
	[Result] [varchar](40) NULL,
	[OldStat] [varchar](40) NULL,
	[Uses] [int] NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_LogTemp] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lpiLicense]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lpiLicense](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intStatus] [int] NOT NULL,
	[strLicense] [nvarchar](40) NOT NULL,
	[strState] [nvarchar](4) NULL,
	[strLot] [nvarchar](10) NULL,
	[dtFirstDate] [datetime] NULL,
	[dtLastDate] [datetime] NULL,
	[imgPicture] [image] NULL,
	[binPicHash] [binary](16) NULL,
	[dtPicDate] [datetime] NULL,
	[strSlot] [nvarchar](10) NULL,
	[strRow] [nvarchar](10) NULL,
	[dtDownloadDate] [datetime] NULL,
	[dtArchivedDate] [datetime] NULL,
	[intReasonForArchive] [int] NULL,
	[strRoad] [nvarchar](50) NULL,
	[strFloor] [nvarchar](50) NULL,
 CONSTRAINT [PK_lpiLicense] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lpiLicenseStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lpiLicenseStatus](
	[intStatusCode] [int] NOT NULL,
	[strStatusDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_lpiLicenseStatus_1] PRIMARY KEY CLUSTERED 
(
	[intStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lpiSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lpiSettings](
	[strName] [nvarchar](40) NOT NULL,
	[strOrigin] [nvarchar](40) NOT NULL,
	[strValue] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmAppOperationLogs]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmAppOperationLogs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtOperationTime] [datetime] NOT NULL,
	[strOperationType] [nvarchar](50) NOT NULL,
	[strAuthenticatedUser] [nvarchar](100) NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intFacilityCode] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
 CONSTRAINT [PK_lsmAppOperationLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmCard](
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[intValid] [int] NOT NULL,
	[intInlot] [int] NOT NULL,
	[bitResync] [bit] NULL,
	[intRawStatus] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intTimeZone] [int] NOT NULL,
	[intAccessLevel] [int] NOT NULL,
	[dtModified] [datetime] NOT NULL,
	[dtTimeCreation] [datetime] NOT NULL,
	[dtValidFromDate] [datetime] NULL,
	[dtValidToDate] [datetime] NULL,
	[dtTimeEntry] [datetime] NULL,
	[intEntryLane] [int] NULL,
	[dtTimeExit] [datetime] NULL,
	[intExitLane] [int] NULL,
	[dtPaymentDateTime] [datetime] NULL,
	[intMachineNumber] [int] NULL,
	[mAmount] [money] NULL,
	[intDiscount] [int] NULL,
	[intOperator] [int] NULL,
	[intRoomNumber] [int] NULL,
	[intTicketNumber] [int] NULL,
	[strMask] [nvarchar](20) NULL,
	[intCCType] [int] NULL,
	[bitPaid] [bit] NULL,
	[intUsage] [int] NULL,
	[strLinkedCardNumber] [nvarchar](256) NULL,
	[intLinkedCardMediaType] [int] NULL,
	[bitBackout] [bit] NULL,
	[bitJam] [bit] NULL,
	[intPaymentLane] [int] NULL,
	[intHintOldCmd] [int] NULL,
	[intTargetControllerID] [int] NULL,
	[intInvoice] [int] NULL,
	[intStatusEx] [int] NULL,
	[intHash] [bigint] NOT NULL,
	[intActiveAccessLevel] [int] NOT NULL,
	[intModifyReason] [int] NOT NULL,
	[intPassThruLane] [int] NULL,
	[dtPassThruDate] [datetime] NULL,
	[intAlarm] [int] NULL,
	[intHWCardStatusCode] [int] NULL,
	[intSetupTimeZone] [int] NOT NULL,
	[intMaxUsageCount] [int] NULL,
	[intCurrentUsageCount] [int] NULL,
	[bitCheckUsageCount] [bit] NULL,
	[intReUsePeriod] [int] NULL,
	[bitFacilitySynced] [bit] NULL,
	[intUsageTypeModifiers] [int] NULL,
	[intPaymentType] [int] NULL,
	[intDiscountMerchantID] [int] NULL,
	[strDiscountMerchantName] [nvarchar](256) NULL,
	[bitWaitList] [bit] NULL,
	[dtWaitListRequestTime] [datetime] NULL,
	[intSanction] [int] NULL,
	[intLprEntryId] [int] NULL,
	[intLprExitId] [int] NULL,
	[strRate] [nvarchar](4) NULL,
	[intExtendedValidFrom] [int] NULL,
	[intExtendedValidTo] [int] NULL,
	[strExtendedValidityRate] [nvarchar](4) NULL,
	[dtPaidToTime] [datetime] NULL,
	[dtDiscountUsedTime] [datetime] NULL,
	[intDiscountUsedLane] [int] NULL,
	[intPassback] [int] NULL,
	[intCommStatus] [int] NULL,
	[strAssistCardNumber] [nvarchar](256) NULL,
	[intAssistCardMediaType] [int] NULL,
	[intAssistCardFacility] [int] NULL,
	[intLprStatusCode] [int] NULL,
	[intActivityLane] [int] NULL,
	[dtTimeActivity] [datetime] NULL,
	[bIsExternalOveragePayment] [bit] NULL,
	[intOperationNumber] [bigint] NULL,
	[intSubUsageType] [int] NULL,
	[strHashNumber] [nvarchar](2048) NULL,
	[bitTimeZoneViolation] [bit] NOT NULL,
	[strTimeZoneViolationRate] [nvarchar](4) NULL,
	[dtTimeZoneViolationTime] [datetime] NULL,
	[dtTimeZoneViolationPaymentTime] [datetime] NULL,
	[bitNestingViolation] [bit] NOT NULL,
	[strNestingViolationRate] [nvarchar](4) NULL,
	[dtNestingViolationTime] [datetime] NULL,
	[dtNestingViolationPaymentTime] [datetime] NULL,
	[bitTimeDebitOverage] [bit] NULL,
	[strTimeDebitOverageRate] [nvarchar](4) NULL,
	[dtTimeDebitOverageStartTime] [datetime] NULL,
	[dtTimeDebitOveragePaymentTime] [datetime] NULL,
	[intPaymentOption] [int] NULL,
	[strContractNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_lsmCard] PRIMARY KEY CLUSTERED 
(
	[strCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmCardHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmCardHistory](
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[intValid] [int] NOT NULL,
	[intInlot] [int] NOT NULL,
	[bitResync] [bit] NULL,
	[intRawStatus] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[intTimeZone] [int] NOT NULL,
	[intAccessLevel] [int] NOT NULL,
	[dtModified] [datetime] NOT NULL,
	[dtTimeCreation] [datetime] NOT NULL,
	[dtValidFromDate] [datetime] NULL,
	[dtValidToDate] [datetime] NULL,
	[dtTimeEntry] [datetime] NULL,
	[intEntryLane] [int] NULL,
	[dtTimeExit] [datetime] NULL,
	[intExitLane] [int] NULL,
	[dtPaymentDateTime] [datetime] NULL,
	[intMachineNumber] [int] NULL,
	[mAmount] [money] NULL,
	[intUsage] [int] NULL,
	[intDiscount] [int] NULL,
	[intOperator] [int] NULL,
	[intRoomNumber] [int] NULL,
	[intTicketNumber] [int] NULL,
	[strMask] [nvarchar](20) NULL,
	[intCCType] [int] NULL,
	[bitPaid] [bit] NULL,
	[strLinkedCardNumber] [nvarchar](256) NULL,
	[intLinkedCardMediaType] [int] NULL,
	[bitBackout] [bit] NULL,
	[bitJam] [bit] NULL,
	[intPaymentLane] [int] NULL,
	[intHintOldCmd] [int] NULL,
	[intTargetControllerID] [int] NULL,
	[intInvoice] [int] NULL,
	[intStatusEx] [int] NULL,
	[intHash] [bigint] NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intActiveAccessLevel] [int] NOT NULL,
	[intModifyReason] [int] NOT NULL,
	[intPassThruLane] [int] NULL,
	[dtPassThruDate] [datetime] NULL,
	[intAlarm] [int] NULL,
	[intHWCardStatusCode] [int] NULL,
	[intSetupTimeZone] [int] NOT NULL,
	[intMaxUsageCount] [int] NULL,
	[intCurrentUsageCount] [int] NULL,
	[bitCheckUsageCount] [bit] NULL,
	[intReUsePeriod] [int] NULL,
	[bitFacilitySynced] [bit] NULL,
	[intUsageTypeModifiers] [int] NULL,
	[intPaymentType] [int] NULL,
	[intDiscountMerchantID] [int] NULL,
	[strDiscountMerchantName] [nvarchar](256) NULL,
	[bitWaitList] [bit] NULL,
	[dtWaitListRequestTime] [datetime] NULL,
	[intSanction] [int] NULL,
	[intLprEntryId] [int] NULL,
	[intLprExitId] [int] NULL,
	[strRate] [nvarchar](4) NULL,
	[intExtendedValidFrom] [int] NULL,
	[intExtendedValidTo] [int] NULL,
	[strExtendedValidityRate] [nvarchar](4) NULL,
	[dtPaidToTime] [datetime] NULL,
	[dtDiscountUsedTime] [datetime] NULL,
	[intDiscountUsedLane] [int] NULL,
	[intPassback] [int] NULL,
	[intCommStatus] [int] NULL,
	[strAssistCardNumber] [nvarchar](256) NULL,
	[intAssistCardMediaType] [int] NULL,
	[intAssistCardFacility] [int] NULL,
	[intLprStatusCode] [int] NULL,
	[intActivityLane] [int] NULL,
	[dtTimeActivity] [datetime] NULL,
	[bIsExternalOveragePayment] [bit] NULL,
	[intOperationNumber] [bigint] NULL,
	[intSubUsageType] [int] NULL,
	[bitTimeZoneViolation] [bit] NULL,
	[strTimeZoneViolationRate] [nvarchar](4) NULL,
	[dtTimeZoneViolationTime] [datetime] NULL,
	[dtTimeZoneViolationPaymentTime] [datetime] NULL,
	[bitNestingViolation] [bit] NULL,
	[strNestingViolationRate] [nvarchar](4) NULL,
	[dtNestingViolationTime] [datetime] NULL,
	[dtNestingViolationPaymentTime] [datetime] NULL,
	[bitTimeDebitOverage] [bit] NULL,
	[strTimeDebitOverageRate] [nvarchar](4) NULL,
	[dtTimeDebitOverageStartTime] [datetime] NULL,
	[dtTimeDebitOveragePaymentTime] [datetime] NULL,
	[intPaymentOption] [int] NULL,
	[strContractNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_lsmCardHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmCleanupTask]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmCleanupTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[bitEnabled] [bit] NOT NULL,
	[intOperationType] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[intDays] [int] NOT NULL,
	[dtModified] [datetime] NOT NULL,
 CONSTRAINT [PK_lsmCleanupTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmDiscount]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmDiscount](
	[strNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intRate] [int] NOT NULL,
	[dtTimeCreation] [datetime] NOT NULL,
	[dtModified] [datetime] NOT NULL,
	[bitValid] [bit] NOT NULL,
	[intHash] [bigint] NOT NULL,
	[intFacility] [int] NOT NULL,
 CONSTRAINT [PK_lsmDiscount] PRIMARY KEY CLUSTERED 
(
	[strNumber] ASC,
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmDiscountHistory]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmDiscountHistory](
	[strNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intRate] [int] NOT NULL,
	[dtTimeCreation] [datetime] NOT NULL,
	[dtModified] [datetime] NOT NULL,
	[bitValid] [bit] NOT NULL,
	[intHash] [bigint] NOT NULL,
	[intFacility] [int] NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_lsmDiscountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmEbetAddIn]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmEbetAddIn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strMemberCard] [nvarchar](50) NOT NULL,
	[intEntryLane] [int] NULL,
	[dtEntryDate] [datetime] NULL,
	[strBadgeNumber] [nvarchar](50) NULL,
	[dtCardLastUsedEntry] [datetime] NULL,
	[strTierDescEntry] [nvarchar](50) NULL,
	[strP_ID] [nvarchar](50) NULL,
	[bitCarparkStatusEntry] [bit] NULL,
	[strMemberGroupEntry] [nvarchar](50) NULL,
	[intExitLane] [int] NULL,
	[dtExitDate] [datetime] NULL,
	[strTierDescExit] [nvarchar](50) NULL,
	[bitCarparkStatusExit] [bit] NULL,
	[strMemberGroupExit] [nvarchar](50) NULL,
	[dtCardLastUsedExit] [datetime] NULL,
	[intPtsEarnedEGM] [int] NULL,
	[intPtsEarnedPOS] [int] NULL,
	[intPtsSpentPOS] [int] NULL,
	[intDiscountNumber] [int] NULL,
	[bitDiscountByPoints] [bit] NULL,
 CONSTRAINT [PK_lsmEbetAddIn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmExcludedTr]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmExcludedTr](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intControllerID] [int] NOT NULL,
	[intProtocol] [int] NOT NULL,
	[intBoardID] [int] NOT NULL,
	[intTrType] [int] NOT NULL,
	[intDirection] [int] NOT NULL,
	[intSystemPassback] [int] NOT NULL,
	[intCurrentPassBack] [int] NOT NULL,
	[dtHWReceiveTime] [datetime] NOT NULL,
	[strBoardName] [nvarchar](100) NOT NULL,
	[strIP] [nvarchar](100) NOT NULL,
	[strLocationName] [nvarchar](100) NOT NULL,
	[bProcess] [bit] NOT NULL,
	[strTransaction] [nvarchar](max) NOT NULL,
	[intMainLotNumber] [int] NOT NULL,
	[intVerifyFailedCode] [int] NOT NULL,
	[intCryptID] [int] NOT NULL,
	[intStatus] [int] NULL,
	[dtModifyDate] [datetime] NULL,
	[intControllerLotNumber] [int] NOT NULL,
 CONSTRAINT [PK_lsmExcludedTr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmLPRconfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmLPRconfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLprProvider] [int] NOT NULL,
	[intGateId] [int] NOT NULL,
	[strLprName] [nvarchar](50) NULL,
	[strLprGuid] [nvarchar](50) NULL,
	[intLprId] [int] NULL,
	[strLprIP] [nvarchar](50) NULL,
	[intLprPort] [int] NULL,
	[intLprTimeout] [int] NULL,
	[bitLprDisabled] [bit] NULL,
	[strUsername] [nvarchar](50) NULL,
	[strPassword] [nvarchar](500) NULL,
 CONSTRAINT [PK_lsmLPRconfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmLPRdata]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmLPRdata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLane] [int] NOT NULL,
	[intTransaction] [int] NOT NULL,
	[intStatus] [int] NOT NULL,
	[strLicensePlateNumber] [nvarchar](32) NOT NULL,
	[dtLicenseDate] [datetime] NOT NULL,
	[strPictureFile] [nvarchar](260) NULL,
	[intPictureType] [int] NOT NULL,
	[intOperationNumber] [int] NULL,
	[intConfidence] [int] NULL,
	[intLprStatus] [int] NULL,
 CONSTRAINT [PK_lsmLPRdata] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmLPRpicture]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmLPRpicture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intStatus] [int] NOT NULL,
	[strLicensePlateNumber] [nvarchar](32) NOT NULL,
	[intLicenseId] [int] NOT NULL,
	[dtLicenseDate] [datetime] NOT NULL,
	[strFile] [nvarchar](260) NULL,
	[intLane] [int] NOT NULL,
 CONSTRAINT [PK_lsmLPRpicture_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmLPRStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmLPRStatusDesc](
	[intStatus] [int] NOT NULL,
	[strDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_lsmLPRStatusDesc] PRIMARY KEY CLUSTERED 
(
	[intStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmNesting]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmNesting](
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intStatus] [int] NOT NULL,
 CONSTRAINT [PK_lsmNesting] PRIMARY KEY CLUSTERED 
(
	[strCardNumber] ASC,
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lsmTempTr]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lsmTempTr](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intControllerID] [int] NOT NULL,
	[intProtocol] [int] NOT NULL,
	[intBoardID] [int] NOT NULL,
	[intTrType] [int] NOT NULL,
	[intDirection] [int] NOT NULL,
	[intSystemPassback] [int] NOT NULL,
	[intCurrentPassBack] [int] NOT NULL,
	[dtHWReceiveTime] [datetime] NOT NULL,
	[strBoardName] [nvarchar](100) NOT NULL,
	[strIP] [nvarchar](100) NOT NULL,
	[strLocationName] [nvarchar](100) NOT NULL,
	[bProcess] [bit] NOT NULL,
	[strTransaction] [nvarchar](2048) NOT NULL,
	[intMainLotNumber] [int] NOT NULL,
	[intControllerLotNumber] [int] NOT NULL,
 CONSTRAINT [PK_lsmTempTr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MerchantAccount]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](50) NULL,
	[MerchantID] [varchar](50) NULL,
	[TerminalID] [varchar](50) NULL,
	[CurrentBatch] [char](10) NULL,
 CONSTRAINT [MerchantAccount_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MerchantConfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Type] [int] NULL,
	[Value] [varchar](150) NULL,
 CONSTRAINT [MerchantConfig_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessagesLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessagesLog](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[When] [datetime] NULL,
	[ShortMessage] [varchar](100) NULL,
	[LongMessage] [text] NULL,
	[Flag] [smallint] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [MessagesLog_RecNo_pk] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgAlarms]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgAlarms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NOT NULL,
	[BoardNumber] [int] NOT NULL,
	[ExpireDateTime] [datetime] NOT NULL,
	[MessageType] [int] NOT NULL,
	[MessageAlarmStatus] [int] NOT NULL,
	[AlarmPriority] [int] NOT NULL,
	[UpdateDateTime] [datetime] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[UserRights] [tinyint] NOT NULL,
	[MarkForClear] [bit] NOT NULL,
	[ComputerID] [int] NULL,
 CONSTRAINT [PK_msgAlarms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgAlarmTurnState]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgAlarmTurnState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlarmTurnStateDefId] [int] NOT NULL,
	[MessageId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[DPUniqueKey] [int] NOT NULL,
 CONSTRAINT [PK_msgAlarmTurnState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgAlarmTurnStateDef]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgAlarmTurnStateDef](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_msgAlarmTurnStateDef] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgComputer]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgComputer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
	[DPPath] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[SQLServerInstance] [nvarchar](100) NULL,
	[Type] [int] NULL,
	[LogID] [int] NULL,
 CONSTRAINT [PK_msgComputer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgComputerBoards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgComputerBoards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ComputerID] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[BoardName] [nvarchar](255) NOT NULL,
	[BoardNumber] [int] NOT NULL,
	[BoardDirection] [int] NOT NULL,
	[BoardType] [int] NOT NULL,
	[BoardTerminal1] [int] NOT NULL,
	[iAreaID] [int] NULL,
	[strAreaDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_msgComputerBoards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgComputerConfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgComputerConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigId] [int] NOT NULL,
	[ComputerId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_msgComputerConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgConfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](256) NULL,
	[DPConfig] [bit] NOT NULL,
	[IsFilled] [bit] NOT NULL,
	[intLangCode] [int] NULL,
 CONSTRAINT [PK_msgConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgDeviceIndicator]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgDeviceIndicator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardNumber] [int] NOT NULL,
	[IndicatorState] [int] NOT NULL,
	[UpdateDateTime] [datetime] NOT NULL,
	[ComputerID] [int] NULL,
 CONSTRAINT [PK_msgAlarmDeviceIndicator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgDynamicDeviceStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgDynamicDeviceStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoardNumber] [int] NOT NULL,
	[BarrierStatus] [int] NOT NULL,
	[LoopArmingStatusA] [int] NOT NULL,
	[LoopStatusB] [int] NOT NULL,
	[LoopClosingStatusC] [int] NOT NULL,
	[TrafficLightStatus] [int] NOT NULL,
	[iIsDoorOpened] [int] NULL,
	[iIsInService] [int] NULL,
 CONSTRAINT [PK_msgDynamicDeviceStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgDynamicDeviceStatusDef]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgDynamicDeviceStatusDef](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strName] [nvarchar](256) NOT NULL,
	[intStatusType] [int] NOT NULL,
	[intStatusSubCode] [int] NOT NULL,
 CONSTRAINT [PK_msgDynamicDeviceStatusDef] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgDynamicDeviceStatusPattern]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgDynamicDeviceStatusPattern](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intDynamicDeviceStatusTurnStateId] [int] NOT NULL,
	[intTrType] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[FieldValue] [nvarchar](10) NOT NULL,
	[FieldValueType] [nvarchar](10) NOT NULL,
	[Equal] [bit] NOT NULL,
	[Big] [bit] NOT NULL,
	[Small] [bit] NOT NULL,
 CONSTRAINT [PK_msgDynamicDeviceStatusPattern] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgDynamicDeviceStatusTurnState]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgDynamicDeviceStatusTurnState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intDynamicDeviceStatusDefId] [int] NOT NULL,
	[intTurnState] [int] NOT NULL,
 CONSTRAINT [PK_msgDynamicDeviceStatusTurnState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgExecute]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgExecute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](50) NOT NULL,
	[Command] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Mode] [int] NOT NULL,
 CONSTRAINT [PK_msgExecute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgFileReaderInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgFileReaderInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FileType] [int] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FilePos] [bigint] NOT NULL,
	[ConfigID] [int] NOT NULL,
 CONSTRAINT [PK_msgFileReaderInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MsgTransaction] [nvarchar](256) NOT NULL,
	[Message] [nvarchar](256) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[AlarmStatus] [int] NULL,
	[Mode] [int] NOT NULL,
	[Priority] [int] NULL,
	[OpName] [nvarchar](50) NULL,
	[dtCleared] [datetime] NULL,
	[Color] [nvarchar](50) NULL,
	[ConfigId] [int] NOT NULL,
	[dtSystemDateTime] [datetime] NULL,
	[ComputerID] [int] NULL,
	[DPUniqueKey] [int] NULL,
	[OriginalLogID] [int] NULL,
	[OperationNumber] [int] NULL,
	[strMessageText] [nvarchar](max) NULL,
	[iBoardNumber] [int] NULL,
	[intJanusUniqueKey] [int] NULL,
 CONSTRAINT [PK_msgLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgLogAlarm]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgLogAlarm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogId] [int] NOT NULL,
	[LogTimeOutId] [int] NOT NULL,
 CONSTRAINT [PK_msgLogTimeOut] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgLogClearAlarm]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgLogClearAlarm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlarmClearMsgID] [int] NOT NULL,
	[AlarmOrTimeoutID] [int] NOT NULL,
 CONSTRAINT [PK_msgLogClearAlarm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgLogExecute]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgLogExecute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogId] [int] NOT NULL,
	[ExecuteId] [int] NOT NULL,
 CONSTRAINT [PK_msgLogExecute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgLogState]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgLogState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogId] [int] NOT NULL,
	[AlarmTurnStateDefId] [int] NOT NULL,
	[StateStatus] [int] NOT NULL,
 CONSTRAINT [PK_msgLogState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgMessage]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageText] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Media] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[ConfigId] [int] NOT NULL,
	[DPUniqueKey] [int] NULL,
	[EditOperation] [int] NOT NULL,
	[ExportFlag] [int] NOT NULL,
	[intJanusUniqueKey] [int] NULL,
 CONSTRAINT [msgMessage_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgMessageExecute]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgMessageExecute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NOT NULL,
	[ExecuteId] [int] NOT NULL,
 CONSTRAINT [PK_msgMessageExecute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgStateIndicator]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgStateIndicator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[BoardNumber] [int] NOT NULL,
	[IndicatorState] [int] NOT NULL,
	[UpdateDateTime] [datetime] NOT NULL,
	[ComputerID] [int] NULL,
 CONSTRAINT [PK_msgStateIndicator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgSystemWord]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgSystemWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[intSysType] [int] NULL,
 CONSTRAINT [PK_msgSystemWord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgSystemWordLang]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgSystemWordLang](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intSystemWordValueID] [bigint] NOT NULL,
	[intLangCode] [int] NOT NULL,
	[strText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_msgSystemWordLang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgSystemWordValue]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgSystemWordValue](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intSysWordID] [int] NOT NULL,
	[strFieldName] [nvarchar](50) NOT NULL,
	[strValue] [nvarchar](50) NOT NULL,
	[strValueMeaningText] [nvarchar](50) NULL,
	[strValueType] [nvarchar](50) NOT NULL,
	[intDPValueType] [int] NOT NULL,
 CONSTRAINT [PK_msgSystemWordValue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msgTrPattern]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgTrPattern](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrType] [int] NOT NULL,
	[MessageId] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [varchar](10) NOT NULL,
	[ValueType] [varchar](10) NOT NULL,
	[Equal] [bit] NULL,
	[Big] [bit] NULL,
	[Small] [bit] NULL,
	[TrFieldPriority] [int] NULL,
	[DPUniqueKey] [int] NULL,
	[intJanusUniqueKey] [int] NULL,
 CONSTRAINT [msgTrPattern_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oBatch]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oBatch](
	[Merchant] [varchar](2) NULL,
	[IsOpen] [smallint] NOT NULL,
	[Batch] [varchar](10) NULL,
	[Sequence] [varchar](255) NULL,
	[Status] [varchar](1) NULL,
	[Account] [varchar](255) NULL,
	[Expiration] [varchar](4) NULL,
	[Amount] [varchar](11) NULL,
	[Authorization] [varchar](6) NULL,
	[Reference] [varchar](16) NULL,
	[Date] [varchar](6) NULL,
	[Time] [varchar](6) NULL,
	[Memo] [varchar](20) NULL,
	[Response] [text] NULL,
	[FeeID] [int] NULL,
	[ReferenceExt] [varchar](10) NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[MerchantID] [int] NOT NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intCWID] [bigint] NOT NULL,
	[intCommand] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[dtTrDate] [datetime] NULL,
 CONSTRAINT [PK_oBatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oBatches]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oBatches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Opened] [datetime] NULL,
	[Closed] [datetime] NULL,
	[Transactions] [int] NULL,
	[Amount] [decimal](19, 4) NULL,
	[Cleared] [bit] NULL,
	[MerchantID] [int] NOT NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_oBatches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oBlackList]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oBlackList](
	[Account] [varchar](255) NOT NULL,
	[DateWhenAdded] [datetime] NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intType] [int] NULL,
	[strReason] [nvarchar](1024) NULL,
	[dtExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_oBlackList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oCreditInlot]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oCreditInlot](
	[Account] [varchar](255) NULL,
	[EntryTime] [datetime] NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[dtExpDate] [datetime] NULL,
 CONSTRAINT [PK_oCreditInLot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oPendingTransactions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oPendingTransactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Options] [int] NULL,
	[Account] [varchar](255) NULL,
	[CreditCardType] [varchar](10) NULL,
	[ExpirationDate] [varchar](4) NULL,
	[CreditTrTime] [datetime] NULL,
	[LaneNumber] [int] NULL,
	[Amount] [decimal](19, 4) NULL,
	[InvoiceNumber] [int] NULL,
	[FeeID] [int] NULL,
	[Retries] [int] NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[intLocationID] [int] NOT NULL,
	[intCWID] [bigint] NOT NULL,
	[intInnerCommand] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
 CONSTRAINT [PK_oPendingTransactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oRejectedLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oRejectedLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NULL,
	[CreditCardType] [varchar](10) NULL,
	[ExpirationDate] [varchar](4) NULL,
	[ReasonCode] [int] NULL,
	[CreditTrTime] [datetime] NULL,
	[LaneNumber] [int] NULL,
	[Amount] [decimal](19, 4) NULL,
	[InvoiceNumber] [int] NULL,
	[RechargeTime] [datetime] NULL,
	[Response] [varchar](1024) NULL,
	[Account] [varchar](255) NULL,
	[FeeID] [int] NULL,
	[Request] [varchar](1) NULL,
	[Status] [int] NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[MerchantID] [int] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intCWID] [bigint] NOT NULL,
	[intCommand] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
 CONSTRAINT [PK_oRejectedLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oRejectionReasons]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oRejectionReasons](
	[ReasonCode] [int] NULL,
	[Description] [varchar](100) NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_oRejectionReasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oScheduledRecharges]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oScheduledRecharges](
	[Account] [varchar](255) NOT NULL,
	[ExpDate] [varchar](4) NOT NULL,
	[Amount] [decimal](19, 4) NOT NULL,
	[Invoice] [int] NOT NULL,
	[Lane] [int] NOT NULL,
	[FeeID] [int] NOT NULL,
	[SchedID] [int] NOT NULL,
	[LastOp] [datetime] NOT NULL,
	[NextOp] [datetime] NOT NULL,
	[Attempt] [int] NOT NULL,
	[CCType] [int] NULL,
	[CryptID] [int] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intCWID] [bigint] NOT NULL,
	[intInnerCommand] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
 CONSTRAINT [PK_oScheduledRecharges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[RecNo] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Account Number] [nvarchar](50) NULL,
	[Card Number] [nvarchar](256) NULL,
	[Due Date] [datetime] NULL,
	[Payment Date] [datetime] NULL,
	[Amount] [money] NULL,
	[Payment Method] [nvarchar](8) NULL,
	[Check/Card Number] [nvarchar](128) NULL,
	[Card Type] [nvarchar](16) NULL,
	[Payer] [nvarchar](32) NULL,
	[Notes] [nvarchar](32) NULL,
	[Batch Number] [float] NULL,
	[Billing Period] [float] NULL,
	[CryptID] [int] NULL,
	[CardType] [tinyint] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Rate] [int] NULL,
	[RefInvNo] [int] NULL,
	[intLocationID] [int] NOT NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intBoardNumber] [int] NULL,
	[intMediaType] [int] NULL,
	[intFacility] [int] NULL,
	[intTaxType] [tinyint] NULL,
	[mnTax] [money] NULL,
	[intReceiptNumber] [bigint] NULL,
	[intOperationNumber] [bigint] NULL,
	[mnSurcharge] [money] NULL,
	[intInvRowNo] [bigint] NULL,
	[strContractNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Key] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [Provider_PK] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderConfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderConfig](
	[Key] [varchar](50) NOT NULL,
	[Param] [varchar](50) NOT NULL,
	[Type] [int] NULL,
	[Value] [varchar](150) NULL,
 CONSTRAINT [ProviderConfig_PK] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repFirminfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repFirminfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strName] [nvarchar](255) NULL,
	[strAddress] [nvarchar](255) NULL,
	[bset] [bit] NULL,
	[dtDayChTime] [smalldatetime] NULL,
	[intCurrMerchantID] [int] NOT NULL,
 CONSTRAINT [PK_firm_info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repLanes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repLanes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[intLane] [int] NOT NULL,
	[strLaneName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Lanes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replArticles]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replArticles](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strArticleName] [nvarchar](100) NOT NULL,
	[intReplInsert] [bit] NOT NULL,
	[intReplUpdate] [bit] NOT NULL,
	[intReplDelete] [bit] NOT NULL,
	[strType] [nvarchar](256) NULL,
	[strOptions] [nvarchar](256) NULL,
 CONSTRAINT [PK_replArticles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reptmpLanes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reptmpLanes](
	[strLaneNumbers] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tmpLanes] PRIMARY KEY CLUSTERED 
(
	[strLaneNumbers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sqlsrv_MessageDialogs]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sqlsrv_MessageDialogs](
	[DBID] [int] NOT NULL,
	[intDialogID] [uniqueidentifier] NOT NULL,
	[strDialogClient] [nvarchar](50) NULL,
	[intResetCount] [int] NOT NULL,
	[intPendingMessageCount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sqlsrv_MessageErrors]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sqlsrv_MessageErrors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strErrorProcedure] [nvarchar](256) NULL,
	[intErrorLine] [int] NULL,
	[intErrorNumber] [int] NULL,
	[strErrorMessage] [nvarchar](256) NULL,
	[intErrorSeverity] [int] NULL,
	[intErrorState] [int] NULL,
	[xmlAuditedData] [xml] NULL,
	[dtErrorDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sqlsrv_MessageLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sqlsrv_MessageLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strSourceDB] [nvarchar](255) NOT NULL,
	[strSourceTable] [nvarchar](255) NOT NULL,
	[strTargetTable] [nvarchar](255) NOT NULL,
	[strUserID] [nvarchar](255) NOT NULL,
	[strDMLType] [nvarchar](50) NOT NULL,
	[xmlMessageData] [xml] NULL,
	[dtLogDate] [datetime] NOT NULL,
	[strLogSource] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatementTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatementTemp](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Type] [smallint] NULL,
	[Reference] [varchar](50) NULL,
	[Amount] [money] NULL,
	[Accum] [float] NULL,
	[FromDate] [smalldatetime] NULL,
	[ToDate] [smalldatetime] NULL,
 CONSTRAINT [PK_StatementTemp] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatementTemp2]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatementTemp2](
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Type] [smallint] NULL,
	[Reference] [varchar](20) NULL,
	[Amount] [money] NULL,
	[Accum] [float] NULL,
 CONSTRAINT [PK_StatementTemp2] PRIMARY KEY CLUSTERED 
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stays]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stays](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateAdded] [datetime] NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NOT NULL,
	[CardType] [tinyint] NOT NULL,
	[EntryTime] [datetime] NULL,
	[EntryLane] [int] NULL,
	[EntryTrID] [int] NULL,
	[ExitTime] [datetime] NULL,
	[ExitLane] [int] NULL,
	[ExitTrID] [int] NULL,
	[Rate] [nvarchar](2) NULL,
	[Amount] [money] NULL,
	[InvNo] [int] NULL,
	[PaymentId] [int] NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_Stays] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDiscountCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDiscountCards](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intCardNumber] [int] NOT NULL,
	[strFirstName] [nvarchar](50) NULL,
	[strLastName] [nvarchar](50) NULL,
	[strGroup] [nvarchar](50) NULL,
	[strAddress] [nvarchar](250) NULL,
	[strCity] [nvarchar](50) NULL,
	[strState] [nvarchar](50) NULL,
	[intZip] [int] NULL,
	[strPhone] [nvarchar](200) NULL,
	[strEmail] [nvarchar](50) NULL,
	[strMakeOfCar] [nvarchar](50) NULL,
	[strColourOfCar] [nvarchar](50) NULL,
	[strLicPlate] [nvarchar](50) NULL,
	[dtDateWhenAdded] [datetime] NOT NULL,
	[dtLastModified] [datetime] NOT NULL,
	[intIsActive] [int] NOT NULL,
	[intModify] [int] NULL,
 CONSTRAINT [PK_StudentDiscountCards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysCrypt]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysCrypt](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intCryptID] [bigint] NOT NULL,
	[intVersion] [bigint] NOT NULL,
	[strSerial] [nvarchar](2048) NOT NULL,
	[strLicenseSerial] [nvarchar](2048) NOT NULL,
	[strData] [nvarchar](2048) NOT NULL,
	[dtLicenseCreation] [datetime] NULL,
	[dtKeyCreation] [datetime] NULL,
	[strGarageSalt] [nvarchar](2048) NULL,
 CONSTRAINT [PK_sysCrypt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlConvertWizardLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlConvertWizardLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strTableName] [nvarchar](255) NOT NULL,
	[intType] [int] NOT NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intPassCnt] [int] NOT NULL,
	[strNotes] [nvarchar](255) NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strSource] [nvarchar](255) NULL,
	[intLocalRemote] [int] NULL,
	[strToolVersion] [nvarchar](50) NULL,
 CONSTRAINT [PK_tlConvertWizardLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlViolationTicketsInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlViolationTicketsInfo](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[intEntryLane] [int] NULL,
	[intTicketNumber] [int] NULL,
	[dtTimeEntry] [datetime] NULL,
	[strLimit] [nvarchar](255) NULL,
	[strStatus] [nvarchar](255) NULL,
	[dtModifyDate] [datetime] NULL,
	[strModifyReason] [nvarchar](255) NULL,
	[strModifyOperator] [nvarchar](255) NULL,
 CONSTRAINT [PK_bilaViolationTicketsInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransferBoardsStatus]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferBoardsStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[IsTransfered] [tinyint] NOT NULL,
	[dtLastTransferDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferBoardsStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trBarCode]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trBarCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strTrType] [nvarchar](1) NULL,
	[strTrStatus] [nvarchar](1) NULL,
	[dtTrDate] [datetime] NULL,
	[intAccount] [int] NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intOpCardNum] [int] NULL,
	[strMNROOMNUMBER] [nvarchar](6) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strValetExitIndex] [nvarchar](4) NOT NULL,
	[intNonResCount] [bigint] NULL,
	[intOperationNumber] [int] NULL,
	[strRateKey] [nvarchar](2) NULL,
	[bGeneratedByTrigger] [bit] NULL,
 CONSTRAINT [PK_BarCodeTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strCardType] [nvarchar](1) NULL,
	[dtTrDate] [datetime] NULL,
	[intFacilityCode] [int] NULL,
	[intCardNumber] [int] NULL,
	[intOpNumber] [int] NULL,
	[strAccount] [nvarchar](20) NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intLaneID] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intNonResCount] [bigint] NULL,
	[intMediaType] [int] NULL,
	[intUsageType] [int] NULL,
	[intOperationNumber] [int] NULL,
	[bGeneratedByTrigger] [bit] NULL,
 CONSTRAINT [PK_CardTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trCreditCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trCreditCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strTrIdent] [nvarchar](6) NULL,
	[dtTrDate] [datetime] NULL,
	[intFlags] [int] NULL,
	[mnAmount] [money] NOT NULL,
	[intInvoiceNumber] [int] NULL,
	[strAccount] [nvarchar](255) NULL,
	[strExpDate] [nvarchar](10) NULL,
	[intCryptID] [int] NULL,
	[intCardType] [int] NULL,
	[intCreditTrID] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strHash] [nvarchar](255) NULL,
	[strMask] [nvarchar](50) NULL,
	[intPaymentMachineNumber] [int] NULL,
	[intInvoiceNumberForRefund] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_CreditCards] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trCreditMessage]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trCreditMessage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intCreditTrID] [int] NOT NULL,
	[intInvoiceNumber] [int] NOT NULL,
	[intCreditMessageNumber] [int] NOT NULL,
	[intCreditMessageType] [int] NOT NULL,
	[strCreditCardReaderDeviceID] [nvarchar](50) NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trCreditMessage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trCreditNotification]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trCreditNotification](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intCreditTrID] [int] NOT NULL,
	[intInvoiceNumber] [int] NOT NULL,
	[strCardSuffix] [nvarchar](50) NOT NULL,
	[intDPResponseCode] [int] NOT NULL,
	[strCardKeyNumber] [nvarchar](50) NOT NULL,
	[strStanIndexNumber] [bigint] NULL,
	[dtSettlementDate] [datetime] NULL,
	[strAuthorisationCode] [nvarchar](50) NULL,
	[strCardHolderName] [nvarchar](50) NULL,
	[intCreditNotificationType] [int] NOT NULL,
	[strCardType] [nvarchar](20) NULL,
	[strAuthTxnRef] [nvarchar](50) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strHostResponseCode] [nvarchar](10) NOT NULL,
	[intOperationNumber] [int] NULL,
	[mnSurchargeAmount] [money] NULL,
	[strChdToken] [nvarchar](128) NULL,
	[strHubInvoice] [nvarchar](64) NULL,
	[strSpecificErrorCode] [nvarchar](64) NULL,
	[strSpecificErrorDescription] [nvarchar](256) NULL,
	[strTerminalID] [nvarchar](64) NULL,
 CONSTRAINT [PK_trCreditNotification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDebit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDebit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[strType] [nvarchar](1) NOT NULL,
	[dtTrDate] [datetime] NULL,
	[intTrNumber] [int] NULL,
	[intReferenceNumber] [int] NULL,
	[strCardNum] [nvarchar](50) NULL,
	[strMediaType] [nvarchar](1) NULL,
	[intFacilityCode] [int] NULL,
	[dtEntryDate] [datetime] NULL,
	[dtPaymentDate] [datetime] NULL,
	[intInvNumber] [int] NULL,
	[mnAmount] [money] NULL,
	[strPaymentType] [nvarchar](1) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intBoardType] [int] NULL,
	[intWebRespCode] [int] NULL,
	[intDevRejCode] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trDebit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDiscounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDiscounts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intInvoiceNumber] [int] NOT NULL,
	[intDiscountNumber] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strOperation] [nvarchar](1) NOT NULL,
	[intTrNumber] [bigint] NOT NULL,
	[mnDiscountAmount] [money] NOT NULL,
	[intDSCNTVersion] [int] NULL,
	[intDSCNTFacilityCode] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trDiscounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDPFee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[intTrNum] [int] NULL,
	[intOpNum] [int] NULL,
	[dtEntryDate] [datetime] NULL,
	[dtExitDate] [datetime] NULL,
	[strRateKey] [nvarchar](2) NULL,
	[mnAmount] [money] NOT NULL,
	[intDK1] [int] NULL,
	[intNC1] [int] NULL,
	[mnDA1] [money] NOT NULL,
	[intDK2] [int] NULL,
	[intNC2] [int] NULL,
	[mnDA2] [money] NOT NULL,
	[intTickDispenser] [int] NULL,
	[intTickNumber] [int] NULL,
	[intTrMode] [int] NULL,
	[intTrType] [int] NULL,
	[intCreditTrID] [int] NULL,
	[intTypeTax] [int] NULL,
	[mnFeeTax] [money] NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[mnTotal] [money] NULL,
	[intFacilityCode] [int] NULL,
	[strCardNum] [nvarchar](128) NULL,
	[intMediaType] [int] NULL,
	[strOperatorCardNumber] [nvarchar](128) NULL,
	[intOperatorCardFacilityCode] [int] NULL,
	[intOperatorCardMediaType] [int] NULL,
	[intRefundVoucherFacilityCode] [int] NULL,
	[strRefundVoucherCardNumber] [nvarchar](128) NULL,
	[intRefundVoucherMediaType] [int] NULL,
	[intReceiptNumber] [bigint] NULL,
	[dtLastModifyDate] [datetime] NULL,
	[dtPaidToTime] [datetime] NULL,
	[mnCCMinAdditiveTax] [money] NULL,
	[mnCCMinAdditiveAmount] [money] NULL,
	[intOperationNumber] [int] NULL,
	[mnSurchargeAmount] [money] NULL,
	[intAreaID] [int] NULL,
	[mnChangeNotGivenAmount] [money] NULL,
	[strPaymentCardNumber] [nvarchar](256) NULL,
	[intPaymentCardFacility] [int] NULL,
	[intPaymentCardMediaType] [int] NULL,
	[strReceiptNumberString] [nvarchar](256) NULL,
 CONSTRAINT [PK_DPFeeTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trDPFeeInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trDPFeeInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intFeeId] [int] NULL,
	[strDiscNum1] [nvarchar](7) NULL,
	[strDiscNum2] [nvarchar](7) NULL,
	[strDiscNum3] [nvarchar](7) NULL,
	[strState] [nvarchar](2) NULL,
	[strLicensePlate] [nvarchar](5) NULL,
	[strMode] [nvarchar](1) NULL,
	[strType] [nvarchar](1) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_DPFeeInfo] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trEncoder]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trEncoder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strType] [nvarchar](1) NULL,
	[dtTrDate] [datetime] NULL,
	[intCardNum] [int] NULL,
	[intLot] [int] NULL,
	[intDiscountNum] [int] NULL,
	[intOperator] [int] NULL,
	[intNoCoupons] [int] NULL,
	[intReusingPeriod] [int] NULL,
	[dtEndDate] [datetime] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
	[strData] [nvarchar](50) NULL,
 CONSTRAINT [PK_Encoder] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trError]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trError](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[intErrorType] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_ErrorTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trEvent]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[intNormalEvent] [int] NULL,
	[intEventCode] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intNonResCount] [bigint] NULL,
	[intOperationNumber] [int] NULL,
	[bGeneratedByTrigger] [bit] NULL,
 CONSTRAINT [PK_EventTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trFeeAmano]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trFeeAmano](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[intTrNum] [int] NULL,
	[intOperator] [int] NULL,
	[dtEntryDate] [datetime] NULL,
	[dtTrDate] [datetime] NULL,
	[strRate] [nvarchar](2) NULL,
	[mnAmount] [money] NOT NULL,
	[intDiscount] [int] NULL,
	[mnDiscountAmt] [money] NOT NULL,
	[mnShortMoney] [money] NOT NULL,
	[intMode] [int] NULL,
	[intType] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationId] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_FeeAmano] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trFPPCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trFPPCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intFlags] [int] NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intInvoiceNumber] [int] NOT NULL,
	[strCardNumber] [nvarchar](16) NOT NULL,
	[strExpDate] [nvarchar](4) NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NOT NULL,
	[intOperationNumber] [int] NULL,
	[intFacilityCode] [int] NULL,
	[intMediaType] [int] NULL,
 CONSTRAINT [PK_trFPPCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trHotel]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trHotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strTrType] [nvarchar](1) NULL,
	[dtTrDate] [datetime] NULL,
	[intRoom] [int] NULL,
	[intEncodedTick] [int] NULL,
	[intMN] [int] NULL,
	[intFacilityCode] [int] NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[strHotelOpNumber] [nvarchar](4) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intNonResCount] [bigint] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_HotelTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[strText] [nvarchar](2048) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trLogOnOff]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trLogOnOff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[intOnOff] [int] NULL,
	[intOpNumber] [int] NULL,
	[dtDate1] [datetime] NULL,
	[dtDate2] [datetime] NULL,
	[intSign] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_LogOnOffTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trLPR]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trLPR](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[intOperator] [int] NOT NULL,
	[intSupervisor] [int] NOT NULL,
	[intTrNumber] [int] NOT NULL,
	[intInvNumber] [int] NOT NULL,
	[dtEntryDate] [datetime] NULL,
	[dtLPIDate] [datetime] NULL,
	[strLPINumber] [nvarchar](32) NOT NULL,
	[mnAmount] [money] NOT NULL,
	[intTrType] [int] NOT NULL,
	[intTrMode] [int] NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trLPR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trMonthPayment]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trMonthPayment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[intTrNumber] [int] NULL,
	[intOperator] [int] NULL,
	[dtDate1] [datetime] NULL,
	[dtDate2] [datetime] NULL,
	[mnAmount] [money] NOT NULL,
	[intCardNum] [int] NULL,
	[strAccount] [nvarchar](9) NULL,
	[intCode1] [int] NULL,
	[intFlags] [int] NULL,
	[intType] [int] NULL,
	[intCreditTrID] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[intOperationNumber] [int] NULL,
	[intReceiptNumber] [bigint] NULL,
	[strReceiptNumberString] [nvarchar](256) NULL,
 CONSTRAINT [PK_MonthPayment] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnCardPass]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnCardPass](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strCardNum] [nvarchar](128) NOT NULL,
	[intFacilityCode] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[intCardStatusCode] [int] NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strLPRNumber] [nvarchar](20) NULL,
	[dtLPRDate] [datetime] NULL,
	[ulLPRID] [numeric](18, 0) NULL,
	[strLPRFilePath] [nvarchar](260) NULL,
	[intCommunicationStatus] [int] NULL,
	[strAssistCardNumber] [nvarchar](128) NULL,
	[intAssistCardMediaType] [int] NULL,
	[intAssistCardFacilityCode] [int] NULL,
	[intOperationNumber] [int] NULL,
	[intLPRStatusCode] [int] NULL,
	[strRateKey] [nvarchar](10) NULL,
	[strAccount] [nvarchar](256) NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intOperatorNumber] [int] NULL,
	[mnCardAmount] [money] NULL,
	[intCardUsageCount] [int] NULL,
	[strValetExitIndex] [nvarchar](16) NULL,
	[intRoomNumber] [int] NULL,
 CONSTRAINT [PK_trnCardPass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnCardQuery]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnCardQuery](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NOT NULL,
	[strCardNum] [nvarchar](128) NOT NULL,
	[intFacilityCode] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intQueryReason] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[dtSearchStartDate] [datetime] NULL,
	[dtSearchEndDate] [datetime] NULL,
	[intOperationNumber] [int] NULL,
	[ulRequestedDataFields] [numeric](18, 0) NULL,
	[intAreaID] [int] NULL,
	[ulCardQuerySerialNumber] [decimal](18, 0) NULL,
	[intPaymentStatus] [int] NULL,
 CONSTRAINT [PK_trnCardQuery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnLPRequest]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnLPRequest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[ulLPRSerialNumber] [numeric](18, 0) NOT NULL,
	[ulLPRCommand] [numeric](18, 0) NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trnLPRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnReceiptInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnReceiptInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NOT NULL,
	[intBoardType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[dtHWReceiveDate] [datetime] NOT NULL,
	[intOperationNumber] [bigint] NOT NULL,
	[strUniversallyUniqueIdentifier] [nvarchar](512) NULL,
	[strAccessNumber] [nvarchar](512) NULL,
	[strBusinessNumber] [nvarchar](512) NULL,
	[strBusinessName] [nvarchar](512) NULL,
	[strBuyersNumber] [nvarchar](512) NULL,
	[strBuyersName] [nvarchar](512) NULL,
	[dtSystemDate] [datetime] NULL,
	[strFiscalPrinterNumber] [nvarchar](512) NULL,
 CONSTRAINT [PK_trnReceiptInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trPoint]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strType] [nvarchar](10) NULL,
	[dtTrDate] [datetime] NULL,
	[intTrNumber] [int] NULL,
	[strCardNum] [nvarchar](20) NULL,
	[dtEntryDate] [datetime] NULL,
	[dtPaymentDate] [datetime] NULL,
	[intInvNumber] [int] NULL,
	[mnAmount] [money] NULL,
	[strAltPayment] [nvarchar](10) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[strMemberID] [nvarchar](12) NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_trPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trSmartCard]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trSmartCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[dtTrDate] [datetime] NULL,
	[intTrNum] [int] NULL,
	[strCardNum] [nvarchar](20) NULL,
	[mnPreviousAmount] [money] NOT NULL,
	[mnTakenAmount] [money] NOT NULL,
	[mnNewAmount] [money] NOT NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
	[strSmartCardType] [nvarchar](128) NULL,
	[intSmartCardStatus] [int] NULL,
 CONSTRAINT [PK_SmartCard] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trTicket]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trTicket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strTickType] [nvarchar](1) NULL,
	[dtTrDate] [datetime] NULL,
	[intTickDispNum] [int] NULL,
	[intTickNumber] [int] NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intNonResCount] [bigint] NULL,
	[strRateKey] [nvarchar](10) NULL,
	[dtEntryDate] [datetime] NULL,
	[intOperationNumber] [int] NULL,
	[bGeneratedByTrigger] [bit] NULL,
 CONSTRAINT [PK_TicketTransactions] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trUndefined]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trUndefined](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strUnknown] [nvarchar](6) NULL,
	[dtTrDate] [datetime] NULL,
	[strRestOfData] [nvarchar](255) NULL,
	[dtHWReceiveDate] [datetime] NULL,
	[dtSystemDate] [datetime] NULL,
	[intLocationID] [int] NULL,
	[intOperationNumber] [int] NULL,
 CONSTRAINT [PK_Undefined] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umsAttachments]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umsAttachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMessageID] [int] NOT NULL,
	[strAttachmentName] [nvarchar](200) NOT NULL,
	[dtLastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_umsAttachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umsMessages]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umsMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dtRegistered] [datetime] NOT NULL,
	[strAccountNumber] [nvarchar](50) NOT NULL,
	[strTemplateName] [nvarchar](50) NOT NULL,
	[intStatus] [int] NOT NULL,
	[strSubject] [nvarchar](1000) NULL,
	[strBody] [nvarchar](260) NULL,
	[dtSent] [datetime] NULL,
	[dtLastSendRetry] [datetime] NULL,
	[intRetryCount] [int] NOT NULL,
	[intExitCode] [int] NULL,
	[strRecipientEmail] [nvarchar](200) NULL,
 CONSTRAINT [PK_umsMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umsSettings]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umsSettings](
	[strName] [nvarchar](40) NOT NULL,
	[strOrigin] [nvarchar](40) NOT NULL,
	[strValue] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umsSettings] PRIMARY KEY CLUSTERED 
(
	[strName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usage]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usage](
	[TrNum] [float] NULL,
	[EntryDateTime] [datetime] NULL,
	[ExitDateTime] [datetime] NULL,
	[CardNumber] [float] NULL,
	[ExitLane] [float] NULL,
	[Amount] [money] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Usage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageCards](
	[Card Number] [float] NOT NULL,
	[EntryTime] [datetime] NULL,
 CONSTRAINT [PK_UsageCards] PRIMARY KEY CLUSTERED 
(
	[Card Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageCardsTemp]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageCardsTemp](
	[Recno] [int] IDENTITY(1,1) NOT NULL,
	[Account Number] [varchar](16) NULL,
	[Account Name] [varchar](16) NULL,
	[Card Number] [int] NULL,
	[Name] [varchar](16) NULL,
	[Entry Time] [datetime] NULL,
	[Exit Time] [datetime] NULL,
	[Fee] [float] NULL,
	[CCType] [varchar](20) NULL,
 CONSTRAINT [PK_UsageCardsTemp] PRIMARY KEY CLUSTERED 
(
	[Recno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsgbyAcc]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsgbyAcc](
	[AccountNumber] [varchar](30) NULL,
	[TrDateTime] [datetime] NULL,
	[CardNumber] [float] NULL,
	[LaneNumber] [float] NULL,
	[LotNumber] [float] NULL,
	[CardType] [float] NULL,
	[Amount] [money] NULL,
	[UserID] [float] NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UsgbyAcc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[RecNum] [int] IDENTITY(1,1) NOT NULL,
	[Licence] [nvarchar](10) NULL,
	[Card Number] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intFacility] [int] NULL,
	[Sticker] [nvarchar](16) NULL,
	[Make] [nvarchar](10) NULL,
	[Model] [nvarchar](10) NULL,
	[Year] [int] NULL,
	[Color] [nvarchar](16) NULL,
	[State] [nvarchar](4) NULL,
	[intLocationID] [int] NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[RecNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vtTickets]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vtTickets](
	[Ticket] [int] NOT NULL,
	[Type] [int] NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Arrival_Time] [datetime] NULL,
	[Checkout_Time] [datetime] NULL,
	[Guest_Room] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Licence] [nvarchar](50) NULL,
	[Sticker] [nvarchar](50) NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[State] [nvarchar](50) NULL,
	[Stall] [nvarchar](50) NULL,
	[ModifiedCheckout_Time] [datetime] NULL,
	[Account_Number] [nvarchar](50) NULL,
	[Guest] [bit] NULL,
 CONSTRAINT [PK_vtTickets] PRIMARY KEY CLUSTERED 
(
	[Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vtTracking]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vtTracking](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intArrivalState] [int] NOT NULL,
	[intEntryLane] [int] NULL,
	[dtEntryTime] [datetime] NULL,
	[strArrivalAssistCardNumber] [nvarchar](256) NULL,
	[intArrivalBeginLane] [int] NULL,
	[dtArrivalBeginTime] [datetime] NULL,
	[intArrivalTimeout] [int] NULL,
	[intArrivalUmsMessageId] [int] NULL,
	[intArrivalEndLane] [int] NULL,
	[dtArrivalEndTime] [datetime] NULL,
	[intPaymentLane] [int] NULL,
	[dtPaymentTime] [datetime] NULL,
	[intRetrievalState] [int] NOT NULL,
	[strRetrievalAssistCardNumber] [nvarchar](256) NULL,
	[intRetrievalBeginLane] [int] NULL,
	[dtRetrievalBeginTime] [datetime] NULL,
	[intRetrievalTimeout] [int] NULL,
	[intRetrievalUmsMessageId] [int] NULL,
	[intRetrievalEndLane] [int] NULL,
	[dtRetrievalEndTime] [datetime] NULL,
	[dtUserCancelationTime] [datetime] NULL,
	[strUserCanceled] [nvarchar](50) NULL,
	[Licence] [nvarchar](50) NULL,
	[Sticker] [nvarchar](50) NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_vtTracking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webBarcodeRangesForExternalReservationCompanies]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webBarcodeRangesForExternalReservationCompanies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[strMerchantName] [nvarchar](1024) NOT NULL,
	[strMerchantID] [nvarchar](256) NOT NULL,
	[intStartingNumber] [int] NOT NULL,
	[intEndingNumber] [int] NOT NULL,
 CONSTRAINT [PK_webBarcodeRangesForExternalReservationCompanies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscountEventCards]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscountEventCards](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intSerialNumber] [bigint] NOT NULL,
	[strDiscountCardNumber] [nvarchar](100) NOT NULL,
	[dtFromDate] [datetime] NOT NULL,
	[dtToDate] [datetime] NOT NULL,
	[intDiscountNumber] [int] NOT NULL,
	[intStatus] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageCount] [int] NOT NULL,
	[intMaxUsageCount] [int] NOT NULL,
	[intReUsePeriod] [int] NOT NULL,
	[dtIssueDate] [datetime] NOT NULL,
	[strIssueOperatorName] [nvarchar](100) NULL,
	[dtLastDateModified] [datetime] NOT NULL,
	[strModifyOperatorName] [nvarchar](100) NULL,
	[intEventID] [bigint] NOT NULL,
	[intFacilityCode] [int] NOT NULL,
	[intDiscountCardUsageType] [int] NOT NULL,
	[intMerchantID] [int] NULL,
	[strMerchantName] [nvarchar](255) NULL,
	[strDefaultRate] [nvarchar](10) NULL,
	[strExtendedValidityRate] [nvarchar](10) NULL,
	[intExtendedValidityPeriodBeforeStartDate] [int] NULL,
	[intExtendedValidityPeriodAfterEndDate] [int] NULL,
 CONSTRAINT [PK_webDiscountEventCards] PRIMARY KEY CLUSTERED 
(
	[strDiscountCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscountEventInfo]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscountEventInfo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strEventName] [nvarchar](255) NOT NULL,
	[dtEventStartDate] [datetime] NULL,
	[dtEventEndDate] [datetime] NULL,
	[intIsActive] [smallint] NOT NULL,
	[dtEventRegistered] [datetime] NOT NULL,
	[strRegisterOperatorName] [nvarchar](100) NULL,
	[dtLastDateModified] [datetime] NOT NULL,
	[strModifyOpertorName] [nvarchar](100) NULL,
	[intDiscountKey] [int] NOT NULL,
	[intRequestedDiscountCount] [int] NOT NULL,
	[intTaskID] [bigint] NOT NULL,
	[intDiscountUsageCount] [int] NOT NULL,
	[intDiscountReUsePeriod] [int] NOT NULL,
	[intDiscountCardUsageType] [int] NOT NULL,
	[intMerchantID] [int] NULL,
	[strMerchantName] [nvarchar](255) NULL,
	[strDefaultRate] [nvarchar](10) NULL,
	[strExtendedValidityRate] [nvarchar](10) NULL,
	[intExtendedValidityPeriodBeforeStartDate] [int] NULL,
	[intExtendedValidityPeriodAfterEndDate] [int] NULL,
 CONSTRAINT [PK_webDiscountEventInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscountEventLocations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscountEventLocations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intEventID] [bigint] NOT NULL,
	[intLocationID] [bigint] NOT NULL,
	[strLocationName] [nvarchar](255) NULL,
	[intStatus] [int] NOT NULL,
 CONSTRAINT [PK_webDiscountEventLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscountEventLog]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscountEventLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[intDiscountEventID] [int] NOT NULL,
	[strAuthenticatedUser] [nvarchar](255) NOT NULL,
	[intRequestOperationFlag] [int] NOT NULL,
	[strRequestOperationName] [nvarchar](50) NOT NULL,
	[intDPWebServiceResponse] [int] NOT NULL,
	[intEventType] [int] NOT NULL,
 CONSTRAINT [PK_webDiscountEventLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscountEventsTasks]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscountEventsTasks](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intEventID] [int] NOT NULL,
	[intTaskID] [int] NOT NULL,
	[dtTaskDate] [datetime] NOT NULL,
 CONSTRAINT [PK_webEventsTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webDiscounts]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webDiscounts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDiscountKeyID] [int] NOT NULL,
	[strDiscountName] [nvarchar](255) NOT NULL,
	[strDiscountDescription] [nvarchar](1024) NULL,
 CONSTRAINT [PK_webDiscounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webEncoderOperations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webEncoderOperations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intBoardNumber] [int] NULL,
	[intBoardType] [int] NULL,
	[strOpName] [nvarchar](50) NOT NULL,
	[intOpNumber] [int] NULL,
	[intOperationType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intFacilityCode] [int] NULL,
	[intLotNumber] [int] NULL,
	[strRateKey] [nvarchar](2) NULL,
	[intBatchNumber] [int] NULL,
	[intCarrierNumber] [int] NULL,
	[intDiscountNumber] [int] NULL,
	[dtStartDate] [datetime] NULL,
	[dtEndDate] [datetime] NULL,
	[intValidityPeriodInMinutes] [bigint] NULL,
	[intUsageCount] [int] NULL,
	[mnUsageAmount] [money] NULL,
	[strTextToPrint] [nvarchar](50) NULL,
	[intLocationID] [int] NULL,
	[intEncoderID] [int] NULL,
	[intMerchantID] [int] NULL,
	[intMediaType] [int] NULL,
	[intUsageType] [int] NULL,
	[dtReceivedDate] [datetime] NOT NULL,
	[intActivationStatus] [int] NOT NULL,
 CONSTRAINT [PK_webEncoderOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webExternalCardsUsage]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webExternalCardsUsage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDeviceID] [int] NOT NULL,
	[strCardNumber] [nvarchar](256) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[intScanStatus] [int] NOT NULL,
 CONSTRAINT [PK_webExternalCardsUsage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webExternalCardsUsageStatuses]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webExternalCardsUsageStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intMessageCode] [int] NOT NULL,
	[strMessageDescription] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_webExternalCardsUsageStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webExternalPaymentConfig]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webExternalPaymentConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strCompanyID] [nvarchar](128) NOT NULL,
	[strCompanyName] [nvarchar](128) NOT NULL,
	[strAuthToken] [nvarchar](128) NULL,
	[dtModifyDate] [datetime] NOT NULL,
	[bIsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_webExternalPaymentConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webExternalPaymentRequests]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webExternalPaymentRequests](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[intClientReference] [int] NOT NULL,
	[xmlRequest] [xml] NOT NULL,
	[intVirtualLane] [int] NOT NULL,
	[intInvoiceNumber] [int] NOT NULL,
	[intPaymentType] [int] NOT NULL,
	[intResultCode] [int] NOT NULL,
	[intClientID] [int] NULL,
	[strClientName] [nvarchar](50) NOT NULL,
	[strRemoteIP] [nvarchar](50) NOT NULL,
	[strRemoteUser] [nvarchar](50) NULL,
	[bIsVoided] [bit] NOT NULL,
	[strCompanyID] [nvarchar](128) NULL,
	[strAuthToken] [nvarchar](128) NULL,
	[strTerminalID] [nvarchar](128) NULL,
	[strTerminalPaymentRef] [nvarchar](128) NULL,
 CONSTRAINT [PK_webExternalPaymentRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webFacilityCodes]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webFacilityCodes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intFacilityCode] [int] NULL,
	[bIsActive] [bit] NOT NULL,
	[dtLastModifiedDate] [datetime] NOT NULL,
	[strNotes] [nvarchar](255) NULL,
 CONSTRAINT [PK_webFaclilityCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webLocations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webLocations](
	[intLocationID] [bigint] NOT NULL,
	[strLocationName] [nvarchar](255) NOT NULL,
	[strLocationAddress] [nvarchar](255) NULL,
	[strLocationTel] [nvarchar](255) NULL,
	[strOther] [nvarchar](255) NULL,
	[strAssignedSQLServerCleint] [nvarchar](255) NULL,
	[strWebHostName] [nvarchar](255) NULL,
	[binUser] [varbinary](255) NULL,
	[binPass] [varbinary](255) NULL,
 CONSTRAINT [PK_webLocations] PRIMARY KEY CLUSTERED 
(
	[intLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMapAccessLevelToNesting]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMapAccessLevelToNesting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intAccessLevel] [int] NOT NULL,
	[bitNesting] [bit] NOT NULL,
 CONSTRAINT [PK_webMapAccessLevelToNesting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMapDPAreasToExternalGarageStructures]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMapDPAreasToExternalGarageStructures](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intDPAreaID] [int] NOT NULL,
	[strExternalGarageStructureID] [nvarchar](256) NULL,
 CONSTRAINT [PK_webMapDPAreasToExternalGarageStructures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMapLocationCodeToNesting]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMapLocationCodeToNesting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [decimal](20, 0) NOT NULL,
	[intLocationCode] [decimal](20, 0) NOT NULL,
	[bIsNesting] [bit] NOT NULL,
	[intAccessLevel] [int] NULL,
 CONSTRAINT [PK_webMapLotToNesting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMapLotToAccessLevel]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMapLotToAccessLevel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intAccessLevel] [int] NOT NULL,
 CONSTRAINT [PK_webMapLotToAccessLevel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMerchants]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMerchants](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intMerchantKeyID] [int] NOT NULL,
	[strMerchantName] [nvarchar](255) NOT NULL,
	[strDescription] [nvarchar](1024) NULL,
	[intMerchantPaymentType] [int] NULL,
 CONSTRAINT [PK_webMerchants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMerchantsAreasMap]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMerchantsAreasMap](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intMerchantKeyID] [int] NOT NULL,
	[intAreaKeyID] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_webMerchantsAreasMap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webMerchantsDiscountsMap]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webMerchantsDiscountsMap](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intMerchantKeyID] [int] NOT NULL,
	[intDiscountKeyID] [int] NOT NULL,
 CONSTRAINT [PK_webMerchantsDiscountsMap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webRangesDescriptions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webRangesDescriptions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intMinCardNumber] [decimal](10, 0) NOT NULL,
	[intMaxCardNumber] [decimal](10, 0) NOT NULL,
	[intMediaType] [bigint] NOT NULL,
	[intFacilityCode] [bigint] NOT NULL,
	[intRangeOption] [bigint] NOT NULL,
	[strDescription] [nvarchar](255) NULL,
	[intLocationID] [int] NOT NULL,
	[dtModifyDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_webRangesDescriptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webRequests]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webRequests](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intTaskID] [int] NOT NULL,
	[intRequestType] [int] NOT NULL,
	[intRequestSubType] [int] NOT NULL,
	[intLocationID] [int] NOT NULL,
	[intRequestStatus] [int] NOT NULL,
	[xmlRequest] [xml] NOT NULL,
	[dtRequestDate] [datetime] NULL,
 CONSTRAINT [PK_webRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webReservations]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webReservations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intSerialNumber] [bigint] NOT NULL,
	[strDiscountCardNumber] [nvarchar](100) NOT NULL,
	[dtFromDate] [datetime] NOT NULL,
	[dtToDate] [datetime] NOT NULL,
	[intDiscountNumber] [int] NOT NULL,
	[intStatus] [int] NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageCount] [int] NOT NULL,
	[intMaxUsageCount] [int] NOT NULL,
	[intReUsePeriod] [int] NOT NULL,
	[dtIssueDate] [datetime] NOT NULL,
	[strIssueOperatorName] [nvarchar](100) NULL,
	[dtLastDateModified] [datetime] NOT NULL,
	[strModifyOperatorName] [nvarchar](100) NULL,
	[intEventID] [bigint] NOT NULL,
	[intFacilityCode] [int] NOT NULL,
	[intDiscountCardUsageType] [int] NOT NULL,
	[intMerchantID] [int] NULL,
	[strMerchantName] [nvarchar](255) NULL,
	[strDefaultRate] [nvarchar](10) NULL,
	[strExtendedValidityRate] [nvarchar](10) NULL,
	[intExtendedValidityPeriodBeforeStartDate] [int] NULL,
	[intExtendedValidityPeriodAfterEndDate] [int] NULL,
	[strFirstName] [nvarchar](100) NULL,
	[strLastName] [nvarchar](100) NULL,
	[mnAmount] [money] NULL,
	[strCustomField] [nvarchar](255) NULL,
	[bOveragesExternalPayment] [bit] NULL,
	[intMerchantLocationID] [bigint] NULL,
	[intLogInfoID] [int] NOT NULL,
 CONSTRAINT [PK_webReservations] PRIMARY KEY CLUSTERED 
(
	[strDiscountCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webTasks]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webTasks](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[strUser] [nvarchar](50) NOT NULL,
	[strIP] [nvarchar](50) NOT NULL,
	[intTaskType] [int] NOT NULL,
	[intTaskStatus] [int] NOT NULL,
	[strTaskStatusDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_webTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webTrackAccountBalanceChange]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webTrackAccountBalanceChange](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[strAccountNumber] [nvarchar](50) NULL,
	[mnAmountChange] [money] NOT NULL,
	[mnPreviousAmount] [money] NOT NULL,
	[mnTotalAmount] [money] NOT NULL,
	[intAmountChangeType] [int] NOT NULL,
	[intTaskID] [bigint] NOT NULL,
 CONSTRAINT [PK_webTrackAccountBalanceChange] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webTrackCardUsageCountChange]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webTrackCardUsageCountChange](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[intLocationID] [int] NOT NULL,
	[dtTrDate] [datetime] NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[intCardNumber] [int] NOT NULL,
	[intCountChange] [int] NOT NULL,
	[intPreviousCount] [int] NOT NULL,
	[intTotalCount] [int] NOT NULL,
	[intCountChangeType] [int] NOT NULL,
	[intTaskID] [bigint] NOT NULL,
 CONSTRAINT [PK_webTrackCardUsageCountChange] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webValidationsRequests]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webValidationsRequests](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[strCardNumber] [nvarchar](128) NOT NULL,
	[intMediaType] [int] NOT NULL,
	[intUsageType] [int] NOT NULL,
	[intDiscountKey] [int] NOT NULL,
	[strMerchantID] [nvarchar](128) NOT NULL,
	[strWebUser] [nvarchar](128) NOT NULL,
	[strIP] [nvarchar](128) NOT NULL,
	[dtRequestDate] [datetime] NOT NULL,
	[intMerchantKeyNumber] [int] NULL,
	[strClientIP] [nvarchar](128) NULL,
	[dtCardEntryTime] [datetime] NULL,
	[intOperationRespCode] [int] NULL,
	[intEntryLane] [int] NULL,
 CONSTRAINT [PK_webValidationsRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Rejected_Fee_Transactions_SubBase]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[Rejected_Fee_Transactions_SubBase]
			(
			/*
			@parameter1 datatype = default value,
			@parameter2 datatype
			*/
			@startDate datetime,
			@endDate datetime,
			@merchantID int
			)
		RETURNS TABLE
		AS
			RETURN ( 
				SELECT 
				intCreditTrId AS FeeTrId,
				trDPFee.*,
				/*oRejectedLog.*, */
				Account,
				ExpirationDate,
				oRejectedLog.Amount AS RAmount, 
				(mnDA1+mnDA2) AS Discount, 
				(mnAmount-(mnDA1+mnDA2)) AS [Charge Amount]
				
			FROM trDPFee LEFT JOIN oRejectedLog ON trDPFee.intCreditTrId=oRejectedLog.FeeId
			WHERE (dtExitDate BETWEEN  @startDate AND @endDate) 
			AND (intTrType<>2)
			AND ((intTrType)=7 OR (intTrMode>3))
			AND (oRejectedLog.FeeId IS NOT NULL)
			AND (oRejectedLog.FeeId>0 )
			AND (@merchantID=oRejectedLog.MerchantID)
			)
GO
/****** Object:  UserDefinedFunction [dbo].[Rejected_Fee_Transactions_MainBase]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[Rejected_Fee_Transactions_MainBase]
				(
			/*
			@parameter1 datatype = default value,
			@parameter2 datatype
			*/
			@startDate datetime,
			@endDate datetime,
			@merchnatID int
			)
		RETURNS TABLE
		AS
			RETURN ( 
			SELECT 
				Rejected_Fee_Transactions_SubBase.*
		FROM Rejected_Fee_Transactions_SubBase(@startDate,@endDate,@merchnatID) 
		LEFT JOIN oBatch ON Rejected_Fee_Transactions_SubBase.FeeTrId =oBatch.FeeId
		AND
		oBatch.FeeId  is Null
		 )
GO
/****** Object:  UserDefinedFunction [dbo].[DistRejectionDet]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[DistRejectionDet]
			(
			/*
			@parameter1 datatype = default value,
			@parameter2 datatype
			
			*/
			@startDate datetime,
			@endDate datetime,
			@merchantID int
			)
		RETURNS TABLE
		AS
			RETURN ( 
			SELECT	oRejectedLog.Time,
					oRejectedLog.Account,
					oRejectedLog.CCType, 
					oRejectedLog.ExpirationDate, 
					oRejectedLog.ReasonCode, 
					oRejectedLog.CreditTrTime, 
					oRejectedLog.LaneNumber, 
					oRejectedLog.Amount, 
					oRejectedLog.InvoiceNumber, 
					oBatch.Account as BatchAccount, 
					oBatch.Memo, 
					oBatch.Amount as BatchAmount, 
					oRejectedLog.Status,
					oRejectedLog.MerchantID
			FROM oRejectedLog LEFT JOIN oBatch ON oRejectedLog.Account = oBatch.Account 
			AND  oRejectedLog.LaneNumber =   dbo.Val( Left(Memo,2)) 
			AND  oRejectedLog.InvoiceNumber =   dbo.Val( Right(Memo ,4))    
			WHERE ( oRejectedLog.Time BETWEEN @startDate AND @endDate ) 
			AND (oBatch.Amount is NULL )
			AND @merchantID=oRejectedLog.MerchantID

			 )
GO
/****** Object:  UserDefinedFunction [dbo].[DistRejectionCons]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[DistRejectionCons]
			(
			/*
			@parameter1 datatype = default value,
			@parameter2 datatype
			*/
			
			@startDate datetime,
			@endDate datetime,
			@merchantID int
			)
			

		RETURNS TABLE
		AS
			RETURN ( 	
			/* SET NOCOUNT ON */
			SELECT 
				Count (InvoiceNumber) AS [Count],
				Account, 
				ExpirationDate, 
				LaneNumber, 
				InvoiceNumber,
				Amount,
				CCType		
			FROM dbo.DistRejectionDet(@startDate,@endDate,@merchantID)
			GROUP BY Account, ExpirationDate, LaneNumber, InvoiceNumber, Amount,CCType
		 )
GO
/****** Object:  UserDefinedFunction [dbo].[OnlyCash]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		Create FUNCTION [dbo].[OnlyCash]
		(
		/*
		@parameter1 datatype = default value,
		@parameter2 datatype
		*/
		@startDate datetime,
		@endDate datetime,
		@merchantID int
		)
		RETURNS  TABLE
		AS
		RETURN( SELECT	intBoardNumber AS Lane, 
				intTrNum AS InvNum,
				(mnDA1 + mnDA2) AS Discount,
				(mnAmount - (mnDA1 + mnDA2)) AS Amount,
				'0' AS Account , 
				101 AS CCType,
				'C' AS Status
		FROM	trDPFee
		WHERE	(intTrType= 1 OR intTrType= 3) AND
				(intTrMode < 4)AND
				(dtExitDate BETWEEN @startDate AND @endDate) AND 
				(intBoardNumber in (Select BoardNum From BoardToMerchantAccount Where MerchantAccountID = @merchantID )
				OR  @merchantID=0)
				)
GO
/****** Object:  UserDefinedFunction [dbo].[OnlyCredit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[OnlyCredit]
			(
			
			@startDate datetime,
			@endDate datetime,
			@merchantID int
			)
		RETURNS TABLE
		AS
			RETURN ( 
			SELECT
					dbo.MemoToBoard(Memo) AS Lane, 
					Account,
					dbo.DolarAmount(Amount,Status)AS Amount,
					CCType,
					Status
			FROM oBatch
			WHERE 
				
				(Status<>'A' AND	Status<>'R')
				AND
				(dbo.StringToDate(Date,Time) BETWEEN @startDate and @endDate)
				AND @merchantID =MerchantID

				)
GO
/****** Object:  UserDefinedFunction [dbo].[CashCredit]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		Create FUNCTION [dbo].[CashCredit]
		(
		/*
		@parameter1 datatype = default value,
		@parameter2 datatype
		*/
		@startDate datetime,
		@endDate datetime,
		@merchantID int
		)
		RETURNS TABLE
		AS
		RETURN ( /* sql select statement */ 
			SELECT 
			
					[Lane], 
					[Amount],
					(Account ) as [Account] ,
					[CCType],
					(Status ) as [Status] 
			FROM  dbo.OnlyCash(@startDate, @endDate,@merchantID)
			WHERE Amount <>0
			UNION ALL 
			SELECT	
					[Lane], 
					[Amount],
					[Account],
					[CCType],
					[Status]
			FROM  dbo.OnlyCredit(@startDate, @endDate,@merchantID) )
GO
/****** Object:  UserDefinedFunction [dbo].[CCByTypeAmountEx]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CCByTypeAmountEx]
		(
		/*
		@parameter1 datatype = default value,
		@parameter2 datatype
		*/
		@startDate datetime,
		@endDate datetime,
		@merchantID int
		)
		RETURNS TABLE/* @table_variable TABLE (column1 datatype, column2 datatype) */
		AS
		RETURN (
		SELECT  
			Cash_Amnt=
			CASE CCType
			WHEN 101 THEN Amount 	
			ELSE 0 
			END,
			Cash_Cnt=
			CASE CCType
			WHEN 101 THEN 1
			ELSE 0
			END	,
			
			Visa_Amnt=
			CASE CCType
			WHEN 2 THEN Amount 	
			ELSE 0 
			END,
			Visa_Cnt=
			CASE CCType
			WHEN 2 THEN 1
			ELSE 0
			END,
			
			Master_Amnt=
			CASE CCType
			WHEN 3 THEN Amount 	
			ELSE 0 
			END,
			Master_Cnt=
			CASE CCType
			WHEN 3 THEN 1
			ELSE 0
			END,
			
			AMEX_Amnt=
			CASE CCType
			WHEN 4 THEN Amount 	
			ELSE 0 
			END,
			AMEX_Cnt=
			CASE CCType
			WHEN 4 THEN 1
			ELSE 0
			END	,
			
			Diners_Amnt=
			CASE CCType
			WHEN 8 THEN Amount 	
			ELSE 0 
			END,
			Diners_Cnt=
			CASE CCType
			WHEN 8 THEN 1
			ELSE 0
			END,
			
			Discover_Amnt=
			CASE CCType
			WHEN 6 THEN Amount 	
			ELSE 0 
			END,
			Discover_Cnt=
			CASE CCType
			WHEN 6 THEN 1
			ELSE 0
			END,
			
			Park_Amnt=
			CASE CCType
			WHEN 7 THEN Amount 	
			ELSE 0 
			END,
			Park_Cnt=
			CASE CCType
			WHEN 7 THEN 1
			ELSE 0
			END,							
			
			Other_Amnt=
			CASE
			WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=9) THEN Amount 	
			ELSE 0 
			END,
			Other_Cnt=
			CASE 
			WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=9) THEN 1
			ELSE 0
			END,
			
			repLanes.strLaneName as LaneName,
			dbo.CashCredit.*,
			
			TP=
			CASE Status
			WHEN 'C' THEN 1
			ELSE 0
			END
			
			FROM dbo.CashCredit(@startDate,@endDate,@merchantID) 
			LEFT JOIN repLanes ON dbo.CashCredit.Lane=repLanes.intLane

		)	
GO
/****** Object:  UserDefinedFunction [dbo].[CCByTypeAmountWithOutParkCEx]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CCByTypeAmountWithOutParkCEx]
		(
		/*
		@parameter1 datatype = default value,
		@parameter2 datatype
		*/
		@startDate datetime,
		@endDate datetime,
		@merchantID int
		)
		RETURNS TABLE
		AS
		RETURN (  
		/* SET NOCOUNT ON */
		SELECT  
			Cash_Amnt=
			CASE CCType
			WHEN 101 THEN Amount 	
			ELSE 0 
			END,
			Cash_Cnt=
			CASE CCType
			WHEN 101 THEN 1
			ELSE 0
			END	,
			
			Visa_Amnt=
			CASE CCType
			WHEN 2 THEN Amount 	
			ELSE 0 
			END,
			Visa_Cnt=
			CASE CCType
			WHEN 2 THEN 1
			ELSE 0
			END,
			
			Master_Amnt=
			CASE CCType
			WHEN 3 THEN Amount 	
			ELSE 0 
			END,
			Master_Cnt=
			CASE CCType
			WHEN 3 THEN 1
			ELSE 0
			END,
			
			AMEX_Amnt=
			CASE CCType
			WHEN 4 THEN Amount 	
			ELSE 0 
			END,
			AMEX_Cnt=
			CASE CCType
			WHEN 4 THEN 1
			ELSE 0
			END	,
			
			Diners_Amnt=
			CASE CCType
			WHEN 8 THEN Amount 	
			ELSE 0 
			END,
			Diners_Cnt=
			CASE CCType
			WHEN 8 THEN 1
			ELSE 0
			END,
			
			Discover_Amnt=
			CASE CCType
			WHEN 6 THEN Amount 	
			ELSE 0 
			END,
			Discover_Cnt=
			CASE CCType
			WHEN 6 THEN 1
			ELSE 0
			END,
			
			Other_Amnt=
			CASE
			WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=7 OR  CCType=9 ) THEN Amount 	
			ELSE 0 
			END,
			Other_Cnt=
			CASE 
			WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=7 OR  CCType=9 ) THEN 1
			ELSE 0
			END,
			
			repLanes.strLaneName as LaneName,
			dbo.CashCredit.*,
			
			TP=
			CASE Status
			WHEN 'C' THEN 1
			ELSE 0
			END
			
		FROM dbo.CashCredit(@startDate,@endDate,@merchantID) 
		LEFT JOIN repLanes ON dbo.CashCredit.Lane=repLanes.intLane
		
 		)
GO
/****** Object:  UserDefinedFunction [dbo].[CreditOutLotExits]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CreditOutLotExits] 
		(	
		@startDate datetime,
		@endDate datetime
		)
		RETURNS TABLE 
		AS
		RETURN 
		(
		-- Add the SELECT statement with parameter references here
		SELECT     ID, intBoardNumber, intBoardType, strTrIdent, dtTrDate, intFlags, mnAmount, intInvoiceNumber, strAccount, strExpDate, intCryptID, intCardType, 
						  intCreditTrID, dtHWReceiveDate, dtSystemDate, intLocationID
		FROM         dbo.trCreditCard
		WHERE     (intFlags & 32 = 32) 
		AND dtTrDate BETWEEN @startDate AND @endDate
		)
GO
/****** Object:  UserDefinedFunction [dbo].[CreditOutLotEntryExits]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CreditOutLotEntryExits] 
		(	
		-- Add the parameters for the function here
		@startDate datetime, 
		@endDate   datetime
		)
		RETURNS TABLE 
		AS
		RETURN 
		(
		-- Add the SELECT statement with parameter references here
		SELECT  TOP 100 PERCENT 
				dbo.trCreditCard.intBoardNumber AS ExitLane, 
				dbo.trCreditCard.dtTrDate AS ExitDate, 
				dbo.trCreditCard.mnAmount AS Amount,
				dbo.trCreditCard.strAccount AS Account, 
				dbo.trCreditCard.strExpDate AS ExpDate,
				dbo.trCreditCard.intCryptID AS CryptID,
				dbo.trCreditCard.intCardType AS CardType,
				dbo.trDPFee.dtEntryDate AS EntryDate, 
				dbo.trDPFee.intTickDispenser AS EntryBoard
		FROM	dbo.trCreditCard 
		LEFT JOIN dbo.trDPFee 
		ON dbo.trCreditCard.intCreditTrID = dbo.trDPFee.intCreditTrID

		RIGHT JOIN dbo.CreditOutLotExits(@startDate,@endDate) AS CreditOutLotExits_1 
		ON dbo.trCreditCard.intBoardNumber = CreditOutLotExits_1.intBoardNumber 
		AND dbo.trCreditCard.intInvoiceNumber = CreditOutLotExits_1.intInvoiceNumber
		AND dbo.trCreditCard.strAccount = CreditOutLotExits_1.strAccount
		WHERE     (dbo.trDPFee.intCreditTrID IS NOT NULL) AND (dbo.trDPFee.intTrType <> 2)
		ORDER BY dbo.trCreditCard.intCreditTrID
		)
GO
/****** Object:  UserDefinedFunction [dbo].[CreditInOutPresenceSub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CreditInOutPresenceSub]
		(	
		-- Add the parameters for the function here
		@startDate datetime,
		@endDate datetime
		)
		RETURNS TABLE 
		AS
		RETURN 
		(
		-- Add the SELECT statement with parameter references here
		SELECT 
				0 AS ExitLane, 
				0 AS ExitDate, 
				0.00 AS Amount,
				Account  AS Account, 
            			0 AS ExpDate,
				CryptID AS CryptID,
				CCType AS CardType,
				EntryTime AS EntryDate 
		FROM oCreditInLot	
		UNION ALL
		SELECT 
				ExitLane, 
				ExitDate, 
				Amount,
				Account, 
				ExpDate,
				CryptID,
				CardType,
				EntryDate
		FROM CreditOutLotEntryExits(@startDate,@endDate)
		)
GO
/****** Object:  UserDefinedFunction [dbo].[CCUsageByStationSub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CCUsageByStationSub]
		(
		@InputDate numeric,
		@merchantID int
		)
		RETURNS TABLE
		AS
		RETURN (  SELECT  month(dbo.StringToDate(oBatch.Date,'00:00:00'))as CMonth,Year(dbo.StringToDate(oBatch.Date,'00:00:00'))as CDate,
			PayStat_Cnt=
			CASE cfgBoards.Terminal_1
			WHEN 6 THEN 1
			ELSE 0 
			END,
			FeeComp_Cnt=
			CASE cfgBoards.Terminal_1
			WHEN 2 THEN 1
			ELSE 0 
			END,
			TickDisp_Cnt=
			CASE cfgBoards.Lanetype
			WHEN 7 THEN 1
			ELSE 0 
			END
		 FROM oBatch LEFT JOIN cfgBoards ON Left(oBatch.memo,2)=cfgBoards.Boardnumber 
		 WHERE year(dbo.StringToDate(oBatch.Date,'00:00:00'))=@InputDate  AND cfgBoards.IsActive=1 
		 AND oBatch.FeeID <>0
		 AND @merchantID=oBatch.MerchantID)
GO
/****** Object:  UserDefinedFunction [dbo].[CCUsageGroupSub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[CCUsageGroupSub]
		(
		 @InputDate numeric,
		 @merchantID int
		)
		RETURNS TABLE
		AS
		RETURN ( select CMonth, CDate, Sum(PayStat_Cnt)as Paystations,Sum(FeeComp_Cnt)as FeeComputers,Sum(TickDisp_Cnt) as TD
		  FROM CCUsageByStationSub(@InputDate,@merchantID) GROUP BY CMonth, CDate )
GO
/****** Object:  UserDefinedFunction [dbo].[TDCCUsageSub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[TDCCUsageSub]
		(
			@InputDate numeric
		)
		RETURNS TABLE
		AS
		RETURN ( SELECT  MONTH(dtTrDate) AS TDMonth, YEAR(dtTrDate) AS TDYear,
			CCInOut_Cnt=
			CASE trCreditCard.intFlags&32
			WHEN 32 THEN 1
			ELSE 0 
			END
		
		 FROM trCreditCard LEFT JOIN cfgBoards ON cfgBoards.BoardNumber=trCreditCard.intBoardNumber
		 WHERE (cfgBoards.Lanetype=7) AND (YEAR(dtTrDate)=@InputDate) AND (cfgBoards.IsActive=1)  )
GO
/****** Object:  UserDefinedFunction [dbo].[TDUsageGroupSub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[TDUsageGroupSub]
		(
		 @InputDate numeric
		)
		RETURNS TABLE
		AS
		RETURN ( select TDMonth, TDYear, Sum(CCInOut_Cnt)as CCInOut
		  from TDCCUsageSub(@InputDate) GROUP BY TDMonth, TDYear )
GO
/****** Object:  UserDefinedFunction [dbo].[CCUsageSummarySub]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE FUNCTION [dbo].[CCUsageSummarySub]
				(
					@InputDate numeric,
					@merchantID int
				)
			RETURNS TABLE
			AS
				RETURN ( SELECT  month(dbo.StringToDate(oBatch.Date,'00:00:00'))as CCMonth,Year(dbo.StringToDate(oBatch.Date,'00:00:00'))as CCDate,
					Visa_Cnt=
					CASE CCType
					WHEN 2 THEN 1
					ELSE 0 
					END,
					Master_Cnt=
					CASE CCType
					WHEN 3 THEN 1
					ELSE 0
					END,
					AMEX_Cnt=
					CASE CCType
					WHEN 4 THEN 1
					ELSE 0
					END	,
					Diners_Cnt=
					CASE CCType
					WHEN 8 THEN 1
					ELSE 0
					END,
					Discover_Cnt=
					CASE CCType
					WHEN 6 THEN 1
					ELSE 0
					END
					
			from oBatch Where year(dbo.StringToDate(oBatch.Date,'00:00:00'))=@InputDate
			AND @merchantID=MerchantID 
			)
GO
/****** Object:  UserDefinedFunction [dbo].[TDAllTransactions]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE FUNCTION [dbo].[TDAllTransactions]
		(	
			-- Add the parameters for the function here
			@InputDate numeric
		)
		RETURNS TABLE 
		AS
		RETURN 
		(
			-- Add the SELECT statement with parameter references here
			SELECT  MONTH(dtExitDate) AS TDMonthAllTr,
			COUNT(dtExitDate) AS ALLFee_Cnt
			FROM trDPFee
			WHERE 
			(YEAR(dtExitDate)=@InputDate AND
			(intTrType<>2 AND  
			 intTrType<>9)
			)
			GROUP BY
			MONTH(dtExitDate)
		)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AccNameInd]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [AccNameInd] ON [dbo].[Accounts]
(
	[Account Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [LastNameInd]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [LastNameInd] ON [dbo].[Accounts]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApprovalList]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_ApprovalList] ON [dbo].[ApprovalList]
(
	[RecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApprovalList_Charge]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_ApprovalList_Charge] ON [dbo].[ApprovalList]
(
	[ChargeHandled] ASC,
	[ApprovedCharge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApprovalList_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_ApprovalList_CNMTFC] ON [dbo].[ApprovalList]
(
	[CardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Account Number]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [Account Number] ON [dbo].[Cards]
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cards_UsageCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Cards_UsageCard] ON [dbo].[Cards]
(
	[UsageCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IntCardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_IntCardNumber] ON [dbo].[Cards]
(
	[intCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [LastNameInd]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [LastNameInd] ON [dbo].[Cards]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CardsExtensions_CNMTFCLocID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_CardsExtensions_CNMTFCLocID] ON [dbo].[CardsExtensions]
(
	[intCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC,
	[intLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndMain]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndMain] ON [dbo].[CardsTemp]
(
	[Account Number] ASC,
	[Charge Code] ASC,
	[Next Bill Date] ASC,
	[Billing Period] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndAccount]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndAccount] ON [dbo].[CardsTemp2]
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndAL]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndAL] ON [dbo].[CardsTemp2]
(
	[AccessLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndCard] ON [dbo].[CardsTemp2]
(
	[Card Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndChCd]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndChCd] ON [dbo].[CardsTemp2]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndLic]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndLic] ON [dbo].[CardsTemp2]
(
	[License] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndLoc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndLoc] ON [dbo].[CardsTemp2]
(
	[Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndMake]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndMake] ON [dbo].[CardsTemp2]
(
	[Make] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndName]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndName] ON [dbo].[CardsTemp2]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndPN]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndPN] ON [dbo].[CardsTemp2]
(
	[ParkerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndStall]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndStall] ON [dbo].[CardsTemp2]
(
	[Stall] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndSticker]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndSticker] ON [dbo].[CardsTemp2]
(
	[Sticker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndTZ]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndTZ] ON [dbo].[CardsTemp2]
(
	[TimeZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CarPoolViol_CNMTFCEntry]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CarPoolViol_CNMTFCEntry] ON [dbo].[CarPoolViol]
(
	[CardNo] ASC,
	[intMediaType] ASC,
	[intFacility] ASC,
	[Entry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cars]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Cars] ON [dbo].[Cars]
(
	[strState] ASC,
	[strLicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strTableName]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NCI_strTableName] ON [dbo].[cfgArchiveFiltersSettings]
(
	[strTableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strSettingName]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NCI_strSettingName] ON [dbo].[cfgArchiveSettings]
(
	[strSettingName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strTableName]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NCI_strTableName] ON [dbo].[cfgArchiveTempDataClearFiltersSettings]
(
	[strTableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BoardNumber_cfgBoards]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_BoardNumber_cfgBoards] ON [dbo].[cfgBoards]
(
	[BoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryExit_cfgBoards]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_EntryExit_cfgBoards] ON [dbo].[cfgBoards]
(
	[EntryExit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsActive_cfgBoards]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_IsActive_cfgBoards] ON [dbo].[cfgBoards]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsCleanupOperationTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsCleanupOperationTypeDesc] ON [dbo].[cfgCardsCleanupOperationTypeDesc]
(
	[intCardCleanupOperationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsCommunicationStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsCommunicationStatusDesc] ON [dbo].[cfgCardsCommunicationStatusDesc]
(
	[intCardCommunicationStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsInlotCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsInlotCodeDesc] ON [dbo].[cfgCardsInlotCodeDesc]
(
	[intCardInlotCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsLprStatusCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsLprStatusCodeDesc] ON [dbo].[cfgCardsLprStatusCodeDesc]
(
	[intCardLprStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_MEDIADESC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_MEDIADESC] ON [dbo].[cfgCardsMediaDesc]
(
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsPassbackModeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsPassbackModeDesc] ON [dbo].[cfgCardsPassbackModeDesc]
(
	[intCardPassbackMode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsPaymentTypeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsPaymentTypeDesc] ON [dbo].[cfgCardsPaymentTypeDesc]
(
	[intCardPaymentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsRangePossessorDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsRangePossessorDesc] ON [dbo].[cfgCardsRangePossessorDesc]
(
	[intCardsRangePossessor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsTargetControllerIdDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsTargetControllerIdDesc] ON [dbo].[cfgCardsTargetControllerIdDesc]
(
	[intCardTargetControllerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_USAGEDESC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_USAGEDESC] ON [dbo].[cfgCardsUsageDesc]
(
	[intUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgCardsValidCodeDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgCardsValidCodeDesc] ON [dbo].[cfgCardsValidCodeDesc]
(
	[intCardValidCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cfgDPLPRMWStatusDesc]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cfgDPLPRMWStatusDesc] ON [dbo].[cfgDPLPRMWStatusDesc]
(
	[intStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgEnabledAccLvls_intAccessLvl]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgEnabledAccLvls_intAccessLvl] ON [dbo].[cfgEnabledAccLvls]
(
	[intAccessLvl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgEnabledAccLvls_intGateUID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgEnabledAccLvls_intGateUID] ON [dbo].[cfgEnabledAccLvls]
(
	[intGateUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgEnabledAccLvls_intGateUID_intAccessLvl]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgEnabledAccLvls_intGateUID_intAccessLvl] ON [dbo].[cfgEnabledAccLvls]
(
	[intGateUID] ASC,
	[intAccessLvl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessages_intLanguageID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessages_intLanguageID] ON [dbo].[cfgMultilanguageMessages]
(
	[intLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessages_intMsgID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessages_intMsgID] ON [dbo].[cfgMultilanguageMessages]
(
	[intMsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessages_intMsgID_intLanguageID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessages_intMsgID_intLanguageID] ON [dbo].[cfgMultilanguageMessages]
(
	[intMsgID] ASC,
	[intLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessagesData_intControllerUID_intLanguageID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessagesData_intControllerUID_intLanguageID] ON [dbo].[cfgMultilanguageMessagesData]
(
	[intControllerUID] ASC,
	[intLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessagesData_intControllerUID_intLanguageID_intMsgID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessagesData_intControllerUID_intLanguageID_intMsgID] ON [dbo].[cfgMultilanguageMessagesData]
(
	[intControllerUID] ASC,
	[intLanguageID] ASC,
	[intMsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgMultilanguageMessagesData_intMsgID_intLanguageID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgMultilanguageMessagesData_intMsgID_intLanguageID] ON [dbo].[cfgMultilanguageMessagesData]
(
	[intMsgID] ASC,
	[intLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarControllersData_intControllerType_intControllerUID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarControllersData_intControllerType_intControllerUID] ON [dbo].[cfgVarControllersData]
(
	[intControllerType] ASC,
	[intControllerUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarControllersData_intControllerType_intSegmentUID_intCommunicationType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarControllersData_intControllerType_intSegmentUID_intCommunicationType] ON [dbo].[cfgVarControllersData]
(
	[intControllerType] ASC,
	[intSegmentUID] ASC,
	[intCommunicationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarControllersData_intControllerUID_intControllerType_intCommunicationType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarControllersData_intControllerUID_intControllerType_intCommunicationType] ON [dbo].[cfgVarControllersData]
(
	[intControllerUID] ASC,
	[intControllerType] ASC,
	[intCommunicationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarControllersData_intControllerUID_intPropertyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarControllersData_intControllerUID_intPropertyID] ON [dbo].[cfgVarControllersData]
(
	[intControllerUID] ASC,
	[intPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarControllersData_intPropertyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarControllersData_intPropertyID] ON [dbo].[cfgVarControllersData]
(
	[intPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarGates_intGateUID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarGates_intGateUID] ON [dbo].[cfgVarGates]
(
	[intGateUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarGates_intGateUID_intPropertyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarGates_intGateUID_intPropertyID] ON [dbo].[cfgVarGates]
(
	[intGateUID] ASC,
	[intPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_cfgVarGates_intPropertyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_cfgVarGates_intPropertyID] ON [dbo].[cfgVarGates]
(
	[intPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Charges_Code]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Charges_Code] ON [dbo].[Charges]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Charges_Description]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Charges_Description] ON [dbo].[Charges]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Ind_AccNum_NotifId]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Ind_AccNum_NotifId] ON [dbo].[cmAccountNotifies]
(
	[strAccountNumber] ASC,
	[intNotifyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmCardArea_AreaId]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_cmCardArea_AreaId] ON [dbo].[cmCardArea]
(
	[intAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmCardArea_CNMTFC_AreaId]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmCardArea_CNMTFC_AreaId] ON [dbo].[cmCardArea]
(
	[strCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC,
	[intAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmDebitMultiusage_CardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_cmDebitMultiusage_CardNumber] ON [dbo].[cmDebitMultiusage]
(
	[intCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmDebitMultiusage_MuPeriod]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_cmDebitMultiusage_MuPeriod] ON [dbo].[cmDebitMultiusage]
(
	[dtMuPeriodBegin] ASC,
	[dtMuPeriodEnd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmUsageCards_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_cmUsageCards_CNMTFC] ON [dbo].[cmUsageCards]
(
	[intCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmUsageCardsHistory_CardMedFac]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_cmUsageCardsHistory_CardMedFac] ON [dbo].[cmUsageCardsHistory]
(
	[intCardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_BatchStatus]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_BatchStatus] ON [dbo].[cwCCMapBatchStatus]
(
	[intCWBatchStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TranCodes]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_TranCodes] ON [dbo].[cwCCMapTranStatus]
(
	[intCWStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_ClientsInfo]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_ClientsInfo] ON [dbo].[cwCCRequest]
(
	[strClientName] ASC,
	[intClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_FeeIDCommand]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_FeeIDCommand] ON [dbo].[cwCCRequest]
(
	[intFeeID] ASC,
	[intCommand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_REQUEST_DATE]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_REQUEST_DATE] ON [dbo].[cwCCRequest]
(
	[dtRequestDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TRAN_STATUS]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_TRAN_STATUS] ON [dbo].[cwCCRequest]
(
	[intTranStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtResponseDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtResponseDate] ON [dbo].[cwCCRequest]
(
	[dtResponseDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intLane] ON [dbo].[cwCCRequest]
(
	[intLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTranStatus]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTranStatus] ON [dbo].[cwCCRequest]
(
	[intTranStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DailyLimited_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DailyLimited_CNMTFC] ON [dbo].[DailyLimited]
(
	[Card] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DailyLimited_Dat]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DailyLimited_Dat] ON [dbo].[DailyLimited]
(
	[Dat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DailyLimitedHistory_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DailyLimitedHistory_CNMTFC] ON [dbo].[DailyLimitedHistory]
(
	[Card] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DailyLimitedHistory_Entry]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DailyLimitedHistory_Entry] ON [dbo].[DailyLimitedHistory]
(
	[Entry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DailyLimitedHistory_Exit]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DailyLimitedHistory_Exit] ON [dbo].[DailyLimitedHistory]
(
	[Exit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Debit_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Debit_CNMTFC] ON [dbo].[Debit]
(
	[CardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intDiscountKey]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intDiscountKey] ON [dbo].[defDiscounts]
(
	[intDiscountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intDiscountsID1]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intDiscountsID1] ON [dbo].[defDiscounts]
(
	[intDiscountsID1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intDiscountsID2]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intDiscountsID2] ON [dbo].[defDiscounts]
(
	[intDiscountsID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intRatesID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intRatesID] ON [dbo].[defDiscounts]
(
	[intRatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DisabledPermit]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DisabledPermit] ON [dbo].[disabledCustomer]
(
	[strDisabledPermit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DisabledRegistration]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DisabledRegistration] ON [dbo].[disabledCustomer]
(
	[strDisabledRegistration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DrivingLicense]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_DrivingLicense] ON [dbo].[disabledCustomer]
(
	[strDrivingLicense] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dpcCarryOvrColumns_intColumnType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_dpcCarryOvrColumns_intColumnType] ON [dbo].[dpcCarryOvrColumns]
(
	[intColumnType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dpcCarryOvrColumns_intDpcCarryOvr_ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_dpcCarryOvrColumns_intDpcCarryOvr_ID] ON [dbo].[dpcCarryOvrColumns]
(
	[intDpcCarryOvr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dpcColumnAccessLevels_intDpcCarryOvrColumns_ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_dpcColumnAccessLevels_intDpcCarryOvrColumns_ID] ON [dbo].[dpcColumnAccessLevels]
(
	[intDpcCarryOvrColumns_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dpcColumnEvents_intDpcCarryOvrColumns_ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_dpcColumnEvents_intDpcCarryOvrColumns_ID] ON [dbo].[dpcColumnEvents]
(
	[intDpcCarryOvrColumns_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dpcColumnTypes_intColumnType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_dpcColumnTypes_intColumnType] ON [dbo].[dpcColumnTypes]
(
	[intColumnType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtLastUsed]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtLastUsed] ON [dbo].[dpiEZPassTags]
(
	[dtLastUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagAgencyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagAgencyID] ON [dbo].[dpiEZPassTags]
(
	[intTagAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagAgencyID_intTagSerialNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagAgencyID_intTagSerialNumber] ON [dbo].[dpiEZPassTags]
(
	[intTagAgencyID] ASC,
	[intTagSerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagSerialNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagSerialNumber] ON [dbo].[dpiEZPassTags]
(
	[intTagSerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtLastUsed]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtLastUsed] ON [dbo].[dpiEZPassTagsTemp]
(
	[dtLastUsed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagAgencyID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagAgencyID] ON [dbo].[dpiEZPassTagsTemp]
(
	[intTagAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagAgencyID_intTagSerialNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagAgencyID_intTagSerialNumber] ON [dbo].[dpiEZPassTagsTemp]
(
	[intTagAgencyID] ASC,
	[intTagSerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intTagSerialNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intTagSerialNumber] ON [dbo].[dpiEZPassTagsTemp]
(
	[intTagSerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndInvNo]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndInvNo] ON [dbo].[Invoices]
(
	[InvNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Invoices_AccountNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Invoices_AccountNumber] ON [dbo].[Invoices]
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Invoices_CardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Invoices_CardNumber] ON [dbo].[Invoices]
(
	[CardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Log_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Log_CNMTFC] ON [dbo].[Log]
(
	[Card Number] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Log_DateTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Log_DateTime] ON [dbo].[Log]
(
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [DateTimeInd]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [DateTimeInd] ON [dbo].[LogTemp]
(
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_dtOperationTime_Reporting]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtOperationTime_Reporting] ON [dbo].[lsmAppOperationLogs]
(
	[dtOperationTime] ASC
)
INCLUDE ( 	[strOperationType],
	[strAuthenticatedUser],
	[strCardNumber],
	[intFacilityCode],
	[intMediaType],
	[intUsageType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_bitNestingViolation]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_bitNestingViolation] ON [dbo].[lsmCard]
(
	[bitNestingViolation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_bitTimeZoneViolation]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_bitTimeZoneViolation] ON [dbo].[lsmCard]
(
	[bitTimeZoneViolation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtModified]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtModified] ON [dbo].[lsmCard]
(
	[dtModified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTimeEntry]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTimeEntry] ON [dbo].[lsmCard]
(
	[dtTimeEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTimeExit]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTimeExit] ON [dbo].[lsmCard]
(
	[dtTimeExit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtValidFromDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtValidFromDate] ON [dbo].[lsmCard]
(
	[dtValidFromDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtValidToDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtValidToDate] ON [dbo].[lsmCard]
(
	[dtValidToDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intEntryLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intEntryLane] ON [dbo].[lsmCard]
(
	[intEntryLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intExitLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intExitLane] ON [dbo].[lsmCard]
(
	[intExitLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intFacility]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intFacility] ON [dbo].[lsmCard]
(
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intInlot]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intInlot] ON [dbo].[lsmCard]
(
	[intInlot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intMediaType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intMediaType] ON [dbo].[lsmCard]
(
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intSubUsageType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intSubUsageType] ON [dbo].[lsmCard]
(
	[intSubUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intUsageType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intUsageType] ON [dbo].[lsmCard]
(
	[intUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intValid]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intValid] ON [dbo].[lsmCard]
(
	[intValid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strCardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strCardNumber] ON [dbo].[lsmCard]
(
	[strCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtModified]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtModified] ON [dbo].[lsmCardHistory]
(
	[dtModified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTimeEntry]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTimeEntry] ON [dbo].[lsmCardHistory]
(
	[dtTimeEntry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTimeExit]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTimeExit] ON [dbo].[lsmCardHistory]
(
	[dtTimeExit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intEntryLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intEntryLane] ON [dbo].[lsmCardHistory]
(
	[intEntryLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intExitLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intExitLane] ON [dbo].[lsmCardHistory]
(
	[intExitLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intInlot]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intInlot] ON [dbo].[lsmCardHistory]
(
	[intInlot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intMediaType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intMediaType] ON [dbo].[lsmCardHistory]
(
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intSubUsageType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intSubUsageType] ON [dbo].[lsmCardHistory]
(
	[intSubUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intUsageType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intUsageType] ON [dbo].[lsmCardHistory]
(
	[intUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intValid]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intValid] ON [dbo].[lsmCardHistory]
(
	[intValid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_mAmount]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_mAmount] ON [dbo].[lsmCardHistory]
(
	[mAmount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strCardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strCardNumber] ON [dbo].[lsmCardHistory]
(
	[strCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_lsmLPRdata]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_lsmLPRdata] ON [dbo].[lsmLPRdata]
(
	[intLane] ASC,
	[intTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_lsmLPRpicture]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_lsmLPRpicture] ON [dbo].[lsmLPRpicture]
(
	[intStatus] ASC,
	[strLicensePlateNumber] ASC,
	[dtLicenseDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndWhen]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndWhen] ON [dbo].[MessagesLog]
(
	[When] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Account]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [Account] ON [dbo].[oBatch]
(
	[Merchant] ASC,
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Date]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [Date] ON [dbo].[oBatch]
(
	[Merchant] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_Batch]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_Batch] ON [dbo].[oBatch]
(
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_CCType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_CCType] ON [dbo].[oBatch]
(
	[CCType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_Date]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_Date] ON [dbo].[oBatch]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTrDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTrDate] ON [dbo].[oBatch]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_FeeID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_FeeID] ON [dbo].[oBatch]
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_ID] ON [dbo].[oBatch]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intCommand]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intCommand] ON [dbo].[oBatch]
(
	[intCommand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intCWID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intCWID] ON [dbo].[oBatch]
(
	[intCWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_Status]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_Status] ON [dbo].[oBatch]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_Time]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_Time] ON [dbo].[oBatch]
(
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[oBatches]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Number]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [Number] ON [dbo].[oBatches]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrimaryKey]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PrimaryKey] ON [dbo].[oBatches]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DATEADDED]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_DATEADDED] ON [dbo].[oBlackList]
(
	[DateWhenAdded] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DATEEXP]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_DATEEXP] ON [dbo].[oBlackList]
(
	[dtExpirationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_STRHASH]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_STRHASH] ON [dbo].[oBlackList]
(
	[strHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[oPendingTransactions]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrimaryKey]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PrimaryKey] ON [dbo].[oPendingTransactions]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[oRejectedLog]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PrimaryKey]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PrimaryKey] ON [dbo].[oRejectedLog]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payments_AccNum]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_AccNum] ON [dbo].[Payments]
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payments_AccNumFromDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_AccNumFromDate] ON [dbo].[Payments]
(
	[Account Number] ASC,
	[FromDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payments_AccNumPymtDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_AccNumPymtDate] ON [dbo].[Payments]
(
	[Account Number] ASC,
	[Payment Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payments_CMF]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_CMF] ON [dbo].[Payments]
(
	[Card Number] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payments_NRN]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_NRN] ON [dbo].[Payments]
(
	[intReceiptNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtLogDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtLogDate] ON [dbo].[sqlsrv_MessageLog]
(
	[dtLogDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strDMLType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strDMLType] ON [dbo].[sqlsrv_MessageLog]
(
	[strDMLType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strSourceTable]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strSourceTable] ON [dbo].[sqlsrv_MessageLog]
(
	[strSourceTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strTargetTable]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strTargetTable] ON [dbo].[sqlsrv_MessageLog]
(
	[strTargetTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strUserID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strUserID] ON [dbo].[sqlsrv_MessageLog]
(
	[strUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndDate] ON [dbo].[StatementTemp]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndDate] ON [dbo].[StatementTemp2]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stays_AccountNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Stays_AccountNumber] ON [dbo].[Stays]
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Stays_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Stays_CNMTFC] ON [dbo].[Stays]
(
	[CardNumber] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stays_InvNo]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Stays_InvNo] ON [dbo].[Stays]
(
	[InvNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtTrDate_trBarCode]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtTrDate_trBarCode] ON [dbo].[trBarCode]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intAccount_trBarCode]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intAccount_trBarCode] ON [dbo].[trBarCode]
(
	[intAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trBarCode]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trBarCode] ON [dbo].[trBarCode]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtTrDate_trCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtTrDate_trCard] ON [dbo].[trCard]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trCard] ON [dbo].[trCard]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intCardNumber_trCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intCardNumber_trCard] ON [dbo].[trCard]
(
	[intCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_fastCardSearchIndex]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_fastCardSearchIndex] ON [dbo].[trCard]
(
	[strCardType] ASC,
	[dtTrDate] ASC,
	[intCardNumber] ASC
)
INCLUDE ( 	[intBoardNumber],
	[intBoardType],
	[intFacilityCode],
	[intOpNumber],
	[intMediaType],
	[intUsageType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtTrDate_trCreditCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtTrDate_trCreditCard] ON [dbo].[trCreditCard]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trCreditCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trCreditCard] ON [dbo].[trCreditCard]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intCreditTrId_trCreditCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intCreditTrId_trCreditCard] ON [dbo].[trCreditCard]
(
	[intCreditTrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intInvoiceNumber_trCreditCard]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intInvoiceNumber_trCreditCard] ON [dbo].[trCreditCard]
(
	[intInvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtEntryDate_trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtEntryDate_trDPFee] ON [dbo].[trDPFee]
(
	[dtEntryDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtExitDate_trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtExitDate_trDPFee] ON [dbo].[trDPFee]
(
	[dtExitDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trDPFee] ON [dbo].[trDPFee]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intCreditTrID_trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intCreditTrID_trDPFee] ON [dbo].[trDPFee]
(
	[intCreditTrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intTickNumber_trDPFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intTickNumber_trDPFee] ON [dbo].[trDPFee]
(
	[intTickNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtTrDate_trEvent]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtTrDate_trEvent] ON [dbo].[trEvent]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trEvent]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trEvent] ON [dbo].[trEvent]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intEventCode_trEvent]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intEventCode_trEvent] ON [dbo].[trEvent]
(
	[intEventCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtDate1_trMonthPayment]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtDate1_trMonthPayment] ON [dbo].[trMonthPayment]
(
	[dtDate1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trMonthPayment]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trMonthPayment] ON [dbo].[trMonthPayment]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intTrNumber_trMonthPayment]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intTrNumber_trMonthPayment] ON [dbo].[trMonthPayment]
(
	[intTrNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtTrDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtTrDate] ON [dbo].[trnCardPass]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intBoardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intBoardNumber] ON [dbo].[trnCardPass]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intBoardType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intBoardType] ON [dbo].[trnCardPass]
(
	[intBoardType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intCardStatusCode]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intCardStatusCode] ON [dbo].[trnCardPass]
(
	[intCardStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intFacilityCode]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intFacilityCode] ON [dbo].[trnCardPass]
(
	[intFacilityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intMediaType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intMediaType] ON [dbo].[trnCardPass]
(
	[intMediaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intUsageType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intUsageType] ON [dbo].[trnCardPass]
(
	[intUsageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strCardNum]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strCardNum] ON [dbo].[trnCardPass]
(
	[strCardNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_dtTrDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_dtTrDate] ON [dbo].[trnReceiptInfo]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_intBoardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_intBoardNumber] ON [dbo].[trnReceiptInfo]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_intOperationNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IDX_intOperationNumber] ON [dbo].[trnReceiptInfo]
(
	[intOperationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_dtTrDate_trTicket]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_dtTrDate_trTicket] ON [dbo].[trTicket]
(
	[dtTrDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intBoardNumber_trTicket]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intBoardNumber_trTicket] ON [dbo].[trTicket]
(
	[intBoardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_intTickNumber_trTicket]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_intTickNumber_trTicket] ON [dbo].[trTicket]
(
	[intTickNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umsAttachments]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_umsAttachments] ON [dbo].[umsAttachments]
(
	[intMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndAccName]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndAccName] ON [dbo].[UsageCardsTemp]
(
	[Account Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndAccNum]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndAccNum] ON [dbo].[UsageCardsTemp]
(
	[Account Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndCardNum]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndCardNum] ON [dbo].[UsageCardsTemp]
(
	[Card Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IndCCType]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndCCType] ON [dbo].[UsageCardsTemp]
(
	[CCType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndExitTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndExitTime] ON [dbo].[UsageCardsTemp]
(
	[Exit Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IndFee]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IndFee] ON [dbo].[UsageCardsTemp]
(
	[Fee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Veh_CNMTFC]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Veh_CNMTFC] ON [dbo].[Vehicles]
(
	[Card Number] ASC,
	[intMediaType] ASC,
	[intFacility] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Veh_Licence]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [IX_Veh_Licence] ON [dbo].[Vehicles]
(
	[Licence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtArrivalEndTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtArrivalEndTime] ON [dbo].[vtTracking]
(
	[dtArrivalEndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtEntryTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtEntryTime] ON [dbo].[vtTracking]
(
	[dtEntryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtPaymentTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtPaymentTime] ON [dbo].[vtTracking]
(
	[dtPaymentTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtRetrievalBeginTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtRetrievalBeginTime] ON [dbo].[vtTracking]
(
	[dtRetrievalBeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_dtRetrievalEndTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_dtRetrievalEndTime] ON [dbo].[vtTracking]
(
	[dtRetrievalEndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intArrivalEndLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intArrivalEndLane] ON [dbo].[vtTracking]
(
	[intArrivalEndLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intArrivalState]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intArrivalState] ON [dbo].[vtTracking]
(
	[intArrivalState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intEntryLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intEntryLane] ON [dbo].[vtTracking]
(
	[intEntryLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intPaymentLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intPaymentLane] ON [dbo].[vtTracking]
(
	[intPaymentLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intRetrievalBeginLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intRetrievalBeginLane] ON [dbo].[vtTracking]
(
	[intRetrievalBeginLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intRetrievalEndLane]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intRetrievalEndLane] ON [dbo].[vtTracking]
(
	[intRetrievalEndLane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_intRetrievalState]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_intRetrievalState] ON [dbo].[vtTracking]
(
	[intRetrievalState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NCI_strCardNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_strCardNumber] ON [dbo].[vtTracking]
(
	[strCardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_webDiscountEventInfo]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_webDiscountEventInfo] ON [dbo].[webDiscountEventInfo]
(
	[strEventName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DiscountID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_DiscountID] ON [dbo].[webDiscounts]
(
	[intDiscountKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_webExternalPaymentRequests_dtRequestDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_webExternalPaymentRequests_dtRequestDate] ON [dbo].[webExternalPaymentRequests]
(
	[dtRequestDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_webExternalPaymentRequests_intInvoiceNumber]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NCI_webExternalPaymentRequests_intInvoiceNumber] ON [dbo].[webExternalPaymentRequests]
(
	[intInvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_MerchantID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_MerchantID] ON [dbo].[webMerchants]
(
	[intMerchantKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_MerchantIDAreaID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_MerchantIDAreaID] ON [dbo].[webMerchantsAreasMap]
(
	[intMerchantKeyID] ASC,
	[intAreaKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_MerchantIDDiscountID]    Script Date: 30/12/2019 07:30:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_MerchantIDDiscountID] ON [dbo].[webMerchantsDiscountsMap]
(
	[intMerchantKeyID] ASC,
	[intDiscountKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonCIx_dtCardEntryTime]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NonCIx_dtCardEntryTime] ON [dbo].[webValidationsRequests]
(
	[dtCardEntryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonCIx_dtRequestDate]    Script Date: 30/12/2019 07:30:02 ******/
CREATE NONCLUSTERED INDEX [NonCIx_dtRequestDate] ON [dbo].[webValidationsRequests]
(
	[dtRequestDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_AccountBalance]  DEFAULT ((0)) FOR [AccountBalance]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Invoice]  DEFAULT ((0)) FOR [Invoice]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_NoPayDeactivate]  DEFAULT ((0)) FOR [NoPayDeactivate]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_AutoPrint]  DEFAULT ((0)) FOR [AutoPrint]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_CreditCardDirect]  DEFAULT ((0)) FOR [CreditCardDirect]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Multiple]  DEFAULT ((1)) FOR [Multiple]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_MultiusageFreeHours]  DEFAULT ((0)) FOR [MultiusageFreeHours]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF__Accounts__intLoc__1D4655FB]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF__Accounts__intAcc__0DCF0841]  DEFAULT ((0)) FOR [intAccountType]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_bUseCreditToken]  DEFAULT ((0)) FOR [bUseCreditToken]
GO
ALTER TABLE [dbo].[ApprovalList] ADD  CONSTRAINT [DF__ApprovalL__intLo__220B0B18]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[authApplications] ADD  CONSTRAINT [DF_authApplications_bDel]  DEFAULT ((0)) FOR [bDel]
GO
ALTER TABLE [dbo].[authRights] ADD  CONSTRAINT [DF_authRights_intRights]  DEFAULT ((0)) FOR [intRights]
GO
ALTER TABLE [dbo].[authRights] ADD  DEFAULT ((0)) FOR [intGroupID]
GO
ALTER TABLE [dbo].[authUsers] ADD  CONSTRAINT [DF_authUsers_txtSID]  DEFAULT (N'0') FOR [txtSID]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_UsageCard]  DEFAULT ((0)) FOR [UsageCard]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_Payment Due]  DEFAULT ((0)) FOR [Payment Due]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_Issue]  DEFAULT ((1)) FOR [Issue]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_Auto Expire]  DEFAULT ((1)) FOR [Auto Expire]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_Enable Passback]  DEFAULT ((0)) FOR [Enable Passback]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_VIP]  DEFAULT ((0)) FOR [VIP]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_AutoDeactivated]  DEFAULT ((0)) FOR [AutoDeactivated]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF__Cards__intLocati__1E3A7A34]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF__Cards__intTimeZo__0CDAE408]  DEFAULT ((0)) FOR [intParisTimeZoneID]
GO
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF_Cards_intTimeDebitBalance]  DEFAULT ((0)) FOR [intTimeDebitBalance]
GO
ALTER TABLE [dbo].[CardsExtensions] ADD  CONSTRAINT [DF_CardsExtensions_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[CardsExtensions] ADD  CONSTRAINT [DF_CardsExtensions_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[CardsExtensions] ADD  CONSTRAINT [DF_CardsExt_bValid]  DEFAULT ((1)) FOR [bValid]
GO
ALTER TABLE [dbo].[CardsExtensions] ADD  CONSTRAINT [DF_CardsExt_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[CardsExtensions] ADD  CONSTRAINT [DF_CardsExt_intCardStatusCode]  DEFAULT ((0)) FOR [intCardStatusCode]
GO
ALTER TABLE [dbo].[CarPoolViol] ADD  CONSTRAINT [DF_CarPoolViol_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[CarPoolViol] ADD  CONSTRAINT [DF_CarPoolViol_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[CarPoolViol] ADD  CONSTRAINT [DF_CarPoolViol_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[CCStatus] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_dtOperationDate]  DEFAULT (getdate()) FOR [dtOperationDate]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strUserName]  DEFAULT ('') FOR [strUserName]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_intOperationType]  DEFAULT ((0)) FOR [intOperationType]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strOperationType]  DEFAULT ('') FOR [strOperationType]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strMaskAccount]  DEFAULT ('') FOR [strMaskAccount]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strAccountType]  DEFAULT ('') FOR [strAccountType]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strExpirDate]  DEFAULT ('') FOR [strExpirDate]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_mnAmount]  DEFAULT ((0)) FOR [mnAmount]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strMemo]  DEFAULT ('') FOR [strMemo]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_intMerchantID]  DEFAULT ((0)) FOR [intMerchantID]
GO
ALTER TABLE [dbo].[CCUOperations] ADD  CONSTRAINT [DF_CCUOperations_strResultDesc]  DEFAULT ('') FOR [strResultDesc]
GO
ALTER TABLE [dbo].[cfgArchiveExcludeTablesFilter] ADD  CONSTRAINT [DF_cfgArchiveExcludeTablesFilter_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveExcludeTablesFilter] ADD  CONSTRAINT [DF_cfgArchiveExcludeTablesFilter_strModifyUser]  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgArchiveFiltersSettings] ADD  CONSTRAINT [DF_cfgArchiveFiltersSettings_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveFiltersSettings] ADD  CONSTRAINT [DF_cfgArchiveFiltersSettings_strModifyUser]  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgArchiveInventory] ADD  CONSTRAINT [DF_cfgArchiveInventory_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveInventory] ADD  CONSTRAINT [DF_cfgArchiveInventory_strModifyUser]  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgArchiveOperationsLog] ADD  CONSTRAINT [DF_cfgArchiveOperationsLog_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveOperationsLog] ADD  CONSTRAINT [DF_cfgArchiveOperationsLog_strModifyUser]  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgArchiveSettings] ADD  CONSTRAINT [DF_cfgArchiveSettings_intAllowEdit]  DEFAULT ((1)) FOR [intAllowEdit]
GO
ALTER TABLE [dbo].[cfgArchiveSettings] ADD  CONSTRAINT [DF_cfgArchiveSettings_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveSettings] ADD  CONSTRAINT [DF_cfgArchiveSettings_strModifyUser]  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgArchiveTempDataClearFiltersSettings] ADD  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[cfgArchiveTempDataClearFiltersSettings] ADD  DEFAULT (suser_sname()) FOR [strModifyUser]
GO
ALTER TABLE [dbo].[cfgAreas] ADD  DEFAULT ((0)) FOR [intEntityID]
GO
ALTER TABLE [dbo].[cfgAreas] ADD  DEFAULT ((-1)) FOR [intCounterCfgNumber]
GO
ALTER TABLE [dbo].[cfgAreas] ADD  DEFAULT ((0)) FOR [bIsVirtual]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  CONSTRAINT [DF__cfgBoards__IsAct__04E4BC85]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [intEntityID]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((1)) FOR [intLotNumber]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [intEntityType]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bUseCC]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [intMaxDiscCoup]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bPrepaidTickets]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bIsLprUnit]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bIsHotelEncoder]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bIsVirtual]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((1)) FOR [bIsController]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((0)) FOR [bIsNested]
GO
ALTER TABLE [dbo].[cfgBoards] ADD  DEFAULT ((2)) FOR [iNestedLocation]
GO
ALTER TABLE [dbo].[cfgCardsPassCodeDesc] ADD  DEFAULT ((0)) FOR [bIsAccepted]
GO
ALTER TABLE [dbo].[cfgCardsRanges] ADD  CONSTRAINT [DF_cfgCardsRanges_strRate]  DEFAULT (N'A') FOR [strRate]
GO
ALTER TABLE [dbo].[cfgDiscountFacilityCodes] ADD  CONSTRAINT [DF_cfgDiscountFacilityCodes_intCode]  DEFAULT ((0)) FOR [intCode]
GO
ALTER TABLE [dbo].[cfgFacilityCodes] ADD  DEFAULT ((0)) FOR [intCode]
GO
ALTER TABLE [dbo].[cfgFacilityCodes] ADD  DEFAULT ('...') FOR [txtDescription]
GO
ALTER TABLE [dbo].[cfgJanusSettings] ADD  CONSTRAINT [DF_cfgJanusSettings_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgJanusSettings] ADD  CONSTRAINT [DF_cfgJanusSettings_strDescription]  DEFAULT ('') FOR [strDescription]
GO
ALTER TABLE [dbo].[cfgMultilanguageMessages] ADD  DEFAULT ((0)) FOR [intType]
GO
ALTER TABLE [dbo].[cfgMultilanguageMessages] ADD  DEFAULT ((7)) FOR [intRules]
GO
ALTER TABLE [dbo].[cfgMultilanguageMessages] ADD  DEFAULT ((1)) FOR [intLanguageID]
GO
ALTER TABLE [dbo].[cfgMultilanguageMessagesData] ADD  DEFAULT ((0)) FOR [intControllerUID]
GO
ALTER TABLE [dbo].[cfgMultilanguageMessagesData] ADD  DEFAULT ((1)) FOR [intLanguageID]
GO
ALTER TABLE [dbo].[cfgNestingCards] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgNestingCfg] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgPaymentTypeCodes] ADD  DEFAULT ('') FOR [strPaymentRate]
GO
ALTER TABLE [dbo].[cfgPaymentTypeCodes] ADD  DEFAULT ((0)) FOR [byOperator]
GO
ALTER TABLE [dbo].[cfgSegments] ADD  CONSTRAINT [DF__cfgSegmen__IsAct__0BC6C43E]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[cfgSegments] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgSelectedMessageLanguages] ADD  DEFAULT ((0)) FOR [intLanguageIndex]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((1)) FOR [bIsActive]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((1)) FOR [bStandartOperatorType]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((0)) FOR [bHotelOperatorType]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ('0000') FOR [strPassword]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((0)) FOR [bArchived]
GO
ALTER TABLE [dbo].[cfgSystemOps] ADD  DEFAULT ((0)) FOR [intRights]
GO
ALTER TABLE [dbo].[cfgSystemSettings] ADD  CONSTRAINT [DF_cfgSystemSettings_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgSystemSettings] ADD  CONSTRAINT [DF_cfgSystemSettings_strDescription]  DEFAULT ('') FOR [strDescription]
GO
ALTER TABLE [dbo].[cfgSystemSettings] ADD  DEFAULT ((0)) FOR [bMigrated]
GO
ALTER TABLE [dbo].[cfgValetExit] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cfgVarControllersData] ADD  DEFAULT ((1)) FOR [intCommunicationType]
GO
ALTER TABLE [dbo].[cfgVarGates] ADD  CONSTRAINT [DF_cfgVarGates_intGateUID]  DEFAULT ((0)) FOR [intGateUID]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ((0)) FOR [bDynamic]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ('') FOR [strDynamicCmndName]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ('') FOR [strDynamicCmndFormat]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ((0)) FOR [bIsRemoteCtrlProperty]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ((1)) FOR [intRemoteCtrlPropertyTrueType]
GO
ALTER TABLE [dbo].[cfgVarProperties] ADD  DEFAULT ((1)) FOR [intRemoteCtrlPropertyType]
GO
ALTER TABLE [dbo].[cfgVarReaders] ADD  DEFAULT ((0)) FOR [intReaderType]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_DefAmt]  DEFAULT ((0)) FOR [DefAmt]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_Include_Tax]  DEFAULT ((0)) FOR [Include Tax]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_bTimeDebit]  DEFAULT ((0)) FOR [bTimeDebit]
GO
ALTER TABLE [dbo].[cmAccountNotifies] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmCardArea] ADD  DEFAULT ((0)) FOR [intSoftTimeZoneID]
GO
ALTER TABLE [dbo].[cmDebitMultiusage] ADD  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[cmDebitMultiusage] ADD  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[cmDebitMultiusage] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmInvoicesHistory] ADD  CONSTRAINT [DF__cmInvoicesHistory__Printed]  DEFAULT ((0)) FOR [Printed]
GO
ALTER TABLE [dbo].[cmInvoicesHistory] ADD  CONSTRAINT [DF__cmInvoicesHistory__intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmLacPermitCard] ADD  CONSTRAINT [DF_cmLacPermitCard_bitEmpPub]  DEFAULT ((0)) FOR [bitEmpPub]
GO
ALTER TABLE [dbo].[cmLacPermitCard] ADD  CONSTRAINT [DF_cmLacPermitCard_bitCivic]  DEFAULT ((0)) FOR [bitCivic]
GO
ALTER TABLE [dbo].[cmLacPermitCard] ADD  CONSTRAINT [DF_cmLacPermitCard_intType]  DEFAULT ((0)) FOR [intPermitType]
GO
ALTER TABLE [dbo].[cmMapCardType] ADD  CONSTRAINT [DF_cmMapCardType_isChargeCodeBased]  DEFAULT ((0)) FOR [isChargeCodeBased]
GO
ALTER TABLE [dbo].[cmMapCardType] ADD  CONSTRAINT [DF_cmMapCardType_isRateBased]  DEFAULT ((0)) FOR [isRateBased]
GO
ALTER TABLE [dbo].[cmMERCashDesc] ADD  CONSTRAINT [DF_cmMERCashDesc_bHidden]  DEFAULT ((0)) FOR [bHidden]
GO
ALTER TABLE [dbo].[cmMERCashierStatusDesc] ADD  CONSTRAINT [DF_cmMERCashierStatusDesc_bHidden]  DEFAULT ((0)) FOR [bHidden]
GO
ALTER TABLE [dbo].[cmMERLaneDesc] ADD  CONSTRAINT [DF_cmMERLaneDesc_bHidden]  DEFAULT ((0)) FOR [bHidden]
GO
ALTER TABLE [dbo].[cmMEROpenLotDesc] ADD  CONSTRAINT [DF_cmMEROpenLot_bHidden]  DEFAULT ((0)) FOR [bHidden]
GO
ALTER TABLE [dbo].[cmMERTicketDesc] ADD  CONSTRAINT [DF_cmMERTicketDesc_bDailyRevenue]  DEFAULT ((1)) FOR [bDailyRevenue]
GO
ALTER TABLE [dbo].[cmMERTicketDesc] ADD  CONSTRAINT [DF_cmMERTicket_bHidden]  DEFAULT ((0)) FOR [bHidden]
GO
ALTER TABLE [dbo].[cmPaymentsHistory] ADD  CONSTRAINT [DF__cmPaymentsHistory__intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmQueueToDpws] ADD  CONSTRAINT [DF_cmQueueToDpws_intWhat]  DEFAULT ((0)) FOR [intTaskType]
GO
ALTER TABLE [dbo].[cmQueueToDpws] ADD  CONSTRAINT [DF_cmQueueToDpws_dtAdded]  DEFAULT (getdate()) FOR [dtAdded]
GO
ALTER TABLE [dbo].[cmUsageCards] ADD  CONSTRAINT [DF_cmUsageCards_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmUsageCards] ADD  CONSTRAINT [DF_cmUsageCards_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[cmUsageCards] ADD  CONSTRAINT [DF_cmUsageCards_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[cmUsageCards] ADD  CONSTRAINT [DF_cmUsageCards_intLowLevel]  DEFAULT ((1)) FOR [intLowLevel]
GO
ALTER TABLE [dbo].[cmUsageCardsHistory] ADD  CONSTRAINT [DF__cmUsageCardsHistory__intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cmUsageCardsHistory] ADD  CONSTRAINT [DF_cmUsageCardsHistory_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[cmUsageCardsHistory] ADD  CONSTRAINT [DF_cmUsageCardsHistory_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF__Company__intLoca__25DB9BFC]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cwCCMapCommand] ADD  DEFAULT ((0)) FOR [bIsSale]
GO
ALTER TABLE [dbo].[cwCCMapCommand] ADD  DEFAULT ((0)) FOR [bIsCredit]
GO
ALTER TABLE [dbo].[cwCCMapCommand] ADD  DEFAULT ((0)) FOR [bIsVoid]
GO
ALTER TABLE [dbo].[cwCCMapName] ADD  CONSTRAINT [DF_cwCCMapName_bitShowInUI]  DEFAULT ((1)) FOR [bitShowInCmUI]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intCardReader]  DEFAULT ((0)) FOR [intCardReader]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_inFeeID]  DEFAULT ((0)) FOR [intFeeID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intCryptID]  DEFAULT ((2)) FOR [intCryptID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intMerchantID]  DEFAULT ((0)) FOR [intMerchantID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intClientID]  DEFAULT ((0)) FOR [intClientID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intTranStatus]  DEFAULT ((3)) FOR [intTranStatus]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intVoidTrID]  DEFAULT ((0)) FOR [intVoidedTrID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  CONSTRAINT [DF_cwCCRequest_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [intAdjustedAmountType]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [mnRequestedAmount]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [mnAmountDelta]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [intRequestType]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [intRecurringOption]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [intAVSResponseID]
GO
ALTER TABLE [dbo].[cwCCRequest] ADD  DEFAULT ((0)) FOR [intTokenIssueResponseID]
GO
ALTER TABLE [dbo].[DailyLimited] ADD  CONSTRAINT [DF_DailyLimited_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[DailyLimited] ADD  CONSTRAINT [DF_DailyLimited_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[DailyLimited] ADD  CONSTRAINT [DF_DailyLimited_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[DailyLimitedHistory] ADD  CONSTRAINT [DF_DailyLimitedHistory_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[DailyLimitedHistory] ADD  CONSTRAINT [DF_DailyLimitedHistory_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[DailyLimitedHistory] ADD  CONSTRAINT [DF_DailyLimitedHistory_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dcmDiscountEventCards] ADD  CONSTRAINT [DF_lsmBarcodeDiscountCards_intMaxUsageCount]  DEFAULT ((0)) FOR [intMaxUsageCount]
GO
ALTER TABLE [dbo].[dcmDiscountEventCards] ADD  CONSTRAINT [DF_lsmBarcodeDiscountCards_dtIsueDate]  DEFAULT (getdate()) FOR [dtIssueDate]
GO
ALTER TABLE [dbo].[dcmDiscountEventCards] ADD  CONSTRAINT [DF_lsmBarcodeDiscountCards_dtLastDateModified]  DEFAULT (getdate()) FOR [dtLastDateModified]
GO
ALTER TABLE [dbo].[dcmDiscountEventInfo] ADD  CONSTRAINT [DF_lsmDiscountEventInfo_intIsActive]  DEFAULT ((0)) FOR [intIsActive]
GO
ALTER TABLE [dbo].[dcmDiscountEventInfo] ADD  CONSTRAINT [DF_lsmDiscountEventInfo_dtEventRegistered]  DEFAULT (getdate()) FOR [dtEventRegistered]
GO
ALTER TABLE [dbo].[dcmDiscountEventInfo] ADD  CONSTRAINT [DF_lsmDiscountEventInfo_dtLastDateModified]  DEFAULT (getdate()) FOR [dtLastDateModified]
GO
ALTER TABLE [dbo].[Debit] ADD  CONSTRAINT [DF_Debit_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[Debit] ADD  CONSTRAINT [DF_Debit_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[Debit] ADD  CONSTRAINT [DF_Debit_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[defDiscounts] ADD  DEFAULT ((0)) FOR [bIsForReservations]
GO
ALTER TABLE [dbo].[defDiscounts] ADD  DEFAULT ((0)) FOR [intUsage]
GO
ALTER TABLE [dbo].[disabledPayments] ADD  CONSTRAINT [DF_disabledPayments_dtCreateTime]  DEFAULT (getdate()) FOR [dtCreateTime]
GO
ALTER TABLE [dbo].[disabledPayments] ADD  DEFAULT ((1)) FOR [intGarageID]
GO
ALTER TABLE [dbo].[dpcCarryOvrColumns] ADD  CONSTRAINT [DF_dpcCarryOvrColumns_intColumnVal]  DEFAULT ((0)) FOR [intColumnVal]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intBoardNumber]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intNormalEvent]  DEFAULT ((0)) FOR [intNormalEvent]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intEventCode]  DEFAULT ((0)) FOR [intEventCode]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_dtSystemDate]  DEFAULT (getdate()) FOR [dtSystemDate]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dpcEventNonResetableCounts] ADD  CONSTRAINT [DF_dpcEventNonResetableCounts_intAdjust]  DEFAULT ((0)) FOR [intAdjust]
GO
ALTER TABLE [dbo].[dpEncoderOperationCodes] ADD  CONSTRAINT [DF__dpEncoder__intOp__22CA2527]  DEFAULT ((0)) FOR [intOperationCode]
GO
ALTER TABLE [dbo].[dpEncoderOperationCodes] ADD  CONSTRAINT [DF__dpEncoder__intLo__23BE4960]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF__dpEncoder__intBo__1D114BD1]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF__dpEncoder__intBo__1E05700A]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF__dpEncoder__intOp__1EF99443]  DEFAULT ((0)) FOR [intOpNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF__dpEncoder__intFa__1FEDB87C]  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intLotNumber]  DEFAULT ((0)) FOR [intLotNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intBatchNumber]  DEFAULT ((0)) FOR [intBatchNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intCarrierNumber]  DEFAULT ((0)) FOR [intCarrierNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intCarrierNumber2]  DEFAULT ((0)) FOR [intDiscountNumber]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intValidityPeriod]  DEFAULT ((0)) FOR [intValidityPeriodInMinutes]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_intUsageCount]  DEFAULT ((0)) FOR [intUsageCount]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF_dpEncoderOperations_mnUsageAmount]  DEFAULT ((0)) FOR [mnUsageAmount]
GO
ALTER TABLE [dbo].[dpEncoderOperations] ADD  CONSTRAINT [DF__dpEncoder__intLo__20E1DCB5]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((0)) FOR [bIsCheckOut]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((4)) FOR [intRecordType]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((0)) FOR [bIsChanged]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((0)) FOR [intPostingRequestNumber]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((0)) FOR [bIsCheckOutByRoom]
GO
ALTER TABLE [dbo].[dpiHotelCards] ADD  DEFAULT ((0)) FOR [intEncoderType]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intMACHINEID]  DEFAULT ((0)) FOR [intMACHINEID]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intAUDIT_NO]  DEFAULT ((0)) FOR [intAUDIT_NO]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_fltPREVIOUS_HOPPER_TOTAL]  DEFAULT ((0)) FOR [fltPREVIOUS_HOPPER_TOTAL]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_fltCURRENT_HOPPER_TOTAL]  DEFAULT ((0)) FOR [fltCURRENT_HOPPER_TOTAL]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_fltHOPPER_VARIANCE]  DEFAULT ((0)) FOR [fltHOPPER_VARIANCE]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intSERVICE_CARD]  DEFAULT ((0)) FOR [intSERVICE_CARD]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intDATA_SOURCE]  DEFAULT ((0)) FOR [intDATA_SOURCE]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS05]  DEFAULT ((0)) FOR [intBCOINS05]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS10]  DEFAULT ((0)) FOR [intBCOINS10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS20]  DEFAULT ((0)) FOR [intBCOINS20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS25]  DEFAULT ((0)) FOR [intBCOINS25]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS50]  DEFAULT ((0)) FOR [intBCOINS50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS100]  DEFAULT ((0)) FOR [intBCOINS100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBCOINS200]  DEFAULT ((0)) FOR [intBCOINS200]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS05]  DEFAULT ((0)) FOR [intB_SAFE_COINS05]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS10]  DEFAULT ((0)) FOR [intB_SAFE_COINS10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS20]  DEFAULT ((0)) FOR [intB_SAFE_COINS20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS25]  DEFAULT ((0)) FOR [intB_SAFE_COINS25]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS50]  DEFAULT ((0)) FOR [intB_SAFE_COINS50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS100]  DEFAULT ((0)) FOR [intB_SAFE_COINS100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intB_SAFE_COINS200]  DEFAULT ((0)) FOR [intB_SAFE_COINS200]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES1]  DEFAULT ((0)) FOR [intBNOTES1]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES2]  DEFAULT ((0)) FOR [intBNOTES2]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES5]  DEFAULT ((0)) FOR [intBNOTES5]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES10]  DEFAULT ((0)) FOR [intBNOTES10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES20]  DEFAULT ((0)) FOR [intBNOTES20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES50]  DEFAULT ((0)) FOR [intBNOTES50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBNOTES100]  DEFAULT ((0)) FOR [intBNOTES100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS05]  DEFAULT ((0)) FOR [intECOINS05]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS10]  DEFAULT ((0)) FOR [intECOINS10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS20]  DEFAULT ((0)) FOR [intECOINS20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS25]  DEFAULT ((0)) FOR [intECOINS25]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS50]  DEFAULT ((0)) FOR [intECOINS50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS100]  DEFAULT ((0)) FOR [intECOINS100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intECOINS200]  DEFAULT ((0)) FOR [intECOINS200]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS05]  DEFAULT ((0)) FOR [intE_SAFE_COINS05]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS10]  DEFAULT ((0)) FOR [intE_SAFE_COINS10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS20]  DEFAULT ((0)) FOR [intE_SAFE_COINS20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS25]  DEFAULT ((0)) FOR [intE_SAFE_COINS25]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS50]  DEFAULT ((0)) FOR [intE_SAFE_COINS50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS100]  DEFAULT ((0)) FOR [intE_SAFE_COINS100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intE_SAFE_COINS200]  DEFAULT ((0)) FOR [intE_SAFE_COINS200]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES1]  DEFAULT ((0)) FOR [intENOTES1]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES2]  DEFAULT ((0)) FOR [intENOTES2]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES5]  DEFAULT ((0)) FOR [intENOTES5]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES10]  DEFAULT ((0)) FOR [intENOTES10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES20]  DEFAULT ((0)) FOR [intENOTES20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES50]  DEFAULT ((0)) FOR [intENOTES50]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intENOTES100]  DEFAULT ((0)) FOR [intENOTES100]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBDISPNOTES1]  DEFAULT ((0)) FOR [intBDISPNOTES1]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBDISPNOTES5]  DEFAULT ((0)) FOR [intBDISPNOTES5]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBDISPNOTES10]  DEFAULT ((0)) FOR [intBDISPNOTES10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intBDISPNOTES20]  DEFAULT ((0)) FOR [intBDISPNOTES20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intEDISPNOTES1]  DEFAULT ((0)) FOR [intEDISPNOTES1]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intEDISPNOTES5]  DEFAULT ((0)) FOR [intEDISPNOTES5]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intEDISPNOTES10]  DEFAULT ((0)) FOR [intEDISPNOTES10]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intEDISPNOTES20]  DEFAULT ((0)) FOR [intEDISPNOTES20]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intZREPORT_NO]  DEFAULT ((0)) FOR [intZREPORT_NO]
GO
ALTER TABLE [dbo].[dprCashReconciliation] ADD  CONSTRAINT [DF_dprCashReconciliation_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_1]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_1]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_2]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_2]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_3]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_3]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_4]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_4]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_5]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_5]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_6]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_6]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_7]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_7]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intHOPP_NOMINAL_8]  DEFAULT ((0)) FOR [intHOPP_NOMINAL_8]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_1]  DEFAULT ((0)) FOR [intB_HOPP_CNT_1]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_2]  DEFAULT ((0)) FOR [intB_HOPP_CNT_2]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_3]  DEFAULT ((0)) FOR [intB_HOPP_CNT_3]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_4]  DEFAULT ((0)) FOR [intB_HOPP_CNT_4]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_5]  DEFAULT ((0)) FOR [intB_HOPP_CNT_5]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_6]  DEFAULT ((0)) FOR [intB_HOPP_CNT_6]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_7]  DEFAULT ((0)) FOR [intB_HOPP_CNT_7]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intB_HOPP_CNT_8]  DEFAULT ((0)) FOR [intB_HOPP_CNT_8]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_1]  DEFAULT ((0)) FOR [intE_HOPP_CNT_1]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_2]  DEFAULT ((0)) FOR [intE_HOPP_CNT_2]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_3]  DEFAULT ((0)) FOR [intE_HOPP_CNT_3]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_4]  DEFAULT ((0)) FOR [intE_HOPP_CNT_4]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_5]  DEFAULT ((0)) FOR [intE_HOPP_CNT_5]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_6]  DEFAULT ((0)) FOR [intE_HOPP_CNT_6]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_7]  DEFAULT ((0)) FOR [intE_HOPP_CNT_7]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intE_HOPP_CNT_8]  DEFAULT ((0)) FOR [intE_HOPP_CNT_8]
GO
ALTER TABLE [dbo].[dprHopperBalance] ADD  CONSTRAINT [DF_dprHopperBalance_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[dpWebJobAgentDownloadInfo] ADD  CONSTRAINT [DF_dpWebJobAgentDownloadInfo_intAvailableCards]  DEFAULT ((0)) FOR [intAvailableCards]
GO
ALTER TABLE [dbo].[dpWebJobAgentDownloadInfo] ADD  CONSTRAINT [DF_dpWebJobAgentDownloadInfo_intNewCards]  DEFAULT ((0)) FOR [intNewCards]
GO
ALTER TABLE [dbo].[dpWebJobAgentDownloadInfo] ADD  CONSTRAINT [DF_dpWebJobAgentDownloadInfo_intUpdatedCards]  DEFAULT ((0)) FOR [intUpdatedCards]
GO
ALTER TABLE [dbo].[GDCards] ADD  DEFAULT ((0)) FOR [intRateNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intFacility]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [bInlot]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [bBlackListed]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [bPaid]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [bBalancePresent]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [dtEntryTime]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [dtPaymentTime]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [dtExitTime]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intEntryLaneNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intPaymentLaneNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intExitLaneNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intEntryRateNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intPaymentRateNumber]
GO
ALTER TABLE [dbo].[GDCStays] ADD  DEFAULT ((0)) FOR [intOriginalStaysLogID]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intFacility]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [bInlot]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [bBlackListed]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [bPaid]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [bBalancePresent]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [dtEntryTime]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [dtPaymentTime]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [dtExitTime]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intEntryLaneNumber]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intPaymentLaneNumber]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intExitLaneNumber]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intEntryRateNumber]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intPaymentRateNumber]
GO
ALTER TABLE [dbo].[GDCStaysLog] ADD  DEFAULT ((0)) FOR [intOriginalStaysLogID]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_Printed]  DEFAULT ((0)) FOR [Printed]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF__Invoices__intLoc__2116E6DF]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[Locations] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[lpiLicense] ADD  CONSTRAINT [DF_lpiLicense_intStatus]  DEFAULT ((0)) FOR [intStatus]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intValid]  DEFAULT ((0)) FOR [intValid]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intInlot]  DEFAULT ((0)) FOR [intInlot]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intRawStatus]  DEFAULT ((0)) FOR [intRawStatus]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intFacility]  DEFAULT ((0)) FOR [intFacility]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intTimeZone]  DEFAULT ((0)) FOR [intTimeZone]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_intAccessLevel]  DEFAULT ((0)) FOR [intAccessLevel]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_dtTimeCreation]  DEFAULT (getdate()) FOR [dtTimeCreation]
GO
ALTER TABLE [dbo].[lsmCard] ADD  DEFAULT ((0)) FOR [intHash]
GO
ALTER TABLE [dbo].[lsmCard] ADD  DEFAULT ((0)) FOR [intActiveAccessLevel]
GO
ALTER TABLE [dbo].[lsmCard] ADD  DEFAULT ((0)) FOR [intModifyReason]
GO
ALTER TABLE [dbo].[lsmCard] ADD  DEFAULT ((0)) FOR [intSetupTimeZone]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_bitTimeZoneViolation]  DEFAULT ((0)) FOR [bitTimeZoneViolation]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_bitNestingViolation]  DEFAULT ((0)) FOR [bitNestingViolation]
GO
ALTER TABLE [dbo].[lsmCard] ADD  CONSTRAINT [DF_lsmCard_bitTimeDebitOverage]  DEFAULT ((0)) FOR [bitTimeDebitOverage]
GO
ALTER TABLE [dbo].[lsmCardHistory] ADD  DEFAULT ((0)) FOR [intHash]
GO
ALTER TABLE [dbo].[lsmCardHistory] ADD  DEFAULT ((0)) FOR [intActiveAccessLevel]
GO
ALTER TABLE [dbo].[lsmCardHistory] ADD  DEFAULT ((0)) FOR [intModifyReason]
GO
ALTER TABLE [dbo].[lsmCardHistory] ADD  DEFAULT ((0)) FOR [intSetupTimeZone]
GO
ALTER TABLE [dbo].[lsmCardHistory] ADD  CONSTRAINT [DF_lsmCardHistory_bitTimeDebitOverage]  DEFAULT ((0)) FOR [bitTimeDebitOverage]
GO
ALTER TABLE [dbo].[lsmDiscount] ADD  CONSTRAINT [DF_lsmDiscount_dtTimeCreation]  DEFAULT (getdate()) FOR [dtTimeCreation]
GO
ALTER TABLE [dbo].[lsmDiscount] ADD  CONSTRAINT [DF_lsmDiscount_dtModified]  DEFAULT (getdate()) FOR [dtModified]
GO
ALTER TABLE [dbo].[lsmDiscount] ADD  DEFAULT ((1)) FOR [bitValid]
GO
ALTER TABLE [dbo].[lsmDiscount] ADD  DEFAULT ((0)) FOR [intHash]
GO
ALTER TABLE [dbo].[lsmDiscount] ADD  DEFAULT ((0)) FOR [intFacility]
GO
ALTER TABLE [dbo].[lsmDiscountHistory] ADD  DEFAULT ((1)) FOR [bitValid]
GO
ALTER TABLE [dbo].[lsmDiscountHistory] ADD  DEFAULT ((0)) FOR [intHash]
GO
ALTER TABLE [dbo].[lsmDiscountHistory] ADD  DEFAULT ((0)) FOR [intFacility]
GO
ALTER TABLE [dbo].[lsmExcludedTr] ADD  DEFAULT ((1)) FOR [intControllerLotNumber]
GO
ALTER TABLE [dbo].[lsmNesting] ADD  CONSTRAINT [DF_lsmNesting_intStatus]  DEFAULT ((0)) FOR [intStatus]
GO
ALTER TABLE [dbo].[lsmTempTr] ADD  DEFAULT ((1)) FOR [intMainLotNumber]
GO
ALTER TABLE [dbo].[lsmTempTr] ADD  DEFAULT ((1)) FOR [intControllerLotNumber]
GO
ALTER TABLE [dbo].[MessagesLog] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatus] ADD  DEFAULT ((0)) FOR [iIsDoorOpened]
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatus] ADD  DEFAULT ((0)) FOR [iIsInService]
GO
ALTER TABLE [dbo].[msgMessage] ADD  DEFAULT ((0)) FOR [ExportFlag]
GO
ALTER TABLE [dbo].[oBatch] ADD  DEFAULT ((0)) FOR [MerchantID]
GO
ALTER TABLE [dbo].[oBatch] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oBatch] ADD  DEFAULT ((0)) FOR [intCWID]
GO
ALTER TABLE [dbo].[oBatch] ADD  DEFAULT ((4)) FOR [intCommand]
GO
ALTER TABLE [dbo].[oBatches] ADD  DEFAULT ((0)) FOR [MerchantID]
GO
ALTER TABLE [dbo].[oBatches] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oBlackList] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oBlackList] ADD  DEFAULT ((0)) FOR [intType]
GO
ALTER TABLE [dbo].[oCreditInlot] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oPendingTransactions] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oPendingTransactions] ADD  DEFAULT ((0)) FOR [intCWID]
GO
ALTER TABLE [dbo].[oPendingTransactions] ADD  DEFAULT ((0)) FOR [intInnerCommand]
GO
ALTER TABLE [dbo].[oRejectedLog] ADD  DEFAULT ((0)) FOR [MerchantID]
GO
ALTER TABLE [dbo].[oRejectedLog] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oRejectedLog] ADD  DEFAULT ((0)) FOR [intCWID]
GO
ALTER TABLE [dbo].[oRejectedLog] ADD  DEFAULT ((4)) FOR [intCommand]
GO
ALTER TABLE [dbo].[oScheduledRecharges] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[oScheduledRecharges] ADD  DEFAULT ((0)) FOR [intCWID]
GO
ALTER TABLE [dbo].[oScheduledRecharges] ADD  DEFAULT ((0)) FOR [intInnerCommand]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[repFirminfo] ADD  DEFAULT ((0)) FOR [intCurrMerchantID]
GO
ALTER TABLE [dbo].[sqlsrv_MessageDialogs] ADD  DEFAULT ((1000)) FOR [intResetCount]
GO
ALTER TABLE [dbo].[sqlsrv_MessageDialogs] ADD  DEFAULT ((0)) FOR [intPendingMessageCount]
GO
ALTER TABLE [dbo].[sqlsrv_MessageErrors] ADD  DEFAULT (getdate()) FOR [dtErrorDate]
GO
ALTER TABLE [dbo].[Stays] ADD  CONSTRAINT [DF_Stays_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[Stays] ADD  CONSTRAINT [DF_Stays_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[Stays] ADD  CONSTRAINT [DF_Stays_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[tlConvertWizardLog] ADD  CONSTRAINT [DF_tlConvertWizardLog_intPassCnt]  DEFAULT ((0)) FOR [intPassCnt]
GO
ALTER TABLE [dbo].[TransferBoardsStatus] ADD  DEFAULT ((0)) FOR [IsTransfered]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF__trBarCode__intBo__08B54D69]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF__trBarCode__intBo__09A971A2]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF__trBarCode__intAc__0A9D95DB]  DEFAULT ((0)) FOR [intAccount]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF__trBarCode__intOp__0B91BA14]  DEFAULT ((0)) FOR [intOpCardNum]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF__trBarCode__intLo__0C85DE4D]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trBarCode] ADD  DEFAULT ('-1') FOR [strValetExitIndex]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF_trBarCode_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[trBarCode] ADD  CONSTRAINT [DF_trBarCode_bGeneratedByTrigger]  DEFAULT ((0)) FOR [bGeneratedByTrigger]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intBo__7D439ABD]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intBo__7E37BEF6]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intFa__7F2BE32F]  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intOp__00200768]  DEFAULT ((0)) FOR [intOpNumber]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intLa__01142BA1]  DEFAULT ((0)) FOR [intLaneID]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF__trCardTra__intLo__02084FDA]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF_trCard_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[trCard] ADD  CONSTRAINT [DF_trCard_bGeneratedByTrigger]  DEFAULT ((0)) FOR [bGeneratedByTrigger]
GO
ALTER TABLE [dbo].[trCreditCard] ADD  CONSTRAINT [DF__trCreditC__intBo__76969D2E]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trCreditCard] ADD  CONSTRAINT [DF__trCreditC__intBo__778AC167]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trCreditCard] ADD  CONSTRAINT [DF__trCreditC__intFl__787EE5A0]  DEFAULT ((0)) FOR [intFlags]
GO
ALTER TABLE [dbo].[trCreditCard] ADD  CONSTRAINT [DF__trCreditC__intIn__797309D9]  DEFAULT ((0)) FOR [intInvoiceNumber]
GO
ALTER TABLE [dbo].[trCreditCard] ADD  CONSTRAINT [DF__trCreditC__intLo__7A672E12]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trCreditMessage] ADD  DEFAULT ((0)) FOR [intCreditTrID]
GO
ALTER TABLE [dbo].[trCreditMessage] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trCreditNotification] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trDiscounts] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intBo__628FA481]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intBo__6383C8BA]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intTr__6477ECF3]  DEFAULT ((0)) FOR [intTrNum]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intOp__656C112C]  DEFAULT ((0)) FOR [intOpNum]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intDK__66603565]  DEFAULT ((0)) FOR [intDK1]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intNC__6754599E]  DEFAULT ((0)) FOR [intNC1]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intDK__68487DD7]  DEFAULT ((0)) FOR [intDK2]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intNC__693CA210]  DEFAULT ((0)) FOR [intNC2]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intTi__6A30C649]  DEFAULT ((0)) FOR [intTickDispenser]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intTi__6B24EA82]  DEFAULT ((0)) FOR [intTickNumber]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intTr__6C190EBB]  DEFAULT ((0)) FOR [intTrMode]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intTr__6D0D32F4]  DEFAULT ((0)) FOR [intTrType]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intCr__6E01572D]  DEFAULT ((0)) FOR [intCreditTrID]
GO
ALTER TABLE [dbo].[trDPFee] ADD  CONSTRAINT [DF__trDPFeeTr__intLo__6EF57B66]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trDPFeeInfo] ADD  CONSTRAINT [DF__trDPFeeIn__intFe__71D1E811]  DEFAULT ((0)) FOR [intFeeId]
GO
ALTER TABLE [dbo].[trDPFeeInfo] ADD  CONSTRAINT [DF__trDPFeeIn__intLo__72C60C4A]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intBo__5812160E]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intBo__59063A47]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intCa__59FA5E80]  DEFAULT ((0)) FOR [intCardNum]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intLo__5AEE82B9]  DEFAULT ((0)) FOR [intLot]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intDi__5BE2A6F2]  DEFAULT ((0)) FOR [intDiscountNum]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intOp__5CD6CB2B]  DEFAULT ((0)) FOR [intOperator]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intNo__5DCAEF64]  DEFAULT ((0)) FOR [intNoCoupons]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intRe__5EBF139D]  DEFAULT ((0)) FOR [intReusingPeriod]
GO
ALTER TABLE [dbo].[trEncoder] ADD  CONSTRAINT [DF__trEncoder__intLo__5FB337D6]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trError] ADD  CONSTRAINT [DF__trErrorTr__intBo__52593CB8]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trError] ADD  CONSTRAINT [DF__trErrorTr__intBo__534D60F1]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trError] ADD  CONSTRAINT [DF__trErrorTr__intEr__5441852A]  DEFAULT ((0)) FOR [intErrorType]
GO
ALTER TABLE [dbo].[trError] ADD  CONSTRAINT [DF__trErrorTr__intLo__5535A963]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF__trEventTr__intBo__4BAC3F29]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF__trEventTr__intBo__4CA06362]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF__trEventTr__intNo__4D94879B]  DEFAULT ((0)) FOR [intNormalEvent]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF__trEventTr__intEv__4E88ABD4]  DEFAULT ((0)) FOR [intEventCode]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF__trEventTr__intLo__4F7CD00D]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trEvent] ADD  CONSTRAINT [DF_trEvent_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intBo__4222D4EF]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intBo__4316F928]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intTr__440B1D61]  DEFAULT ((0)) FOR [intTrNum]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intOp__44FF419A]  DEFAULT ((0)) FOR [intOperator]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intDi__45F365D3]  DEFAULT ((0)) FOR [intDiscount]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intMo__46E78A0C]  DEFAULT ((0)) FOR [intMode]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intTy__47DBAE45]  DEFAULT ((0)) FOR [intType]
GO
ALTER TABLE [dbo].[trFeeAmano] ADD  CONSTRAINT [DF__trFeeAman__intLo__48CFD27E]  DEFAULT ((0)) FOR [intLocationId]
GO
ALTER TABLE [dbo].[trFPPCard] ADD  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trFPPCard] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intBo__37A5467C]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intBo__38996AB5]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intRo__398D8EEE]  DEFAULT ((0)) FOR [intRoom]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intEn__3A81B327]  DEFAULT ((0)) FOR [intEncodedTick]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intMN__3B75D760]  DEFAULT ((0)) FOR [intMN]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intFa__3C69FB99]  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF__trHotelTr__intLo__3D5E1FD2]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trHotel] ADD  CONSTRAINT [DF_trHotel_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[trLog] ADD  CONSTRAINT [DF__trLog__intBoardN__30F848ED]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trLog] ADD  CONSTRAINT [DF__trLog__intBoardT__31EC6D26]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trLog] ADD  CONSTRAINT [DF__trLog__intLocati__32E0915F]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intBo__29572725]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intBo__2A4B4B5E]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intOn__2B3F6F97]  DEFAULT ((0)) FOR [intOnOff]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intOp__2C3393D0]  DEFAULT ((0)) FOR [intOpNumber]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intSi__2D27B809]  DEFAULT ((0)) FOR [intSign]
GO
ALTER TABLE [dbo].[trLogOnOff] ADD  CONSTRAINT [DF__trLogOnOf__intLo__2E1BDC42]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intBo__1ED998B2]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intBo__1FCDBCEB]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intTr__20C1E124]  DEFAULT ((0)) FOR [intTrNumber]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intOp__21B6055D]  DEFAULT ((0)) FOR [intOperator]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intCa__22AA2996]  DEFAULT ((0)) FOR [intCardNum]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intCo__239E4DCF]  DEFAULT ((0)) FOR [intCode1]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intFl__24927208]  DEFAULT ((0)) FOR [intFlags]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intTy__25869641]  DEFAULT ((0)) FOR [intType]
GO
ALTER TABLE [dbo].[trMonthPayment] ADD  CONSTRAINT [DF__trMonthPa__intLo__267ABA7A]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trnCardPass] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trnCardQuery] ADD  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trSmartCard] ADD  CONSTRAINT [DF__trSmartCa__intBo__060DEAE8]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trSmartCard] ADD  CONSTRAINT [DF__trSmartCa__intBo__07020F21]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trSmartCard] ADD  CONSTRAINT [DF__trSmartCa__intTr__07F6335A]  DEFAULT ((0)) FOR [intTrNum]
GO
ALTER TABLE [dbo].[trSmartCard] ADD  CONSTRAINT [DF__trSmartCa__intLo__08EA5793]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF__trTicketT__intBo__7E6CC920]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF__trTicketT__intBo__7F60ED59]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF__trTicketT__intTi__00551192]  DEFAULT ((0)) FOR [intTickDispNum]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF__trTicketT__intTi__014935CB]  DEFAULT ((0)) FOR [intTickNumber]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF__trTicketT__intLo__023D5A04]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF_trTicket_intNonResCount]  DEFAULT ((0)) FOR [intNonResCount]
GO
ALTER TABLE [dbo].[trTicket] ADD  CONSTRAINT [DF_trTicket_bGeneratedByTrigger]  DEFAULT ((0)) FOR [bGeneratedByTrigger]
GO
ALTER TABLE [dbo].[trUndefined] ADD  CONSTRAINT [DF__trUndefin__intBo__76CBA758]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[trUndefined] ADD  CONSTRAINT [DF__trUndefin__intBo__77BFCB91]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[trUndefined] ADD  CONSTRAINT [DF__trUndefin__intLo__78B3EFCA]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[umsAttachments] ADD  CONSTRAINT [DF_umsAttachments_dtLastUpdate]  DEFAULT (getdate()) FOR [dtLastUpdate]
GO
ALTER TABLE [dbo].[umsMessages] ADD  CONSTRAINT [DF_umsMessages_intRetryCount]  DEFAULT ((0)) FOR [intRetryCount]
GO
ALTER TABLE [dbo].[Vehicles] ADD  CONSTRAINT [DF_Vehicles_intMediaType]  DEFAULT ((4)) FOR [intMediaType]
GO
ALTER TABLE [dbo].[Vehicles] ADD  CONSTRAINT [DF_Vehicles_intFacility]  DEFAULT ((1)) FOR [intFacility]
GO
ALTER TABLE [dbo].[Vehicles] ADD  CONSTRAINT [DF_Vehicles_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[vtTracking] ADD  CONSTRAINT [DF_vtTracking_intArrivalState]  DEFAULT ((0)) FOR [intArrivalState]
GO
ALTER TABLE [dbo].[vtTracking] ADD  CONSTRAINT [DF_vtTracking_intRetrievalState]  DEFAULT ((0)) FOR [intRetrievalState]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  CONSTRAINT [DF_webBarcodeDiscountCards_intUsageCount]  DEFAULT ((0)) FOR [intUsageCount]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  CONSTRAINT [DF_webBarcodeDiscountCards_intMaxUsageCount]  DEFAULT ((-1)) FOR [intMaxUsageCount]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  DEFAULT ((0)) FOR [intReUsePeriod]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  CONSTRAINT [DF_webBarcodeDiscountCards_dtIsueDate]  DEFAULT (getdate()) FOR [dtIssueDate]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  CONSTRAINT [DF_webBarcodeDiscountCards_dtLastDateModified]  DEFAULT (getdate()) FOR [dtLastDateModified]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[webDiscountEventCards] ADD  DEFAULT ((5)) FOR [intDiscountCardUsageType]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  CONSTRAINT [DF_webDiscountEventInfo_intIsActive]  DEFAULT ((0)) FOR [intIsActive]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  CONSTRAINT [DF_webDiscountEventInfo_dtEventRegistered]  DEFAULT (getdate()) FOR [dtEventRegistered]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  CONSTRAINT [DF_webDiscountEventInfo_dtLastDateModified]  DEFAULT (getdate()) FOR [dtLastDateModified]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  DEFAULT ((-1)) FOR [intDiscountUsageCount]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  DEFAULT ((0)) FOR [intDiscountReUsePeriod]
GO
ALTER TABLE [dbo].[webDiscountEventInfo] ADD  DEFAULT ((5)) FOR [intDiscountCardUsageType]
GO
ALTER TABLE [dbo].[webDiscountEventLocations] ADD  DEFAULT ((1)) FOR [intStatus]
GO
ALTER TABLE [dbo].[webDiscountEventLog] ADD  DEFAULT ((0)) FOR [intEventType]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF__webEncoder__intBo__1D114BD1]  DEFAULT ((0)) FOR [intBoardNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF__webEncoder__intBo__1E05700A]  DEFAULT ((0)) FOR [intBoardType]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF__webEncoder__intOp__1EF99443]  DEFAULT ((0)) FOR [intOpNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF__webEncoder__intFa__1FEDB87C]  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intLotNumber]  DEFAULT ((0)) FOR [intLotNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intBatchNumber]  DEFAULT ((0)) FOR [intBatchNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intCarrierNumber]  DEFAULT ((0)) FOR [intCarrierNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intCarrierNumber2]  DEFAULT ((0)) FOR [intDiscountNumber]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intValidityPeriod]  DEFAULT ((0)) FOR [intValidityPeriodInMinutes]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_intUsageCount]  DEFAULT ((0)) FOR [intUsageCount]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF_webEncoderOperations_mnUsageAmount]  DEFAULT ((0)) FOR [mnUsageAmount]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  CONSTRAINT [DF__webEncoder__intLo__20E1DCB5]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[webEncoderOperations] ADD  DEFAULT ((0)) FOR [intActivationStatus]
GO
ALTER TABLE [dbo].[webExternalPaymentConfig] ADD  DEFAULT ((0)) FOR [bIsEnabled]
GO
ALTER TABLE [dbo].[webExternalPaymentRequests] ADD  DEFAULT ((0)) FOR [bIsVoided]
GO
ALTER TABLE [dbo].[webFacilityCodes] ADD  DEFAULT ((1)) FOR [bIsActive]
GO
ALTER TABLE [dbo].[webMapLocationCodeToNesting] ADD  DEFAULT ((0)) FOR [bIsNesting]
GO
ALTER TABLE [dbo].[webRangesDescriptions] ADD  CONSTRAINT [DF_webRangesDescriptions_intLocationID]  DEFAULT ((0)) FOR [intLocationID]
GO
ALTER TABLE [dbo].[webReservations] ADD  CONSTRAINT [DF_webReservations_intUsageCount]  DEFAULT ((0)) FOR [intUsageCount]
GO
ALTER TABLE [dbo].[webReservations] ADD  CONSTRAINT [DF_webReservations_intMaxUsageCount]  DEFAULT ((-1)) FOR [intMaxUsageCount]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((0)) FOR [intReUsePeriod]
GO
ALTER TABLE [dbo].[webReservations] ADD  CONSTRAINT [DF_webReservations_dtIsueDate]  DEFAULT (getdate()) FOR [dtIssueDate]
GO
ALTER TABLE [dbo].[webReservations] ADD  CONSTRAINT [DF_webReservations_dtLastDateModified]  DEFAULT (getdate()) FOR [dtLastDateModified]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((0)) FOR [intEventID]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((0)) FOR [intFacilityCode]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((5)) FOR [intDiscountCardUsageType]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((0)) FOR [bOveragesExternalPayment]
GO
ALTER TABLE [dbo].[webReservations] ADD  DEFAULT ((0)) FOR [intLogInfoID]
GO
ALTER TABLE [dbo].[cfgCardsRanges]  WITH CHECK ADD  CONSTRAINT [FK_cfgCardsRanges_cfgCardsMediaDesc] FOREIGN KEY([intRangeMediaType])
REFERENCES [dbo].[cfgCardsMediaDesc] ([intMediaType])
GO
ALTER TABLE [dbo].[cfgCardsRanges] CHECK CONSTRAINT [FK_cfgCardsRanges_cfgCardsMediaDesc]
GO
ALTER TABLE [dbo].[cfgCardsRanges]  WITH CHECK ADD  CONSTRAINT [FK_cfgCardsRanges_cfgCardsUsageDesc] FOREIGN KEY([intRangeUsageType])
REFERENCES [dbo].[cfgCardsUsageDesc] ([intUsageType])
GO
ALTER TABLE [dbo].[cfgCardsRanges] CHECK CONSTRAINT [FK_cfgCardsRanges_cfgCardsUsageDesc]
GO
ALTER TABLE [dbo].[cmMERCashData]  WITH CHECK ADD  CONSTRAINT [FK_cmMERCashData_cmMERCashDesc] FOREIGN KEY([intCashID])
REFERENCES [dbo].[cmMERCashDesc] ([ID])
GO
ALTER TABLE [dbo].[cmMERCashData] CHECK CONSTRAINT [FK_cmMERCashData_cmMERCashDesc]
GO
ALTER TABLE [dbo].[cmMERCashData]  WITH CHECK ADD  CONSTRAINT [FK_cmMERCashData_cmMERData] FOREIGN KEY([intMnlEntID])
REFERENCES [dbo].[cmMERData] ([ID])
GO
ALTER TABLE [dbo].[cmMERCashData] CHECK CONSTRAINT [FK_cmMERCashData_cmMERData]
GO
ALTER TABLE [dbo].[cmMERTicketData]  WITH CHECK ADD  CONSTRAINT [FK_cmMERTicketData_cmMERData] FOREIGN KEY([intMnlEntID])
REFERENCES [dbo].[cmMERData] ([ID])
GO
ALTER TABLE [dbo].[cmMERTicketData] CHECK CONSTRAINT [FK_cmMERTicketData_cmMERData]
GO
ALTER TABLE [dbo].[cmMERTicketData]  WITH CHECK ADD  CONSTRAINT [FK_cmMERTicketData_cmMERTicketDesc] FOREIGN KEY([intTicketID])
REFERENCES [dbo].[cmMERTicketDesc] ([ID])
GO
ALTER TABLE [dbo].[cmMERTicketData] CHECK CONSTRAINT [FK_cmMERTicketData_cmMERTicketDesc]
GO
ALTER TABLE [dbo].[cwCCNashvilleExtraData]  WITH CHECK ADD  CONSTRAINT [FK_cwCCNashvilleExtraData_cwCCRequest] FOREIGN KEY([intCWID])
REFERENCES [dbo].[cwCCRequest] ([ID])
GO
ALTER TABLE [dbo].[cwCCNashvilleExtraData] CHECK CONSTRAINT [FK_cwCCNashvilleExtraData_cwCCRequest]
GO
ALTER TABLE [dbo].[defAutoApply]  WITH CHECK ADD  CONSTRAINT [FK_defAutoApply_defAutoApplyOn] FOREIGN KEY([intAutoApplyOnID])
REFERENCES [dbo].[defAutoApplyOn] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defAutoApply] CHECK CONSTRAINT [FK_defAutoApply_defAutoApplyOn]
GO
ALTER TABLE [dbo].[defAutoApply]  WITH CHECK ADD  CONSTRAINT [FK_defAutoApply_defDiscounts] FOREIGN KEY([intDiscountID])
REFERENCES [dbo].[defDiscounts] ([ID])
GO
ALTER TABLE [dbo].[defAutoApply] CHECK CONSTRAINT [FK_defAutoApply_defDiscounts]
GO
ALTER TABLE [dbo].[defAutoApplyOn]  WITH CHECK ADD  CONSTRAINT [FK_defAutoApplyOn_defRates] FOREIGN KEY([intRateID])
REFERENCES [dbo].[defRates] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defAutoApplyOn] CHECK CONSTRAINT [FK_defAutoApplyOn_defRates]
GO
ALTER TABLE [dbo].[defChargeTableUnits]  WITH CHECK ADD  CONSTRAINT [FK_defChargeTableUnits_defChargeTables] FOREIGN KEY([intChargeTableID])
REFERENCES [dbo].[defChargeTables] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defChargeTableUnits] CHECK CONSTRAINT [FK_defChargeTableUnits_defChargeTables]
GO
ALTER TABLE [dbo].[defDayPatternTimeExtentChargeTables]  WITH CHECK ADD  CONSTRAINT [FK_defDayPatternTimeExtentChargeTables_defChargeTables] FOREIGN KEY([intChargeTableID])
REFERENCES [dbo].[defChargeTables] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDayPatternTimeExtentChargeTables] CHECK CONSTRAINT [FK_defDayPatternTimeExtentChargeTables_defChargeTables]
GO
ALTER TABLE [dbo].[defDayPatternTimeExtentChargeTables]  WITH CHECK ADD  CONSTRAINT [FK_defDayPatternTimeExtentChargeTables_defDayPatternTimeExtents] FOREIGN KEY([intDayPatternTimeExtentID])
REFERENCES [dbo].[defDayPatternTimeExtents] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDayPatternTimeExtentChargeTables] CHECK CONSTRAINT [FK_defDayPatternTimeExtentChargeTables_defDayPatternTimeExtents]
GO
ALTER TABLE [dbo].[defDayPatternTimeExtents]  WITH CHECK ADD  CONSTRAINT [FK_defDayPatternTimeExtents_defDayPatternTimeLineConditions] FOREIGN KEY([intDayPatternTimeLineConditionID])
REFERENCES [dbo].[defDayPatternTimeLineConditions] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDayPatternTimeExtents] CHECK CONSTRAINT [FK_defDayPatternTimeExtents_defDayPatternTimeLineConditions]
GO
ALTER TABLE [dbo].[defDayPatternTimeLineConditions]  WITH CHECK ADD  CONSTRAINT [FK_defDayPatternTimeLineConditions_defDayPatterns] FOREIGN KEY([intDayPatternID])
REFERENCES [dbo].[defDayPatterns] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDayPatternTimeLineConditions] CHECK CONSTRAINT [FK_defDayPatternTimeLineConditions_defDayPatterns]
GO
ALTER TABLE [dbo].[defDiscountApplianceApply]  WITH CHECK ADD  CONSTRAINT [FK_defDiscountApplianceApply_defDiscountAppliances] FOREIGN KEY([intDiscountAppliancesID])
REFERENCES [dbo].[defDiscountAppliances] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDiscountApplianceApply] CHECK CONSTRAINT [FK_defDiscountApplianceApply_defDiscountAppliances]
GO
ALTER TABLE [dbo].[defDiscountBlackoutDates]  WITH CHECK ADD  CONSTRAINT [FK_defDiscountBlackoutDates_defBlackoutDates] FOREIGN KEY([intBlackoutDateID])
REFERENCES [dbo].[defBlackoutDates] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDiscountBlackoutDates] CHECK CONSTRAINT [FK_defDiscountBlackoutDates_defBlackoutDates]
GO
ALTER TABLE [dbo].[defDiscountBlackoutDates]  WITH CHECK ADD  CONSTRAINT [FK_defDiscountBlackoutDates_defDiscounts] FOREIGN KEY([intDiscountID])
REFERENCES [dbo].[defDiscounts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDiscountBlackoutDates] CHECK CONSTRAINT [FK_defDiscountBlackoutDates_defDiscounts]
GO
ALTER TABLE [dbo].[defDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_defDiscounts_defDiscounts] FOREIGN KEY([intDiscountsID1])
REFERENCES [dbo].[defDiscounts] ([ID])
GO
ALTER TABLE [dbo].[defDiscounts] CHECK CONSTRAINT [FK_defDiscounts_defDiscounts]
GO
ALTER TABLE [dbo].[defDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_defDiscounts_defDiscounts1] FOREIGN KEY([intDiscountsID2])
REFERENCES [dbo].[defDiscounts] ([ID])
GO
ALTER TABLE [dbo].[defDiscounts] CHECK CONSTRAINT [FK_defDiscounts_defDiscounts1]
GO
ALTER TABLE [dbo].[defDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_defDiscounts_defRates] FOREIGN KEY([intRatesID])
REFERENCES [dbo].[defRates] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defDiscounts] CHECK CONSTRAINT [FK_defDiscounts_defRates]
GO
ALTER TABLE [dbo].[defRateConditionDayPattern]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionDayPattern_defDayPatterns] FOREIGN KEY([intDayPatternID])
REFERENCES [dbo].[defDayPatterns] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionDayPattern] CHECK CONSTRAINT [FK_defRateConditionDayPattern_defDayPatterns]
GO
ALTER TABLE [dbo].[defRateConditionDayPattern]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionDayPattern_defRateConditions] FOREIGN KEY([intRateConditionID])
REFERENCES [dbo].[defRateConditions] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionDayPattern] CHECK CONSTRAINT [FK_defRateConditionDayPattern_defRateConditions]
GO
ALTER TABLE [dbo].[defRateConditionDaysInLot]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionDaysInLot_defRateConditions] FOREIGN KEY([intRateConditionID])
REFERENCES [dbo].[defRateConditions] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionDaysInLot] CHECK CONSTRAINT [FK_defRateConditionDaysInLot_defRateConditions]
GO
ALTER TABLE [dbo].[defRateConditionHolidays]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionHolidays_defHolidays] FOREIGN KEY([intHolidaysID])
REFERENCES [dbo].[defHolidays] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionHolidays] CHECK CONSTRAINT [FK_defRateConditionHolidays_defHolidays]
GO
ALTER TABLE [dbo].[defRateConditionHolidays]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionHolidays_defRateConditions] FOREIGN KEY([intRateConditionsID])
REFERENCES [dbo].[defRateConditions] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionHolidays] CHECK CONSTRAINT [FK_defRateConditionHolidays_defRateConditions]
GO
ALTER TABLE [dbo].[defRateConditions]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditions_defRates] FOREIGN KEY([intRatesID])
REFERENCES [dbo].[defRates] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditions] CHECK CONSTRAINT [FK_defRateConditions_defRates]
GO
ALTER TABLE [dbo].[defRateConditionWeekDays]  WITH CHECK ADD  CONSTRAINT [FK_defRateConditionWeekDays_defRateConditions] FOREIGN KEY([intRateConditionID])
REFERENCES [dbo].[defRateConditions] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[defRateConditionWeekDays] CHECK CONSTRAINT [FK_defRateConditionWeekDays_defRateConditions]
GO
ALTER TABLE [dbo].[dpcCarryOvrColumns]  WITH CHECK ADD  CONSTRAINT [FK_dpcCarryOvrColumns_dpcCarryOvr] FOREIGN KEY([intDpcCarryOvr_ID])
REFERENCES [dbo].[dpcCarryOvr] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcCarryOvrColumns] CHECK CONSTRAINT [FK_dpcCarryOvrColumns_dpcCarryOvr]
GO
ALTER TABLE [dbo].[dpcCarryOvrColumns]  WITH CHECK ADD  CONSTRAINT [FK_dpcCarryOvrColumns_dpcColumnTypes] FOREIGN KEY([intColumnType])
REFERENCES [dbo].[dpcColumnTypes] ([intColumnType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcCarryOvrColumns] CHECK CONSTRAINT [FK_dpcCarryOvrColumns_dpcColumnTypes]
GO
ALTER TABLE [dbo].[dpcCfgColumns]  WITH CHECK ADD  CONSTRAINT [FK_dpcCfgColumns_dpcCfgGeneral] FOREIGN KEY([dpcCfgGeneral_ID])
REFERENCES [dbo].[dpcCfgGeneral] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcCfgColumns] CHECK CONSTRAINT [FK_dpcCfgColumns_dpcCfgGeneral]
GO
ALTER TABLE [dbo].[dpcCfgLanes]  WITH CHECK ADD  CONSTRAINT [FK_dpcCfgLanes_dpcCfgGeneral] FOREIGN KEY([dpcCfgGeneral_ID])
REFERENCES [dbo].[dpcCfgGeneral] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcCfgLanes] CHECK CONSTRAINT [FK_dpcCfgLanes_dpcCfgGeneral]
GO
ALTER TABLE [dbo].[dpcColumnAccessLevels]  WITH CHECK ADD  CONSTRAINT [FK_dpcColumnAccessLevels_dpcCarryOvrColumns] FOREIGN KEY([intDpcCarryOvrColumns_ID])
REFERENCES [dbo].[dpcCarryOvrColumns] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcColumnAccessLevels] CHECK CONSTRAINT [FK_dpcColumnAccessLevels_dpcCarryOvrColumns]
GO
ALTER TABLE [dbo].[dpcColumnCardAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dpcColumnCardAccounts_dpcCarryOvrColumns] FOREIGN KEY([intDpcCarryOvrColumns_ID])
REFERENCES [dbo].[dpcCarryOvrColumns] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcColumnCardAccounts] CHECK CONSTRAINT [FK_dpcColumnCardAccounts_dpcCarryOvrColumns]
GO
ALTER TABLE [dbo].[dpcColumnEvents]  WITH CHECK ADD  CONSTRAINT [FK_dpcColumnEvents_dpcCarryOvrColumns] FOREIGN KEY([intDpcCarryOvrColumns_ID])
REFERENCES [dbo].[dpcCarryOvrColumns] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpcColumnEvents] CHECK CONSTRAINT [FK_dpcColumnEvents_dpcCarryOvrColumns]
GO
ALTER TABLE [dbo].[dpWebJobAgentDownloadedCards]  WITH CHECK ADD  CONSTRAINT [FK_dpWebJobAgentDownloadedCards_dpWebJobAgentDownloadInfo] FOREIGN KEY([intDownloadInfoID])
REFERENCES [dbo].[dpWebJobAgentDownloadInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dpWebJobAgentDownloadedCards] CHECK CONSTRAINT [FK_dpWebJobAgentDownloadedCards_dpWebJobAgentDownloadInfo]
GO
ALTER TABLE [dbo].[MerchantConfig]  WITH CHECK ADD  CONSTRAINT [MerchantAccount_MerchantConfig_FK1] FOREIGN KEY([AccID])
REFERENCES [dbo].[MerchantAccount] ([ID])
GO
ALTER TABLE [dbo].[MerchantConfig] CHECK CONSTRAINT [MerchantAccount_MerchantConfig_FK1]
GO
ALTER TABLE [dbo].[msgAlarmTurnState]  WITH CHECK ADD  CONSTRAINT [FK_msgAlarmTurnState_msgAlarmTurnStateDef] FOREIGN KEY([AlarmTurnStateDefId])
REFERENCES [dbo].[msgAlarmTurnStateDef] ([ID])
GO
ALTER TABLE [dbo].[msgAlarmTurnState] CHECK CONSTRAINT [FK_msgAlarmTurnState_msgAlarmTurnStateDef]
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatusPattern]  WITH CHECK ADD  CONSTRAINT [FK_msgDynamicDeviceStatusPattern_msgDynamicDeviceStatusTurnState] FOREIGN KEY([intDynamicDeviceStatusTurnStateId])
REFERENCES [dbo].[msgDynamicDeviceStatusTurnState] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatusPattern] CHECK CONSTRAINT [FK_msgDynamicDeviceStatusPattern_msgDynamicDeviceStatusTurnState]
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatusTurnState]  WITH CHECK ADD  CONSTRAINT [FK_msgDynamicDeviceStatusTurnState_msgDynamicDeviceStatusDef] FOREIGN KEY([intDynamicDeviceStatusDefId])
REFERENCES [dbo].[msgDynamicDeviceStatusDef] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgDynamicDeviceStatusTurnState] CHECK CONSTRAINT [FK_msgDynamicDeviceStatusTurnState_msgDynamicDeviceStatusDef]
GO
ALTER TABLE [dbo].[msgLogExecute]  WITH CHECK ADD  CONSTRAINT [FK_msgLogExecute_msgExecute] FOREIGN KEY([LogId])
REFERENCES [dbo].[msgLog] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgLogExecute] CHECK CONSTRAINT [FK_msgLogExecute_msgExecute]
GO
ALTER TABLE [dbo].[msgMessage]  WITH CHECK ADD  CONSTRAINT [FK_msgMessage_msgConfig] FOREIGN KEY([ConfigId])
REFERENCES [dbo].[msgConfig] ([ID])
GO
ALTER TABLE [dbo].[msgMessage] CHECK CONSTRAINT [FK_msgMessage_msgConfig]
GO
ALTER TABLE [dbo].[msgMessageExecute]  WITH CHECK ADD  CONSTRAINT [FK_msgMessageExecute_msgExecute] FOREIGN KEY([ExecuteId])
REFERENCES [dbo].[msgExecute] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgMessageExecute] CHECK CONSTRAINT [FK_msgMessageExecute_msgExecute]
GO
ALTER TABLE [dbo].[msgMessageExecute]  WITH CHECK ADD  CONSTRAINT [FK_msgMessageExecute_msgMessage] FOREIGN KEY([MessageId])
REFERENCES [dbo].[msgMessage] ([ID])
GO
ALTER TABLE [dbo].[msgMessageExecute] CHECK CONSTRAINT [FK_msgMessageExecute_msgMessage]
GO
ALTER TABLE [dbo].[msgSystemWordLang]  WITH CHECK ADD  CONSTRAINT [FK_msgSystemWordLang_msgSystemWordValue] FOREIGN KEY([intSystemWordValueID])
REFERENCES [dbo].[msgSystemWordValue] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgSystemWordLang] CHECK CONSTRAINT [FK_msgSystemWordLang_msgSystemWordValue]
GO
ALTER TABLE [dbo].[msgSystemWordValue]  WITH CHECK ADD  CONSTRAINT [FK_msgSystemWordValue_msgSystemWord] FOREIGN KEY([intSysWordID])
REFERENCES [dbo].[msgSystemWord] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[msgSystemWordValue] CHECK CONSTRAINT [FK_msgSystemWordValue_msgSystemWord]
GO
ALTER TABLE [dbo].[msgTrPattern]  WITH CHECK ADD  CONSTRAINT [msgMessage_msgTrPattern_FK1] FOREIGN KEY([MessageId])
REFERENCES [dbo].[msgMessage] ([ID])
GO
ALTER TABLE [dbo].[msgTrPattern] CHECK CONSTRAINT [msgMessage_msgTrPattern_FK1]
GO
ALTER TABLE [dbo].[ProviderConfig]  WITH CHECK ADD  CONSTRAINT [Provider_ProviderConfig_FK1] FOREIGN KEY([Key])
REFERENCES [dbo].[Provider] ([Key])
GO
ALTER TABLE [dbo].[ProviderConfig] CHECK CONSTRAINT [Provider_ProviderConfig_FK1]
GO
ALTER TABLE [dbo].[webDiscountEventLocations]  WITH CHECK ADD  CONSTRAINT [FK_webDiscountEventLocations_webDiscountEventInfo] FOREIGN KEY([intEventID])
REFERENCES [dbo].[webDiscountEventInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[webDiscountEventLocations] CHECK CONSTRAINT [FK_webDiscountEventLocations_webDiscountEventInfo]
GO
ALTER TABLE [dbo].[webMerchantsAreasMap]  WITH CHECK ADD  CONSTRAINT [FK_webMerchantsAreasMap_webMerchants] FOREIGN KEY([intMerchantKeyID])
REFERENCES [dbo].[webMerchants] ([intMerchantKeyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[webMerchantsAreasMap] CHECK CONSTRAINT [FK_webMerchantsAreasMap_webMerchants]
GO
ALTER TABLE [dbo].[webMerchantsDiscountsMap]  WITH CHECK ADD  CONSTRAINT [FK_webMerchantsDiscountsMap_webDiscounts] FOREIGN KEY([intDiscountKeyID])
REFERENCES [dbo].[webDiscounts] ([intDiscountKeyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[webMerchantsDiscountsMap] CHECK CONSTRAINT [FK_webMerchantsDiscountsMap_webDiscounts]
GO
ALTER TABLE [dbo].[webMerchantsDiscountsMap]  WITH CHECK ADD  CONSTRAINT [FK_webMerchantsDiscountsMap_webMerchants] FOREIGN KEY([intMerchantKeyID])
REFERENCES [dbo].[webMerchants] ([intMerchantKeyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[webMerchantsDiscountsMap] CHECK CONSTRAINT [FK_webMerchantsDiscountsMap_webMerchants]
GO
/****** Object:  StoredProcedure [dbo].[AddPublication]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPublication]
                @strPubLogin AS nvarchar(100)
                ,@strPubLoginPass AS nvarchar(100)
                ,@strPublicationName AS nvarchar(100)
				,@security_mode AS int
				,@strPublishereLogin AS nvarchar(100)
				,@strPublisheLoginPass AS nvarchar(100)
                
                AS
                BEGIN
				/* Procedure version 1.001 08 feb 2013 made by veselin*/
                SET NOCOUNT ON;
                DECLARE @SQLString nvarchar(1000);
                DECLARE @intRetCode INT 
                DECLARE @intVal INT 
                DECLARE @strVal  nvarchar(100);
				DECLARE @strArticleType  nvarchar(256);
				DECLARE @strArticleOptiones nvarchar(256);
                DECLARE @intID INT 
                SET @intID = 0
                SET @SQLString = 'exec sp_replicationdboption @dbname = N''Datapark'', @optname = N''publish'', @value = N''true'''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec [Datapark].sys.sp_addlogreader_agent @job_login = N'''+@strPubLogin+''', @job_password = N'''+@strPubLoginPass+''', @publisher_security_mode = '+CONVERT(nvarchar(1),@security_mode)
				+', @publisher_login = N'''+@strPublishereLogin+''', @publisher_password = N'''+@strPublisheLoginPass+''''
                EXECUTE sp_executesql @SQLString
				BEGIN TRY
                SET  @SQLString = 'exec [Datapark].sys.sp_addqreader_agent @job_login = null, @job_password = null, @frompublisher = 1'
                EXECUTE sp_executesql @SQLString
				END TRY 
				BEGIN CATCH 
				SET  @SQLString = 'exec [Datapark].sys.sp_changeqreader_agent @job_login = null, @job_password = null, @frompublisher = 1'
                EXECUTE sp_executesql @SQLString
				END CATCH


                SET  @SQLString = 'exec sp_addpublication @publication = N'''+@strPublicationName+''', @description = N''Transactional publication of database Datapark from Publisher .\DPSERVER'', @sync_method = N''concurrent'', @retention = 0, @allow_push = N''true'', @allow_pull = N''true'', @allow_anonymous = N''true'', @enabled_for_internet = N''false'', @snapshot_in_defaultfolder = N''true'', @compress_snapshot = N''false'', @ftp_port = 21, @ftp_login = N''anonymous'', @allow_subscription_copy = N''false'', @add_to_active_directory = N''false'', @repl_freq = N''continuous'', @status = N''active'', @independent_agent = N''true'', @immediate_sync = N''true'', @allow_sync_tran = N''false'', @autogen_sync_procs = N''false'', @allow_queued_tran = N''false'', @allow_dts = N''false'', @replicate_ddl = 1, @allow_initialize_from_backup = N''false'', @enabled_for_p2p = N''false'', @enabled_for_het_sub = N''false'''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec sp_addpublication_snapshot @publication = N'''+@strPublicationName+''', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0'
				+', @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0,'
				+' @job_login = N'''+@strPubLogin+''', @job_password = N'''+@strPubLoginPass+''', @publisher_security_mode = '+CONVERT(nvarchar(1),@security_mode)
				+', @publisher_login = N'''+@strPublishereLogin+''', @publisher_password = N'''+@strPublisheLoginPass+''''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec sp_grant_publication_access @publication = N'''+@strPublicationName+''', @login = N''sa'''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec sp_grant_publication_access @publication = N'''+@strPublicationName+''', @login = N''NT AUTHORITY\SYSTEM'''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec sp_grant_publication_access @publication = N'''+@strPublicationName+''', @login = N'''+ @strPubLogin+''''
                EXECUTE sp_executesql @SQLString
				SET  @SQLString = 'exec sp_grant_publication_access @publication = N'''+@strPublicationName+''', @login = N'''+ @strPublishereLogin+''''
                EXECUTE sp_executesql @SQLString
                SET  @SQLString = 'exec sp_grant_publication_access @publication = N'''+@strPublicationName+''', @login = N''distributor_admin'''
                EXECUTE sp_executesql @SQLString
                SET @intVal = (SELECT COUNT(*) FROM replArticles)
                IF (@intVal > 0) BEGIN
                WHILE (@intID IS NOT NULL) BEGIN
                SET @intID = (SELECT TOP 1 ID FROM replArticles WHERE ID > @intID ORDER BY ID)
                SET @strVal = (SELECT strArticleName FROM replArticles WHERE ID = @intID )
				SET @strArticleType = (SELECT strType FROM replArticles WHERE ID = @intID )
				SET @strArticleOptiones = (SELECT strOptions FROM replArticles WHERE ID = @intID )
                SET  @SQLString = 'exec sp_addarticle @publication =  N'''+@strPublicationName+'''
                , @article = N'''+@strVal+'''
                , @source_owner = N''dbo''
                , @source_object = N'''+@strVal+'''
                , @type = N'''+@strArticleType+'''
                , @description = N''
                , @creation_script = N''
                , @pre_creation_cmd = N''drop''
                , @schema_option = '+@strArticleOptiones +'
                , @identityrangemanagementoption = N''manual''
                , @destination_table = N'''+@strVal+'''
                , @destination_owner = N''dbo''
                , @status = 24
                , @vertical_partition = N''false'''
                SET @intVal = (SELECT intReplInsert FROM replArticles WHERE ID = @intID)
                IF  @intVal = 1 SET  @SQLString = @SQLString + ', @ins_cmd = N''CALL [dbo].[sp_MSins_dbo'+@strVal+']''' ELSE SET  @SQLString = @SQLString + ', @ins_cmd = N''NONE'''
                SET @intVal = (SELECT intReplUpdate FROM replArticles WHERE ID = @intID)
                IF  @intVal = 1 SET  @SQLString = @SQLString + ', @upd_cmd = N''SCALL [dbo].[sp_MSupd_dbo'+@strVal+']''' ELSE SET  @SQLString = @SQLString + ', @upd_cmd = N''NONE'''
                SET @intVal = (SELECT intReplDelete FROM replArticles WHERE ID = @intID)
                IF  @intVal = 1 SET  @SQLString = @SQLString + ', @del_cmd = N''CALL [dbo].[sp_MSdel_dbo'+@strVal+']''' ELSE SET  @SQLString = @SQLString + ', @del_cmd = N''NONE'''
                print  @strVal + ' Article Added'
                EXECUTE sp_executesql @SQLString
                END
                END
                END
GO
/****** Object:  StoredProcedure [dbo].[AddSubscription]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSubscription]
				@strSubServerName AS nvarchar(100)
				,@strSubDBName AS nvarchar(100)
				,@strSubJobLogin AS nvarchar(100)
				,@strSubJobLoginPass AS nvarchar(100)
				,@security_mode AS int
				,@strSubLogin AS nvarchar(100)
				,@strSubLoginPass AS nvarchar(100)
				,@strPublicationName AS nvarchar(100)
				AS
				BEGIN
					SET NOCOUNT ON;
					/* Procedure version 1.001 08 feb 2013 made by veselin*/
	    
				EXEC sp_addsubscription @publication = @strPublicationName
				, @subscriber = @strSubServerName
				, @destination_db = @strSubDBName
				, @subscription_type = N'Push'
				, @sync_type = N'automatic'
				, @article = N'all'
				, @update_mode = N'read only'
				, @subscriber_type = 0

				EXEC sp_addpushsubscription_agent @publication = @strPublicationName
				, @subscriber = @strSubServerName
				, @subscriber_db = @strSubDBName
				, @job_login = @strSubJobLogin
				, @job_password = @strSubJobLoginPass
				, @subscriber_security_mode = @security_mode
				, @subscriber_login = @strSubLogin
				, @subscriber_password = @strSubLoginPass
				, @frequency_type = 64
				, @frequency_interval = 1
				, @frequency_relative_interval = 1
				, @frequency_recurrence_factor = 0
				, @frequency_subday = 4
				, @frequency_subday_interval = 5
				, @active_start_time_of_day = 0
				, @active_end_time_of_day = 235959
				, @active_start_date = 0
				, @active_end_date = 0
				, @dts_package_location = N'Distributor'

				END
GO
/****** Object:  StoredProcedure [dbo].[BatchCloses]    Script Date: 30/12/2019 07:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[BatchCloses]
			@startDate datetime,
			@endDate datetime,
			@mechantID int
		AS
			/* SET NOCOUNT ON */
			
			SELECT *
		FROM oBatches
		WHERE oBatches.Closed  BETWEEN @startDate AND @endDate 
		AND oBatches.MerchantID = @mechantID

		RETURN 
GO
/****** Object:  StoredProcedure [dbo].[BlackList]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[BlackList]
		/*
			(
				@parameter1 datatype = default value,
				@parameter2 datatype OUTPUT
			)
		*/
		AS
			
			SELECT Account, DateWhenAdded
		FROM dbo.oBlacklist
GO
/****** Object:  StoredProcedure [dbo].[ByType]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[ByType]
		/*
			(
				@parameter1 datatype = default value,
				@parameter2 datatype OUTPUT
			)
		*/
			@sDate as datetime,
			@eDate as datetime
		AS
			/* SET NOCOUNT ON */
			SELECT Account, dbo.DolarAmount(Amount,Status)AS ExprAm, dbo.StringToDate(Date,Time) AS ExprDate, Expiration, status, Batch FROM dbo.oBatch
		WHERE dbo.StringToDate(Date,Time ) BETWEEN @sDate AND @eDate and ( Status<>'A')
GO
/****** Object:  StoredProcedure [dbo].[CalculateTimePeriod]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CalculateTimePeriod]
		@dtStartDate  datetime
		,@dtEndDate datetime
		,@intInterval int 

		AS
		BEGIN
				SET NOCOUNT ON;
				DECLARE @tblTimePeriods  TABLE
				(dtDate datetime
				,strDate  nvarchar(10)
				,strHours nvarchar(10)
				,intDateTimeInMin  int  )

				WHILE @dtStartDate < @dtEndDate 
				BEGIN 
				SET @dtStartDate =  DATEADD(minute,@intInterval,@dtStartDate)
				INSERT INTO @tblTimePeriods
				SELECT @dtStartDate
				,CONVERT(nvarchar(10), @dtStartDate, 101)
				,CONVERT(nvarchar(10), @dtStartDate, 108)
				,DateDiff(DAY,'2000-01-01', @dtStartDate)*1440 + DATEPART(HOUR, @dtStartDate)*60 + DATEPART(Minute, @dtStartDate) 
				END

			SELECT dtDate, strDate,strHours, intDateTimeInMin  FROM @tblTimePeriods
		END
GO
/****** Object:  StoredProcedure [dbo].[CCByTypeAmount]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CCByTypeAmount]
/* 
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
	@startDate datetime,
	@endDate datetime
AS
	/* SET NOCOUNT ON */
	SELECT  
		Cash_Amnt=
		CASE CCType
		WHEN 101 THEN Amount 	
		ELSE 0 
		END,
		Cash_Cnt=
		CASE CCType
		WHEN 101 THEN 1
		ELSE 0
		END	,
		
		Visa_Amnt=
		CASE CCType
		WHEN 2 THEN Amount 	
		ELSE 0 
		END,
		Visa_Cnt=
		CASE CCType
		WHEN 2 THEN 1
		ELSE 0
		END,
		
		Master_Amnt=
		CASE CCType
		WHEN 3 THEN Amount 	
		ELSE 0 
		END,
		Master_Cnt=
		CASE CCType
		WHEN 3 THEN 1
		ELSE 0
		END,
		
		AMEX_Amnt=
		CASE CCType
		WHEN 4 THEN Amount 	
		ELSE 0 
		END,
		AMEX_Cnt=
		CASE CCType
		WHEN 4 THEN 1
		ELSE 0
		END	,
		
		Diners_Amnt=
		CASE CCType
		WHEN 8 THEN Amount 	
		ELSE 0 
		END,
		Diners_Cnt=
		CASE CCType
		WHEN 8 THEN 1
		ELSE 0
		END,
		
		Discover_Amnt=
		CASE CCType
		WHEN 6 THEN Amount 	
		ELSE 0 
		END,
		Discover_Cnt=
		CASE CCType
		WHEN 6 THEN 1
		ELSE 0
		END,
		
		Park_Amnt=
		CASE CCType
		WHEN 7 THEN Amount 	
		ELSE 0 
		END,
		Park_Cnt=
		CASE CCType
		WHEN 7 THEN 1
		ELSE 0
		END,							
		
		Other_Amnt=
		CASE
		WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=9) THEN Amount 	
		ELSE 0 
		END,
		Other_Cnt=
		CASE 
		WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=9) THEN 1
		ELSE 0
		END,
		
		repLanes.strLaneName as LaneName,
		dbo.CashCredit.*,
		Status,
		TP=
		CASE Status
		WHEN 'C' THEN 1
		ELSE 0
		END
		
	FROM dbo.CashCredit(@startDate,@endDate) 
	LEFT JOIN repLanes ON dbo.CashCredit.Lane=repLanes.intLane
	RETURN 

GO
/****** Object:  StoredProcedure [dbo].[CCByTypeAmountWithOutParkC]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[CCByTypeAmountWithOutParkC]
		/* 
			(
				@parameter1 datatype = default value,
				@parameter2 datatype OUTPUT
			)
		*/
			@startDate datetime,
			@endDate datetime,
			@merchantID int
		AS
			/* SET NOCOUNT ON */
			SELECT  
				Cash_Amnt=
				CASE CCType
				WHEN 101 THEN Amount 	
				ELSE 0 
				END,
				Cash_Cnt=
				CASE CCType
				WHEN 101 THEN 1
				ELSE 0
				END	,
				
				Visa_Amnt=
				CASE CCType
				WHEN 2 THEN Amount 	
				ELSE 0 
				END,
				Visa_Cnt=
				CASE CCType
				WHEN 2 THEN 1
				ELSE 0
				END,
				
				Master_Amnt=
				CASE CCType
				WHEN 3 THEN Amount 	
				ELSE 0 
				END,
				Master_Cnt=
				CASE CCType
				WHEN 3 THEN 1
				ELSE 0
				END,
				
				AMEX_Amnt=
				CASE CCType
				WHEN 4 THEN Amount 	
				ELSE 0 
				END,
				AMEX_Cnt=
				CASE CCType
				WHEN 4 THEN 1
				ELSE 0
				END	,
				
				Diners_Amnt=
				CASE CCType
				WHEN 8 THEN Amount 	
				ELSE 0 
				END,
				Diners_Cnt=
				CASE CCType
				WHEN 8 THEN 1
				ELSE 0
				END,
				
				Discover_Amnt=
				CASE CCType
				WHEN 6 THEN Amount 	
				ELSE 0 
				END,
				Discover_Cnt=
				CASE CCType
				WHEN 6 THEN 1
				ELSE 0
				END,
				
				Other_Amnt=
				CASE
				WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=7 OR  CCType=9 ) THEN Amount 	
				ELSE 0 
				END,
				Other_Cnt=
				CASE 
				WHEN ( CCType=0 OR CCType=1 OR CCType=5 OR  CCType=7 OR  CCType=9 ) THEN 1
				ELSE 0
				END,
				
				repLanes.strLaneName as LaneName,
				dbo.CashCredit.*,
				Status,
				TP=
				CASE Status
				WHEN 'C' THEN 1
				ELSE 0
				END
				
			FROM dbo.CashCredit(@startDate,@endDate,@merchantID) 
			LEFT JOIN repLanes ON dbo.CashCredit.Lane=repLanes.intLane
			RETURN 
GO
/****** Object:  StoredProcedure [dbo].[CCQuery]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CCQuery]
			/*
				(
					@parameter1 datatype = default value,
					@parameter2 datatype OUTPUT
				)
			*/(
				@sDate datetime,
				@eDate datetime,
				@merchantID int
				)
			AS
				/* SET NOCOUNT ON */
				SELECT dbo.StringToDate(Date,Time) AS tim,dbo.StringToDate(Date,Time) AS dat,
				 dbo.ChargeType(Memo) AS Lane,
				 dbo.DolarAmount(Amount,Status ) AS amount, Account AS Account, Status, Memo, dbo.Type(Status) AS TP
			FROM dbo.oBatch
			WHERE (dbo.StringToDate(Date,Time ) BETWEEN @sDate AND  @eDate) and (Status<>'A')
			AND (@merchantID=MerchantID)
GO
/****** Object:  StoredProcedure [dbo].[CCReportByType]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CCReportByType]
			/*
				(
					@parameter1 datatype = default value,
					@parameter2 datatype OUTPUT
				)
			*/
					@sDate datetime,
					@eDate datetime,
					@merchantID int
			AS
				SELECT CCType as CCType, Account AS Account, dbo.DolarAmount(Amount,Status) AS ExprAm, dbo.StringToDate(Date,Time ) AS ExprDate, Expiration,status, Batch,MerchantID
			FROM oBatch
			WHERE (dbo.StringToDate(Date,Time )) BETWEEN (@sDate) AND (@eDate) and ( Status<>'A')
			AND @merchantID=MerchantID

				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[CCUsageByStation]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CCUsageByStation]
			(
				@InputDate numeric,
				@merchantID int
			)
			AS
			SELECT	CMonth,
					CDate, 
					IsNull(Paystations,0)AS PS ,
					IsNull(FeeComputers,0)AS FC,
					IsNull(CCInOut,0) AS CCin,
					IsNull(TD,0) AS TickDisp,
					IsNull((Paystations+FeeComputers+CCInOut+(TD-CCInOut)),0) AS Total, 
					IsNull((TD-CCInOut),0) AS TickInCCOut,
					IsNull((ALLFee_Cnt),0) AS ALLFee_Cnt
			FROM CCUsageGroupSub(@InputDate,@merchantID) 
			LEFT JOIN TDUsageGroupSub(@InputDate) ON CMonth=TDMonth
			LEFT JOIN TDAllTransactions(@InputDate)ON CMonth=TDMonthAllTr;
			
			
			RETURN 
GO
/****** Object:  StoredProcedure [dbo].[CCUsageSummary]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CCUsageSummary]
			(
			   @InputDate varchar(4),
			   @merchantID int
			)
			AS
				
				Select CCMonth,CCDate,Sum(Visa_Cnt)as Visa,Sum(Master_Cnt)as Master,Sum(AMEX_Cnt)as Amex,Sum(Diners_Cnt)as Diners,Sum(Discover_Cnt) 
				as Discover,count(CCMonth) as Total
				FROM CCUsageSummarySub(@InputDate,@merchantID) GROUP BY CCMonth,CCDate;
				
			RETURN 
GO
/****** Object:  StoredProcedure [dbo].[Charged_Fee_Transactions]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[Charged_Fee_Transactions]
		/*
		(
			@parameter1 datatype = default value,
			@parameter2 datatype OUTPUT
		)
		*/
		@startDate datetime,
		@endDate datetime,
		@merchantID int
		AS
		/* SET NOCOUNT ON */
		SELECT 
		trDPFee.*, 
		oBatch.*, 
		dbo.DolarAmount(oBatch.Amount,oBatch.Status) AS BAmount,
		oBatch.Account AS AccountM, 
		(mnDA1+mnDA2) AS Discount, 
		(CASE
		WHEN intTrType =3 THEN  (mnAmount-(mnDA1+mnDA2))*(-1)
		ELSE mnAmount-(mnDA1+mnDA2)
		END) AS [Charge Amount] ,
		oBatch.MerchantID
		FROM trDPFee LEFT JOIN oBatch ON 
		trDPFee.intCreditTrID=oBatch.FeeId
		AND (trDPFee.intBoardNumber = CAST(LEFT(Memo,2) AS INT))
		AND (trDPFee.intTrNum = CAST(RIGHT(Memo,4) AS INT))
		WHERE ( dtExitDate BETWEEN @startDate AND @endDate)
		AND	(trDPFee.intCreditTrID >0) 
		AND (Status<>'V') 
		AND (trDPFee.intTrType<>'2') 
		AND (trDPFee.intTrType=7 OR trDPFee.intTrMode>3 ) 
		AND (@merchantID=oBatch.MerchantID)
		ORDER BY intBoardNumber, intTrNum
GO
/****** Object:  StoredProcedure [dbo].[cmAllocateOperationNumber]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[cmAllocateOperationNumber]
	@intBoardNumber int,
	@intResult bigint output
AS
BEGIN
	SET NOCOUNT ON;

	SET @intResult = (SELECT max(intLastMaxValue) FROM dbo.cmOperationNumbersPerBoard WHERE intBoardNumber=@intBoardNumber)

	if(@intResult is NULL or @intResult=0) BEGIN
		SET @intResult = 1
		INSERT INTO cmOperationNumbersPerBoard (intBoardNumber, intLastMaxValue) VALUES (@intBoardNumber, @intResult)
	END
	ELSE
	BEGIN
		SET @intResult = @intResult + 1
		UPDATE cmOperationNumbersPerBoard SET intLastMaxValue = @intResult WHERE intBoardNumber = @intBoardNumber
	END

	RETURN @intResult
END
GO
/****** Object:  StoredProcedure [dbo].[ConsolidatedBatch]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[ConsolidatedBatch]
			/*
				(
					@parameter1 datatype = default value,
					@parameter2 datatype OUTPUT
				)
			*/ 
				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				
				SELECT  dbo.Val(Batch) AS Batch, Date, dbo.DolarAmount(Amount,Status)AS amount, Status, Account, memo, dbo.Type(Status) AS TP
				 FROM dbo.oBatch 
			WHERE (dbo.StringToDate(Date, Time) BETWEEN  @startDate and @endDate) AND Status<>'A'
			AND @merchantID = MerchantID 
GO
/****** Object:  StoredProcedure [dbo].[CreditBatchByType]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

				CREATE PROCEDURE [dbo].[CreditBatchByType]
				/*
					(
						@parameter1 datatype = default value,
						@parameter2 datatype OUTPUT
					)
				*/
					@startDate datetime,
					@endDate datetime,
					@merchantID int
				AS
					/* SET NOCOUNT ON */
					
					SELECT 
					Batch,
					Date, 
					Account,
					dbo.DolarAmount(Amount,Status) AS Amount, 
					CCType AS Type,
					Status,
					(CASE
						WHEN CCtype=2 THEN 1
						ELSE 0
					END) AS VisaCnt,
					(CASE
						WHEN CCtype=2 THEN dbo.DolarAmount(Amount,Status)
						ELSE 0
					END) AS VisaAmnt,
					
					(CASE
						WHEN CCtype=3 THEN 1
						ELSE 0
					END) AS MasterCnt,
					(CASE
						WHEN CCtype=3 THEN dbo.DolarAmount(Amount,Status)
						ELSE 0
					END) AS MasterAmnt,
					
					(CASE
						WHEN CCtype=4 THEN 1
						ELSE 0
					END) AS AMEXCnt,
					(CASE
						WHEN CCtype=4 THEN dbo.DolarAmount(Amount,Status)
						ELSE 0
					END) AS AMEXAmnt,
					
					(CASE
						WHEN CCtype=8 THEN 1
						ELSE 0
					END) AS DinersCnt,
					(CASE
						WHEN CCtype=8 THEN dbo.DolarAmount(Amount,Status)
						ELSE 0
					END) AS DinersAmnt,
					
					(CASE
						WHEN CCtype<>2 AND CCtype<>3 AND CCtype<>4 AND CCtype<>8 THEN 1
						ELSE 0
					END) AS OtherCnt,
					(CASE
						WHEN CCtype<>2 AND CCtype<>3 AND CCtype<>4 AND CCtype<>8  THEN dbo.DolarAmount(Amount,Status)
						ELSE 0
					END) AS OtherAmnt,
					dbo.StringToDate(Date, NULL ) AS TrDate, 
					dbo.Type(Status) AS TP
				FROM oBatch
				WHERE (dbo.StringToDate(Date,Time ) BETWEEN @startDate AND @endDate) AND @merchantID=MerchantID
				AND ( Status<>'A' and  Status<>'R')
				ORDER BY Date, Batch

					RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreditBatchByType1]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

					CREATE PROCEDURE [dbo].[CreditBatchByType1]
					
						@startDate datetime,
						@endDate datetime,
						@merchantID int
					AS
						
						
						SELECT 
						Batch, 
						Date,
						Account,
						dbo.DolarAmount(Amount,Status) AS Amount, 
						CCType AS Type,
						Status,
						(CASE
							WHEN CCtype=2 THEN 1
							ELSE 0
						END) AS VisaCnt,
						(CASE
							WHEN CCtype=2 THEN dbo.DolarAmount(Amount,Status)
							ELSE 0
						END) AS VisaAmnt,
						
						(CASE
							WHEN CCtype=3 THEN 1
							ELSE 0
						END) AS MasterCnt,
						(CASE
							WHEN CCtype=3 THEN dbo.DolarAmount(Amount,Status)
							ELSE 0
						END) AS MasterAmnt,
						
						(CASE
							WHEN CCtype=4 THEN 1
							ELSE 0
						END) AS AMEXCnt,
						(CASE
							WHEN CCtype=4 THEN dbo.DolarAmount(Amount,Status)
							ELSE 0
						END) AS AMEXAmnt,
													
						(CASE
							WHEN CCtype<>2 AND CCtype<>3 AND CCtype<>4  THEN 1
							ELSE 0
						END) AS OtherCnt,
						(CASE
							WHEN CCtype<>2 AND CCtype<>3 AND CCtype<>4 THEN dbo.DolarAmount(Amount,Status)
							ELSE 0
						END) AS OtherAmnt,
						dbo.StringToDate(Date, NULL ) AS TrDate, 
						dbo.Type(Status) AS TP
					FROM oBatch
					WHERE (dbo.StringToDate(Date,Time ) BETWEEN @startDate AND @endDate) AND @merchantID=MerchantID
					AND ( Status<>'A' and  Status<>'R') 
					ORDER BY Date, Batch

						RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreditCardsInLot]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CreditCardsInLot]
			
			AS
				SELECT Account, EntryTime
			FROM oCreditInlot 
GO
/****** Object:  StoredProcedure [dbo].[CreditInOutPresence]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CreditInOutPresence]
			-- Add the parameters for the stored procedure here
			@startDate datetime,
			@endDate   datetime
			AS
			BEGIN
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements.
			SET NOCOUNT OFF;

			-- Insert statements for procedure here
			
			SELECT 
				dbo.trCreditCard.intBoardNumber AS EntryLane,
				dbo.trCreditCard.strExpDate AS EntryExpDate,
				CONVERT(nvarchar,EntryDate,101) AS strEntryDate,
				CONVERT(nvarchar,EntryDate,108) AS strEntryTime,
				strExitDate=
				CASE ExitLane
				WHEN 0
				THEN 'in car park'
				ELSE CONVERT(nvarchar,ExitDate,101)
				END,
				strExitTime=
				CASE ExitLane
				WHEN 0
				THEN ''
				ELSE CONVERT(nvarchar,ExitDate,108)
				END,
				CreditInOutPresenceSub_1.* 
			FROM dbo.trCreditCard
			RIGHT JOIN dbo.CreditInOutPresenceSub(@startDate,@endDate)AS CreditInOutPresenceSub_1
			ON (CreditInOutPresenceSub_1.Account = trCreditCard.strAccount
			AND CreditInOutPresenceSub_1.EntryDate = trCreditCard.dtTrDate 
			)
			WHERE  (trCreditCard.intFlags&8=8)
				
			
			END
GO
/****** Object:  StoredProcedure [dbo].[CreditInOutPresenceTotals]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[CreditInOutPresenceTotals]
				-- Add the parameters for the stored procedure here
				@startDate datetime,
				@endDate datetime
			AS
			BEGIN
			-- SET NOCOUNT ON added to prevent extra result sets from
			-- interfering with SELECT statements.
			SET NOCOUNT ON;

			-- Insert statements for procedure here
			SELECT EntryLane AS Lane, Count(0) as Amount_Cnt, Convert(Money,Sum(0)) as Amount_Sum, 'Entry' AS Mode FROM (	
			SELECT 
				dbo.trCreditCard.intBoardNumber AS EntryLane,
				dbo.trCreditCard.strExpDate AS EntryExpDate,
				CONVERT(nvarchar,EntryDate,101) AS strEntryDate,
				CONVERT(nvarchar,EntryDate,108) AS strEntryTime,
				strExitDate=
				CASE ExitLane
				WHEN 0
				THEN 'in car park'
				ELSE CONVERT(nvarchar,ExitDate,101)
				END,
				strExitTime=
				CASE ExitLane
				WHEN 0
				THEN ''
				ELSE CONVERT(nvarchar,ExitDate,108)
				END,
				CreditInOutPresenceSub_1.* 
			FROM dbo.trCreditCard
			RIGHT JOIN dbo.CreditInOutPresenceSub(@startDate,@endDate)AS CreditInOutPresenceSub_1
			ON (CreditInOutPresenceSub_1.Account = trCreditCard.strAccount
			AND CreditInOutPresenceSub_1.EntryDate = trCreditCard.dtTrDate 
			)
			WHERE  (trCreditCard.intFlags&8=8)
			) AS TempEntry
			GROUP BY EntryLane
			UNION ALL
			SELECT ExitLane AS Lane, Count(Amount) as Amount_Cnt, Convert(Money,Sum(Amount))  as Amount_Sum, 'Exit' AS Mode FROM (	
			SELECT 
				dbo.trCreditCard.intBoardNumber AS EntryLane,
				dbo.trCreditCard.strExpDate AS EntryExpDate,
				CONVERT(nvarchar,EntryDate,101) AS strEntryDate,
				CONVERT(nvarchar,EntryDate,108) AS strEntryTime,
				strExitDate=
				CASE ExitLane
				WHEN 0
				THEN 'in car park'
				ELSE CONVERT(nvarchar,ExitDate,101)
				END,
				strExitTime=
				CASE ExitLane
				WHEN 0
				THEN ''
				ELSE CONVERT(nvarchar,ExitDate,108)
				END,
				CreditInOutPresenceSub_1.* 
			FROM dbo.trCreditCard
			RIGHT JOIN dbo.CreditInOutPresenceSub(@startDate,@endDate)AS CreditInOutPresenceSub_1
			ON (CreditInOutPresenceSub_1.Account = trCreditCard.strAccount
			AND CreditInOutPresenceSub_1.EntryDate = trCreditCard.dtTrDate 
			)
			WHERE  (trCreditCard.intFlags&8=8) AND (ExitLane <>0)
			) AS TempEntry
			GROUP BY ExitLane

			--SELECT ExitLane AS Lane, Amount FROM TempEntry
			

			END
GO
/****** Object:  StoredProcedure [dbo].[DetailedBatch]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[DetailedBatch]

			  @startDate datetime,
			  @endDate datetime,
			  @merchantID int
			AS
				
				 SELECT     Batch, Date, Time, Status, Expiration, dbo.DolarAmount(Amount, Status) AS amount, Status AS Expr1, Account, Expiration AS Expr3, LEFT(Memo, 2) 
								  AS Expr2, RIGHT(Memo, 4) AS Expr4, dbo.Type(Status) AS TP, [Authorization], dbo.StringToDate(Date, Time) AS dat
			FROM dbo.oBatch 
			WHERE (dbo.StringToDate(Date, Time) BETWEEN  @startDate and @endDate) AND Status<>'A'
			AND @merchantID= MerchantID
GO
/****** Object:  StoredProcedure [dbo].[DetailedBatchByStation]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[DetailedBatchByStation]

			  @startDate datetime,
			  @endDate datetime,
			  @stNo int,
			  @merchantID int
			AS
				
				 SELECT     Batch, Date, Time, Status, Expiration, dbo.DolarAmount(Amount, Status) AS amount, Status AS Expr1, Account, Expiration AS Expr3, LEFT(Memo, 2) 
								  AS Expr2, RIGHT(Memo, 4) AS Expr4, dbo.Type(Status) AS TP, [Authorization], dbo.StringToDate(Date, Time) AS dat
			FROM dbo.oBatch 
			WHERE (dbo.StringToDate(Date, Time) BETWEEN  @startDate and @endDate ) AND @stNo=CAST(LEFT(Memo, 2) as INT) AND Status<>'A'
			AND @merchantID=MerchantID
GO
/****** Object:  StoredProcedure [dbo].[DetailedBatchTest]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Create procedure/function DetailedBatchTest;1.                                             */


CREATE PROCEDURE [dbo].[DetailedBatchTest]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
  @startDate datetime,
  @endDate datetime
AS
	DECLARE @COMObject as int 
	DECLARE @hr as int
	EXEC  @hr = sp_OACreate 'DPCCEncDec.DPCCEncDec' , @COMObject OUT
	 SELECT     Batch, Date, Time, Status, Expiration, dbo.DolarAmount(Amount, Status) AS amount, Status AS Expr1, dbo.DAccount(@COMObject,Account), Expiration AS Expr3, LEFT(Memo, 2) 
                      AS Expr2, RIGHT(Memo, 4) AS Expr4, dbo.Type(Status) AS TP, [Authorization], dbo.StringToDate(Date, Time) AS dat
FROM dbo.oBatch 
WHERE (dbo.StringToDate(Date, Time) BETWEEN  @startDate and @endDate) AND Status<>'A' 

	 EXEC @hr = sp_OADestroy @COMObject





GO
/****** Object:  StoredProcedure [dbo].[DistRejectionConsBridge]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[DistRejectionConsBridge]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				/* SET NOCOUNT ON */
				Select * from dbo.DistRejectionCons(@startDate,@endDate,@merchantID) 
				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[DistRejectionSum]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[DistRejectionSum]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				/* SET NOCOUNT ON */
				SELECT 
				(CASE 
				WHEN CCType=4 THEN 'AMEX'
				WHEN CCType=7 THEN 'ParkCard'
				ELSE 'Other'
				END) AS Type,
				
				(CASE 
				WHEN CCType=4 THEN 1 
				ELSE 0
				END) AS AMEX_Cnt,
				
				(CASE 
				WHEN CCType=4 THEN Amount 
				ELSE 0
				END) AS AMEX_Amnt,
				
				(CASE 
				WHEN CCType=7 THEN 1 
				ELSE 0
				END) AS Park_Cnt,
				
				(CASE 
				WHEN CCType=7 THEN Amount 
				ELSE 0
				END) AS Park_Amnt,
				
				(CASE 
				WHEN CCType<>4 and CCType<>7  THEN 1 
				ELSE 0
				END) AS Other_Cnt,
				
				(CASE 
				WHEN CCType<>4 and CCType<>7 THEN Amount 
				ELSE 0
				END) AS Other_Amnt,
				Amount
				
				
				/*IIf(Type="AMEX",DistinctOut.Amount,0) AS AMEX_Amnt, IIf(Type="AMEX",1,0) AS AMEX_Cnt, IIf(Type="Park Card",DistinctOut.Amount,0) AS Park_Amnt, IIf(Type="Park Card",1,0) AS Park_Cnt, IIf(Type="Other",DistinctOut.Amount,0) AS Other_Amnt,
				IIf(Type="Other",1,0) AS Other_Cnt, *  */
			FROM dbo.DistRejectionCons(@startDate,@endDate,@merchantID);
				
				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[DistRessubmAll]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[DistRessubmAll]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				SELECT DISTINCT 
					oRejectedLog.Account as RejAcnt, 
					oRejectedLog.CCType as RejCCType, 
					oRejectedLog.ExpirationDate, 
					oRejectedLog.ReasonCode , 
					oRejectedLog.LaneNumber, 
					oRejectedLog.InvoiceNumber, 
					oBatch.Account, 
					oBatch.Memo, 
					dbo.DolarAmount(oBatch.Amount,oBatch.Status) as Amount,
					oBatch.Date, 
					oBatch.CCType AS Type,
					(CASE 
					WHEN oBatch.CCType=4 THEN dbo.DolarAmount(oBatch.Amount,oBatch.Status)
					ELSE 0
					END ) AS AMEX_Amnt,
					(CASE 
					WHEN oBatch.CCType=4 THEN 1
					ELSE 0
					END ) AS AMEX_Cnt,
					
					(CASE 
					WHEN oBatch.CCType=7 THEN dbo.DolarAmount(oBatch.Amount,oBatch.Status)
					ELSE 0
					END ) AS Park_Amnt,
					(CASE 
					WHEN oBatch.CCType=7 THEN 1
					ELSE 0
					END ) AS Park_Cnt,
					
					(CASE 
					WHEN oBatch.CCType<>7 AND oBatch.CCType<>4 THEN dbo.DolarAmount(oBatch.Amount,oBatch.Status)
					ELSE 0
					END ) AS Other_Amnt,
					(CASE 
					WHEN oBatch.CCType<>7 AND oBatch.CCType<>4 THEN 1
					ELSE 0
					END ) AS Other_Cnt
					
					  
					
			FROM oRejectedLog LEFT JOIN oBatch ON  (oRejectedLog.Account = oBatch.Account)
			AND  ( oRejectedLog.LaneNumber=   dbo.Val( Left(Memo ,2)))  
			AND  ( oRejectedLog.InvoiceNumber=   dbo.Val( Right(Memo ,4)))
			WHERE ( oRejectedLog.Time BETWEEN @startDate AND @endDate) 
			AND (SUBSTRING(Memo,3,1)='_')
			AND @merchantID = oRejectedLog.MerchantID
				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[dpPayStationBalance]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dpPayStationBalance]

 @intLastID AS INT,
 @SelectedLanes AS INT
AS
BEGIN
SET NOCOUNT ON;

IF @intLastID IS NULL RETURN;

;WITH cte_PSBalance AS (
SELECT 
[intID]
,[intID_IN_CR]
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_1])/100) AS intHOPP_NOMINAL_1
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_2])/100) AS intHOPP_NOMINAL_2
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_3])/100) AS intHOPP_NOMINAL_3
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_4])/100) AS intHOPP_NOMINAL_4
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_5])/100) AS intHOPP_NOMINAL_5
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_6])/100) AS intHOPP_NOMINAL_6
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_7])/100) AS intHOPP_NOMINAL_7
,CONVERT(MONEY,CONVERT(REAL,[intHOPP_NOMINAL_8])/100) AS intHOPP_NOMINAL_8
,[intB_HOPP_CNT_1]
,[intB_HOPP_CNT_2]
,[intB_HOPP_CNT_3]
,[intB_HOPP_CNT_4]
,[intB_HOPP_CNT_5]
,[intB_HOPP_CNT_6]
,[intB_HOPP_CNT_7]
,[intB_HOPP_CNT_8]
,[intE_HOPP_CNT_1]
,[intE_HOPP_CNT_2]
,[intE_HOPP_CNT_3]
,[intE_HOPP_CNT_4]
,[intE_HOPP_CNT_5]
,[intE_HOPP_CNT_6]
,[intE_HOPP_CNT_7]
,[intE_HOPP_CNT_8]
, dprCashReconciliation.*
FROM dprCashReconciliation 
INNER JOIN dprHopperBalance 
ON dprCashReconciliation.intUNQ_ID = dprHopperBalance.intID_IN_CR
WHERE intUNQ_ID > @intLastID AND dprCashReconciliation.intMACHINEID IN (@SelectedLanes)
)
SELECT * 
,mnHoppersAmount + mnCoinSafeAmount + mnBillAcceptorAmount + mnBillDispenserAmount AS mnPayStationBalance
FROM (
SELECT 
cte_PSBalance.intUNQ_ID
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID]
,[intAUDIT_NO]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
,[intHOPP_NOMINAL_1]*[intE_HOPP_CNT_1]
+[intHOPP_NOMINAL_2]*[intE_HOPP_CNT_2]
+[intHOPP_NOMINAL_3]*[intE_HOPP_CNT_3]
+[intHOPP_NOMINAL_4]*[intE_HOPP_CNT_4]
+[intHOPP_NOMINAL_5]*[intE_HOPP_CNT_5]
+[intHOPP_NOMINAL_6]*[intE_HOPP_CNT_6]
+[intHOPP_NOMINAL_7]*[intE_HOPP_CNT_7]
+[intHOPP_NOMINAL_8]*[intE_HOPP_CNT_8] AS mnHoppersAmount
,[intE_SAFE_COINS05]*CONVERT(MONEY,0.05) 
+[intE_SAFE_COINS10]*CONVERT(MONEY,0.1) 
+[intE_SAFE_COINS20]*CONVERT(MONEY,0.2) 
+[intE_SAFE_COINS25]*CONVERT(MONEY,0.25) 
+[intE_SAFE_COINS50]*CONVERT(MONEY,0.5) 
+[intE_SAFE_COINS100]*CONVERT(MONEY,1) 
+[intE_SAFE_COINS200]*CONVERT(MONEY,2) AS mnCoinSafeAmount
,[intENOTES1]*CONVERT(MONEY,1)
+[intENOTES2]*CONVERT(MONEY,2)
+[intENOTES5]*CONVERT(MONEY,5)
+[intENOTES10]*CONVERT(MONEY,10)
+[intENOTES20]*CONVERT(MONEY,20)
+[intENOTES50]*CONVERT(MONEY,50)
+[intENOTES100]*CONVERT(MONEY,100) AS mnBillAcceptorAmount
,[intEDISPNOTES1]*CONVERT(MONEY,1)
+[intEDISPNOTES5]*CONVERT(MONEY,5)
+[intEDISPNOTES10]*CONVERT(MONEY,10)
+[intEDISPNOTES20]*CONVERT(MONEY,20) AS mnBillDispenserAmount
FROM cte_PSBalance
) AS PaySationBalance
END 
GO
/****** Object:  StoredProcedure [dbo].[dpPayStationBillAcceptorsBalance]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dpPayStationBillAcceptorsBalance]

 @intLastID AS INT,
 @SelectedLanes AS INT
AS
BEGIN
SET NOCOUNT ON;

IF @intLastID IS NULL RETURN;

;WITH cte_PSBalance AS (
SELECT  dprCashReconciliation.*
FROM dprCashReconciliation 
WHERE intUNQ_ID > @intLastID AND dprCashReconciliation.intMACHINEID IN (@SelectedLanes)
)
,cte_BillsBeforeState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(Bills,'intBNOTES',''))) AS mnBillsNominal
,intBeforeState
FROM cte_PSBalance
UNPIVOT (
intBeforeState  FOR Bills IN (
[intBNOTES1]
,[intBNOTES2]
,[intBNOTES5]
,[intBNOTES10]
,[intBNOTES20]
,[intBNOTES50]
,[intBNOTES100])
) unpvt_CoinSafe
)
,cte_BillsAfterState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(Bills,'intENOTES',''))) AS mnBillsNominal
,intAfterState
FROM cte_PSBalance
UNPIVOT (
intAfterState  FOR Bills IN (
[intENOTES1]
,[intENOTES2]
,[intENOTES5]
,[intENOTES10]
,[intENOTES20]
,[intENOTES50]
,[intENOTES100])
) unpvt_CoinSafe
)

/*===========================================================*/
SELECT 
cte_PSBalance.intUNQ_ID
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID]
,[intAUDIT_NO]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
,cte_BillsBeforeState.mnBillsNominal
,cte_BillsBeforeState.intBeforeState
,intBeforeState * cte_BillsBeforeState.mnBillsNominal AS mnBeforeState 
,cte_BillsAfterState.intAfterState
,intAfterState* cte_BillsBeforeState.mnBillsNominal AS mnAfterState
FROM  cte_PSBalance
LEFT JOIN cte_BillsBeforeState
ON cte_PSBalance.intUNQ_ID = cte_BillsBeforeState.intUNQ_ID
LEFT JOIN cte_BillsAfterState
ON cte_PSBalance.intUNQ_ID = cte_BillsAfterState.intUNQ_ID
AND cte_BillsBeforeState.mnBillsNominal = cte_BillsAfterState.mnBillsNominal

END
GO
/****** Object:  StoredProcedure [dbo].[dpPayStationBillDispencersBalance]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dpPayStationBillDispencersBalance]

 @intLastID AS INT,
 @SelectedLanes AS INT
AS
BEGIN
SET NOCOUNT ON;

IF @intLastID IS NULL RETURN;

;WITH cte_PSBalance AS (
SELECT  dprCashReconciliation.*
FROM dprCashReconciliation 
WHERE intUNQ_ID > @intLastID AND dprCashReconciliation.intMACHINEID IN (@SelectedLanes)
)
,cte_DISPBillsBeforeState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(DISPBills,'intBDISPNOTES',''))) AS mnBillsNominal
,intBeforeState
FROM cte_PSBalance
UNPIVOT (
intBeforeState  FOR DISPBills IN (
[intBDISPNOTES1]
,[intBDISPNOTES5]
,[intBDISPNOTES10]
,[intBDISPNOTES20])
) unpvt_CoinSafe )
,cte_DISPBillsAfterState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(Bills,'intEDISPNOTES',''))) AS mnBillsNominal
,intAfterState
FROM cte_PSBalance
UNPIVOT (
intAfterState  FOR Bills IN (
[intEDISPNOTES1]
,[intEDISPNOTES5]
,[intEDISPNOTES10]
,[intEDISPNOTES20])
) unpvt_CoinSafe )

/*===========================================================*/
SELECT 
cte_PSBalance.intUNQ_ID
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID]
,[intAUDIT_NO]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
,cte_DISPBillsBeforeState.mnBillsNominal
,cte_DISPBillsBeforeState.intBeforeState
,intBeforeState * cte_DISPBillsBeforeState.mnBillsNominal AS mnBeforeState 
,cte_DISPBillsAfterState.intAfterState
,intAfterState* cte_DISPBillsBeforeState.mnBillsNominal AS mnAfterState
FROM  cte_PSBalance
LEFT JOIN cte_DISPBillsBeforeState
ON cte_PSBalance.intUNQ_ID = cte_DISPBillsBeforeState.intUNQ_ID
LEFT JOIN cte_DISPBillsAfterState
ON cte_PSBalance.intUNQ_ID = cte_DISPBillsAfterState.intUNQ_ID
AND cte_DISPBillsBeforeState.mnBillsNominal = cte_DISPBillsAfterState.mnBillsNominal
END
GO
/****** Object:  StoredProcedure [dbo].[dpPayStationCoinSafeBalance]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dpPayStationCoinSafeBalance] 

 @intLastID AS INT,
 @SelectedLanes AS INT
AS
BEGIN
SET NOCOUNT ON;

IF @intLastID IS NULL RETURN;

;WITH cte_PSBalance AS (
SELECT
 dprCashReconciliation.*
FROM dprCashReconciliation 
WHERE intUNQ_ID > @intLastID
AND 
(dprCashReconciliation.intMACHINEID IN (@SelectedLanes) OR @SelectedLanes IS NULL)
)
,cte_CoinSafeBeforeState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(CoinSafe,'intB_SAFE_COINS',''))/100) AS mnCoinSafeNominal
,intBeforeState
FROM cte_PSBalance
UNPIVOT (
intBeforeState  FOR CoinSafe IN (
[intB_SAFE_COINS05]
,[intB_SAFE_COINS10]
,[intB_SAFE_COINS20]
,[intB_SAFE_COINS25]
,[intB_SAFE_COINS50]
,[intB_SAFE_COINS100]
,[intB_SAFE_COINS200])
) unpvt_CoinSafe
)
,cte_CoinSafeAfterState AS (
SELECT
 intUNQ_ID
,CONVERT(MONEY,CONVERT(REAL,REPLACE(CoinSafe,'intE_SAFE_COINS',''))/100) AS mnCoinSafeNominal
,intAfterState
FROM cte_PSBalance
UNPIVOT (
intAfterState  FOR CoinSafe IN (
[intE_SAFE_COINS05]
,[intE_SAFE_COINS10]
,[intE_SAFE_COINS20]
,[intE_SAFE_COINS25]
,[intE_SAFE_COINS50]
,[intE_SAFE_COINS100]
,[intE_SAFE_COINS200])
) unpvt_CoinSafe
)

/*===========================================================*/
SELECT 
cte_PSBalance.intUNQ_ID
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID]
,[intAUDIT_NO]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
,cte_CoinSafeBeforeState.mnCoinSafeNominal
,cte_CoinSafeBeforeState.intBeforeState
,intBeforeState * cte_CoinSafeBeforeState.mnCoinSafeNominal AS mnBeforeState 
,cte_CoinSafeAfterState.intAfterState
,intAfterState* cte_CoinSafeBeforeState.mnCoinSafeNominal AS mnAfterState
FROM  cte_PSBalance
LEFT JOIN cte_CoinSafeBeforeState
ON cte_PSBalance.intUNQ_ID = cte_CoinSafeBeforeState.intUNQ_ID
LEFT JOIN cte_CoinSafeAfterState
ON cte_PSBalance.intUNQ_ID = cte_CoinSafeAfterState.intUNQ_ID
AND cte_CoinSafeBeforeState.mnCoinSafeNominal = cte_CoinSafeAfterState.mnCoinSafeNominal
END
GO
/****** Object:  StoredProcedure [dbo].[dpPayStationHoppersBalance]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dpPayStationHoppersBalance]

 @intLastID AS INT,
 @SelectedLanes AS INT
AS
BEGIN
SET NOCOUNT ON;

IF @intLastID IS NULL RETURN;

;WITH cte_PSBalance AS (
SELECT 
[intID]
,[intID_IN_CR]
,[intHOPP_NOMINAL_1]
,[intHOPP_NOMINAL_2]
,[intHOPP_NOMINAL_3]
,[intHOPP_NOMINAL_4]
,[intHOPP_NOMINAL_5]
,[intHOPP_NOMINAL_6]
,[intHOPP_NOMINAL_7]
,[intHOPP_NOMINAL_8]
,[intB_HOPP_CNT_1]
,[intB_HOPP_CNT_2]
,[intB_HOPP_CNT_3]
,[intB_HOPP_CNT_4]
,[intB_HOPP_CNT_5]
,[intB_HOPP_CNT_6]
,[intB_HOPP_CNT_7]
,[intB_HOPP_CNT_8]
,[intE_HOPP_CNT_1]
,[intE_HOPP_CNT_2]
,[intE_HOPP_CNT_3]
,[intE_HOPP_CNT_4]
,[intE_HOPP_CNT_5]
,[intE_HOPP_CNT_6]
,[intE_HOPP_CNT_7]
,[intE_HOPP_CNT_8]
, dprCashReconciliation.[intUNQ_ID]
,[dtPDATE_Added]
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID]
,[intAUDIT_NO]
,[fltPREVIOUS_HOPPER_TOTAL]
,[fltCURRENT_HOPPER_TOTAL]
,[fltHOPPER_VARIANCE]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
FROM dprCashReconciliation 
INNER JOIN dprHopperBalance 
ON dprCashReconciliation.intUNQ_ID = dprHopperBalance.intID_IN_CR
WHERE intUNQ_ID > @intLastID AND dprCashReconciliation.intMACHINEID IN (@SelectedLanes)

)
,cte_HoppersNominals AS 
(
SELECT unpvt_Hoppers.intID_IN_CR
,CONVERT(INT,RIGHT(HoppersNumber,1)) AS intCoinHopperNumber
,CONVERT(MONEY,CONVERT(REAL,intNominal)/100) AS mnNominal
FROM cte_PSBalance
UNPIVOT (
intNominal  FOR HoppersNumber IN (
[intHOPP_NOMINAL_1]
,[intHOPP_NOMINAL_2]
,[intHOPP_NOMINAL_3]
,[intHOPP_NOMINAL_4]
,[intHOPP_NOMINAL_5]
,[intHOPP_NOMINAL_6]
,[intHOPP_NOMINAL_7]
,[intHOPP_NOMINAL_8])
) unpvt_Hoppers
)
 
,cte_HoppersBState AS
(
SELECT intID_IN_CR
,CONVERT(INT,RIGHT(HoppersNumber,1)) AS intCoinHopperNumber
,intBState
FROM cte_PSBalance
UNPIVOT (
intBState  FOR HoppersNumber IN (
[intB_HOPP_CNT_1]
,[intB_HOPP_CNT_2]
,[intB_HOPP_CNT_3]
,[intB_HOPP_CNT_4]
,[intB_HOPP_CNT_5]
,[intB_HOPP_CNT_6]
,[intB_HOPP_CNT_7]
,[intB_HOPP_CNT_8])
) unpvt_HoppersBState
)
,cte_HoppersEState AS
(
SELECT intID_IN_CR
,CONVERT(INT,RIGHT(HoppersNumber,1)) AS intCoinHopperNumber
,intEState
FROM cte_PSBalance
UNPIVOT (
intEState  FOR HoppersNumber IN (
[intE_HOPP_CNT_1]
,[intE_HOPP_CNT_2]
,[intE_HOPP_CNT_3]
,[intE_HOPP_CNT_4]
,[intE_HOPP_CNT_5]
,[intE_HOPP_CNT_6]
,[intE_HOPP_CNT_7]
,[intE_HOPP_CNT_8])
) unpvt_HoppersEState
)
/*===============================================================*/
SELECT 
intUNQ_ID
,[dtPDATE_Start]
,[dtPDATE_End]
,[intMACHINEID] AS intBoardNumber
,[intAUDIT_NO]
,[intSERVICE_CARD]
,[intDATA_SOURCE]
,intCoinHopperNumber
,mnNominal
,intBState AS intBeforeState
,intBState*mnNominal AS mnBeforeState
,intEState AS intEndState
,intEState*mnNominal AS mnEndState
FROM 
(
SELECT cte_HoppersNominals.intID_IN_CR
,cte_HoppersNominals.intCoinHopperNumber
,mnNominal
,intBState
,intEState
FROM cte_HoppersNominals
LEFT JOIN cte_HoppersBState
ON cte_HoppersNominals.intID_IN_CR = cte_HoppersBState.intID_IN_CR
AND  cte_HoppersNominals.intCoinHopperNumber = cte_HoppersBState.intCoinHopperNumber
LEFT JOIN cte_HoppersEState
ON cte_HoppersNominals.intID_IN_CR = cte_HoppersEState.intID_IN_CR
AND  cte_HoppersNominals.intCoinHopperNumber = cte_HoppersEState.intCoinHopperNumber
WHERE mnNominal > 0
) AS HopperBalanceInfomation
LEFT JOIN cte_PSBalance
ON cte_PSBalance.intUNQ_ID = HopperBalanceInfomation.intID_IN_CR
END
GO
/****** Object:  StoredProcedure [dbo].[FindCardInBatch]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[FindCardInBatch]


				@strAccount  varchar(255),
				@sDate datetime,
				@eDate datetime
			AS
				SELECT Batch, Account, Expiration, 
				dbo.DolarAmount(Amount,Status) AS amount, 
				Memo, Status,  dbo.StringToDate( Date,Time ) AS dat, MerchantID
			FROM dbo.oBatch 
			WHERE Account=@strAccount AND dbo.StringToDate(Date,Time)  Between @sDate And @eDate;

				/* SET NOCOUNT ON */
				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[FindCardInBatchFeeMatch]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

				CREATE PROCEDURE [dbo].[FindCardInBatchFeeMatch]
				@strAccount  varchar(255),
				@sDate datetime,
				@eDate datetime
					
				AS
				SELECT dpFee.dtEntryDate,Batch.ChargeDate,dpFee.intTickDispenser ,
				 dpFee.intTickNumber, Batch.Account, 
				 Batch.Expiration, Batch.Amount, Batch.Batch, Batch.Status,
				 Batch.Board, Batch.TrNum, Batch. MerchantID, Batch.Memo
				 FROM	
				(SELECT Batch, Account, Expiration, 
					dbo.DolarAmount(Amount,Status) AS Amount, 
					Memo, CAST(LEFT(Memo, 2) as INT) AS Board,
					CAST(Right(Memo, 4) as INT) AS TrNum,
					Status,  dbo.StringToDate( Date,Time ) AS ChargeDate, FeeID, MerchantID
				FROM dbo.oBatch 
				WHERE Account=@strAccount AND dbo.StringToDate(Date,Time)  Between @sDate And @eDate
				) as Batch

				LEFT JOIN (select *, (mnAmount - (mnDA1 + mnDA2)) AS totAmnt from trDPFee 
				WHERE (dtExitDate  Between @sDate AND @eDate)
				AND intTrMode > 3 
				AND intTrType <>2
				) AS dpFee

				ON Batch.FeeID = dpFee.intCreditTrId 
				AND Batch.Board = dpFee.intBoardNumber 
				AND Batch.TrNum = dpFee.intTrNum
				AND Batch.amount = dpFee.totAmnt;

					/* SET NOCOUNT ON */
				RETURN 
				
GO
/****** Object:  StoredProcedure [dbo].[FindCardInRejection]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[FindCardInRejection]

				@strAccount  varchar(255),
				@sDate datetime,
				@eDate datetime
			AS
				/* SET NOCOUNT ON */
				
			SELECT Account, Time, oRejectedLog.ReasonCode, CreditTrTime, LaneNumber, Amount, InvoiceNumber, Description, MerchantID
			FROM oRejectedLog INNER JOIN oRejectionReasons ON oRejectedLog.ReasonCode=oRejectionReasons.ReasonCode
			WHERE (((oRejectedLog.Account)=@strAccount) And ((oRejectedLog.Time) Between @sDate And @eDate+1))
GO
/****** Object:  StoredProcedure [dbo].[FlowLimitRejections]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[FlowLimitRejections]

					@sDate as datetime,
					@eDate as datetime,
					@flowLimit as int,
					@merchantID as int
			AS
				
				SELECT dbo.oRejectedLog.Time, dbo.oRejectedLog.Account AS Account, 
				dbo.oRejectedLog.CreditCardType, dbo.oRejectedLog.ExpirationDate, 
				dbo.oRejectedLog.ReasonCode, dbo.oRejectedLog.CreditTrTime,
				 dbo.oRejectedLog.LaneNumber, dbo.oRejectedLog.Amount, 
				 dbo.oRejectedLog.InvoiceNumber, dbo.oRejectedLog.Status, 
				 dbo.oRejectionReasons.Description
			FROM dbo.oRejectedLog LEFT JOIN dbo.oRejectionReasons ON dbo.oRejectedLog.Reasoncode=dbo.oRejectionReasons.reasoncode
			WHERE ([amount]<@flowLimit And [time]>=@sDate And [time]<=@eDate)
			AND @merchantID = MerchantID;
			RETURN 
GO
/****** Object:  StoredProcedure [dbo].[Gen_Fee_Transactions]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

		CREATE PROCEDURE [dbo].[Gen_Fee_Transactions]

		@startDate datetime,
		@endDate	datetime,
		@merchantID int
		AS
		
		SELECT 
			trDPFee.*,
			(mnDA1 +mnDA2) AS Discount,
			 (mnAmount-(mnDA1 +mnDA2))  AS FeeAmount
		FROM trDPFee
		WHERE (dtExitDate BETWEEN @startDate AND @endDate ) 
		AND (intCreditTrID >0) AND (intTrType<>2) 
		AND (intTrType=7 OR intTrMode>3 ) 
		AND (
		trDPFee.intBoardNumber IN (SELECT BoardNum FROM BoardToMerchantAccount WHERE @merchantID =MerchantAccountID)
		OR @merchantID=0
		)
		ORDER BY intBoardNumber, intTrNum
GO
/****** Object:  StoredProcedure [dbo].[getHotelEncoderDevices]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getHotelEncoderDevices]
	AS
	BEGIN	
		SET NOCOUNT ON;
    
		SELECT intControllerUID as ControllerUID, intControllerID as BoardNumber, varValue as Name 
		FROM cfgVarControllersData
		WHERE (intPropertyID = 138) 
		AND (intControllerUID in (SELECT intControllerUID FROM cfgVarControllersData WHERE (intPropertyID=100405) AND (CAST(varValue as bit) = 1) ))
		AND (intControllerUID in (SELECT varValue FROM cfgVarGates WHERE intPropertyID = 302))
	END
GO
/****** Object:  StoredProcedure [dbo].[getHotelOperatorsData]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getHotelOperatorsData]
	AS
	BEGIN
	SET NOCOUNT ON;

	SELECT intOperNumber, strPassword, strOperName FROM cfgSystemOps WHERE bHotelOperatorType=1 AND bIsActive=1 ORDER BY intOperNumber
	END
GO
/****** Object:  StoredProcedure [dbo].[Incorrect_Fee_Charges]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[Incorrect_Fee_Charges]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				/* SET NOCOUNT ON */
				
				SELECT 
					oBatch.*,
					trDPFee.*, 
					dbo.DolarAmount(Amount,Status) AS BAmount, 
					Account AS AccountM, 
					(mnDA1+mnDA2) AS Discount, 
					(mnAmount-(mnDA1+mnDA2)) AS [Charge Amount]
			FROM oBatch LEFT JOIN trDPFee ON oBatch.FeeId = trDPFee.intCreditTrID
			WHERE (dbo.StringToDate(Date,Time ) BETWEEN  @startDate AND @endDate   ) 
			AND  (oBatch.FeeId>0)  
			AND (oBatch.FeeId  IN
					(SELECT FeeId FROM (SELECT Count(FeeId) AS cnt, FeeId
									FROM oBatch Group   By FeeId) AS [tmp]
									WHERE cnt >1
					)		
				)
			 AND (@merchantID=oBatch.MerchantID)
			ORDER BY oBatch.FeeId, oBatch.Status

				RETURN
GO
/****** Object:  StoredProcedure [dbo].[Mon_Man_Charges]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[Mon_Man_Charges]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				SELECT 
					oBatch.*,
					dbo.DolarAmount(Amount,Status ) AS BAmount,
					Account AS AccountM,
					dbo.StringToDate(Date,Time ) AS dat
			FROM oBatch
			WHERE oBatch.FeeId =0 
			AND @merchantID=oBatch.MerchantID
			AND (dbo.StringToDate(Date,Time) BETWEEN  @startDate AND @endDAte )

				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[MonthlyBatch]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[MonthlyBatch]
				
				
				@intMonth int,
				@intYear int,
				@merchantID int
			AS
				
				SELECT  dbo.Val(Batch) AS Batch, Date, dbo.DolarAmount(Amount,Status)AS amount, Status, Account, memo, dbo.Type(Status) AS TP
				 FROM dbo.oBatch 
			WHERE ((dbo.Val(Left(Date,2)))=@intMonth AND (2000+ dbo.Val(Right(Date,2))) = @intYear ) AND Status<>'A'
			AND @merchantID=MerchantID
GO
/****** Object:  StoredProcedure [dbo].[Pending_Fee_Transactions]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[Pending_Fee_Transactions]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				SELECT 
					trDPFee.*, 
					/*oPendingTransactions.*, */
					(oPendingTransactions.Amount ) AS BAmount,
					(oPendingTransactions.Account) AS AccountM,
					(mnDA1+mnDA2) AS Discount,
					(mnAmount-(mnDA1+mnDA2)) AS [Charge Amount]
			FROM trDPFee LEFT JOIN oPendingTransactions ON trDPFee.intCreditTrId=oPendingTransactions.FeeId
			WHERE ( dtExitDate BETWEEN @startDate AND @endDATE) 
			AND (intCreditTrId >0)   
			AND (intTrType<>2) 
			AND oPendingTransactions.FeeId IS NOT NULL 
			AND (intTrType=7 OR intTrMode>3  ) 
			AND (intBoardNumber IN (SELECT BoardNum FROM BoardToMerchantAccount WHERE @merchantID =MerchantAccountID))
			ORDER BY intBoardNumber, intTrNum


				/* SET NOCOUNT ON */
				RETURN
GO
/****** Object:  StoredProcedure [dbo].[Refunds]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[Refunds]


				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS

			SELECT dbo.Val([Batch]) AS ExprBatch,Status, dbo.StringToDate(Date,Time) AS ExprData, Expiration, dbo.DolarAmount(Amount,Status) AS exprAmount, Account  AS Account
			FROM dbo.oBatch
			WHERE (dbo.StringToDate(Date,Time) BETWEEN @startDate And @endDate) AND (dbo.DolarAmount(Amount,Status)<0) 
			AND (@merchantID=MerchantID)

			ORDER BY dbo.Val([Batch]), dbo.StringToDate(Date,Time)
GO
/****** Object:  StoredProcedure [dbo].[Rejected_Fee_Transactions]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[Rejected_Fee_Transactions]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				SELECT 
				DISTINCT (Rejected_Fee_Transactions_MainBase.FeeTrId),
				intBoardNumber, 
				intTrNum,
				dtEntryDate,
				dtExitDate,
				strRateKey,
				intTickDispenser,
				intTickNumber,
				intTrMode,
				intTrType,
				Rejected_Fee_Transactions_MainBase.Account,
				Rejected_Fee_Transactions_MainBase.ExpirationDate,
				RAmount, 
				Discount
			FROM Rejected_Fee_Transactions_MainBase(@startDate,@endDate,@merchantID)
			LEFT JOIN oScheduledRecharges ON Rejected_Fee_Transactions_MainBase.FeeTrId = oScheduledRecharges.FeeId
			WHERE oScheduledRecharges.FeeId  is Null
			;

				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[RejectionsAll]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

			CREATE PROCEDURE [dbo].[RejectionsAll]

					@sDate as datetime,
					@eDate as datetime,
					@merchantID as int
					
			AS
				
				SELECT dbo.oRejectedLog.Time, dbo.oRejectedLog.Account AS Account, 
				dbo.oRejectedLog.CreditCardType, dbo.oRejectedLog.ExpirationDate, 
				dbo.oRejectedLog.ReasonCode, dbo.oRejectedLog.CreditTrTime,
				 dbo.oRejectedLog.LaneNumber, dbo.oRejectedLog.Amount, 
				 dbo.oRejectedLog.InvoiceNumber, dbo.oRejectedLog.Status, 
				 dbo.oRejectionReasons.Description
			FROM dbo.oRejectedLog LEFT JOIN dbo.oRejectionReasons ON dbo.oRejectedLog.Reasoncode=dbo.oRejectionReasons.reasoncode
			WHERE ([time]>=@sDate And [time]<=@eDate)
			AND (@merchantID=MerchantID);
				
				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[Scheduled_Fee_Transactions]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


			CREATE PROCEDURE [dbo].[Scheduled_Fee_Transactions]

				@startDate datetime,
				@endDate datetime,
				@merchantID int
			AS
				SELECT 
				DISTINCT (Rejected_Fee_Transactions_MainBase.FeeTrId),
				intBoardNumber, 
				intTrNum,
				dtEntryDate,
				dtExitDate,
				strRateKey,
				intTickDispenser,
				intTickNumber,
				intTrMode,
				intTrType,
				Rejected_Fee_Transactions_MainBase.Account,
				Rejected_Fee_Transactions_MainBase.ExpirationDate,
				RAmount, 
				Discount
			FROM Rejected_Fee_Transactions_MainBase(@startDate,@endDate,@merchantID) 
			LEFT JOIN oScheduledRecharges ON Rejected_Fee_Transactions_MainBase.FeeTrId =oScheduledRecharges.FeeId
			WHERE oScheduledRecharges.FeeId  is Not  Null

				RETURN 
GO
/****** Object:  StoredProcedure [dbo].[sp_drop_table_constraints]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_drop_table_constraints]
	@tablename	sysname
AS
 set nocount on
 declare @constname	sysname, @cmd		varchar(1024)
 declare curs_constraints cursor for
	select 	name
	from 	sysobjects 
	where 	xtype in ('D') 
	and	(status & 64) = 0
	and     parent_obj = object_id(@tablename)

 open curs_constraints

 fetch next from curs_constraints into @constname
 while (@@fetch_status = 0)
 begin
	select @cmd = 'ALTER TABLE ' + @tablename + ' DROP CONSTRAINT [' + @constname + ']'
	exec(@cmd)
	fetch next from curs_constraints into @constname
 end

 close curs_constraints
 deallocate curs_constraints

 return 0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetValidatedAmountByMerchantID]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetValidatedAmountByMerchantID]
 @dtStartDate AS DateTime
,@dtEndDate AS DateTime
,@strMerchantIDs AS nvarchar(max)
AS
BEGIN
	
SET NOCOUNT ON;

DECLARE
 @dtInnerStartDate AS DateTime
,@dtInnerEndDate AS DateTime
,@strInnerMerchantIDs AS nvarchar(max)

SET @dtInnerStartDate = @dtStartDate
SET @dtInnerEndDate = @dtEndDate
SET @strInnerMerchantIDs = @strMerchantIDs

;WITH cte_RequestedMerchants AS
(
 SELECT CONVERT(INT, strValue)  AS intMerchantKeyNumber
,'' AS strDiscountMerchantName
,CONVERT(MONEY,0) AS mnTotalDiscountAmount
 FROM dbo.Split(@strInnerMerchantIDs,',')
)
,cte_eValRawDataIDs AS 
(
SELECT
MAX(ID) AS intValidationRequestID
FROM webValidationsRequests
WHERE intMerchantKeyNumber IN (SELECT CONVERT(INT, strValue) FROM dbo.Split(@strInnerMerchantIDs,','))
AND dtRequestDate BETWEEN @dtInnerStartDate AND @dtInnerEndDate
AND dtCardEntryTime IS NOT NULL
GROUP BY strCardNumber, intEntryLane, dtCardEntryTime 
)
,cte_eValRawData AS (
SELECT
ID
,strCardNumber
,intEntryLane
,intMediaType
,CONVERT(DATETIME,(CONVERT(nvarchar(16), dtCardEntryTime,120))) AS dtTimeEntry
,intDiscountKey
,intMerchantKeyNumber
,strMerchantID AS strDiscountMerchantName
FROM webValidationsRequests
INNER JOIN cte_eValRawDataIDs ON ID = intValidationRequestID
)
, cte_FeeTransactionIDs  AS (
SELECT 
MAX(trDPFee.ID) AS intFeeTransactionID
FROM  [dbo].[trDPFee] 
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE dtExitDate BETWEEN @dtInnerStartDate AND DATEADD(DAY,7,@dtInnerEndDate)
AND (intDK1 > 0 OR intDK2 > 0)
AND cfgPaymentTypeDesc.intRevenueStatus NOT IN (0)
AND cfgPaymentTypeDesc.isForStandartReporting  > 0 
GROUP BY intTickDispenser,intTickNumber, dtEntryDate

)
, cte_FeeTransactions  AS (
SELECT 
trDPFee.ID AS intFeeTrID
,intBoardNumber
,CONVERT(DateTime,CONVERT(nvarchar(16),dtEntryDate,120)) AS dtEntryDate
,dtExitDate
,mnAmount 
,mnTotal
,intDK1,intDK2,intNC1
,intNC2,mnDA1,mnDA2
,intTickDispenser
,intTickNumber AS intTicket 
,strCardNum 
,intMediaType
,intTrMode
,intTrType
FROM  [dbo].[trDPFee] 
INNER JOIN cte_FeeTransactionIDs ON trDPFee.ID  = intFeeTransactionID
)
,cte_MerchantUsageData AS
(
SELECT 
intMerchantKeyNumber
,ISNULL(MAX(cte_eValRawData.strDiscountMerchantName),'') AS strDiscountMerchantName
,CONVERT(MONEY,ISNULL(SUM(mnDA1),0)) AS mnTotalDiscountAmount
FROM cte_eValRawData
LEFT JOIN  cte_FeeTransactions
ON  cte_FeeTransactions.intTickDispenser =cte_eValRawData.intEntryLane
AND cte_FeeTransactions.strCardNum =cte_eValRawData.strCardNumber
AND cte_FeeTransactions.dtEntryDate = cte_eValRawData.dtTimeEntry
AND cte_FeeTransactions.intMediaType = cte_eValRawData.intMediaType
AND cte_FeeTransactions.intDK1 = cte_eValRawData.intDiscountKey 
GROUP BY cte_eValRawData.intMerchantKeyNumber)

/*=============================================================*/
SELECT 
RequestedMerchants.intMerchantKeyNumber
,ISNULL(MerchantUsage.strDiscountMerchantName, RequestedMerchants.strDiscountMerchantName) AS strDiscountMerchantName
,ISNULL(MerchantUsage.mnTotalDiscountAmount, RequestedMerchants.mnTotalDiscountAmount) AS mnTotalDiscountAmount
FROM cte_RequestedMerchants AS RequestedMerchants
LEFT JOIN cte_MerchantUsageData AS MerchantUsage
ON RequestedMerchants.intMerchantKeyNumber= MerchantUsage.intMerchantKeyNumber

ORDER BY RequestedMerchants.intMerchantKeyNumber

END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetValidatedAmountByMerchantID2]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetValidatedAmountByMerchantID2]
 @dtStartDate AS DateTime
,@dtEndDate AS DateTime
,@strMerchantIDs AS nvarchar(max)
AS
BEGIN
	
SET NOCOUNT ON;

DECLARE
 @dtInnerStartDate AS DateTime
,@dtInnerEndDate AS DateTime
,@strInnerMerchantIDs AS nvarchar(max)

SET @dtInnerStartDate = @dtStartDate
SET @dtInnerEndDate = @dtEndDate
SET @strInnerMerchantIDs = @strMerchantIDs

;WITH cte_eValRawData AS (
SELECT * FROM 
(
SELECT
RANK() OVER (partition by strCardNumber, intEntryLane, dtCardEntryTime ORDER BY ID DESC ) AS intRank
,ID
,strCardNumber
,intEntryLane
,intTicketNumber = CASE 
WHEN  intMediaType  = 2 AND intUsageType = 2 
AND strCardNumber LIKE '%-%'
THEN CAST(RIGHT(strCardNumber,LEN(strCardNumber)-CHARINDEX('-',strCardNumber)) AS int)
WHEN  intMediaType   NOT IN (2) AND intUsageType = 2 THEN CONVERT(INT, strCardNumber)
ELSE -1 END
,CONVERT(DATETIME,(CONVERT(nvarchar(16), dtCardEntryTime,120))) AS dtTimeEntry
,intDiscountKey
,intMerchantKeyNumber
,strMerchantID AS strDiscountMerchantName
FROM webValidationsRequests
WHERE intMerchantKeyNumber IN (SELECT CONVERT(INT, strValue) FROM dbo.Split(@strInnerMerchantIDs,','))
AND dtRequestDate BETWEEN @dtInnerStartDate AND @dtInnerEndDate
AND dtCardEntryTime IS NOT NULL ) AS webRequestRawData
WHERE intRank = 1
)


, cte_FeeTransactions  AS (

SELECT * FROM (
SELECT 
RANK() OVER (partition by intTickDispenser,intTickNumber, dtEntryDate ORDER BY dtExitDate DESC ) AS intRank
,trDPFee.ID AS intFeeTrID
,intBoardNumber
,CONVERT(DateTime,CONVERT(nvarchar(16),dtEntryDate,120)) AS dtEntryDate
,dtExitDate
,mnAmount 
,mnTotal
,intDK1,intDK2,intNC1
,intNC2,mnDA1,mnDA2
,intTickDispenser
,intTickNumber AS intTicket 
,strCardNum = CASE WHEN LEN(strCardNum)  =0 THEN  CONVERT(nvarchar(20),intTickNumber) ELSE strCardNum END
,intTrMode
,intTrType
FROM  [dbo].[trDPFee] 
WHERE dtExitDate BETWEEN @dtInnerStartDate AND DATEADD(DAY,7,@dtInnerEndDate)
AND (intDK1 > 0 OR intDK2 > 0)
AND intTrType NOT IN (2,3,4)) AS tempFeeTransactions
WHERE intRank = 1

)


/*=============================================================*/

SELECT 
intMerchantKeyNumber
,ISNULL(MAX(cte_eValRawData.strDiscountMerchantName),'') AS strDiscountMerchantName
,CONVERT(MONEY,ISNULL(SUM(mnDA1),0)) AS mnTotalDiscountAmount
FROM cte_eValRawData
LEFT JOIN  cte_FeeTransactions
ON (cte_FeeTransactions.intTickDispenser = cte_eValRawData.intEntryLane )
AND cte_FeeTransactions.intTickDispenser =cte_eValRawData.intEntryLane
AND cte_FeeTransactions.intTicket =cte_eValRawData.intTicketNumber
AND cte_FeeTransactions.dtEntryDate = cte_eValRawData.dtTimeEntry
AND (cte_FeeTransactions.intDK1 = cte_eValRawData.intDiscountKey )
GROUP BY cte_eValRawData.intMerchantKeyNumber
ORDER BY intMerchantKeyNumber

END 
GO
/****** Object:  StoredProcedure [dbo].[sp_SetArchiveServerSettings]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SetArchiveServerSettings] 
@strArchiveServer NVARCHAR(256),
@strArchiveServerUser NVARCHAR(256),
@strArchiveServerPass NVARCHAR(256)
AS BEGIN

DECLARE @sysArchiveServer sysname
DECLARE @sysRemoteUser sysname
DECLARE @sysRemotePass sysname
DECLARE @strSRVproduct nvarchar(128)
DECLARE @strUseItSelf varchar(8)
DECLARE @sysLocalLogin sysname
DECLARE @RC int
SET @strSRVproduct = N'SQL Server'
SET @sysArchiveServer = @strArchiveServer
SET @sysRemoteUser = @strArchiveServerUser
SET @sysRemotePass = @strArchiveServerPass
SET @sysLocalLogin = NULL
IF LEN(ISNULL(@strArchiveServerUser, '')) = 0 OR LEN(ISNULL(@strArchiveServerPass, '')) = 0 
SET @strUseItSelf = N'True'
ELSE 
SET @strUseItSelf = N'False'

SET @RC = 0;

if NOT EXISTS(SELECT NAME FROM sys.servers WHERE NAME = @sysArchiveServer)
 EXECUTE @RC = master.dbo.sp_addlinkedserver @sysArchiveServer, @strSRVproduct

EXEC @RC = master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@sysArchiveServer,@useself=@strUseItSelf,@locallogin=NULL,@rmtuser=@sysRemoteUser,@rmtpassword=@sysRemotePass

IF @RC = 0 BEGIN
UPDATE cfgArchiveSettings SET strSettingValue = @strArchiveServer, dtModified = GETDATE(),strModifyUser = SYSTEM_USER  WHERE strSettingName = 'ArchiveServerName'
END

RETURN @RC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetJanusSettings]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetJanusSettings]
 @strKey nvarchar(255),
 @varValue sql_Variant OUTPUT
AS
BEGIN
SET @varValue = (SELECT CASE
WHEN sysType LIKE 'int' THEN CONVERT(int,varValue )
WHEN sysType LIKE 'bigint' THEN CONVERT(bigint,varValue )
WHEN sysType LIKE 'nvarchar' THEN CONVERT(nvarchar(255),varValue )
WHEN sysType LIKE 'bit' THEN CONVERT(bit,varValue )
ELSE varValue END FROM cfgJanusSettings WHERE strName = @strKey)
RETURN  
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateJanusSettings]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateJanusSettings]
@strKey nvarchar(255),
@varValue sql_variant,	
@strSystemType nvarchar(255),
@strDescription nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;

IF @strKey IS NULL OR @varValue IS NULL OR @strSystemType IS NULL
BEGIN 
RAISERROR('Paramater Value Not Set!',16,1)
RETURN
END 

IF @strSystemType NOT LIKE '%Int%'
AND @strSystemType NOT LIKE '%Int32%'
AND @strSystemType NOT LIKE '%Int64%'
AND @strSystemType NOT LIKE '%String%' 
AND @strSystemType NOT LIKE '%Bool%'
BEGIN
RAISERROR('Key [%s] has invalid data type [%s]',16,1,@strKey,@strSystemType )
RETURN
END


DECLARE @strMaptype AS NVARCHAR(255)
IF (SELECT COUNT(strName) FROM  cfgJanusSettings WHERE strName = @strKey) = 0 BEGIN

INSERT INTO cfgJanusSettings (strName, varValue, sysType,strDescription)
SELECT @strKey 
,CASE
WHEN @strSystemType LIKE '%Int32%' THEN CONVERT(int,@varValue )
WHEN @strSystemType LIKE '%Int64%' THEN CONVERT(bigint,@varValue )
WHEN @strSystemType LIKE '%Int%' THEN CONVERT(int,@varValue )
WHEN @strSystemType LIKE '%String%' THEN CONVERT(nvarchar(255),@varValue )
WHEN @strSystemType LIKE '%Bool%' THEN CONVERT(bit,@varValue )
ELSE @varValue END
,CASE
WHEN @strSystemType LIKE '%Int32%' THEN 'int'
WHEN @strSystemType LIKE '%Int64%' THEN 'bigint'
WHEN @strSystemType LIKE '%Int%' THEN 'int'
WHEN @strSystemType LIKE '%String%' THEN 'nvarchar'
WHEN @strSystemType LIKE '%Bool%' THEN 'bit'
END
,@strDescription
END ELSE BEGIN 

IF @strDescription IS NULL 
UPDATE cfgJanusSettings SET varValue = CASE
WHEN @strSystemType LIKE '%Int32%' THEN CONVERT(int,@varValue )
WHEN @strSystemType LIKE '%Int64%' THEN CONVERT(bigint,@varValue )
WHEN @strSystemType LIKE '%String%' THEN CONVERT(nvarchar(255),@varValue )
WHEN @strSystemType LIKE '%Bool%' THEN CONVERT(bit,@varValue )
ELSE @varValue END  WHERE strName = @strKey

IF @strDescription IS NOT NULL AND LEN(@strDescription) = 0
UPDATE cfgJanusSettings SET varValue = CASE
WHEN @strSystemType LIKE '%Int32%' THEN CONVERT(int,@varValue )
WHEN @strSystemType LIKE '%Int64%' THEN CONVERT(bigint,@varValue )
WHEN @strSystemType LIKE '%String%' THEN CONVERT(nvarchar(255),@varValue )
WHEN @strSystemType LIKE '%Bool%' THEN CONVERT(bit,@varValue )
ELSE @varValue END  WHERE strName = @strKey

IF @strDescription IS NOT NULL AND LEN(@strDescription) > 0
UPDATE cfgJanusSettings SET varValue = CASE
WHEN @strSystemType LIKE '%Int32%' THEN CONVERT(int,@varValue )
WHEN @strSystemType LIKE '%Int64%' THEN CONVERT(bigint,@varValue )
WHEN @strSystemType LIKE '%String%' THEN CONVERT(nvarchar(255),@varValue )
WHEN @strSystemType LIKE '%Bool%' THEN CONVERT(bit,@varValue )
ELSE @varValue END  
,strDescription = @strDescription
WHERE strName = @strKey

END
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DataparkMaintenanceProcedure]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DataparkMaintenanceProcedure]
@bBackupDatabase bit
,@strDatabaseBackupPath NVARCHAR(1000)
,@bRebuildDatabase bit
,@bRebuildIndexes bit
,@bShrinkDataFile bit
,@bShrinkLogFile bit
WITH EXECUTE AS OWNER
AS
BEGIN
SET QUOTED_IDENTIFIER ON;
SET NOCOUNT ON;
DECLARE @RC int
DECLARE @strProcName nvarchar(256)
DECLARE @strSqlCommand AS nvarchar(MAX)
DECLARE @strSqlStatCommand AS nvarchar(MAX)
DECLARE @xmlLogMessage AS XML
DECLARE @xmlLogTempMessage AS XML
DECLARE @logTable AS TABLE (dtLogDate DATETIME, strLogMessage NVARCHAR(MAX), isXML bit)
SET  @strProcName = OBJECT_NAME(@@PROCID) 


INSERT INTO @logTable VALUES (GETDATE(),'PROCEDURE usp_DataparkMaintenaceProcedure   @bBackupDatabase = '+ ISNULL(CONVERT(nvarchar(10) , @bBackupDatabase), '0')+
', @strDatabaseBackupPath = ' + ISNULL( @strDatabaseBackupPath, '')+
', @bRebuildDatabase = ' + ISNULL(CONVERT(nvarchar(10) , @bRebuildDatabase), '0')+
', @bRebuildIndexes  = '+ ISNULL(CONVERT(nvarchar(10) , @bRebuildIndexes), '0')+
', @bShrinkDataFile  = '+ ISNULL(CONVERT(nvarchar(10) , @bShrinkDataFile), '0')+
', @bShrinkLogFile = ' + ISNULL(CONVERT(nvarchar(10) , @bShrinkLogFile), '0')+
' Start...' , 0)



BEGIN TRY 
SET @strSqlStatCommand = 'SELECT @xmlLogTempMessage = ( SELECT
strDBName ,rlDBSize ,(rlDBSize -rlUnUsedSpace) AS rlUsedSpace,rlUnUsedSpace ,(rlUnUsedSpace/rlDBSize)*100 AS rlFreePerc
FROM
(SELECT 
strDBName
,((intDBSize + intLogSize)* 8192 / 1048576) AS rlDBSize 
, rlUnUsedSpace = CASE
WHEN intDBSize >= rlReservedPages THEN  
 (CONVERT (dec (15,2),intDBSize) - CONVERT (dec (15,2),rlReservedPages)) * 8192 / 1048576 ELSE 0 END 
FROM (SELECT  db_name() AS strDBName
, CONVERT (dec (15,2),(SELECT  sum(CONVERT(bigint,case when status & 64 = 0 then size else 0 end))FROM dbo.sysfiles  )) AS intDBSize
, CONVERT (dec (15,2),(SELECT  sum(CONVERT(bigint,case when status & 64 <> 0 then size else 0 end)) from dbo.sysfiles  ))  AS intLogSize
,(SELECT sum(a.total_pages) FROM sys.partitions p JOIN sys.allocation_units  a ON p.partition_id = a.container_id  
  LEFT JOIN sys.internal_tables it ON p.object_id = it.object_id ) AS rlReservedPages
) AS SubDBSize) AS DBInitialSize  FOR XML AUTO , ELEMENTS) '

EXECUTE sp_executesql @strSqlStatCommand, N'@xmlLogTempMessage xml output', @xmlLogTempMessage output

INSERT INTO @logTable VALUES (GETDATE(),CONVERT(NVARCHAR(MAX), @xmlLogTempMessage), 1)



IF @bBackupDatabase IS NOT NULL AND @bBackupDatabase = 1 AND @strDatabaseBackupPath IS NOT NULL BEGIN

DECLARE @result INT
SET @strDatabaseBackupPath = @strDatabaseBackupPath + 'Datapark_FullBackup.bak'
EXEC master.dbo.xp_fileexist @strDatabaseBackupPath, @result OUTPUT
IF @result =  1 BEGIN 
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] DIFFERENTIAL BACKUP ['+@strDatabaseBackupPath+'] Start...',0)
SET @strSqlCommand = N'BACKUP DATABASE [Datapark] TO  DISK = N'''+@strDatabaseBackupPath+''' WITH DIFFERENTIAL'
EXECUTE  @RC  = sp_executesql @strSqlCommand
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] DIFFERENTIAL BACKUP ['+@strDatabaseBackupPath+'] End...',0)
END
ELSE BEGIN 
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] FULL BACKUP ['+@strDatabaseBackupPath+'] Start...',0)
SET @strSqlCommand =N'BACKUP DATABASE [Datapark] TO  DISK = N'''+@strDatabaseBackupPath+''' WITH INIT'
EXECUTE  @RC  = sp_executesql @strSqlCommand
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] FULL BACKUP ['+@strDatabaseBackupPath+'] End...',0)
END 
END 

IF @bRebuildDatabase IS NOT NULL AND @bRebuildDatabase = 1 BEGIN

INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] SET SINGLE_USER Start...',0)
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET SINGLE_USER WITH ROLLBACK IMMEDIATE'
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] SET SINGLE_USER End.',0)

INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] REPAIR_REBUILD Start...',0)
EXECUTE  @RC  = sp_executesql N'DBCC CHECKDB (''Datapark'',REPAIR_REBUILD ) WITH NO_INFOMSGS'
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] REPAIR_REBUILD END...',0)

INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] SET MULTI_USER Start...',0)
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET MULTI_USER WITH ROLLBACK IMMEDIATE'
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] SET MULTI_USER End...',0)
END

IF @bRebuildIndexes IS NOT NULL AND @bRebuildIndexes =1 BEGIN
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] Rebuild Indexes Start...',0)
DECLARE @strTableName VARCHAR(255)
DECLARE @intfillfactor INT
SET @intfillfactor =80 --80% of data max
DECLARE crTableCursor CURSOR FOR
SELECT name AS TableName FROM sys.tables WHERE type ='U' ORDER BY name
OPEN crTableCursor
FETCH NEXT FROM crTableCursor INTO @strTableName
WHILE @@FETCH_STATUS = 0
BEGIN
SET @strSqlCommand = 'ALTER INDEX ALL ON ' + @strTableName + ' REBUILD WITH (FILLFACTOR = ' + CONVERT(VARCHAR(3),@intfillfactor) + ')'
EXECUTE (@strSqlCommand)
FETCH NEXT FROM crTableCursor INTO @strTableName
END
CLOSE crTableCursor
DEALLOCATE crTableCursor
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] Rebuild Indexes End.',0)
END

IF @bShrinkDataFile IS NOT NULL AND @bShrinkDataFile =1 BEGIN
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] MDF File Shrink Start...',0)
DECLARE @strMDFFileName AS nvarchar(255)
SELECT TOP 1 @strMDFFileName = name FROM sys.master_files WHERE database_id = DB_ID('datapark')  AND type_desc LIKE 'ROWS'
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET SINGLE_USER WITH ROLLBACK IMMEDIATE'
EXECUTE  @RC  = sp_executesql N'ALTER DATABASE [Datapark] SET  RECOVERY  SIMPLE'
SET @strSqlCommand ='USE [Datapark] DBCC SHRINKFILE ('+@strMDFFileName+') WITH NO_INFOMSGS'
EXECUTE  @RC  = sp_executesql @strSqlCommand
EXECUTE  @RC  = sp_executesql N'ALTER DATABASE [Datapark] SET  RECOVERY  FULL'
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET MULTI_USER WITH ROLLBACK IMMEDIATE'
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] MDF File Shrink End.',0)
END

IF @bShrinkLogFile IS NOT NULL AND @bShrinkLogFile =1 BEGIN
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] LDF File Shrink Start...',0)
DECLARE @strLDFFileName AS nvarchar(255)
SELECT TOP 1 @strLDFFileName = name FROM sys.master_files WHERE database_id = DB_ID('datapark')  AND type_desc LIKE 'LOG'
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET SINGLE_USER WITH ROLLBACK IMMEDIATE'
EXECUTE  @RC  = sp_executesql N'ALTER DATABASE [Datapark] SET  RECOVERY  SIMPLE'
SET @strSqlCommand ='USE [Datapark] DBCC SHRINKFILE ('+@strLDFFileName+') WITH NO_INFOMSGS'
EXECUTE  @RC  = sp_executesql @strSqlCommand
EXECUTE  @RC  = sp_executesql N'ALTER DATABASE [Datapark] SET  RECOVERY  FULL'
EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET MULTI_USER WITH ROLLBACK IMMEDIATE' 
INSERT INTO @logTable VALUES (GETDATE(),'DATABASE [Datapark] LDF File Shrink End.',0)
END

INSERT INTO @logTable VALUES (GETDATE(),'PROCEDUE usp_DataparkMaintenaceProcedure End.',0)

END TRY 
BEGIN CATCH

EXECUTE  @RC  = sp_executesql N'USE MASTER ALTER DATABASE [Datapark] SET MULTI_USER WITH ROLLBACK IMMEDIATE'					
INSERT INTO @logTable VALUES (GETDATE(), 'ERROR_PROCEDURE:'+@strProcName +'| ERROR_LINE:' +CONVERT(nvarchar(10), ERROR_LINE()) 
+'| ERROR_NUMBER:' +CONVERT(nvarchar(10), ERROR_NUMBER()) +'| ERROR_MESSAGE:'+ERROR_MESSAGE() ,0)

END CATCH

SET @xmlLogMessage = N'<LogRoot>           
<InitialStatistics></InitialStatistics>
<ProcedureLog></ProcedureLog>
<FinalStatistics></FinalStatistics>
</LogRoot>';

SET @xmlLogTempMessage = ( SELECT strLogMessage FROM @logTable AS DBStat WHERE isXML = 1)

SET @strSqlCommand ='SET @xmlLogMessage.modify(''insert ' + convert(nvarchar(max), @xmlLogTempMessage) + ' as last into (/LogRoot/InitialStatistics)[1] '')'
EXECUTE sp_executesql @strSqlCommand, N'@xmlLogMessage xml output, @xmlLogTempMessage xml', @xmlLogMessage output, @xmlLogTempMessage;


SET @strSqlCommand  = ''
SELECT  @strSqlCommand =@strSqlCommand + '<logData><dtLogDate>'+CONVERT(NVARCHAR(20), dtLogDate,120)+'</dtLogDate>' +'<strLogMessage>'+strLogMessage+'</strLogMessage></logData>,' FROM @logTable WHERE isXML = 0
SET @strSqlCommand  =LEFT(@strSqlCommand, LEN(@strSqlCommand)-1)

SET @strSqlCommand ='SET @xmlLogMessage.modify(''insert (' +@strSqlCommand + ')  into (/LogRoot/ProcedureLog)[1] '')'
EXECUTE sp_executesql @strSqlCommand, N'@xmlLogMessage xml output', @xmlLogMessage output

EXECUTE sp_executesql @strSqlStatCommand, N'@xmlLogTempMessage xml output', @xmlLogTempMessage output

SET @strSqlCommand ='SET @xmlLogMessage.modify(''insert ' + convert(nvarchar(max), @xmlLogTempMessage) + ' as last into (/LogRoot/FinalStatistics)[1]'') '
EXECUTE sp_executesql @strSqlCommand, N'@xmlLogMessage xml output, @xmlLogTempMessage xml', @xmlLogMessage output, @xmlLogTempMessage

INSERT INTO [dbo].[sqlsrv_MessageLog] ([strSourceDB],[strSourceTable],[strTargetTable],[strUserID],[strDMLType],[xmlMessageData],[dtLogDate])
SELECT DB_NAME()+'.dbo.'+@strProcName ,'' , '' ,ORIGINAL_LOGIN() ,'INFO' ,@xmlLogMessage, GETDATE()

END 
GO
/****** Object:  StoredProcedure [dbo].[usp_DisableAutoExportTriggers]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DisableAutoExportTriggers]
WITH EXECUTE AS OWNER
AS 
BEGIN

EXECUTE('DISABLE TRIGGER [dbo].[OnInsertTransaferToDPRpt] ON [dbo].[dpcManualAdjustments]')
EXECUTE('DISABLE TRIGGER [dbo].[lsmCard_OnUpdate_SendToDPRpt] ON [dbo].[lsmCard]')
EXECUTE('DISABLE TRIGGER [dbo].[trDPFee_OnInsert_SendToDPRpt] ON [dbo].[trDPFee]')
EXECUTE('DISABLE TRIGGER [dbo].[Payments_OnInsert_SendToDPRpt] ON [dbo].[Payments]')
EXECUTE('DISABLE TRIGGER [dbo].[trEvent_OnInsert_SendToDPRpt] ON [dbo].[trEvent]')
EXECUTE('DISABLE TRIGGER [dbo].[trError_OnInsert_SendToDPRpt] ON [dbo].[trError]')
EXECUTE('DISABLE TRIGGER [dbo].[cfgBoards_OnInsert_SendToDPRpt] ON [dbo].[cfgBoards]')
EXECUTE('DISABLE TRIGGER [dbo].[trLogOnOff_OnInsert_SendToDPRpt] ON [dbo].[trLogOnOff]')
EXECUTE('DISABLE TRIGGER [dbo].[trnCardPass_OnInsert_SendToDPRpt] ON [dbo].[trnCardPass]')
EXECUTE('DISABLE TRIGGER [dbo].[dprZReports_OnInsert_SendToDPRpt] ON  [dbo].[dprZReports]')
EXECUTE('DISABLE TRIGGER [dbo].[sqlsrv_MessageDialogs_OnUpdate_Perform_DPMS_CleanUp] ON  [dbo].[sqlsrv_MessageDialogs]')

IF (SELECT is_broker_enabled FROM sys.databases WHERE name = 'Datapark') = 1 
BEGIN
 EXECUTE('EXECUTE [dbo].[usp_DPMS_ServiceBrokerConversationQueueCleaUp] 1 ')
END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DPMS_ServiceBrokerConversationQueueCleaUp]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DPMS_ServiceBrokerConversationQueueCleaUp]
@bFullClean AS BIT
WITH EXECUTE AS OWNER
AS 
BEGIN
DECLARE @dtUTCLocalTime AS DATETIME
DECLARE @conversationHandle uniqueidentifier;
DECLARE @intCount BIGINT
DECLARE @intID BIGINT
DECLARE @tblConversations AS TABLE ([ID] [int] IDENTITY(1,1) NOT NULL, convHandle uniqueidentifier NULL)
SET @dtUTCLocalTime =  DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), GETDATE())

INSERT INTO @tblConversations (convHandle)
SELECT  conversation_handle 
FROM sys.conversation_endpoints AS ep
WHERE far_service IN ( '//Datapark/TargetService', '//Datapark/InitiatorService') AND ( @bFullClean = 1  OR  ([state] NOT LIKE 'CO' OR [lifetime] < @dtUTCLocalTime ))

SET @intCount = ISNULL((SELECT MAX(ID) FROM @tblConversations),0)
SET @intID = 0 		

WHILE (@intID < @intCount )
BEGIN
	SET @intID = (SELECT MIN(ID) FROM @tblConversations WHERE ID > @intID)
	
	IF @intID IS NULL BREAK;
	SELECT TOP 1 @conversationHandle = convHandle FROM @tblConversations WHERE ID = @intID
	IF @@ROWCOUNT = 0 BREAK;

	BEGIN TRY
		END CONVERSATION @conversationHandle WITH CLEANUP
	END TRY
	BEGIN CATCH
		INSERT INTO dbo.sqlsrv_MessageErrors (
		strErrorProcedure, intErrorLine, intErrorNumber, strErrorMessage, 
		intErrorSeverity, intErrorState, xmlAuditedData)
		SELECT	ISNULL(ERROR_PROCEDURE(),'usp_ServiceBrokerConversationQueueCleaUp'), ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE(), 
		ERROR_SEVERITY(), ERROR_STATE(), NULL	
		WHERE  ERROR_NUMBER() NOT IN (8426,8435)
	END CATCH;

	END

UPDATE [dbo].[sqlsrv_MessageDialogs] SET intPendingMessageCount = 0 WHERE [DBID] = DB_ID() AND strDialogClient = 'DPMS'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EnableAutoExportTriggers]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EnableAutoExportTriggers]
WITH EXECUTE AS OWNER
AS 
BEGIN
EXECUTE('USE MASTER
ALTER DATABASE [DataparkReporting] SET TRUSTWORTHY ON
ALTER DATABASE [Datapark] SET TRUSTWORTHY ON
')

IF (SELECT is_broker_enabled FROM sys.databases WHERE name = 'Datapark') = 0 
BEGIN
EXECUTE('ALTER DATABASE [DATAPARK] SET SINGLE_USER WITH ROLLBACK IMMEDIATE')
EXECUTE('ALTER DATABASE [DATAPARK] SET ENABLE_BROKER')
EXECUTE('ALTER DATABASE [DATAPARK] SET MULTI_USER WITH ROLLBACK IMMEDIATE')
END

EXECUTE('ENABLE TRIGGER [dbo].[OnInsertTransaferToDPRpt] ON [dbo].[dpcManualAdjustments]')
EXECUTE('ENABLE TRIGGER [dbo].[lsmCard_OnUpdate_SendToDPRpt] ON [dbo].[lsmCard]')
EXECUTE('ENABLE TRIGGER [dbo].[trDPFee_OnInsert_SendToDPRpt] ON [dbo].[trDPFee]')
EXECUTE('ENABLE TRIGGER [dbo].[Payments_OnInsert_SendToDPRpt] ON [dbo].[Payments]')
EXECUTE('ENABLE TRIGGER [dbo].[trEvent_OnInsert_SendToDPRpt] ON [dbo].[trEvent]')
EXECUTE('ENABLE TRIGGER [dbo].[trError_OnInsert_SendToDPRpt] ON [dbo].[trError]')
EXECUTE('ENABLE TRIGGER [dbo].[cfgBoards_OnInsert_SendToDPRpt] ON [dbo].[cfgBoards]')
EXECUTE('ENABLE TRIGGER [dbo].[trLogOnOff_OnInsert_SendToDPRpt] ON [dbo].[trLogOnOff]')
EXECUTE('ENABLE TRIGGER [dbo].[trnCardPass_OnInsert_SendToDPRpt] ON  [dbo].[trnCardPass]')
EXECUTE('ENABLE TRIGGER [dbo].[dprZReports_OnInsert_SendToDPRpt] ON  [dbo].[dprZReports]')
EXECUTE('ENABLE TRIGGER [dbo].[sqlsrv_MessageDialogs_OnUpdate_Perform_DPMS_CleanUp] ON  [dbo].[sqlsrv_MessageDialogs]')

IF(SELECT COUNT(ID) FROM  [DataparkReporting].[dbo].[omBoardsData]) = 0
BEGIN
INSERT INTO [DataparkReporting].[dbo].[omBoardsData]
([intGarageID]
,[intBoardNumber]
,[intBoardLocation]
,[intBoardPool]
,[intBoardTypeCode1]
,[intBoardTypeCode2]
,[strBoardDesc]
,[strSourceTable]
,[intOriginID]
,[dtSystemDate])
SELECT 
Datapark.dbo.cfgGetAreaIdentificator(BoardNumber)
,[BoardNumber]
,[EntryExit]
,[Poll]
,[LaneType]
,[Terminal_1]
,[Description]
,'cfgBoards'
,[ID]
,GetDate() FROM [Datapark].[dbo].[cfgBoards]

END

EXECUTE('USE Datapark
EXEC sp_changedbowner ''dpAdmin''
')
EXECUTE('USE DataparkReporting
EXEC sp_changedbowner ''dpAdmin''
')
END
GO
/****** Object:  StoredProcedure [dbo].[usp_IsAutoExportTriggersEnabled]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_IsAutoExportTriggersEnabled]
WITH EXECUTE AS OWNER
AS BEGIN
IF (SELECT is_broker_enabled FROM sys.databases WHERE name = 'Datapark') <> 1  RETURN -1;
IF (SELECT TOP 1 SUSER_SNAME(owner_sid) FROM sys.databases WHERE database_id = db_id('Datapark')) NOT LIKE 'dpAdmin' RETURN -1;
IF (SELECT TOP 1 SUSER_SNAME(owner_sid) FROM sys.databases WHERE database_id = db_id('DataparkReporting')) NOT LIKE 'dpAdmin' RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'OnInsertTransaferToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'lsmCard_OnUpdate_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'trDPFee_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'Payments_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'trEvent_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'trError_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'cfgBoards_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'trLogOnOff_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'trnCardPass_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'dprZReports_OnInsert_SendToDPRpt') = 1 RETURN -1;
IF (SELECT is_disabled FROM sys.triggers WHERE NAME LIKE 'sqlsrv_MessageDialogs_OnUpdate_Perform_DPMS_CleanUp') = 1 RETURN -1;
RETURN 0;

END 
GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateDataparkReportingDataForPeriod]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PopulateDataparkReportingDataForPeriod]
@dtDateFrom AS DateTime
,@dtDateTo AS DateTime
,@intTransactionsProcessStep AS INT
AS BEGIN

SET NOCOUNT ON;

DECLARE @dtStartDate AS DATETIME
DECLARE @dtEndDate AS DATETIME
DECLARE @intOperationsCount AS INT
DECLARE @intSubOperationsCount AS INT
DECLARE @intSubProcessedOperationsCount AS INT
DECLARE @intProcessedOperationsCount AS INT
DECLARE @strTimeStamp AS nvarchar(20)

DECLARE @tblProcessIDs AS TABLE (strSourceTable nvarchar(256),strDestinationTable nvarchar(256) ,intID bigint NULL)
DECLARE @tblTempProcessIDs AS TABLE (intID bigint NULL)
DECLARE @intProcessStep AS int
SET @dtStartDate = /*'2015-04-01'--*/@dtDateFrom
SET @dtEndDate = /*'2015-05-01'--*/ @dtDateTo
SET @intOperationsCount = 0
SET @intSubOperationsCount = 0
SET @intProcessedOperationsCount = 0
SET @intProcessStep = /*1000 --*/ @intTransactionsProcessStep
SET @intSubProcessedOperationsCount = 0

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	====Start==== ', 0, 1,@strTimeStamp ) WITH NOWAIT

/*============ omGarageSession ID Identification=====================*/

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omGarageSession' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omGarageSession) > 0 BEGIN
;WITH cte_ReportCardData AS 
(
SELECT 
ID AS intRepID
,strDocNumber
,intMediaType
,intUsageType
,dtEntryDateTime
,dtExitDateTime
,CASE WHEN dtEntryDateTime IS NOT NULL AND dtExitDateTime IS NULL THEN 1 ELSE 2 END AS intModifyReason
FROM DataparkReporting.dbo.omGarageSession
WHERE  (dtEntryDateTime BETWEEN @dtStartDate AND @dtEndDate
OR dtExitDateTime BETWEEN @dtStartDate AND @dtEndDate)
)

,cte_lsmTempCardData AS 
(
SELECT 
ID
,strCardNumber
,intMediaType
,intUsageType
,intModifyReason
,dtTimeEntry 
,dtTimeExit = CASE WHEN intModifyReason = 1 THEN NULL ELSE dtTimeExit END

FROM  Datapark.dbo.lsmCardHistory 
WHERE intModifyReason IN (1,2) AND 
[dbo].[lsmValidateExit](intMediaType,intExitLane,intHWCardStatusCode, intModifyReason ) > 0
AND (dtTimeEntry BETWEEN @dtStartDate AND @dtEndDate
OR dtTimeExit BETWEEN @dtStartDate AND @dtEndDate)
)

, cte_lsmCardData AS (
SELECT ID FROM (
SELECT 
DPData.ID
,ReportingData.intRepID
FROM  cte_lsmTempCardData AS DPData
LEFT JOIN cte_ReportCardData AS ReportingData
ON DPData.strCardNumber = ReportingData.strDocNumber
AND (DPData.dtTimeEntry =  ReportingData.dtEntryDateTime OR (DPData.dtTimeEntry IS NULL AND ReportingData.dtEntryDateTime IS NULL))
AND (DPData.dtTimeExit =  ReportingData.dtExitDateTime OR (DPData.dtTimeExit IS NULL AND ReportingData.dtExitDateTime IS NULL) )
AND DPData.intMediaType = ReportingData.intMediaType
AND DPData.intUsageType = ReportingData.intUsageType
AND DPData.intModifyReason = ReportingData.intModifyReason
) AS DDD WHERE intRepID IS NULL

)

INSERT INTO @tblProcessIDs SELECT 'lsmCardHistory','omGarageSession',ID FROM cte_lsmCardData ORDER BY ID

END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'lsmCardHistory','omGarageSession',ID FROM (SELECT ID FROM  Datapark.dbo.lsmCardHistory 
WHERE intModifyReason IN (1,2) AND 
[dbo].[lsmValidateExit](intMediaType,intExitLane,intHWCardStatusCode, intModifyReason ) > 0
AND (dtTimeEntry BETWEEN @dtStartDate AND @dtEndDate
OR dtTimeExit BETWEEN @dtStartDate AND @dtEndDate)) AS cte_lsmCardData ORDER BY ID
END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omGarageSession' ) WITH NOWAIT

/*============ omConsolidatedGarageSession ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omConsolidatedGarageSession' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omConsolidatedGarageSession) > 0 BEGIN
;WITH cte_ReportCardData AS 
(
SELECT 
ID AS intRepID
,strDocNumber
,intMediaType
,intUsageType
,dtEntryDateTime
,dtExitDateTime
,intModifyReason
FROM DataparkReporting.dbo.omConsolidatedGarageSession
WHERE  (dtEntryDateTime BETWEEN @dtStartDate AND @dtEndDate
OR dtExitDateTime BETWEEN @dtStartDate AND @dtEndDate)
)

,cte_lsmTempCardData AS 
(
SELECT 
ID
,strCardNumber
,intMediaType
,intUsageType
,intModifyReason
,dtTimeEntry 
,dtTimeExit = CASE WHEN intModifyReason = 1 THEN NULL ELSE dtTimeExit END

FROM  Datapark.dbo.lsmCardHistory 
WHERE intModifyReason NOT IN (7) AND 
[dbo].[lsmValidateExit](intMediaType,intExitLane,intHWCardStatusCode, intModifyReason ) > 0
AND (dtTimeEntry BETWEEN @dtStartDate AND @dtEndDate
OR dtTimeExit BETWEEN @dtStartDate AND @dtEndDate)
)

, cte_lsmCardData AS (
SELECT ID FROM (
SELECT 
DPData.ID
,ReportingData.intRepID
FROM  cte_lsmTempCardData AS DPData
LEFT JOIN cte_ReportCardData AS ReportingData
ON DPData.strCardNumber = ReportingData.strDocNumber
AND (DPData.dtTimeEntry =  ReportingData.dtEntryDateTime OR (DPData.dtTimeEntry IS NULL AND ReportingData.dtEntryDateTime IS NULL))
AND (DPData.dtTimeExit =  ReportingData.dtExitDateTime OR (DPData.dtTimeExit IS NULL AND ReportingData.dtExitDateTime IS NULL) )
AND DPData.intMediaType = ReportingData.intMediaType
AND DPData.intUsageType = ReportingData.intUsageType
AND DPData.intModifyReason = ReportingData.intModifyReason
) AS DDD WHERE intRepID IS NULL

)

INSERT INTO @tblProcessIDs SELECT 'lsmCardHistory','omConsolidatedGarageSession',ID FROM cte_lsmCardData ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'lsmCardHistory','omConsolidatedGarageSession',ID FROM (SELECT ID FROM  Datapark.dbo.lsmCardHistory 
WHERE intModifyReason NOT IN (7) AND 
[dbo].[lsmValidateExit](intMediaType,intExitLane,intHWCardStatusCode, intModifyReason ) > 0
AND (dtTimeEntry BETWEEN @dtStartDate AND @dtEndDate
OR dtTimeExit BETWEEN @dtStartDate AND @dtEndDate)) AS  cte_lsmCardData ORDER BY ID
END


SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omConsolidatedGarageSession' ) WITH NOWAIT

/*============ omConsolidatedPaymentTransactions ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omConsolidatedPaymentTransactions' ) WITH NOWAIT


IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omConsolidatedPaymentTransactions) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trDPFee','omConsolidatedPaymentTransactions',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trDPFee
WHERE ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omConsolidatedPaymentTransactions WHERE dtPaymentDateTime BETWEEN @dtStartDate AND @dtEndDate)
AND intBoardNumber NOT IN (61,62,63)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
) AS trFeeData
 ORDER BY ID

END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trDPFee','omConsolidatedPaymentTransactions',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trDPFee
WHERE intBoardNumber NOT IN (61,62,63)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
) AS trFeeData
 ORDER BY ID
END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omConsolidatedPaymentTransactions' ) WITH NOWAIT
/*============ omTransientPayment ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omTransientPayment' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omConsolidatedPaymentTransactions) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trDPFee','omTransientPayment',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE Datapark.dbo.trDPFee.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omTransientPayment WHERE dtPaymentDateTime BETWEEN @dtStartDate AND @dtEndDate)
AND intBoardNumber NOT IN (61,62,63)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID

END ELSE BEGIN 
INSERT INTO @tblProcessIDs SELECT 'trDPFee','omTransientPayment',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE intBoardNumber NOT IN (61,62,63)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID
END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omTransientPayment' ) WITH NOWAIT
/*============ omExceptionPayment ID Identification=====================*/

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omExceptionPayment' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omExceptionPayment) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trDPFee','omExceptionPayment',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE Datapark.dbo.trDPFee.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omExceptionPayment WHERE dtPaymentDateTime BETWEEN @dtStartDate AND @dtEndDate)
AND intBoardNumber IN (0)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trDPFee','omExceptionPayment',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE intBoardNumber IN (0)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omExceptionPayment' ) WITH NOWAIT

/*============ omCardUsage ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omCardUsage' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omCardUsage) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trDPFee','omCardUsage',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE Datapark.dbo.trDPFee.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omCardUsage WHERE dtExitDateTime BETWEEN @dtStartDate AND @dtEndDate)
AND intBoardNumber IN (62)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trDPFee','omCardUsage',ID FROM 
(
SELECT Datapark.dbo.trDPFee.ID
FROM Datapark.dbo.trDPFee
LEFT JOIN cfgPaymentTypeDesc ON dbo.cfgGetPayTypeCode(intTrMode, intTrType) = intPayCode
WHERE  intBoardNumber IN (62)
AND  dtExitDate BETWEEN @dtStartDate AND @dtEndDate
AND intRevenueStatus NOT IN (0)
) AS trFeeData
ORDER BY ID
END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omCardUsage' ) WITH NOWAIT

/*============ omMonthlyPayment ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omMonthlyPayment' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omMonthlyPayment) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'cmPaymentsHistory','omMonthlyPayment',ID FROM 
(
SELECT ID
FROM Datapark.dbo.cmPaymentsHistory
WHERE Datapark.dbo.cmPaymentsHistory.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omMonthlyPayment WHERE dtPaymentDateTime BETWEEN @dtStartDate AND @dtEndDate)
AND  [Payment Date] BETWEEN @dtStartDate AND @dtEndDate
) AS monthlyPayData
ORDER BY ID

END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'cmPaymentsHistory','omMonthlyPayment',ID FROM 
(
SELECT ID
FROM Datapark.dbo.cmPaymentsHistory
WHERE [Payment Date] BETWEEN @dtStartDate AND @dtEndDate
) AS monthlyPayData
ORDER BY ID
END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omMonthlyPayment' ) WITH NOWAIT
/*============ omOperatorSignOnOff ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omOperatorSignOnOff' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omOperatorSignOnOff) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trLogOnOff','omOperatorSignOnOff',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trLogOnOff
WHERE Datapark.dbo.trLogOnOff.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omOperatorSignOnOff WHERE dtDate1 BETWEEN @dtStartDate AND @dtEndDate)
AND  dtDate1 BETWEEN @dtStartDate AND @dtEndDate
) AS operatorData
ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trLogOnOff','omOperatorSignOnOff',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trLogOnOff
WHERE  dtDate1 BETWEEN @dtStartDate AND @dtEndDate
) AS operatorData
ORDER BY ID
END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omOperatorSignOnOff' ) WITH NOWAIT

/*============ omEventData ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'omEventData' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omEventData) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trEvent','omEventData',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trEvent
WHERE Datapark.dbo.trEvent.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omEventData WHERE dtEventDate BETWEEN @dtStartDate AND @dtEndDate AND strSourceTable = 'trEvent')
AND  dtTrDate BETWEEN @dtStartDate AND @dtEndDate
AND intEventCode IN  (SELECT intEventCode FROM [DataparkReporting].[dbo].[cfgEventsDesc]  WHERE intEventType IN (3))
) AS eventsData
ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trEvent','omEventData',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trEvent
WHERE  dtTrDate BETWEEN @dtStartDate AND @dtEndDate
AND intEventCode IN  (SELECT intEventCode FROM [DataparkReporting].[dbo].[cfgEventsDesc]  WHERE intEventType IN (3))
) AS eventsData
ORDER BY ID
END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'omEventData' ) WITH NOWAIT
/*============ omEventData ID Identification=====================*/
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] Start...', 0, 1,@strTimeStamp, 'trError omEventData' ) WITH NOWAIT

IF (SELECT COUNT(ID) FROM DataparkReporting.dbo.omEventData) > 0 BEGIN

INSERT INTO @tblProcessIDs SELECT 'trError','omEventData',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trError
WHERE Datapark.dbo.trError.ID NOT IN (SELECT  intOriginID FROM DataparkReporting.dbo.omEventData WHERE dtEventDate BETWEEN @dtStartDate AND @dtEndDate AND strSourceTable = 'trError')
AND  dtTrDate BETWEEN @dtStartDate AND @dtEndDate
AND intErrorType IN  (SELECT intEventCode FROM [DataparkReporting].[dbo].[cfgEventsDesc]  WHERE intEventType IN (4))
) AS errorEventsData
ORDER BY ID
END ELSE BEGIN
INSERT INTO @tblProcessIDs SELECT 'trError','omEventData',ID FROM 
(
SELECT ID
FROM Datapark.dbo.trError
WHERE dtTrDate BETWEEN @dtStartDate AND @dtEndDate
AND intErrorType IN  (SELECT intEventCode FROM [DataparkReporting].[dbo].[cfgEventsDesc]  WHERE intEventType IN (4))
) AS errorEventsData
ORDER BY ID
END 

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Analyze of [%s] End...', 0, 1,@strTimeStamp, 'trError omEventData' ) WITH NOWAIT
/*========================Get Total Operations Data===============================*/
SET @intOperationsCount  = @intOperationsCount + (SELECT COUNT(intID) FROM  @tblProcessIDs)
/*========================Transfer Data To DataparkReporting Database===============================*/


/*========================Insert into omConsolidatedPaymentTransactions ===============================*/

SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omConsolidatedPaymentTransactions')
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omConsolidatedPaymentTransactions',@intSubOperationsCount ) WITH NOWAIT
DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omConsolidatedPaymentTransactions') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omConsolidatedPaymentTransactions' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trDPFee' AND strDestinationTable='omConsolidatedPaymentTransactions'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO [DataparkReporting].[dbo].[omConsolidatedPaymentTransactions]
([intGarageID]
,[intMediaType]
,intUsageType
,[intFacilityCode]
,[strDocNumber]
,[intEntryLane]
,[dtEntryDateTime]
,[dtPaymentDateTime]
,[intExitLane]
,[dtExitDateTime]
,[intInvoiceNumber]
,[intPaymentStationNumber]
,[strCashierID]
,[strRateType]
,[mnPaymentAmount]
,[strDiscountType1]
,[mnDiscountAmount1]
,[strDiscountType2]
,[mnDiscountAmount2]
,[intIsAuto]
,[strSourceTable]
,[intOriginID]
,[mnGrossAmount]
,[intCCType]
,[intPaymentTypeCode]
,[intTaxType]
,[mnTaxAmount]
,[intReceiptNum]
)
 SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber)
,CASE WHEN intMediaType IS NULL OR intMediaType = 0 THEN 2 ELSE  intMediaType END AS intMediaType
,intUsageType  = CASE WHEN intMediaType NOT IN (2) 
THEN dbo.lsmGetUsageTypeByCardNumberAndMediaType(intTickNumber,intMediaType)
ELSE dbo.lsmGetUsageTypeByCardNumberAndMediaType(CASE WHEN LEN(strCardNum) > 0 THEN strCardNum 
ELSE  CONVERT(nvarchar(20), intTickDispenser)  +'-'+ CONVERT(nvarchar(20), intTickNumber) END ,intMediaType)
END
,intFacilityCode 
,LTRIM(RTRIM(CASE WHEN LEN(strCardNum) > 0 THEN strCardNum 
ELSE  CONVERT(nvarchar(20), intTickDispenser)  +'-'+ CONVERT(nvarchar(20), intTickNumber) END ))

,intTickDispenser AS intEntryLane
,dtEntryDate
,dtExitDate
,CASE WHEN intBoardType = 1 THEN intBoardNumber ELSE NULL END AS intExitLane
,CASE WHEN intBoardType = 1 THEN dtExitDate ELSE NULL END AS dtExitDate
,intTrNum
,intBoardNumber
,dbo.feeGetFCOperatorName( intOpNum)
,strRate = CASE WHEN ISNUMERIC(LTRIM(RTRIM(strRateKey))) > 0
THEN CONVERT(NVARCHAR(10),CONVERT(INT,LTRIM(RTRIM(strRateKey))))
ELSE LTRIM(RTRIM(strRateKey)) END
,mnTotal
,intDK1
,mnDA1
,intDK2
,mnDA2
,intIsAuto = CASE WHEN intTrMode NOT IN (3,7) THEN 0 ELSE 1 END
,'trDPFee'
,ID
,mnAmount
,(SELECT TOP 1  intCCType FROM cwCCRequest WHERE intFeeID = intCreditTrID
AND intLane = intBoardNumber AND intFeeID > 0 )
,Datapark.dbo.cfgGetPayTypeCodeByRateEx(intTrMode
,intTrType
,strRateKey
,intOpNum
)
,intTypeTax
,mnFeeTax
,intReceiptNumber
FROM Datapark.dbo.trDPFee WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)

DELETE FROM @tblTempProcessIDs
SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp, 'omConsolidatedPaymentTransactions',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omConsolidatedPaymentTransactions' ) WITH NOWAIT



/*========================Insert into omTransientPayment ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omTransientPayment')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omTransientPayment',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omTransientPayment') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omTransientPayment' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trDPFee' AND strDestinationTable='omTransientPayment'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO [DataparkReporting].[dbo].[omTransientPayment]
([intGarageID]
,[strMediaType]
,[intFacilityCode]
,[strDocNumber]
,[dtTickEntryDateTime]
,[dtPaymentDateTime]
,[intInvoiceNumber]
,[intStation]
,[strCashierID]
,[strRateType]
,[strPaymentType]
,[mnPaymentAmount]
,[strDiscountType1]
,[mnDiscountAmount1]
,[strDiscountType2]
,[mnDiscountAmount2]
,intIsAuto
,strSourceTable
,intOriginID
,mnGrossAmount
,intCCType
,intMediaType
,intPaymentTypeCode
,[intTaxType]
,[mnTaxAmount]
,[intReceiptNum]
)
 SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber)
,[dbo].[lsmGetMediaTypeDesc](intMediaType)
,intFacilityCode 
,LTRIM(RTRIM(LTRIM(RTRIM(CASE WHEN LEN(strCardNum) > 0 THEN strCardNum 
ELSE  CONVERT(nvarchar(20), intTickDispenser)  +'-'+ CONVERT(nvarchar(20), intTickNumber) END ))))
,dtEntryDate
,dtExitDate
,intTrNum
,intBoardNumber
,dbo.feeGetFCOperatorName( intOpNum)
,strRate = CASE WHEN ISNUMERIC(LTRIM(RTRIM(strRateKey))) > 0
THEN CONVERT(NVARCHAR(10),CONVERT(INT,LTRIM(RTRIM(strRateKey))))
ELSE LTRIM(RTRIM(strRateKey)) END
,strPaymentType= CASE WHEN strRateKey = '99'  THEN 'Short Money'
WHEN intTrMode < 4 AND intTrType NOT IN (3) THEN 'Cash'
WHEN intTrMode > 3 AND intTrType NOT IN (3) THEN 'Card'
END
,mnTotal
,intDK1
,mnDA1
,intDK2
,mnDA2
,intIsAuto = CASE WHEN intTrMode NOT IN (3,7) THEN 0 ELSE 1 END
,'trDPFee'
,ID
,mnAmount
,(SELECT top 1  intCCType FROM cwCCRequest WHERE intFeeID = intCreditTrID
AND intLane = intBoardNumber AND intFeeID > 0 )
,intMediaType
,Datapark.dbo.cfgGetPayTypeCode(intTrMode,intTrType)
,intTypeTax
,mnFeeTax
,intReceiptNumber
FROM Datapark.dbo.trDPFee WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)


DELETE FROM @tblTempProcessIDs
SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp,'omTransientPayment',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omTransientPayment' ) WITH NOWAIT


/*========================Insert into omGarageSession ===============================*/
SET @intProcessedOperationsCount = 0 
DELETE FROM @tblTempProcessIDs
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omGarageSession')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omGarageSession',@intSubOperationsCount ) WITH NOWAIT

WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omGarageSession') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omGarageSession' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'lsmCardHistory' AND strDestinationTable='omGarageSession'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )


INSERT INTO [DataparkReporting].[dbo].[omGarageSession]
   ([intGarageID]
   ,[strUsageType]
   ,[strMediaType]
   ,[intFacilityCode]
   ,[strDocNumber]
   ,[intEntryLane]
   ,[dtEntryDateTime]
   ,[intExitLane]
   ,[dtExitDateTime]
   ,strSourceTable
   ,intOriginID
   ,intMediaType
   ,intUsageType
   ,[intLprEntryId]
   ,[strEntryLicensePlateNumber]
   ,[strLprEntryImagePath]
   ,[intLprExitId]
   ,[strExitLicensePlateNumber]
   ,[strLprExitImagePath])
SELECT
CASE WHEN intModifyReason = 2 THEN  [dbo].[cfgGetAreaIdentificator](intExitLane)
ELSE [dbo].[cfgGetAreaIdentificator](intEntryLane) END
,[dbo].[lsmGetUsageTypeDesc](intUsageType)
,[dbo].[lsmGetMediaTypeDesc](intMediaType)
,intFacility
,LTRIM(RTRIM(strCardNumber))
,intEntryLane
,dtEntryDateTime = CASE WHEN dtTimeEntry> '2000-01-01'
THEN dtTimeEntry ELSE NULL END
,intExitLane = CASE WHEN intModifyReason = 1 THEN NULL ELSE  intExitLane END
,dtExitDateTime = CASE
WHEN intModifyReason = 1 THEN NULL
WHEN dtTimeExit>'2000-01-01' THEN dtTimeExit ELSE NULL END
,'lsmCardHistory'
,lsmCardData.ID
,intMediaType
,intUsageType
,intLprEntryId
,entryLPRData.strLicensePlateNumber
,entryLPRData.strPictureFile
,intLprExitId
,exitLPRData.strLicensePlateNumber
,exitLPRData.strPictureFile
FROM(SELECT
ID
,intModifyReason 
,intUsageType
,intMediaType
,intFacility
,strCardNumber
,intEntryLane
,dtTimeEntry
,intExitLane
,dtTimeExit 
,intPaymentLane
,dtPaymentDateTime
,intPassThruLane
,dtPassThruDate
,intLprEntryId
,intLprExitId
,intHWCardStatusCode
FROM  Datapark.dbo.lsmCardHistory
WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)
) AS lsmCardData
LEFT JOIN 
(SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata WHERE intPictureType = 1 ) AS entryLPRData
ON entryLPRData.intTransaction = intLprEntryId 
AND entryLPRData.intLane = intEntryLane
LEFT JOIN 
(SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata WHERE intPictureType = 1 ) AS exitLPRData
ON exitLPRData.intTransaction = intLprExitId
AND exitLPRData.intLane = intExitLane
WHERE intModifyReason IN (1,2)

DELETE FROM @tblTempProcessIDs
SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1, @strTimeStamp,'omGarageSession',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omGarageSession' ) WITH NOWAIT

/*========================Insert into omConsolidatedGarageSession ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omConsolidatedGarageSession')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omConsolidatedGarageSession',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omConsolidatedGarageSession') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'lsmCardHistory' AND strDestinationTable='omConsolidatedGarageSession' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'lsmCardHistory' AND strDestinationTable='omConsolidatedGarageSession'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )


INSERT INTO [DataparkReporting].[dbo].[omConsolidatedGarageSession]
 ([intGarageID]
,[intMediaType]
,[intUsageType]
,[intFacilityCode]
,[strDocNumber]
,[intModifyReason]
,[intHWCardStatusCode]
,[intEntryLane]
,[dtEntryDateTime]
,[intExitLane]
,[dtExitDateTime]
,[intPayLane]
,[dtPayDateTime]
,[intPassThruLane]
,[dtPassThruDateTime]
,[intLprEntryId]
,[strEntryLicensePlateNumber]
,[strLprEntryImagePath]
,[intLprExitId]
,[strExitLicensePlateNumber]
,[strLprExitImagePath]
,[strSourceTable]
,[intOriginID]
,intActivityLane
,dtTimeActivity
)
SELECT
CASE WHEN intModifyReason = 2 THEN  [dbo].[cfgGetAreaIdentificator](intExitLane)
ELSE [dbo].[cfgGetAreaIdentificator](intEntryLane) END
,intMediaType
,intUsageType
,intFacility
,LTRIM(RTRIM(strCardNumber))
,intModifyReason 
,intHWCardStatusCode
,intEntryLane
,dtEntryDateTime = CASE WHEN dtTimeEntry> '2000-01-01'
THEN dtTimeEntry ELSE NULL END
,intExitLane = CASE WHEN intModifyReason = 1 THEN NULL ELSE  intExitLane END
,dtExitDateTime = CASE
WHEN intModifyReason = 1 THEN NULL
WHEN dtTimeExit>'2000-01-01' THEN dtTimeExit ELSE NULL END
,intPaymentLane  = CASE WHEN intModifyReason = 1 THEN NULL ELSE intPaymentLane END
,dtPaymentDateTime = CASE WHEN intModifyReason = 1 THEN NULL ELSE dtPaymentDateTime END
,intPassThruLane = CASE WHEN intModifyReason = 1 THEN NULL ELSE intPassThruLane END
,dtPassThruDate = CASE WHEN intModifyReason = 1 THEN NULL ELSE dtPassThruDate END
,intLprEntryId 
,entryLPRData.strLicensePlateNumber
,entryLPRData.strPictureFile
,intLprExitId 
,exitLPRData.strLicensePlateNumber
,exitLPRData.strPictureFile
,'lsmCardHistory'
,lsmDetailedData.ID
,intActivityLane
,dtTimeActivity
FROM(SELECT
ID
,intModifyReason 
,intUsageType
,intMediaType
,intFacility
,strCardNumber
,intEntryLane
,dtTimeEntry
,intExitLane
,dtTimeExit 
,intPaymentLane
,dtPaymentDateTime
,intPassThruLane
,dtPassThruDate
,intLprEntryId
,intLprExitId
,intHWCardStatusCode
,intActivityLane
,dtTimeActivity
FROM  Datapark.dbo.lsmCardHistory
WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)) AS lsmDetailedData
LEFT JOIN 
 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata WHERE intPictureType = 1 ) AS entryLPRData
 ON entryLPRData.intTransaction = intLprEntryId
 AND entryLPRData.intLane = intEntryLane 
LEFT JOIN 
 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata WHERE intPictureType = 1 ) AS exitLPRData
 ON exitLPRData.intTransaction = intLprExitId 
 AND exitLPRData.intLane = intExitLane

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp, 'omConsolidatedGarageSession',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omConsolidatedGarageSession' ) WITH NOWAIT

/*========================Insert into cmPaymentsHistory ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'cmPaymentsHistory' AND strDestinationTable='omMonthlyPayment')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omMonthlyPayment',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'cmPaymentsHistory' AND strDestinationTable='omMonthlyPayment') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'cmPaymentsHistory' AND strDestinationTable='omMonthlyPayment' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'cmPaymentsHistory' AND strDestinationTable='omMonthlyPayment'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )


INSERT INTO [DataparkReporting].[dbo].[omMonthlyPayment]
([intGarageID]
,[strMediaType]
,[intFacilityCode]
,[strDocNumber]
,[dtPaymentDateTime]
,[intInvoiceNumber]
,[dtFromDate]
,[dtToDate]
,[strAccountNumber]
,[strRateType]
,[strPaymentType]
,[mnPaymentAmount]
,[intIsAuto]
,[strSourceTable]
,[intOriginID]
,intCCType
,intMediaType
,intPaymentTypeCode
,intCardUsageSubType
,intBoardNumber
,intReceiptNum
)
SELECT 
[intGarageID]
,[dbo].[lsmGetMediaTypeDesc]([dbo].[cardmngGetCardMediaType] (strDocNumber,intMediaType)) AS [strMediaType]
,[dbo].[cardmngGetCardFacCode](strDocNumber,intFacilityCode) 
,[strDocNumber]
,[dtPaymentDateTime]
,[intInvoiceNumber]
,[dtFromDate]
,[dtToDate]
,[strAccountNumber]
,dbo.cmGetCardChargeRateOrCode(strDocNumber,strRateType)
,[strPaymentType]
,[mnPaymentAmount]
,[intIsAuto]
,[strSourceTable]
,[intOriginID]
,intCCCode
,intMediaType
,intPaymentTypeCode
,intCardUsageSubType
,intBoardNumber
,intReceiptNum
FROM 
(
SELECT
 [dbo].[cfgGetAreaIdentificator](CASE WHEN intBoardNumber IS NOT NULL AND intBoardNumber > 0 THEN intBoardNumber ELSE 63 END ) AS intGarageID
,intMediaType AS intMediaType
,intFacility AS [intFacilityCode]
,CONVERT(nvarchar(256),[Card Number] ) AS strDocNumber
,[Payment Date] AS dtPaymentDateTime
,RefInvNo AS intInvoiceNumber
,FromDate  AS dtFromDate
,ToDate AS dtToDate
,LTRIM(RTRIM([Account Number])) AS strAccountNumber
,LTRIM(RTRIM(Rate)) AS strRateType
,LTRIM(RTRIM([Payment Method])) AS strPaymentType
,LTRIM(RTRIM([Card Type])) AS strCCType
,Amount AS mnPaymentAmount
,intIsAuto = CASE
WHEN Payer LIKE '%CBU%' THEN 1
WHEN (intBoardNumber IS NOT NULL AND intBoardNumber > 0) THEN 1
WHEN  Payer IS NULL AND (intBoardNumber IS NULL OR intBoardNumber = 0) THEN -1 
ELSE 0
END
,'cmPaymentsHistory' AS strSourceTable
,ID AS intOriginID
, CASE WHEN [Payment Method] LIKE '%Card%' THEN Datapark.dbo.cfgGetPayTypeCode(7,1) ELSE Datapark.dbo.cfgGetPayTypeCode(3,1) END AS intPaymentTypeCode
,CardType AS intCardUsageSubType
,intBoardNumber AS intBoardNumber
,intReceiptNumber AS intReceiptNum
FROM Datapark.dbo.cmPaymentsHistory WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)) AS DDD
LEFT JOIN cwCCMapName ON  strCCType LIKE strCCName

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ',  0, 1,@strTimeStamp, 'omMonthlyPayment',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT


INSERT INTO [DataparkReporting].[dbo].[omConsolidatedPaymentTransactions]
([intGarageID]
,[intMediaType]
,intUsageType
,[intFacilityCode]
,[strDocNumber]
,[dtEntryDateTime]
,[dtPaymentDateTime]
,[dtExitDateTime]
,[intInvoiceNumber]
,[intPaymentStationNumber]
,[strCashierID]
,strAccountNumber
,[strRateType]
,[mnPaymentAmount]
,intIsAuto
,strSourceTable
,intOriginID
,intCCType
,intPaymentTypeCode
,intCardUsageSubType
,intReceiptNum
)

SELECT 
[intGarageID]
,intMediaType
,dbo.lsmGetUsageTypeByCardNumberAndMediaType(strDocNumber,intMediaType) AS intUsageType 
,[dbo].[cardmngGetCardFacCode](strDocNumber,intFacilityCode) 
,[strDocNumber]
,[dtFromDate]
,[dtPaymentDateTime]
,[dtToDate]
,[intInvoiceNumber]
,intBoardNumber
,strPayer
,[strAccountNumber]
,dbo.cmGetCardChargeRateOrCode(strDocNumber,strRateType)
,[mnPaymentAmount]
,[intIsAuto]
,[strSourceTable]
,[intOriginID]
,intCCCode
,intPaymentTypeCode
,intCardUsageSubType
,intReceiptNum
FROM 
(
SELECT
[dbo].[cfgGetAreaIdentificator](CASE WHEN intBoardNumber IS NOT NULL AND intBoardNumber > 0 THEN intBoardNumber ELSE 63 END ) AS intGarageID
,Payer AS strPayer
,intMediaType AS intMediaType
,intFacility AS [intFacilityCode]
,CONVERT(nvarchar(256),[Card Number] ) AS strDocNumber
,[Payment Date] AS dtPaymentDateTime
,RefInvNo AS intInvoiceNumber
,FromDate  AS dtFromDate
,ToDate AS dtToDate
,LTRIM(RTRIM([Account Number])) AS strAccountNumber
,LTRIM(RTRIM(Rate)) AS strRateType
,LTRIM(RTRIM([Payment Method])) AS strPaymentType
,LTRIM(RTRIM([Card Type])) AS strCCType
,Amount AS mnPaymentAmount
,intIsAuto = CASE
WHEN Payer LIKE '%CBU%' THEN 1
WHEN (intBoardNumber IS NOT NULL AND intBoardNumber > 0) THEN 1
WHEN  Payer IS NULL AND (intBoardNumber IS NULL OR intBoardNumber = 0) THEN -1 
ELSE 0
END
,'cmPaymentsHistory' AS strSourceTable
,ID AS intOriginID
, CASE WHEN [Payment Method] LIKE '%Card%' THEN Datapark.dbo.cfgGetPayTypeCode(7,1) ELSE Datapark.dbo.cfgGetPayTypeCode(3,1) END AS intPaymentTypeCode
,CardType AS intCardUsageSubType
,intBoardNumber AS intBoardNumber
,intReceiptNumber AS intReceiptNum
FROM Datapark.dbo.cmPaymentsHistory WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)) AS DDD
LEFT JOIN cwCCMapName ON  strCCType LIKE strCCName

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ',  0, 1,@strTimeStamp ,'omConsolidatedPaymentTransactions',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omMonthlyPayment' ) WITH NOWAIT


/*========================Insert into trLogOnOff ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trLogOnOff' AND strDestinationTable='omOperatorSignOnOff')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'trLogOnOff',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trLogOnOff' AND strDestinationTable='omOperatorSignOnOff') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trLogOnOff' AND strDestinationTable='omOperatorSignOnOff' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trLogOnOff' AND strDestinationTable='omOperatorSignOnOff'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO [DataparkReporting].[dbo].[omOperatorSignOnOff]
([intGarageID]
,[intBoardNumber]
,[intBoardLocation]
,[intOpNumber]
,[strOperatorName]
,[dtDate]
,[intSign]
,[strSourceTable]
,[intOriginID]
,[dtSystemDate])
     
SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarageID
,intBoardNumber AS intBoardNumber
,intBoardType AS intBoardLocation
,intOpNumber AS intOpNumber
,Datapark.dbo.feeGetFCOperatorName(intOpNumber) AS strOperatorName
,dtDate1 AS dtDate
,intSign AS intSign
,'trLogOnOff' AS strSourceTable
,ID AS intOriginID
,GetDate() AS dtSystemDate
FROM Datapark.dbo.trLogOnOff 
WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)


DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1, @strTimeStamp,'omOperatorSignOnOff',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omOperatorSignOnOff' ) WITH NOWAIT


/*========================Insert into omEventData ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trEvent' AND strDestinationTable='omEventData')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omEventData',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trEvent' AND strDestinationTable='omEventData') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trEvent' AND strDestinationTable='omEventData' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trEvent' AND strDestinationTable='omEventData'

SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO [DataparkReporting].[dbo].[omEventData]
  ([intGarageID]
,[intBoardNumber]
,[intBoardLocation]
,[dtEventDate]
,[intEventType]
,[intNormalEvent]
,[intEventCode]
,[strSourceTable]
,[intOriginID]
,[dtSystemDate])
    
SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarageID
,intBoardNumber AS intBoardNumber
,intBoardType AS intBoardLocation
,dtTrDate AS dtEventDate
,3 AS intEventType
,intNormalEvent
,intEventCode AS intEventCode
,'trEvent' AS strSourceTable
,ID AS intOriginID
,GetDate() AS dtSystemDate
FROM Datapark.dbo.trEvent WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1, @strTimeStamp,'omEventData',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omEventData' ) WITH NOWAIT
/*========================Insert into errors in omEventData ===============================*/

SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trError' AND strDestinationTable='omEventData')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omEventData',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trError' AND strDestinationTable='omEventData') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trError' AND strDestinationTable='omEventData' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trError' AND strDestinationTable='omEventData'

SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO [DataparkReporting].[dbo].[omEventData]
  ([intGarageID]
,[intBoardNumber]
,[intBoardLocation]
,[dtEventDate]
,[intEventType]
,[intNormalEvent]
,[intEventCode]
,[strSourceTable]
,[intOriginID]
,[dtSystemDate])
    
SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarageID
,intBoardNumber AS intBoardNumber
,intBoardType AS intBoardLocation
,dtTrDate AS dtEventDate
,4 AS intEventType
,0 AS intNormalEvent
,intErrorType AS intEventCode
,'trError' AS strSourceTable
,ID AS intOriginID
,GetDate() AS dtSystemDate

FROM Datapark.dbo.trError WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp,'omEventData',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omEventData' ) WITH NOWAIT



/*========================Insert into omExceptionPayment ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omExceptionPayment')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omExceptionPayment',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omExceptionPayment') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omExceptionPayment' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trDPFee' AND strDestinationTable='omExceptionPayment'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO DataparkReporting.[dbo].[omExceptionPayment]
([intGarageID]
,[strMediaType]
,[dtPaymentDateTime]
,[intInvoiceNumber]
,[mnAmount]
,[intCCType]
,[strExceptionType]
,[intExceptionType]
,[strSourceTable]
,[intOriginID]
,dtSystemDate
,intMediaType
,intPaymentTypeCode
)
SELECT 
[intGarageID]
,[strMediaType]
,[dtPaymentDateTime]
,[intInvoiceNumber]
,[mnAmount]
,[intCCType]
,dbo.[cwGetCommand]([intExceptionType]) AS [strExceptionType]
,[intExceptionType]
,[strSourceTable]
,[intOriginID]
,dtSystemDate
,intMediaType
,intPaymentTypeCode
FROM (
SELECT
 [dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarageID
,[dbo].[lsmGetMediaTypeDesc](6) AS strMediaType
,dtExitDate AS dtPaymentDateTime
,intTrNum AS intInvoiceNumber
,ABS(mnAmount) AS mnAmount
,(SELECT top 1  intCCType FROM cwCCRequest WHERE DATEADD(second ,DATEPART(SECOND,dtRequestDate) *-1, dtRequestDate) = dtExitDate AND intLane = 0 AND intTranStatus IN (0,5)) AS intCCType
,intExceptionType = CASE 
WHEN intTrType NOT IN (3) THEN 4
ELSE ISNULL((SELECT top 1  intCommand FROM cwCCRequest WHERE DATEADD(second ,DATEPART(SECOND,dtRequestDate) *-1, dtRequestDate) = dtExitDate AND intLane = 0 
AND intTranStatus IN (0,5) AND intCommand IN(8,9) AND mnAmount = ABS(mnAmount)),0)
END
,'trDPFee' AS strSourceTable
,ID AS intOriginID
,GetDate() AS dtSystemDate
,6 AS intMediaType 
,Datapark.dbo.cfgGetPayTypeCode(intTrMode,intTrType) intPaymentTypeCode
FROM Datapark.dbo.trDPFee WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)
) AS CC

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp, 'omExceptionPayment',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omExceptionPayment' ) WITH NOWAIT


/*========================Insert into omCardUsage ===============================*/
SET @intSubOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omCardUsage')

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] Start records count[%d]', 0, 1,@strTimeStamp, 'omCardUsage',@intSubOperationsCount ) WITH NOWAIT

DELETE FROM @tblTempProcessIDs
SET @intProcessedOperationsCount = 0 
WHILE (SELECT COUNT(intID) FROM @tblProcessIDs  WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omCardUsage') > 0 BEGIN 

INSERT INTO @tblTempProcessIDs
SELECT TOP (@intProcessStep) intID FROM @tblProcessIDs WHERE  strSourceTable = 'trDPFee' AND strDestinationTable='omCardUsage' ORDER BY intID
DELETE FROM @tblProcessIDs WHERE intID IN (SELECT B.intID FROM @tblTempProcessIDs AS B) AND strSourceTable = 'trDPFee' AND strDestinationTable='omCardUsage'


SET @intProcessedOperationsCount = @intProcessedOperationsCount + (SELECT COUNT(intID) FROM @tblTempProcessIDs )

INSERT INTO DataparkReporting.[dbo].[omCardUsage]
([intGarageID]
,[strUsageType]
,[strMediaType]
,[intFacilityCode]
,[strDocNumber]
,[dtEntryDateTime]
,[dtExitDateTime]
,[strRate]
,[mnAmount]
,[dtSystemDate]
,[strSourceTable]
,[intOriginID])
SELECT
[dbo].[cfgGetAreaIdentificator](63) AS intGarageID
,dbo.lsmGetUsageTypeDesc(10 ) AS strUsageType
,[dbo].[lsmGetMediaTypeDesc](dbo.cardmngGetCardMediaType(CASE 	WHEN LEN(strCardNum) > 0 THEN strCardNum ELSE  CONVERT(nvarchar(20), intTickNumber) END,0)) AS strMediaType
,dbo.cardmngGetCardFacCode(CASE 	WHEN LEN(strCardNum) > 0 THEN strCardNum ELSE  CONVERT(nvarchar(20), intTickNumber) END,0) AS intFacilityCode
,CASE 	WHEN LEN(strCardNum) > 0 THEN strCardNum ELSE  CONVERT(nvarchar(20), intTickNumber) END AS [strDocNumber]
,dtEntryDate AS dtEntryDateTime
,dtExitDate AS dtExittDateTime
,strRateKey  AS strRate
,mnAmount AS mnAmount
,GetDate() AS dtSystemDate
,'trDPFee' AS strSourceTable
,ID AS intOriginID

FROM	Datapark.dbo.trDPFee WHERE ID IN (SELECT intID FROM @tblTempProcessIDs)

DELETE FROM @tblTempProcessIDs

SET @intSubProcessedOperationsCount = (SELECT COUNT(intID) FROM @tblProcessIDs)
SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	[%s] : %d from %d | total operations : %d from %d ', 0, 1,@strTimeStamp, 'omCardUsage',@intProcessedOperationsCount,  @intSubOperationsCount,@intSubProcessedOperationsCount,@intOperationsCount) WITH NOWAIT

END

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	Transfer to [%s] End.', 0, 1,@strTimeStamp, 'omCardUsage' ) WITH NOWAIT

/*========================Insert into  in omBoardsData ===============================*/
DELETE FROM [DataparkReporting].[dbo].[omBoardsData] WHERE intBoardNumber IN (SELECT BoardNumber FROM Datapark.dbo.cfgBoards)

INSERT INTO [DataparkReporting].[dbo].[omBoardsData]
([intGarageID]
,[intBoardNumber]
,[intBoardLocation]
,[intBoardPool]
,[intBoardTypeCode1]
,[intBoardTypeCode2]
,[strBoardDesc]
,[strSourceTable]
,[intOriginID]
,[dtSystemDate])

SELECT
 [dbo].[cfgGetAreaIdentificator](BoardNumber) AS intGarageID
,BoardNumber AS intBoardNumber
,EntryExit AS intBoardLocation
,Poll AS intBoardPool
,LaneType AS intBoardTypeCode1
,Terminal_1 AS intBoardTypeCode2
,Description AS strBoardDesc
,'cfgBoards' AS strSourceTable
,ID AS intOriginID
,GetDate() AS dtSystemDate
FROM Datapark.dbo.cfgBoards

SET @strTimeStamp = CONVERT(nvarchar(24),getdate(),120) 
RAISERROR ('[%s]	====End==== ', 0, 1, @strTimeStamp) WITH NOWAIT

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ResetDatabaseServiceBroker]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ResetDatabaseServiceBroker] WITH EXECUTE AS OWNER
AS
BEGIN
SET QUOTED_IDENTIFIER ON;
	
		BEGIN TRY		

		EXECUTE('ALTER DATABASE DATAPARK SET SINGLE_USER WITH ROLLBACK IMMEDIATE')
		EXECUTE('ALTER DATABASE DATAPARK SET NEW_BROKER WITH ROLLBACK IMMEDIATE')
		EXECUTE('ALTER DATABASE DATAPARK SET MULTI_USER WITH ROLLBACK IMMEDIATE')
		RETURN 0;
		END TRY
		
		BEGIN CATCH
		-- insert error into the MessageErrors table
		INSERT INTO dbo.sqlsrv_MessageErrors (
				strErrorProcedure, intErrorLine, intErrorNumber, strErrorMessage, 
				intErrorSeverity, intErrorState, xmlAuditedData)
		SELECT	ISNULL(ERROR_PROCEDURE(),'usp_ResetDatabaseServiceBroker'), ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE(), 
				ERROR_SEVERITY(), ERROR_STATE(), NULL	
				
		RETURN -1;	
		END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SendMessageData]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SendMessageData]
(
	@xmlMessageData XML
)
WITH EXECUTE AS OWNER
AS
BEGIN
SET QUOTED_IDENTIFIER ON;
	BEGIN TRY

		IF (SELECT is_broker_enabled FROM sys.databases WHERE name = 'Datapark') = 0 
		BEGIN
		INSERT INTO [dbo].[sqlsrv_MessageLog]
		([strSourceDB],[strSourceTable],[strTargetTable],[strUserID],[strDMLType],[xmlMessageData],[dtLogDate],[strLogSource])
		SELECT 'Datapark' ,'' , '' ,SUSER_SNAME() ,'W' ,@xmlMessageData, GETDATE(),'usp_SendMessageData:S.Brocer Disabled'
		RETURN;
		END;


		DECLARE @dlgId UNIQUEIDENTIFIER, @dlgIdExists BIT
		SELECT @dlgIdExists = 1
		
		SELECT	@dlgId = intDialogID FROM	dbo.sqlsrv_MessageDialogs AD WHERE	AD.DBID = DB_ID() AND strDialogClient = 'DPMS'
		IF 	@dlgId IS NULL
		BEGIN 
			SELECT @dlgIdExists = 0
		END

		-- Begin the dialog, either with existing or new Id
		BEGIN DIALOG @dlgId
			FROM SERVICE [//Datapark/InitiatorService] TO SERVICE
					N'//Datapark/TargetService'
			ON CONTRACT [//Datapark/MessageContract]
			WITH ENCRYPTION = OFF, LIFETIME = 3600;

		IF @dlgIdExists = 0
		BEGIN 
			INSERT INTO sqlsrv_MessageDialogs(DBID, intDialogID, strDialogClient) SELECT DB_ID(), @dlgId, 'DPMS'
		END
		--SELECT @@xmlMessageData
		;SEND ON CONVERSATION @dlgId MESSAGE TYPE [//Datapark/RequestMessage] (@xmlMessageData)
		EXECUTE('UPDATE [dbo].[sqlsrv_MessageDialogs] SET intPendingMessageCount = intPendingMessageCount + 1 WHERE [DBID] = DB_ID() AND strDialogClient = ''DPMS''')
	END TRY
	BEGIN CATCH
	IF (SELECT is_receive_enabled FROM sys.service_queues WHERE name = 'InitiatorQueue') = 1 BEGIN
		INSERT INTO dbo.sqlsrv_MessageErrors (
				strErrorProcedure, intErrorLine, intErrorNumber, strErrorMessage, 
				intErrorSeverity, intErrorState, xmlAuditedData)
		SELECT	ISNULL(ERROR_PROCEDURE(), 'usp_SendMessageData'), ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE(), 
				ERROR_SEVERITY(), ERROR_STATE(), @xmlMessageData
				END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WriteGarageStatistcsData]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_WriteGarageStatistcsData]
(@dtDate DATETIME)
AS
BEGIN
BEGIN TRY


DECLARE @dtStartDate AS DATETIME
DECLARE @dtEndDate AS DATETIME
SET @dtDate = CONVERT(DATETIME,(CONVERT(nvarchar(10), @dtDate, 120)))
SET @dtStartDate = (SELECT MAX(dtStatDate) FROM DataparkReporting.dbo.omGarageStatistic WHERE dtStatDate < @dtDate)
IF @dtStartDate IS NULL SET @dtStartDate = @dtDate
SET @dtEndDate = DATEADD(SECOND, 86399,@dtDate)
PRINT @dtDate
PRINT @dtStartDate
PRINT @dtEndDate


DECLARE @intGarageID AS int 
DECLARE @tblGargeIDS AS TABLE 
(
intGarageID int
)
INSERT INTO @tblGargeIDS
SELECT [dbo].[cfgGetAreaIdentificator](BoardNumber) FROM cfgBoards
WHERE IsActive = 1 
GROUP BY [dbo].[cfgGetAreaIdentificator](BoardNumber)
ORDER BY [dbo].[cfgGetAreaIdentificator](BoardNumber)

SET @intGarageID = 0 
WHILE @intGarageID IS NOT NULL BEGIN 
SET @intGarageID = (SELECT MIN(intGarageID) FROM @tblGargeIDS WHERE intGarageID > @intGarageID)
PRINT @intGarageID
DELETE FROM  @tblGargeIDS WHERE intGarageID = @intGarageID
IF @intGarageID IS NOT NULL BEGIN 
DELETE DataparkReporting.[dbo].[omGarageStatistic] WHERE intGarageID = @intGarageID 
AND dtStatDate BETWEEN @dtStartDate AND @dtEndDate 
INSERT INTO DataparkReporting.[dbo].[omGarageStatistic]
           ([intGarageID]
           ,[dtStatDate]
           ,[intNumberOfTickets]
           ,[intNumberOfGateEntry]
           ,[intNumberOfGateExit]
           ,[intLoopCounterArming]
           ,[intLoopCounterClosing]
           ,[dtSystemDate])
SELECT @intGarageID
,DATEADD(DAY,-1,dtDate)
,0 AS [intNumberOfTickets]
,0 AS [intNumberOfGateEntry]
,0 AS [intNumberOfGateExit]
,0 AS [intLoopCounterArming]
,0 AS [intLoopCounterClosing]
,GETDATE()
 FROM [Datapark].dbo.[CalculateTimePeriodFunc] (   @dtStartDate  , @dtEndDate ,1440)
 END
END 

;WITH cte_StatisticsData AS (
SELECT 
1 AS intType
,dtTrDate
,[dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarID
FROM trTicket WHERE dtTrDate BETWEEN @dtStartDate AND @dtEndDate
AND strTickType IN ('0','4') AND intBoardType IN (0)
/*=====================EntryGateStatus=====================*/
UNION ALL 
SELECT 
2 AS intType
,dtTrDate
,[dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarID
FROM trEvent WHERE intEventCode  = 16375 AND intBoardType = 0
AND dtTrDate BETWEEN @dtStartDate AND @dtEndDate
/*=====================ExitGateStatus=====================*/
UNION ALL 
SELECT 
3 AS intType
,dtTrDate
,[dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarID
FROM trEvent WHERE intEventCode  = 16375 AND intBoardType = 1
AND dtTrDate BETWEEN @dtStartDate AND @dtEndDate
/*=====================Arming Loops=====================*/
UNION ALL 
SELECT 
4 AS intType
,dtTrDate
,[dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarID
FROM trEvent WHERE intEventCode  = 16382
AND dtTrDate BETWEEN @dtStartDate AND @dtEndDate
/*=====================Closing Loops=====================*/
UNION ALL 
SELECT 
5 AS intType
,dtTrDate
,[dbo].[cfgGetAreaIdentificator](intBoardNumber) AS intGarID
FROM trEvent WHERE intEventCode  = 16381
AND dtTrDate BETWEEN @dtStartDate AND @dtEndDate
) 

UPDATE  DataparkReporting.[dbo].[omGarageStatistic] SET [intNumberOfTickets] = 
(SELECT COUNT(dtTrDate) FROM cte_StatisticsData WHERE dtTrDate BETWEEN dtStatDate AND DATEADD(SECOND, 86399, dtStatDate) AND intGarID = intGarageID AND intType = 1)
,[intNumberOfGateEntry] = 
(SELECT COUNT(dtTrDate) FROM cte_StatisticsData WHERE dtTrDate BETWEEN dtStatDate AND DATEADD(SECOND, 86399, dtStatDate) AND intGarID = intGarageID AND intType = 2)
,intNumberOfGateExit =
(SELECT COUNT(dtTrDate) FROM cte_StatisticsData WHERE dtTrDate BETWEEN dtStatDate AND DATEADD(SECOND, 86399, dtStatDate) AND intGarID = intGarageID AND intType = 3)
,intLoopCounterArming =
(SELECT COUNT(dtTrDate) FROM cte_StatisticsData WHERE dtTrDate BETWEEN dtStatDate AND DATEADD(SECOND, 86399, dtStatDate) AND intGarID = intGarageID AND intType = 4)
,intLoopCounterClosing=
(SELECT COUNT(dtTrDate) FROM cte_StatisticsData WHERE dtTrDate BETWEEN dtStatDate AND DATEADD(SECOND, 86399, dtStatDate) AND intGarID = intGarageID AND intType = 5)
WHERE dtStatDate  BETWEEN @dtStartDate AND @dtEndDate AND 
intGarageID IN (SELECT intGarID FROM cte_StatisticsData GROUP BY intGarID)



END TRY
BEGIN CATCH

INSERT INTO dbo.sqlsrv_MessageErrors (
strErrorProcedure, intErrorLine, intErrorNumber, strErrorMessage, 
intErrorSeverity, intErrorState, xmlAuditedData)
SELECT	ERROR_PROCEDURE(), ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE(), 
ERROR_SEVERITY(), ERROR_STATE(),''
END CATCH;
END	
GO
/****** Object:  StoredProcedure [dbo].[usp_WriteMessageData]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[usp_WriteMessageData]
WITH EXECUTE AS OWNER
AS
BEGIN
SET QUOTED_IDENTIFIER ON;
			DECLARE @msgBody XML	
			DECLARE @dlgId uniqueidentifier
			DECLARE @dtStart AS DATETIME		
			DECLARE @SourceTable sysname
			DECLARE @TargetTable sysname
			DECLARE @ChangedData XML
			DECLARE @DMLType CHAR(1)
			DECLARE @strMessageData AS nvarchar(MAX)

			WHILE(1=1)
			BEGIN
				
				BEGIN TRY		
					-- insert messages into audit table one message at a time
					;RECEIVE top(1) 
							@msgBody	= message_body,      
							@dlgId		= conversation_handle    
					FROM	[dbo].[TargetQueue]
								
					-- exit when the whole queue has been processed
					IF @@ROWCOUNT = 0 BREAK;
	
			SELECT	@SourceTable =	T.c.query('/Message/SourceTable').value('.[1]', 'sysname'),
					@TargetTable =  T.c.query('/Message/TargetTable').value('.[1]', 'sysname'),
					@DMLType =		T.c.query('/Message/DMLType').value('.[1]', 'NVARCHAR(1)'),
					@ChangedData =	T.c.query('*')
			FROM	@msgBody.nodes('/Message/ChangedData') T(c)

			SET @strMessageData = CONVERT(nvarchar(MAX),@ChangedData)


			/*=========================Populate receipt number from log transaction BEGIN ========*/
			IF @SourceTable='trLog' AND @TargetTable = 'trDPFee' BEGIN

			EXECUTE('
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
			
				INSERT INTO [DataparkReporting].[dbo].[omPaymentReceipts]
				([intBoardNumber]
				,[dtTrDate]
				,[intTransNumber]
				,[strRate]
				,[intTicketNumber]
				,[mnAmount]
				,[intReceiptNum]
				,[strSourceTable]
				,[intOriginID]
				)
				SELECT
				T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
				,T.Item.value(''dtTrDate[1]'', ''DATETIME'') AS dtTrDate
				,T.Item.value(''intTransNumber[1]'', ''INT'') AS intTransNumber
				,LTRIM(RTRIM(T.Item.value(''strRate[1]'', ''CHAR(10)''))) AS strRate
				,T.Item.value(''intTicketNumber[1]'', ''INT'') AS intTicketNumber
				,T.Item.value(''mnAmount[1]'', ''Money'') AS  mnAmount
				,T.Item.value(''intReceiptNum[1]'', ''BIGINT'') AS intReceiptNum
				,@SourceTable
				,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
				FROM	@ChangedData.nodes(''/inserted'') T(Item)

				UPDATE Datapark.dbo.trDPFee 
				SET intReceiptNumber = intLogReceiptNumber
				,dtLastModifyDate = GETDATE()
				FROM Datapark.dbo.trDpfee  WITH(NOLOCK) INNER JOIN
				(SELECT * FROM (
				SELECT logReceipts.intReceiptNum AS intLogReceiptNumber, trDPFee.ID AS intFeeTrID  FROM 
				(SELECT
				T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
				,T.Item.value(''dtTrDate[1]'', ''DATETIME'') AS dtTrDate
				,T.Item.value(''intTransNumber[1]'', ''INT'') AS intTransNumber
				,LTRIM(RTRIM(T.Item.value(''strRate[1]'', ''CHAR(10)''))) AS strRate
				,T.Item.value(''intTicketNumber[1]'', ''INT'') AS intTicketNumber
				,T.Item.value(''mnAmount[1]'', ''Money'') AS  mnAmount
				,T.Item.value(''intReceiptNum[1]'', ''BIGINT'') AS intReceiptNum
				FROM	@ChangedData.nodes(''/inserted'') T(Item)) AS logReceipts
				INNER JOIN Datapark.dbo.trDPFee WITH(NOLOCK) ON 
				trDPFee.intBoardNumber = logReceipts.intBoardNumber
				AND trDPFee.intTrNum = logReceipts.intTransNumber
				AND trDPFee.intTickNumber = logReceipts.intTicketNumber
				AND trDPFee.strRateKey = logReceipts.strRate
				AND (trDPFee.mnAmount = logReceipts.mnAmount
				OR (trDPFee.mnAmount+mnFeeTax) = logReceipts.mnAmount)
				WHERE (trDPFee.intReceiptNumber IS NULL OR trDPFee.intReceiptNumber = 0 ) AND trDPFee.mnAmount > 0 ) AS DDD
				WHERE   intFeeTrID  IS NOT NULL) AS Receipts
				ON trDPFee.ID= intFeeTrID
				')
				END


				/*========Populate EntryExit Info at DataparkReporting.dbo.omGarageSession BEGIN ========*/	
				IF @SourceTable='lsmCard' AND @TargetTable = 'omGarageSession' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				INSERT INTO [DataparkReporting].[dbo].[omGarageSession]
				   ([intGarageID]
				   ,[strUsageType]
				   ,[strMediaType]
				   ,[intFacilityCode]
				   ,[strDocNumber]
				   ,[intEntryLane]
				   ,[dtEntryDateTime]
				   ,[intExitLane]
				   ,[dtExitDateTime]
				   ,strSourceTable
				   ,intOriginID
				   ,intMediaType
				   ,intUsageType
				   ,[intLprEntryId]
				   ,[strEntryLicensePlateNumber]
				   ,[strLprEntryImagePath]
				   ,[intLprExitId]
				   ,[strExitLicensePlateNumber]
				   ,[strLprExitImagePath]
				   ,[strAccountNumber] 
				   ,[strAccountName])
				SELECT
				CASE WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 2 THEN  [dbo].[cfgGetAreaIdentificator](T.Item.value(''intExitLane[1]'', ''INT''))
				ELSE [dbo].[cfgGetAreaIdentificator](T.Item.value(''intEntryLane[1]'', ''INT'')) END
				,[dbo].[lsmGetUsageTypeDesc](T.Item.value(''intUsageType[1]'', ''INT''))
				,[dbo].[lsmGetMediaTypeDesc](T.Item.value(''intMediaType[1]'', ''INT''))
				,T.Item.value(''intFacility[1]'', ''INT'')
				,LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)'')))
				,T.Item.value(''intEntryLane[1]'', ''INT'')
				,dtEntryDateTime = 	CASE WHEN T.Item.value(''dtTimeEntry[1]'', ''DATETIME'')> ''2000-01-01''
				THEN T.Item.value(''dtTimeEntry[1]'', ''DATETIME'') ELSE NULL END
			    ,intExitLane = CASE WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL ELSE  T.Item.value(''intExitLane[1]'', ''INT'') END
				,dtExitDateTime = CASE
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				WHEN T.Item.value(''dtTimeExit[1]'', ''DATETIME'')>''2000-01-01'' THEN T.Item.value(''dtTimeExit[1]'', ''DATETIME'') ELSE NULL END
				,@SourceTable
				,T.Item.value(''ID[1]'', ''INT'')
				,T.Item.value(''intMediaType[1]'', ''INT'')
				,T.Item.value(''intUsageType[1]'', ''INT'')
				,T.Item.value(''intLprEntryId[1]'', ''INT'') 
				,entryLPRData.strLicensePlateNumber
				,entryLPRData.strPictureFile
				,T.Item.value(''intLprExitId[1]'', ''INT'') 
				,exitLPRData.strLicensePlateNumber
				,exitLPRData.strPictureFile
				,[Accounts].[Account Number] AS [strAccountNumber] 
				,[Accounts].[Account Name] AS [strAccountName]
				FROM	@ChangedData.nodes(''/inserted'') T(Item)
					LEFT JOIN 
				 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata  WITH(NOLOCK) WHERE intPictureType = 1 ) AS entryLPRData
				 ON entryLPRData.intTransaction = T.Item.value(''intLprEntryId[1]'', ''INT'') 
				 AND entryLPRData.intLane = T.Item.value(''intEntryLane[1]'', ''INT'')
				LEFT JOIN 
				 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata  WITH(NOLOCK) WHERE intPictureType = 1 ) AS exitLPRData
				 ON exitLPRData.intTransaction = T.Item.value(''intLprExitId[1]'', ''INT'') 
				  AND exitLPRData.intLane = T.Item.value(''intExitLane[1]'', ''INT'')
				LEFT JOIN [dbo].[Cards] WITH(NOLOCK) ON 
				LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) = [Cards].[Card Number]
				AND T.Item.value(''intMediaType[1]'', ''INT'') = [Cards].[intMediaType]
				AND T.Item.value(''intFacility[1]'', ''INT'') = [Cards].[intFacility]
				LEFT JOIN [dbo].[Accounts] WITH(NOLOCK) ON [Cards].[Account Number] = [Accounts].[Account Number]
				WHERE T.Item.value(''intModifyReason[1]'', ''INT'') IN (1,2)
			 

				/*Populate LSM Data in DataparkReporting.dbo.omConsolidatedGarageSession*/
				
				INSERT INTO [DataparkReporting].[dbo].[omConsolidatedGarageSession]
				   ([intGarageID]
					,[intMediaType]
					,[intUsageType]
					,[intFacilityCode]
					,[strDocNumber]
					,[intModifyReason]
					,[intHWCardStatusCode]
					,[intEntryLane]
					,[dtEntryDateTime]
					,[intExitLane]
					,[dtExitDateTime]
					,[intPayLane]
					,[dtPayDateTime]
					,[intPassThruLane]
					,[dtPassThruDateTime]
					,[intLprEntryId]
					,[strEntryLicensePlateNumber]
					,[strLprEntryImagePath]
					,[intLprExitId]
					,[strExitLicensePlateNumber]
					,[strLprExitImagePath]
					,[strSourceTable]
					,[intOriginID]
					,[intActivityLane]
					,[dtTimeActivity]
				    ,[strAccountNumber] 
				    ,[strAccountName])
				SELECT
				CASE WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 2 THEN  [dbo].[cfgGetAreaIdentificator](T.Item.value(''intExitLane[1]'', ''INT''))
				ELSE [dbo].[cfgGetAreaIdentificator](T.Item.value(''intEntryLane[1]'', ''INT'')) END
				,T.Item.value(''intMediaType[1]'', ''INT'')
				,T.Item.value(''intUsageType[1]'', ''INT'')
				,T.Item.value(''intFacility[1]'', ''INT'')
				,LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)'')))
				,T.Item.value(''intModifyReason[1]'', ''INT'') 
				,T.Item.value(''intHWCardStatusCode[1]'', ''INT'')
				,T.Item.value(''intEntryLane[1]'', ''INT'')
				,dtEntryDateTime = 	CASE WHEN T.Item.value(''dtTimeEntry[1]'', ''DATETIME'')> ''2000-01-01''
				THEN T.Item.value(''dtTimeEntry[1]'', ''DATETIME'') ELSE NULL END
			    ,intExitLane = CASE WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL ELSE  T.Item.value(''intExitLane[1]'', ''INT'') END
				,dtExitDateTime = CASE
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				WHEN T.Item.value(''dtTimeExit[1]'', ''DATETIME'')>''2000-01-01'' THEN T.Item.value(''dtTimeExit[1]'', ''DATETIME'') ELSE NULL END
				,intPayLane = CASE 
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				ELSE T.Item.value(''intPaymentLane[1]'', ''INT'') END
				,dtPayDateTime = CASE 
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				WHEN T.Item.value(''dtPaymentDateTime[1]'', ''DATETIME'') >''2000-01-01'' THEN T.Item.value(''dtPaymentDateTime[1]'', ''DATETIME'') ELSE NULL END
				
				,intPassThruLane = CASE 
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				ELSE T.Item.value(''intPassThruLane[1]'', ''INT'') END
				,dtPassThruDateTime = CASE 
				WHEN T.Item.value(''intModifyReason[1]'', ''INT'') = 1 THEN NULL
				WHEN T.Item.value(''dtPassThruDate[1]'', ''DATETIME'') >''2000-01-01'' THEN T.Item.value(''dtPassThruDate[1]'', ''DATETIME'') ELSE NULL END
				
				,T.Item.value(''intLprEntryId[1]'', ''INT'') 
				,entryLPRData.strLicensePlateNumber
				,entryLPRData.strPictureFile
				,T.Item.value(''intLprExitId[1]'', ''INT'') 
				,exitLPRData.strLicensePlateNumber
				,exitLPRData.strPictureFile
				,@SourceTable
				,T.Item.value(''ID[1]'', ''INT'')
				,T.Item.value(''intActivityLane[1]'', ''INT'')
				,T.Item.value(''dtTimeActivity[1]'', ''DATETIME'')
                ,[Accounts].[Account Number] AS [strAccountNumber] 
				,[Accounts].[Account Name] AS [strAccountName]
				FROM	@ChangedData.nodes(''/inserted'') T(Item)
				LEFT JOIN 
				 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata  WITH(NOLOCK) WHERE intPictureType = 1 ) AS entryLPRData
				 ON entryLPRData.intTransaction = T.Item.value(''intLprEntryId[1]'', ''INT'')
				 AND entryLPRData.intLane = T.Item.value(''intEntryLane[1]'', ''INT'') 
				LEFT JOIN 
				 (SELECT ID,intTransaction,intLane,strPictureFile, strLicensePlateNumber FROM Datapark.dbo.lsmLPRdata  WITH(NOLOCK) WHERE intPictureType = 1 ) AS exitLPRData
				 ON exitLPRData.intTransaction = T.Item.value(''intLprExitId[1]'', ''INT'') 
				 AND exitLPRData.intLane = T.Item.value(''intExitLane[1]'', ''INT'')
				LEFT JOIN [dbo].[Cards] WITH(NOLOCK) ON 
				LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) = [Cards].[Card Number]
				AND T.Item.value(''intMediaType[1]'', ''INT'') = [Cards].[intMediaType]
				AND T.Item.value(''intFacility[1]'', ''INT'') = [Cards].[intFacility]
				LEFT JOIN [dbo].[Accounts] WITH(NOLOCK) ON [Cards].[Account Number] = [Accounts].[Account Number]
				')
				END

				/*========Populate All Fee Payment Transactions at DataparkReporting.dbo.omConsolidatedPaymentTransactions BEGIN ========*/	
				IF @SourceTable='trDPFee' AND @TargetTable = 'omConsolidatedPaymentTransactions'  BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''

				INSERT INTO [DataparkReporting].[dbo].[omConsolidatedPaymentTransactions]
				   ([intGarageID]
				   ,[intMediaType]
				   ,intUsageType
				   ,[intFacilityCode]
				   ,[strDocNumber]
				   ,[intEntryLane]
				   ,[dtEntryDateTime]
				   ,[dtPaymentDateTime]
				   ,[intExitLane]
				   ,[dtExitDateTime]
				   ,[intInvoiceNumber]
				   ,[intPaymentStationNumber]
				   ,[strCashierID]
				   ,[strRateType]
				   ,[mnPaymentAmount]
				   ,[strDiscountType1]
				   ,[mnDiscountAmount1]
				   ,[strDiscountType2]
				   ,[mnDiscountAmount2]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,[mnGrossAmount]
				   ,[intCCType]
				   ,[intPaymentTypeCode]
				   ,[intTaxType]
				   ,[mnTaxAmount]
				   ,[intReceiptNum]
				   ,[mnSurchargeAmount]
				   )
					 SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT''))
					,T.Item.value(''intMediaType[1]'', ''INT'')
					,intUsageType  = CASE WHEN T.Item.value(''intMediaType[1]'', ''INT'') NOT IN (2) 
					THEN dbo.lsmGetUsageTypeByCardNumberAndMediaType(T.Item.value(''intTickNumber[1]'', ''CHAR(50)''),T.Item.value(''intMediaType[1]'', ''INT''))
					ELSE dbo.lsmGetUsageTypeByCardNumberAndMediaType(T.Item.value(''strDocNumber[1]'', ''CHAR(256)''),T.Item.value(''intMediaType[1]'', ''INT''))
					END
					,T.Item.value(''intFacilityCode [1]'', ''INT'')
					,LTRIM(RTRIM(T.Item.value(''strDocNumber[1]'', ''CHAR(256)'')))
					,T.Item.value(''intEntryLane[1]'', ''INT'')
					,T.Item.value(''dtEntryDate[1]'', ''DATETIME'')
					,T.Item.value(''dtExitDate[1]'', ''DATETIME'')
					,CASE WHEN T.Item.value(''intBoardType[1]'', ''INT'') = 1 THEN T.Item.value(''intBoardNumber[1]'', ''INT'') ELSE NULL END AS intExitLane
					,CASE WHEN T.Item.value(''intBoardType[1]'', ''INT'') = 1 THEN T.Item.value(''dtExitDate[1]'', ''DATETIME'') ELSE NULL END AS dtExitDate
					,T.Item.value(''intTrNum[1]'', ''INT'')
					,T.Item.value(''intBoardNumber[1]'', ''INT'')
					,dbo.feeGetFCOperatorName( T.Item.value(''intOpNum[1]'', ''INT''))
					,strRate = CASE WHEN ISNUMERIC(LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)'')))) > 0
					THEN CONVERT(NVARCHAR(10),CONVERT(INT,LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)'')))))
					ELSE LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)''))) END
					,T.Item.value(''mnTotal[1]'', ''MONEY'')
					,T.Item.value(''intDK1[1]'', ''INT'')
					,T.Item.value(''mnDA1[1]'', ''MONEY'')
					,T.Item.value(''intDK2[1]'', ''INT'')
					,T.Item.value(''mnDA2[1]'', ''MONEY'')
					,T.Item.value(''intIsAuto[1]'', ''INT'')
					,@SourceTable
					,T.Item.value(''ID[1]'', ''INT'')
					,T.Item.value(''mnAmount[1]'', ''MONEY'')
					,(SELECT TOP 1  intCCType FROM cwCCRequest  WITH(NOLOCK) WHERE intFeeID = T.Item.value(''intCreditTrID[1]'', ''INT'')
					AND intLane = T.Item.value(''intBoardNumber[1]'', ''INT'') AND intFeeID > 0 )
					,Datapark.dbo.[cfgGetPayTypeCodeByRateEx](T.Item.value(''intTrMode[1]'', ''INT'')
						,T.Item.value(''intTrType[1]'', ''INT'')
						,T.Item.value(''strRateKey[1]'', ''CHAR(50)'')
						,T.Item.value(''intOpNum[1]'', ''INT'')
						,T.Item.value(''mnTotal[1]'', ''MONEY'')
					)
					,T.Item.value(''intTypeTax[1]'', ''INT'')
					,T.Item.value(''mnFeeTax[1]'', ''MONEY'')
					,T.Item.value(''intReceiptNumber[1]'', ''BIGINT'')
					,T.Item.value(''mnSurchargeAmount[1]'', ''MONEY'')
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END
				

				/*========Populate Transient payments at DataparkReporting.dbo.omTransientPayment BEGIN ========*/	
				IF @SourceTable='trDPFee' AND @TargetTable = 'omTransientPayment'  BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''

				INSERT INTO [DataparkReporting].[dbo].[omTransientPayment]
				   ([intGarageID]
				   ,[strMediaType]
				   ,[intFacilityCode]
				   ,[strDocNumber]
				   ,[dtTickEntryDateTime]
				   ,[dtPaymentDateTime]
				   ,[intExitLane]
				   ,[dtExitDate]
				   ,[intInvoiceNumber]
				   ,[intStation]
				   ,[strCashierID]
				   ,[strRateType]
				   ,[strPaymentType]
				   ,[mnPaymentAmount]
				   ,[strDiscountType1]
				   ,[mnDiscountAmount1]
				   ,[strDiscountType2]
				   ,[mnDiscountAmount2]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,[mnGrossAmount]
				   ,[intCCType]
				   ,[intMediaType]
				   ,[intPaymentTypeCode]
				   ,[intTaxType]
				   ,[mnTaxAmount]
				   ,[intReceiptNum]
				   ,[mnSurchargeAmount]
				   )
					 SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT''))
					,[dbo].[lsmGetMediaTypeDesc](T.Item.value(''intMediaType[1]'', ''INT''))
					,T.Item.value(''intFacilityCode [1]'', ''INT'')
					,LTRIM(RTRIM(T.Item.value(''strDocNumber[1]'', ''CHAR(256)'')))
					,T.Item.value(''dtEntryDate[1]'', ''DATETIME'')
					,T.Item.value(''dtExitDate[1]'', ''DATETIME'')
					,CASE WHEN T.Item.value(''intBoardType[1]'', ''INT'') = 1 THEN T.Item.value(''intBoardNumber[1]'', ''INT'') ELSE NULL END AS intExitLane
					,CASE WHEN T.Item.value(''intBoardType[1]'', ''INT'') = 1 THEN T.Item.value(''dtExitDate[1]'', ''DATETIME'') ELSE NULL END AS dtExitDate
					,T.Item.value(''intTrNum[1]'', ''INT'')
					,T.Item.value(''intBoardNumber[1]'', ''INT'')
					,dbo.feeGetFCOperatorName( T.Item.value(''intOpNum[1]'', ''INT''))
					,strRate = CASE WHEN ISNUMERIC(LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)'')))) > 0
					THEN CONVERT(NVARCHAR(10),CONVERT(INT,LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)'')))))
					ELSE LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)''))) END
					,RTRIM(T.Item.value(''strPaymentType[1]'', ''CHAR(50)''))
					,T.Item.value(''mnTotal[1]'', ''MONEY'')
					,T.Item.value(''intDK1[1]'', ''INT'')
					,T.Item.value(''mnDA1[1]'', ''MONEY'')
					,T.Item.value(''intDK2[1]'', ''INT'')
					,T.Item.value(''mnDA2[1]'', ''MONEY'')
					,T.Item.value(''intIsAuto[1]'', ''INT'')
					,@SourceTable
					,T.Item.value(''ID[1]'', ''INT'')
					,T.Item.value(''mnAmount[1]'', ''MONEY'')
					,(SELECT top 1  intCCType FROM cwCCRequest  WITH(NOLOCK) WHERE intFeeID = T.Item.value(''intCreditTrID[1]'', ''INT'')
					AND intLane = T.Item.value(''intBoardNumber[1]'', ''INT'') AND intFeeID > 0 )
					,T.Item.value(''intMediaType[1]'', ''INT'')
					,Datapark.dbo.cfgGetPayTypeCode(T.Item.value(''intTrMode[1]'', ''INT''),T.Item.value(''intTrType[1]'', ''INT''))
					,T.Item.value(''intTypeTax[1]'', ''INT'')
					,T.Item.value(''mnFeeTax[1]'', ''MONEY'')
					,T.Item.value(''intReceiptNumber[1]'', ''BIGINT'')
					,T.Item.value(''mnSurchargeAmount[1]'', ''MONEY'')
					FROM	@ChangedData.nodes(''/inserted'') T(Item)

				')
				END

				/*========Populate Card payments at DataparkReporting.dbo.omMonthlyPayment BEGIN ========*/	
				IF @SourceTable='Payments' AND @TargetTable = 'omMonthlyPayment'  BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				INSERT INTO [DataparkReporting].[dbo].[omMonthlyPayment]
				   ([intGarageID]
				   ,[strMediaType]
				   ,[intFacilityCode]
				   ,[strDocNumber]
				   ,[dtPaymentDateTime]
				   ,[intInvoiceNumber]
				   ,[dtFromDate]
				   ,[dtToDate]
				   ,[strAccountNumber]
				   ,[strRateType]
				   ,[strPaymentType]
				   ,[mnPaymentAmount]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,intCCType
				   ,intMediaType
				   ,intPaymentTypeCode
				   ,intCardUsageSubType
				   ,intBoardNumber
				   ,intReceiptNum
				   ,[strAccountName]
				   )
				   SELECT 
				   [intGarageID]
				   ,[dbo].[lsmGetMediaTypeDesc]([dbo].[cardmngGetCardMediaType] (strDocNumber,intMediaType)) AS [strMediaType]
				   ,[dbo].[cardmngGetCardFacCode](strDocNumber,intFacilityCode) 
				   ,[strDocNumber]
				   ,[dtPaymentDateTime]
				   ,[intInvoiceNumber]
				   ,[dtFromDate]
				   ,[dtToDate]
				   ,[strAccountNumber]
				   ,dbo.cmGetCardChargeRateOrCode(strDocNumber,strRateType)
				   ,[strPaymentType]
				   ,[mnPaymentAmount]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,[intCCCode]
				   ,[intMediaType]
				   ,[intPaymentTypeCode]
				   ,[intCardUsageSubType]
				   ,[intBoardNumber]
				   ,[intReceiptNum]
				   ,[strAccountName]
				   FROM 
				   (
				   SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT'')) AS intGarageID
					,T.Item.value(''intMediaType[1]'', ''INT'') AS intMediaType
					,T.Item.value(''intFacility[1]'', ''INT'') AS [intFacilityCode]
					,LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) AS strDocNumber
					,T.Item.value(''dtPayDate[1]'', ''DATETIME'') AS dtPaymentDateTime
					,T.Item.value(''intInvoiceNumber[1]'', ''INT'') AS intInvoiceNumber
					,T.Item.value(''FromDate [1]'', ''DATETIME'') AS dtFromDate
					,T.Item.value(''ToDate[1]'', ''DATETIME'') AS dtToDate
					,LTRIM(RTRIM(T.Item.value(''strAccountNumber[1]'', ''CHAR(50)''))) AS strAccountNumber
					,LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)''))) AS strRateType
					,LTRIM(RTRIM(T.Item.value(''strPayType[1]'', ''CHAR(50)''))) AS strPaymentType
					,LTRIM(RTRIM(T.Item.value(''strCCType[1]'', ''CHAR(50)''))) AS strCCType
					,T.Item.value(''Amount[1]'', ''MONEY'') AS mnPaymentAmount
					,T.Item.value(''intIsAuto[1]'', ''INT'') AS intIsAuto
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					, CASE WHEN T.Item.value(''strPayType[1]'', ''CHAR(50)'') LIKE ''%Card%'' 
					THEN Datapark.dbo.cfgGetPayTypeCode(7,1) ELSE Datapark.dbo.cfgGetPayTypeCode(3,1) END AS intPaymentTypeCode
					,T.Item.value(''CardType[1]'', ''INT'') AS intCardUsageSubType
					,T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
					,T.Item.value(''intReceiptNumber[1]'', ''BIGINT'') AS intReceiptNum
					,[Account Name] AS strAccountName
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
					LEFT JOIN [dbo].[Cards] WITH(NOLOCK) ON 
					LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) = [Cards].[Card Number]
					AND T.Item.value(''intMediaType[1]'', ''INT'') = [Cards].[intMediaType]
					AND T.Item.value(''intFacility[1]'', ''INT'') = [Cards].[intFacility]
					LEFT JOIN [dbo].[Accounts] WITH(NOLOCK) ON [Cards].[Account Number] = [Accounts].[Account Number] 
					) AS DDD
					LEFT JOIN cwCCMapName  WITH(NOLOCK) ON  strCCType LIKE strCCName
					

					/*------------------------Populate Card Payment in Consolidated Payments Table--------------- */
					INSERT INTO [DataparkReporting].[dbo].[omConsolidatedPaymentTransactions]
				   ([intGarageID]
				   ,[intMediaType]
				   ,intUsageType
				   ,[intFacilityCode]
				   ,[strDocNumber]
				   ,[dtEntryDateTime]
				   ,[dtPaymentDateTime]
				   ,[dtExitDateTime]
				   ,[intInvoiceNumber]
				   ,[intPaymentStationNumber]
				   ,[strCashierID]
				   ,[strAccountNumber]
				   ,[strRateType]
				   ,[mnPaymentAmount]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,[intCCType]
				   ,[intPaymentTypeCode]
				   ,[intCardUsageSubType]
				   ,[intReceiptNum]
				   ,[strAccountName]
				   )

				   SELECT 
				   [intGarageID]
				   ,intMediaType
				   ,dbo.lsmGetUsageTypeByCardNumberAndMediaType(strDocNumber,intMediaType) AS intUsageType 
				   ,[dbo].[cardmngGetCardFacCode](strDocNumber,intFacilityCode) 
				   ,[strDocNumber]
				   ,[dtFromDate]
				   ,[dtPaymentDateTime]
				   ,[dtToDate]
				   ,[intInvoiceNumber]
				   ,intBoardNumber
				   ,strPayer
				   ,[strAccountNumber]
				   ,dbo.cmGetCardChargeRateOrCode(strDocNumber,strRateType)
				   ,[mnPaymentAmount]
				   ,[intIsAuto]
				   ,[strSourceTable]
				   ,[intOriginID]
				   ,intCCCode
				   ,intPaymentTypeCode
				   ,intCardUsageSubType
				   ,intReceiptNum
				   ,strAccountName
				   FROM 
				   (
				   SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT'')) AS intGarageID
					,T.Item.value(''intMediaType[1]'', ''INT'') AS intMediaType
					,T.Item.value(''intFacility[1]'', ''INT'') AS [intFacilityCode]
					,LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) AS strDocNumber
					,T.Item.value(''dtPayDate[1]'', ''DATETIME'') AS dtPaymentDateTime
					,T.Item.value(''intInvoiceNumber[1]'', ''INT'') AS intInvoiceNumber
					,T.Item.value(''FromDate [1]'', ''DATETIME'') AS dtFromDate
					,T.Item.value(''ToDate[1]'', ''DATETIME'') AS dtToDate
					,LTRIM(RTRIM(T.Item.value(''strAccountNumber[1]'', ''CHAR(50)''))) AS strAccountNumber
					,LTRIM(RTRIM(T.Item.value(''strRateKey[1]'', ''CHAR(50)''))) AS strRateType
					,LTRIM(RTRIM(T.Item.value(''strPayType[1]'', ''CHAR(50)''))) AS strPaymentType
					,LTRIM(RTRIM(T.Item.value(''strCCType[1]'', ''CHAR(50)''))) AS strCCType
					,T.Item.value(''Amount[1]'', ''MONEY'') AS mnPaymentAmount
					,T.Item.value(''intIsAuto[1]'', ''INT'') AS intIsAuto
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
					,T.Item.value(''strPayer[1]'', ''CHAR(50)'') AS strPayer
					, CASE WHEN T.Item.value(''strPayType[1]'', ''CHAR(50)'') LIKE ''%Card%'' 
					THEN Datapark.dbo.cfgGetPayTypeCode(7,1) ELSE Datapark.dbo.cfgGetPayTypeCode(3,1) END AS intPaymentTypeCode
					,T.Item.value(''CardType[1]'', ''INT'') AS intCardUsageSubType
					,T.Item.value(''intReceiptNumber[1]'', ''BIGINT'') AS intReceiptNum
					,[Account Name] AS strAccountName
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
					LEFT JOIN [dbo].[Cards] WITH(NOLOCK) ON 
					LTRIM(RTRIM(T.Item.value(''strCardNumber[1]'', ''CHAR(256)''))) = [Cards].[Card Number]
					AND T.Item.value(''intMediaType[1]'', ''INT'') = [Cards].[intMediaType]
					AND T.Item.value(''intFacility[1]'', ''INT'') = [Cards].[intFacility]
					LEFT JOIN [dbo].[Accounts] WITH(NOLOCK) ON [Cards].[Account Number] = [Accounts].[Account Number]
					) AS DDD
					LEFT JOIN cwCCMapName  WITH(NOLOCK) ON  strCCType LIKE strCCName
					

				')
				END
				
				/*==========================================FC Operators Log On Off Event =============================== */	
				IF @SourceTable='trLogOnOff' AND @TargetTable = 'omOperatorSignOnOff'  BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				INSERT INTO [DataparkReporting].[dbo].[omOperatorSignOnOff]
				([intGarageID]
				,[intBoardNumber]
				,[intBoardLocation]
				,[intOpNumber]
				,[strOperatorName]
				,[dtDate]
				,[intSign]
				,[strSourceTable]
				,[intOriginID]
				,[dtSystemDate])
     
				SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT'')) AS intGarageID
					,T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
					,T.Item.value(''intBoardType[1]'', ''INT'') AS intBoardLocation
					,T.Item.value(''intOpNumber[1]'', ''INT'') AS intOpNumber
					,Datapark.dbo.feeGetFCOperatorName(T.Item.value(''intOpNumber[1]'', ''INT'')) AS strOperatorName
					,T.Item.value(''dtDate1[1]'', ''DATETIME'') AS dtDate
					,T.Item.value(''intSign[1]'', ''INT'') AS intSign
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GetDate() AS dtSystemDate
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END

				/*========================================== Event data Storrage=============================== */	
				IF @SourceTable IN ('trEvent','trError') AND @TargetTable = 'omEventData' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				INSERT INTO [DataparkReporting].[dbo].[omEventData]
					  ([intGarageID]
						,[intBoardNumber]
						,[intBoardLocation]
						,[dtEventDate]
						,[intEventType]
						,[intNormalEvent]
						,[intEventCode]
						,[strSourceTable]
						,[intOriginID]
						,[dtSystemDate])
    
     			SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'',''INT'')) AS intGarageID
					,T.Item.value(''intBoardNumber[1]'',''INT'') AS intBoardNumber
					,T.Item.value(''intBoardType[1]'', ''INT'') AS intBoardLocation
					,T.Item.value(''dtTrDate[1]'', ''DATETIME'') AS dtEventDate
					,T.Item.value(''intEventType[1]'', ''INT'') AS intEventType
					,T.Item.value(''intNormalEvent[1]'', ''INT'') AS intNormalEvent
					,T.Item.value(''intEventCode[1]'', ''INT'') AS intEventCode
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GetDate() AS dtSystemDate
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END

				/*==========================================Boards configuration data Storrage=============================== */
				IF @SourceTable IN ('cfgBoards') AND @TargetTable = 'omBoardsData' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				DELETE FROM [DataparkReporting].[dbo].[omBoardsData] WHERE intBoardNumber IN (	SELECT T.Item.value(''BoardNumber[1]'',''INT'') FROM	@ChangedData.nodes(''/inserted'') T(Item))

				INSERT INTO [DataparkReporting].[dbo].[omBoardsData]
	           ([intGarageID]
				,[intBoardNumber]
			    ,[intBoardLocation]
				,[intBoardPool]
				,[intBoardTypeCode1]
				,[intBoardTypeCode2]
				,[strBoardDesc]
				,[strSourceTable]
				,[intOriginID]
				,[dtSystemDate])
    
     			SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''BoardNumber[1]'',''INT'')) AS intGarageID
					,T.Item.value(''BoardNumber[1]'',''INT'') AS intBoardNumber
					,T.Item.value(''EntryExit[1]'', ''INT'') AS intBoardLocation
					,T.Item.value(''Poll[1]'', ''INT'') AS intBoardPool
					,T.Item.value(''LaneType[1]'', ''INT'') AS intBoardTypeCode1
					,T.Item.value(''Terminal_1[1]'', ''INT'') AS intBoardTypeCode2
					,T.Item.value(''Description[1]'', ''CHAR(50)'') AS strBoardDesc
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GetDate() AS dtSystemDate
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END

				/*==========================================Manual Credit Card Payments ========================*/
				IF @SourceTable IN ('trDpFee') AND @TargetTable = 'omExceptionPayment' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''

				INSERT INTO DataparkReporting.[dbo].[omExceptionPayment]
					([intGarageID]
					,[strMediaType]
					,[dtPaymentDateTime]
					,[intInvoiceNumber]
					,[mnAmount]
					,[intCCType]
					,[strExceptionType]
					,[intExceptionType]
					,[strSourceTable]
					,[intOriginID]
					,dtSystemDate
					,intMediaType
					,intPaymentTypeCode
					,mnSurchargeAmount
					)
					SELECT 
					[intGarageID]
					,[strMediaType]
					,[dtPaymentDateTime]
					,[intInvoiceNumber]
					,[mnAmount]
					,[intCCType]
					,dbo.[cwGetCommand]([intExceptionType]) AS [strExceptionType]
					,[intExceptionType]
					,[strSourceTable]
					,[intOriginID]
					,dtSystemDate
					,intMediaType
					,intPaymentTypeCode
					,mnSurchargeAmount
					FROM (
					SELECT
					 [dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'',''INT'')) AS intGarageID
					,[dbo].[lsmGetMediaTypeDesc](T.Item.value(''intMediaType[1]'', ''INT'')) AS strMediaType
					,T.Item.value(''dtExitDate[1]'', ''DATETIME'') AS dtPaymentDateTime
					,T.Item.value(''intTrNum[1]'', ''INT'') AS intInvoiceNumber
					,ABS(T.Item.value(''mnAmount[1]'', ''MONEY'')) AS mnAmount
					,(SELECT top 1  intCCType FROM cwCCRequest  WITH(NOLOCK) WHERE DATEADD(second ,DATEPART(SECOND,dtRequestDate) *-1, dtRequestDate) = T.Item.value(''dtExitDate[1]'', ''DATETIME'') AND intLane = 0 AND intTranStatus IN (0,5)) AS intCCType
					,intExceptionType = CASE 
					WHEN T.Item.value(''intTrType[1]'', ''INT'') NOT IN (3) THEN 4
					ELSE ISNULL((SELECT top 1  intCommand FROM cwCCRequest  WITH(NOLOCK) WHERE DATEADD(second ,DATEPART(SECOND,dtRequestDate) *-1, dtRequestDate) = T.Item.value(''dtExitDate[1]'', ''DATETIME'') AND intLane = 0 
					AND intTranStatus IN (0,5) AND intCommand IN(8,9) AND mnAmount = ABS(T.Item.value(''mnAmount[1]'', ''MONEY''))),0)
					END
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GetDate() AS dtSystemDate
					,T.Item.value(''intMediaType[1]'', ''INT'') AS intMediaType
					,Datapark.dbo.cfgGetPayTypeCode(T.Item.value(''intTrMode[1]'', ''INT''),T.Item.value(''intTrType[1]'', ''INT'')) intPaymentTypeCode
					,T.Item.value(''mnSurchargeAmount[1]'', ''MONEY'') AS mnSurchargeAmount
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
					) AS CC


				')
				END
				
				/*==========================================Debit Card Usage ========================*/
				IF @SourceTable IN ('trDpFee') AND @TargetTable = 'omCardUsage' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''

				INSERT INTO DataparkReporting.[dbo].[omCardUsage]
				  ([intGarageID]
				 ,[strUsageType]
				 ,[strMediaType]
				 ,[intFacilityCode]
				 ,[strDocNumber]
				 ,[dtEntryDateTime]
				 ,[dtExitDateTime]
				 ,[strRate]
				 ,[mnAmount]
				 ,[dtSystemDate]
				 ,[strSourceTable]
				 ,[intOriginID])
				 SELECT
					 [dbo].[cfgGetAreaIdentificator](63) AS intGarageID
					,dbo.lsmGetUsageTypeDesc(T.Item.value(''intUsageType[1]'', ''INT'')) AS strUsageType
					,[dbo].[lsmGetMediaTypeDesc](dbo.cardmngGetCardMediaType(T.Item.value(''strDocNumber[1]'', ''CHAR(256)''),0)) AS strMediaType
					,dbo.cardmngGetCardFacCode(T.Item.value(''strDocNumber[1]'', ''CHAR(256)''),0) AS intFacilityCode
					,T.Item.value(''strDocNumber[1]'', ''CHAR(256)'') AS [strDocNumber]
					,T.Item.value(''dtEntryDate[1]'', ''DATETIME'') AS dtEntryDateTime
					,T.Item.value(''dtExitDate[1]'', ''DATETIME'') AS dtExittDateTime
					,T.Item.value(''strRateKey [1]'', ''CHAR(50)'') AS strRate
					,T.Item.value(''mnAmount[1]'', ''MONEY'') AS mnAmount
					,GetDate() AS dtSystemDate
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					
					FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END
				
				/*==========================================DP Hotel Valet Passage Operations Tracking ========================*/
				IF @SourceTable IN ('trnCardPass') AND @TargetTable = 'dpHotelValetPassageOperations' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				INSERT INTO [DataparkReporting].[dbo].[dpHotelValetPassageOperations]
				([dtOperationDateTime]
				,[intBoardNumber]
				,[intBoardType]
				,[strCardNumber]
				,[intMediaType]
				,[intUsageType]
				,[intFacilityCode]
				,[dtValidFrom]
				,[dtValidTo]
				,[strAssistCardNumber]
				,[intAssistCardMediaType]
				,[intAssistCardFacilityCode]
				,[strOperatorName]
				,[intCardStatusCode]
				,[strSourceTable]
				,[intOriginID]
				,[dtSystemDate]
				,[intTransferStatus])
				SELECT
					 T.Item.value(''dtTrDate[1]'', ''DATETIME'') AS dtOperationDateTime
					,T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
					,T.Item.value(''intBoardType[1]'', ''INT'') AS intBoardType
					,T.Item.value(''strCardNum[1]'', ''CHAR(256)'') AS strCardNumber
					,T.Item.value(''intMediaType[1]'', ''INT'') AS intMediaType
					,T.Item.value(''intUsageType[1]'', ''INT'') AS intUsageType
					,T.Item.value(''intFacilityCode[1]'', ''INT'') AS intFacilityCode
					,T.Item.value(''dtStartDate[1]'', ''DATETIME'') AS dtValidFrom
					,T.Item.value(''dtEndDate[1]'', ''DATETIME'') AS dtValidTo
					,T.Item.value(''strAssistCardNumber[1]'', ''CHAR(256)'') AS strAssistCardNumber
					,T.Item.value(''intAssistCardMediaType[1]'', ''INT'') AS intAssistCardMediaType
					,T.Item.value(''intAssistCardFacilityCode[1]'', ''INT'') AS intAssistCardFacilityCode
					,ISNULL([Cards].[First Name],'''') +'' '' + ISNULL([Cards].[Last Name],'''') AS strOperatorName
					,T.Item.value(''intCardStatusCode[1]'', ''INT'') AS intCardStatusCode
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GETDATE() AS dtSystemDate
					, 0 AS intTransferStatus
				FROM	@ChangedData.nodes(''/inserted'') T(Item)
				LEFT JOIN [dbo].[Cards] WITH(NOLOCK) ON 
				T.Item.value(''strAssistCardNumber[1]'', ''CHAR(256)'') = [Cards].[Card Number]
				AND T.Item.value(''intAssistCardMediaType[1]'', ''INT'') = [Cards].[intMediaType]
				AND T.Item.value(''intAssistCardFacilityCode[1]'', ''INT'') = [Cards].[intFacility]
				')
				END
				

				/*==========================================Z Reports Data Transfer ========================*/
				IF @SourceTable IN ('dprZReports') AND @TargetTable = 'omZReports' BEGIN

				EXECUTE(
				'
				DECLARE 
				@SourceTable sysname
				,@ChangedData XML						
			
				SET @SourceTable = '''+@SourceTable+'''
				SET @ChangedData = '''+@strMessageData+'''
				
				
				INSERT INTO [DataparkReporting].[dbo].[omZReports]
				([intZReportNum]
				,[intBoardNumber]
				,[intStructCode]
				,[strCodeDesc]
				,[vtValue]
				,[vtNominal]
				,[dtDBStoreDate]
				,[strSourceTable]
				,[intOriginID]
				,[dtSystemDate]
				,[intGarageID])
				SELECT
					 T.Item.value(''intZReportNum[1]'', ''INT'') AS intZReportNum
					,T.Item.value(''intBoardNumber[1]'', ''INT'') AS intBoardNumber
					,T.Item.value(''intStructCode[1]'', ''INT'') AS intStructCode
					,T.Item.value(''strCodeDesc[1]'', ''CHAR(256)'') AS strCodeDesc
					,T.Item.value(''vtValue[1]'', ''CHAR(256)'') AS vtValue
					,T.Item.value(''vtNominal[1]'', ''CHAR(256)'') AS vtNominal
					,T.Item.value(''dtDBStoreDate[1]'', ''DATETIME'') AS dtDBStoreDate
					,@SourceTable AS strSourceTable
					,T.Item.value(''ID[1]'', ''INT'') AS intOriginID
					,GETDATE() AS dtSystemDate
					,[dbo].[cfgGetAreaIdentificator](T.Item.value(''intBoardNumber[1]'', ''INT'')) AS intGarageID
				FROM	@ChangedData.nodes(''/inserted'') T(Item)
				')
				END

				END CONVERSATION @dlgId;

				END TRY
				BEGIN CATCH

				-- insert error into the AuditErrors table
					INSERT INTO dbo.sqlsrv_MessageErrors (
						strErrorProcedure, intErrorLine, intErrorNumber, strErrorMessage, 
						intErrorSeverity, intErrorState, xmlAuditedData)
				SELECT	ISNULL(ERROR_PROCEDURE(),'usp_WriteMessageData'), ERROR_LINE(), ERROR_NUMBER(), ERROR_MESSAGE(), 
						ERROR_SEVERITY(), ERROR_STATE(), @msgBody	

					IF (SELECT is_receive_enabled FROM sys.service_queues WHERE name = 'TargetQueue') = 0 RETURN;
				END CATCH;
			END	
		END
GO
/****** Object:  StoredProcedure [dbo].[zxReportSequenceGenerator]    Script Date: 30/12/2019 07:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zxReportSequenceGenerator]( @intZXReportSequence BIGINT OUTPUT  )
AS
BEGIN
SET @intZXReportSequence = (SELECT MAX([intZXReportSequence]) FROM [dbo].[cfgZXReportSequence])
IF @intZXReportSequence IS NULL BEGIN
DECLARE @strStartSequence AS NVARCHAR(20)
SET @strStartSequence = CONVERT(NVARCHAR(20),ISNULL((SELECT MAX(intReportSequenceID) FROM [dbo].[dprZReports]),0)+1)
EXECUTE('INSERT INTO [dbo].[cfgZXReportSequence]([intZXReportSequence]) SELECT '+@strStartSequence)
SET @intZXReportSequence = CONVERT(BIGINT,@strStartSequence)
END
EXECUTE('UPDATE [dbo].[cfgZXReportSequence] SET [intZXReportSequence] = [intZXReportSequence]+1')
SELECT ISNULL(@intZXReportSequence, 1)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'INFO=0, WARNING=1, ERROR=2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'authSystemOpsLog', @level2type=N'COLUMN',@level2name=N'intLogType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Enum: Reg, Rsvd, Des' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cmLacPermitCard', @level2type=N'COLUMN',@level2name=N'intPermitType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'intLaneID = cmMERLane.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cmMERData', @level2type=N'COLUMN',@level2name=N'intLaneID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The SessionId is to be obtained from dbo.LOG table, thus giving info to whoever registered the request' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cmQueueToDpws', @level2type=N'COLUMN',@level2name=N'intSessionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Additional FirstData Nashville data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cwCCNashvilleExtraData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes', @level2type=N'COLUMN',@level2name=N'strLaneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes', @level2type=N'COLUMN',@level2name=N'strLaneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2055 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes', @level2type=N'COLUMN',@level2name=N'strLaneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'reptmpLanes'
GO
USE [master]
GO
ALTER DATABASE [Datapark] SET  READ_WRITE 
GO
