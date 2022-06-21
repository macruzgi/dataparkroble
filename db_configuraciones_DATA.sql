USE [DB_CONFIGURACIONES]
GO
/****** Object:  Table [dbo].[adm_Modulo]    Script Date: 05/28/2019 16:43:52 ******/
SET IDENTITY_INSERT [dbo].[adm_Modulo] ON
INSERT [dbo].[adm_Modulo] ([id_modulo], [nombre_modulo], [descripcion_modulo], [icono_item], [fecha]) VALUES (1, N'Card Manager', N'opcion padre del munu', N'assignment                                                  ', CAST(0x0000AA560091D015 AS DateTime))
INSERT [dbo].[adm_Modulo] ([id_modulo], [nombre_modulo], [descripcion_modulo], [icono_item], [fecha]) VALUES (2, N'Administraci&oacute;n', N'opcion del menu padre', N'settings                                                    ', CAST(0x0000AA560091D015 AS DateTime))
INSERT [dbo].[adm_Modulo] ([id_modulo], [nombre_modulo], [descripcion_modulo], [icono_item], [fecha]) VALUES (3, N'Accesos', N'opcion del menu padre', N'vpn_key                                                     ', CAST(0x0000AA5600979D14 AS DateTime))
SET IDENTITY_INSERT [dbo].[adm_Modulo] OFF

/****** Object:  Table [dbo].[adm_Usuario]    Script Date: 05/28/2019 16:43:52 ******/
SET IDENTITY_INSERT [dbo].[adm_Usuario] ON
INSERT [dbo].[adm_Usuario] ([id_usuario], [usuario], [clave_usuario], [nombre_usuario], [estado_usuario], [fecha]) VALUES (7, N'admin', N'lú‹ÈˆŸ''Œ§∆!≥<†P', N'Administrador del Sistema', 1, CAST(0x0000AA5B01059E73 AS DateTime))
SET IDENTITY_INSERT [dbo].[adm_Usuario] OFF
/****** Object:  Table [dbo].[adm_Tarjetas]    Script Date: 05/28/2019 16:43:52 ******/
SET IDENTITY_INSERT [dbo].[adm_Tarjetas] ON
INSERT [dbo].[adm_Tarjetas] ([id_tarjeta], [intFacility], [estado_facility], [fecha]) VALUES (1, 1, 1, CAST(0x0000AA4600F8C93F AS DateTime))

/****** Object:  Table [dbo].[adm_Modulo_Opcion]    Script Date: 05/28/2019 16:43:52 ******/
SET IDENTITY_INSERT [dbo].[adm_Modulo_Opcion] ON
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (1, N'Registro', N'Cuentas/VistaRegistroCuenta                                                                         ', 1, 1, N'Permite registrar una cuenta y autom&aacute;ticamente registra una tarjeta', 1, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (2, N'Recargas', N'Tarjetas/VistaRecargarTarjeta                                                                       ', 1, 1, N'Realizar recargas a las tarjetas', 1, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (3, N'Cuentas', N'Cuentas/ListadoCuentas                                                                              ', 1, 1, N'Muestra el listado de cuentas existenes, as&iacute; como tambi&eacute;n el saldo actual', 1, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (4, N'Reversi&oacute;n de Recarga', N'Tarjetas/VistaRevertirRecarga                                                                       ', 1, 1, N'Revertir recargas, si recarga se ha realizado a una cuenta incorrecta', 2, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (5, N'Ajuste de Recarga', N'Tarjetas/VistaAjustarRecarga                                                                        ', 1, 1, N'Ajusta una recarga a una cuenta en espec&iacute;fico si el valor ha sido incorrecto', 2, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (6, N'Creaci&oacute;n de Usuarios', N'Usuarios/VistaUsuario                                                                               ', 1, 1, N'Crear usuarios', 3, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (7, N'Listado de Usuarios', N'Usuarios/ListaUsuarios                                                                              ', 1, 1, N'Lista los usuarios registrados.  Activar/Desactivar y asignar permisos a los usuarios', 3, CAST(0x0000AA560097C8B7 AS DateTime))
INSERT [dbo].[adm_Modulo_Opcion] ([id_modulo_opcion], [nombre_opcion], [nombre_controlador_opcion], [nivel_opcion], [estado_opcion], [descripcion_menu_opcion], [id_modulo], [fecha]) VALUES (8, N'Opcion Prueba', N'Usuarios/nada                                                                                       ', 1, 0, NULL, 3, CAST(0x0000AA57009F02DC AS DateTime))
SET IDENTITY_INSERT [dbo].[adm_Modulo_Opcion] OFF

SET IDENTITY_INSERT [dbo].[adm_Tarjetas] OFF
/****** Object:  Table [dbo].[adm_Modulo_Opcion_Usuario]    Script Date: 05/28/2019 16:43:52 ******/
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 1, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 2, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 3, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 4, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 5, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 6, 1)
INSERT [dbo].[adm_Modulo_Opcion_Usuario] ([id_usuario], [id_modulo_opcion], [tiene_permiso]) VALUES (7, 7, 1)