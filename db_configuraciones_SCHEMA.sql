USE [master]
GO
/****** Object:  Database [DB_CONFIGURACIONES]    Script Date: 05/28/2019 16:14:59 ******/
CREATE DATABASE [DB_CONFIGURACIONES]
GO
USE [DB_CONFIGURACIONES]
GO
/****** Object:  Table [dbo].[adm_Modulo]    Script Date: 05/28/2019 16:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_Auditoria]    Script Date: 05/28/2019 16:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_Usuario]    Script Date: 05/28/2019 16:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_Tarjetas]    Script Date: 05/28/2019 16:14:59 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Modulo_Opcion_Usuario]    Script Date: 05/28/2019 16:14:59 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_Modulo_Opcion]    Script Date: 05/28/2019 16:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adm_Modulo_Opcion](
	[id_modulo_opcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre_opcion] [varchar](250) NOT NULL,
	[nombre_controlador_opcion] [char](100) NULL,
	[nivel_opcion] [tinyint] NOT NULL,
	[estado_opcion] [bit] NOT NULL,
	[descripcion_menu_opcion] [nvarchar](max) NULL,
	[id_modulo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK__adm_Modu__5A99E8A225869641] PRIMARY KEY CLUSTERED 
(
	[id_modulo_opcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__adm_Modul__fecha__1CF15040]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Modulo] ADD  CONSTRAINT [DF__adm_Modul__fecha__1CF15040]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__adm_Audit__fecha__15502E78]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Auditoria] ADD  CONSTRAINT [DF__adm_Audit__fecha__15502E78]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__adm_Usuar__estad__403A8C7D]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Usuario] ADD  DEFAULT ((1)) FOR [estado_usuario]
GO
/****** Object:  Default [DF__adm_Usuar__fecha__412EB0B6]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Usuario] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__adm_Tarje__estad__0AD2A005]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Tarjetas] ADD  DEFAULT ((0)) FOR [estado_facility]
GO
/****** Object:  Default [DF__adm_Tarje__fecha__0BC6C43E]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Tarjetas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF__adm_Modul__tiene__45F365D3]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Modulo_Opcion_Usuario] ADD  DEFAULT ((0)) FOR [tiene_permiso]
GO
/****** Object:  Default [DF__adm_Modul__estad__276EDEB3]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Modulo_Opcion] ADD  CONSTRAINT [DF__adm_Modul__estad__276EDEB3]  DEFAULT ((1)) FOR [estado_opcion]
GO
/****** Object:  Default [DF__adm_Modul__fecha__286302EC]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE [dbo].[adm_Modulo_Opcion] ADD  CONSTRAINT [DF__adm_Modul__fecha__286302EC]  DEFAULT (getdate()) FOR [fecha]
GO




/****** Object:  ForeignKey [fk_moduloOpcion_modulo]    Script Date: 05/28/2019 16:14:59 ******/
ALTER TABLE adm_Modulo_Opcion_Usuario ADD CONSTRAINT fk_ModuloOpcionUsuario_Usuario FOREIGN KEY(id_usuario)
REFERENCES adm_Usuario(id_usuario) ON UPDATE CASCADE ON DELETE NO ACTION;
ALTER TABLE adm_Modulo_Opcion_Usuario ADD CONSTRAINT fk_ModuloOpcionUsuario_ModuloOpcion FOREIGN KEY(id_modulo_opcion)
REFERENCES adm_Modulo_Opcion(id_modulo_opcion) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE adm_Modulo_Opcion ADD CONSTRAINT fk_moduloOpcion_modulo FOREIGN KEY(id_modulo)
REFERENCES adm_Modulo(id_modulo) ON UPDATE CASCADE ON DELETE NO ACTION;
