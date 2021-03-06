USE [master]
GO
/****** Object:  Database [DB_CONFIGURACIONES]    Script Date: 30/12/2019 07:24:09 ******/
CREATE DATABASE [DB_CONFIGURACIONES] ON  PRIMARY 
( NAME = N'DB_CONFIGURACIONES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLDESA08\MSSQL\DATA\DB_CONFIGURACIONES.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_CONFIGURACIONES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLDESA08\MSSQL\DATA\DB_CONFIGURACIONES_log.LDF' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CONFIGURACIONES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET DB_CHAINING OFF 
GO
USE [DB_CONFIGURACIONES]
GO
/****** Object:  UserDefinedFunction [dbo].[EliminarCaracteres]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[EliminarCaracteres](@Input varchar(1000))
RETURNS VARCHAR(1000)
BEGIN
  DECLARE @pos INT
  SET @Pos = PATINDEX('%[^0-9]%',@Input)
  WHILE @Pos > 0
   BEGIN
    SET @Input = STUFF(@Input,@pos,1,'')
    SET @Pos = PATINDEX('%[^0-9]%',@Input)
   END
  RETURN @Input
END
GO
/****** Object:  Table [dbo].[adm_Auditoria]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Auditoria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tbl_gestionada] [varchar](50) NOT NULL,
	[accion_realizada] [varchar](25) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[descripcion] [xml] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__adm_Audi__3214EC271367E606] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Modulo]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Modulo](
	[id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_modulo] [varchar](100) NOT NULL,
	[descripcion_modulo] [varchar](180) NOT NULL,
	[icono_item] [nchar](60) NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__adm_Modu__B2584DFC1B0907CE] PRIMARY KEY CLUSTERED 
(
	[id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Modulo_Opcion]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Modulo_Opcion](
	[id_modulo_opcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre_opcion] [nvarchar](250) NOT NULL,
	[nombre_controlador_opcion] [nvarchar](100) NULL,
	[nivel_opcion] [tinyint] NOT NULL,
	[estado_opcion] [bit] NOT NULL,
	[descripcion_menu_opcion] [nvarchar](max) NULL,
	[id_modulo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__adm_Modu__5A99E8A225869641] PRIMARY KEY CLUSTERED 
(
	[id_modulo_opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Modulo_Opcion_Usuario]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Modulo_Opcion_Usuario](
	[id_usuario] [int] NOT NULL,
	[id_modulo_opcion] [int] NOT NULL,
	[tiene_permiso] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_modulo_opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Sucursal]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Sucursal](
	[id_sucursal] [smallint] IDENTITY(1,1) NOT NULL,
	[sucursal_nombre] [varchar](50) NOT NULL,
	[sucursal_estado] [bit] NOT NULL,
	[sucursal_nombre_db] [varchar](60) NULL,
	[sucursal_prefijo] [varchar](8) NOT NULL,
	[sucursal_fecha] [datetime] NOT NULL,
 CONSTRAINT [id_sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Tarjetas]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Tarjetas](
	[id_tarjeta] [int] IDENTITY(1,1) NOT NULL,
	[intFacility] [int] NOT NULL,
	[estado_facility] [bit] NOT NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Usuario]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[clave_usuario] [varchar](100) NOT NULL,
	[nombre_usuario] [varchar](200) NOT NULL,
	[estado_usuario] [bit] NOT NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_UsuariosEnSucursales]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_UsuariosEnSucursales](
	[id_usuario] [int] NOT NULL,
	[id_sucursal] [smallint] NOT NULL,
 CONSTRAINT [pk_usuario_surcursal] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conf_Conexiones_Remotas]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conf_Conexiones_Remotas](
	[id_conexion] [smallint] IDENTITY(1,1) NOT NULL,
	[conexion_nombre] [varchar](30) NOT NULL,
	[id_sucursal] [smallint] NOT NULL,
 CONSTRAINT [conexion_nombre] PRIMARY KEY CLUSTERED 
(
	[conexion_nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sucursal_nombre_db]    Script Date: 30/12/2019 07:24:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [sucursal_nombre_db] ON [dbo].[adm_Sucursal]
(
	[sucursal_nombre_db] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indexIdUsuarioIdSucursal]    Script Date: 30/12/2019 07:24:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [indexIdUsuarioIdSucursal] ON [dbo].[adm_UsuariosEnSucursales]
(
	[id_usuario] ASC,
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adm_Auditoria] ADD  CONSTRAINT [DF__adm_Audit__fecha__15502E78]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[adm_Modulo] ADD  CONSTRAINT [DF__adm_Modul__fecha__1CF15040]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[adm_Modulo_Opcion] ADD  CONSTRAINT [DF__adm_Modul__estad__276EDEB3]  DEFAULT ((1)) FOR [estado_opcion]
GO
ALTER TABLE [dbo].[adm_Modulo_Opcion] ADD  CONSTRAINT [DF__adm_Modul__fecha__286302EC]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[adm_Modulo_Opcion_Usuario] ADD  DEFAULT ((0)) FOR [tiene_permiso]
GO
ALTER TABLE [dbo].[adm_Sucursal] ADD  CONSTRAINT [DF__adm_Sucur__sucur__534D60F1]  DEFAULT ((1)) FOR [sucursal_estado]
GO
ALTER TABLE [dbo].[adm_Sucursal] ADD  CONSTRAINT [DF__adm_Sucur__sucur__5441852A]  DEFAULT (getdate()) FOR [sucursal_fecha]
GO
ALTER TABLE [dbo].[adm_Tarjetas] ADD  DEFAULT ((0)) FOR [estado_facility]
GO
ALTER TABLE [dbo].[adm_Tarjetas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[adm_Usuario] ADD  DEFAULT ((1)) FOR [estado_usuario]
GO
ALTER TABLE [dbo].[adm_Usuario] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[adm_Modulo_Opcion]  WITH CHECK ADD  CONSTRAINT [fk_moduloOpcion_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[adm_Modulo] ([id_modulo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[adm_Modulo_Opcion] CHECK CONSTRAINT [fk_moduloOpcion_modulo]
GO
ALTER TABLE [dbo].[adm_UsuariosEnSucursales]  WITH CHECK ADD  CONSTRAINT [fk_ensucursales_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[adm_Sucursal] ([id_sucursal])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[adm_UsuariosEnSucursales] CHECK CONSTRAINT [fk_ensucursales_sucursal]
GO
ALTER TABLE [dbo].[adm_UsuariosEnSucursales]  WITH CHECK ADD  CONSTRAINT [fk_ensucursales_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[adm_Usuario] ([id_usuario])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[adm_UsuariosEnSucursales] CHECK CONSTRAINT [fk_ensucursales_usuario]
GO
ALTER TABLE [dbo].[conf_Conexiones_Remotas]  WITH CHECK ADD  CONSTRAINT [fk_conexionesremotas_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[adm_Sucursal] ([id_sucursal])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[conf_Conexiones_Remotas] CHECK CONSTRAINT [fk_conexionesremotas_sucursal]
GO
/****** Object:  StoredProcedure [dbo].[pa_TraerCargos]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pa_TraerCargos]   
AS
DECLARE @nombre_dia AS varchar(15)
DECLARE @dia AS SMALLINT
DECLARE @mes AS SMALLINT
DECLARE @toal_dia AS money
-- CREAR TABLA TEMPORAL
CREATE TABLE #semana(
	venta_lunes money,
	venta_martes money,
	venta_miercoles money,
	venta_jueves money,
	venta_viernes money,
	venta_sabado money,
	venta_domingo money
)
INSERT INTO #semana VALUES (0,0,0,0,0,0,0)

DECLARE cursor_Invoices CURSOR FOR 
SELECT  DATENAME(weekday,invo.InvDate)
 /* CASE DATENAME(weekday,invo.InvDate)
	WHEN 'Sunday' THEN  'DOMINGO'
	WHEN 'Monday' THEN	'LUNES'
	WHEN 'Tuesday' THEN	'MARTES'
	WHEN 'Wednesday' THEN 'MIERCOLES'
	WHEN 'Thursday' THEN 'JUEVES'
	WHEN 'Friday' THEN	'VIERNES'
	WHEN 'Saturday' THEN	'SABADO'
 END*/ AS NOMBRE_DIA, DAY(invo.InvDate) AS DIA, MONTH(invo.InvDate) AS MES,
SUM(ABS(invo.Amount)) AS TOTAL_CARGOS_DIA
FROM Datapark.dbo.Invoices invo
WHERE CONVERT(varchar, invo.InvDate, 23) >= CONVERT(varchar, dateadd(week, datediff(week, 0, getdate()), 0), 23) /*DATEADD(DAY, -7, convert(varchar, '2019-07-17', 23))*/
AND CONVERT(varchar, invo.InvDate, 23) <= convert(varchar, getdate(), 23)
GROUP BY DAY(invo.InvDate), DATENAME(weekday,invo.InvDate), MONTH(invo.InvDate)
ORDER BY MES,DIA
OPEN cursor_Invoices
FETCH NEXT FROM cursor_Invoices INTO @nombre_dia,  @dia, @mes, @toal_dia 
	WHILE @@fetch_status = 0
		BEGIN
			IF @nombre_dia = 'Monday'
				BEGIN
					UPDATE  #semana SET venta_lunes = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Tuesday'
				BEGIN
					UPDATE  #semana SET venta_martes = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Wednesday'
				BEGIN
					UPDATE  #semana SET venta_miercoles = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Thursday'
				BEGIN
					UPDATE  #semana SET venta_jueves = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Friday'
				BEGIN
					UPDATE  #semana SET venta_viernes = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Saturday'
				BEGIN
					UPDATE  #semana SET venta_sabado = @toal_dia;
				END
			ELSE IF @nombre_dia = 'Sunday'
				BEGIN
					UPDATE  #semana SET venta_domingo = @toal_dia;
				END
				
		FETCH NEXT FROM cursor_Invoices INTO @nombre_dia,  @dia, @mes, @toal_dia 
		END
CLOSE cursor_Invoices
DEALLOCATE cursor_Invoices


SELECT * FROM #semana
DROP TABLE #semana
-- EXEC pa_TraerCargos
GO
/****** Object:  StoredProcedure [dbo].[pa_TraerRecargas]    Script Date: 30/12/2019 07:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pa_TraerRecargas]   
AS
DECLARE @nombre_dia AS varchar(15)
DECLARE @dia AS SMALLINT
DECLARE @mes AS SMALLINT
DECLARE @toal_venta_dia AS money
-- CREAR TABLA TEMPORAL
CREATE TABLE #semana(
	venta_lunes money,
	venta_martes money,
	venta_miercoles money,
	venta_jueves money,
	venta_viernes money,
	venta_sabado money,
	venta_domingo money
)
INSERT INTO #semana VALUES (0,0,0,0,0,0,0)

DECLARE cursor_Payments CURSOR FOR 
SELECT 
 CASE DATENAME(weekday,pay.[Payment Date])
	WHEN 'Monday' THEN	'LUNES'
	WHEN 'Tuesday' THEN	'MARTES'
	WHEN 'Wednesday' THEN 'MIERCOLES'
	WHEN 'Thursday' THEN 'JUEVES'
	WHEN 'Friday' THEN	'VIERNES'
	WHEN 'Saturday' THEN 'SABADO'
	WHEN 'Sunday' THEN  'DOMINGO'
 END AS NOMBRE_DIA, DAY(pay.[Payment Date]) AS DIA,  MONTH(pay.[Payment Date]) AS MES,
SUM(ABS(pay.Amount)) AS TOTAL_VENTA_DIA
FROM Datapark.dbo.Payments pay
WHERE CONVERT(varchar, pay.[Payment Date], 23) >= CONVERT(varchar, dateadd(week, datediff(week, 0, getdate()), 0), 23)
AND CONVERT(varchar, pay.[Payment Date], 23) <= convert(varchar, getdate(), 23) /* DATEADD(DAY, -7, convert(varchar, '2019-07-17', 23)) */
GROUP BY DAY(pay.[Payment Date]), DATENAME(weekday,pay.[Payment Date]), MONTH(pay.[Payment Date])
ORDER BY MES,DIA
OPEN cursor_Payments
FETCH NEXT FROM cursor_Payments INTO @nombre_dia,  @dia, @mes, @toal_venta_dia 
	WHILE @@fetch_status = 0
		BEGIN
			IF @nombre_dia = 'LUNES'
				BEGIN
					UPDATE  #semana SET venta_lunes = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'MARTES'
				BEGIN
					UPDATE  #semana SET venta_martes = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'MIERCOLES'
				BEGIN
					UPDATE  #semana SET venta_miercoles = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'JUEVES'
				BEGIN
					UPDATE  #semana SET venta_jueves = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'VIERNES'
				BEGIN
					UPDATE  #semana SET venta_viernes = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'SABADO'
				BEGIN
					UPDATE  #semana SET venta_sabado = @toal_venta_dia;
				END
			ELSE IF @nombre_dia = 'DOMINGO'
				BEGIN
					UPDATE  #semana SET venta_domingo = @toal_venta_dia;
				END
				
		FETCH NEXT FROM cursor_Payments INTO @nombre_dia,  @dia, @mes, @toal_venta_dia 
		END
CLOSE cursor_Payments
DEALLOCATE cursor_Payments


SELECT * FROM #semana
DROP TABLE #semana
-- EXEC pa_TraerRecargas
GO
USE [master]
GO
ALTER DATABASE [DB_CONFIGURACIONES] SET  READ_WRITE 
GO
