USE [master]
GO
/****** Object:  Database [Planillas]    Script Date: 23/7/2022 16:54:39 ******/
CREATE DATABASE [Planillas]
GO
USE [Planillas]
GO
/****** Object:  Table [dbo].[CalculoSalarios]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalculoSalarios](
	[idRegistro] [int] IDENTITY(1,1) NOT NULL,
	[idColaborador] [int] NOT NULL,
	[diasLaborados] [int] NOT NULL,
	[idTurno] [int] NOT NULL,
	[horasExtras] [decimal](18, 2) NOT NULL,
	[SeguroSocial] [decimal](18, 2) NOT NULL,
	[impuestoRenta] [decimal](18, 2) NOT NULL,
	[Asociacion] [decimal](18, 2) NOT NULL,
	[otrosRebajos] [int] NOT NULL,
 CONSTRAINT [PK_CalculoSalarios] PRIMARY KEY CLUSTERED 
(
	[idRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colaboradores]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colaboradores](
	[idColaborador] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[primerApellido] [varchar](20) NOT NULL,
	[segundoApellido] [varchar](20) NOT NULL,
	[Genero] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](100) NOT NULL,
	[direccionFisica] [varchar](200) NOT NULL,
	[telefono] [decimal](8, 0) NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[salarioBase] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Colaboradores] PRIMARY KEY CLUSTERED 
(
	[idColaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[idReservas] [int] IDENTITY(1,1) NOT NULL,
	[idColaborador] [int] NOT NULL,
	[diasVacaciones] [int] NOT NULL,
	[Vacaciones] [decimal](18, 0) NOT NULL,
	[Aguinaldo] [decimal](18, 0) NOT NULL,
	[Cesantia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[idReservas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnosLaborales]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnosLaborales](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[nombreTurno] [varchar](10) NOT NULL,
 CONSTRAINT [PK_turnosLaborales] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](150) NOT NULL,
	[contrasena] [varchar](100) NOT NULL,
	[tipoUsuario] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colaboradores] ON 
GO
INSERT [dbo].[Colaboradores] ([idColaborador], [cedula], [Nombre], [primerApellido], [segundoApellido], [Genero], [correoElectronico], [direccionFisica], [telefono], [fechaIngreso], [salarioBase]) VALUES (1, 113640179, N'Diego', N'Sanchez', N'Badilla', N'Masculino', N'diego@prueba.com', N'San Rafael Abajo', CAST(60484890 AS Decimal(8, 0)), CAST(N'2022-07-16' AS Date), CAST(350000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Colaboradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([id_Usuario], [nombreCompleto], [correoElectronico], [contrasena], [tipoUsuario]) VALUES (1, N'Administrador', N'administrador@prueba.com', N'123456', N'Adm')
GO
INSERT [dbo].[Usuarios] ([id_Usuario], [nombreCompleto], [correoElectronico], [contrasena], [tipoUsuario]) VALUES (2, N'Operativo', N'operativo@prueba.com', N'123456', N'Ope')
GO
INSERT [dbo].[Usuarios] ([id_Usuario], [nombreCompleto], [correoElectronico], [contrasena], [tipoUsuario]) VALUES (4, N'UsuariodePrueba', N'prueba@prueba.com', N'YfBJU6BY#c', N'Ope')
GO
INSERT [dbo].[Usuarios] ([id_Usuario], [nombreCompleto], [correoElectronico], [contrasena], [tipoUsuario]) VALUES (5, N'UsuariodePrueba2', N'prueba2@prueba.com', N'Xi0fh0n@b4', N'Ope')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[CalculoSalarios]  WITH CHECK ADD  CONSTRAINT [FK_CalculoSalarios_Colaboradores] FOREIGN KEY([idColaborador])
REFERENCES [dbo].[Colaboradores] ([idColaborador])
GO
ALTER TABLE [dbo].[CalculoSalarios] CHECK CONSTRAINT [FK_CalculoSalarios_Colaboradores]
GO
ALTER TABLE [dbo].[CalculoSalarios]  WITH CHECK ADD  CONSTRAINT [FK_CalculoSalarios_turnosLaborales] FOREIGN KEY([idTurno])
REFERENCES [dbo].[turnosLaborales] ([idTurno])
GO
ALTER TABLE [dbo].[CalculoSalarios] CHECK CONSTRAINT [FK_CalculoSalarios_turnosLaborales]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Colaboradores] FOREIGN KEY([idColaborador])
REFERENCES [dbo].[Colaboradores] ([idColaborador])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Colaboradores]
GO
/****** Object:  StoredProcedure [dbo].[sp_ColaboradorElimina]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ColaboradorElimina]
--Parametros
	@idColaborador int
AS
Begin
		DELETE FROM Colaboradores
		WHERE idColaborador = @idColaborador

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ColaboradorInserta]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ColaboradorInserta]
--Parametros
	@cedula int,
	@Nombre varchar(20),
	@Primer_Apellido varchar(20),
	@Segundo_Apellido varchar(20),
	@Genero varchar(50),
	@CorreoElectronico varchar (50),
	@direccionFisica varchar(200),
	@Telefono decimal (8,0),
	@FechaIngreso date,
	@SalarioBase decimal (18,2)
AS
Begin
		INSERT INTO [dbo].Colaboradores(Cedula, Nombre, primerApellido, segundoApellido, Genero,
		correoElectronico, direccionFisica, telefono, fechaIngreso, salarioBase)
		VALUES (
		@Cedula, 
		@Nombre, 
		@Primer_Apellido, 
		@Segundo_Apellido, 
		@Genero, 
		@CorreoElectronico, 
		@direccionFisica, 
		@Telefono, 
		@FechaIngreso, 
		@SalarioBase)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ColaboradorModifica]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ColaboradorModifica]
--Parametros
	@idColaborador int,
	@cedula int,
	@Nombre varchar(20),
	@Primer_Apellido varchar(20),
	@Segundo_Apellido varchar(20),
	@Genero varchar(50),
	@CorreoElectronico varchar (50),
	@direccionFisica varchar(200),
	@Telefono decimal (8,0),
	@FechaIngreso date,
	@SalarioBase decimal (18,2)
AS
Begin
		UPDATE Colaboradores SET
		Cedula = @Cedula, 
		Nombre = @Nombre, 
		primerApellido = @Primer_Apellido, 
		segundoApellido = @Segundo_Apellido, 
		Genero = @Genero,
		correoElectronico = @CorreoElectronico, 
		direccionFisica = @direccionFisica, 
		telefono = @Telefono, 
		fechaIngreso = @FechaIngreso, 
		salarioBase = @SalarioBase
		WHERE idColaborador = @idColaborador

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ColaboradorRetorna]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ColaboradorRetorna]
@primerApellido[varchar](200)= NULL,
@segundoApellido[varchar](200)= NULL,
@nombre [varchar](200)= NULL
AS
	
SELECT idColaborador
	  ,cedula
	  ,Nombre	
	  ,primerApellido
	  ,segundoApellido
	  ,Genero
      ,correoElectronico 
      ,direccionFisica
	  ,telefono
	  ,fechaIngreso
	  ,salarioBase

FROM [dbo].Colaboradores 
WHERE primerApellido like (case when @primerApellido is null then '%%' else '%'+@primerApellido+'%' end)
and segundoApellido like (case when @segundoApellido is null then '%%' else '%'+@segundoApellido+'%' end)
and Nombre like (case when @nombre is null then '%%' else '%'+@nombre+'%' end) 
GO
/****** Object:  StoredProcedure [dbo].[sp_ColaboradorRetornaID]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ColaboradorRetornaID]
@idColaborador int
AS
	
SELECT idColaborador
	  ,cedula
	  ,Nombre	
	  ,primerApellido
	  ,segundoApellido
	  ,Genero
      ,correoElectronico 
      ,direccionFisica
	  ,telefono
	  ,fechaIngreso
	  ,salarioBase

FROM [dbo].Colaboradores 
WHERE [idColaborador] =@idColaborador
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaUsuarioCorreoPwd]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RetornaUsuarioCorreoPwd]
@correoElectronico [varchar](150),
@contrasena [varchar](100)
AS
	
SELECT [id_Usuario],[nombreCompleto],[correoElectronico],[contrasena],[tipoUsuario]
FROM [Usuarios]
WHERE [contrasena]=@contrasena and [correoElectronico]=@correoElectronico

GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioElimina]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adriana Sequeira
-- Create date: <13-06-2021>
-- Description:	<Elimina un registro de la tabla jugador>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioElimina]
		@id_Usuario int
AS
BEGIN
	DELETE FROM Usuarios
	WHERE id_Usuario = @id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioInserta]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UsuarioInserta]
--Parametros
	@nombreCompleto varchar(50),
	@correoElectronico varchar(150),
	@contrasena varchar(100),
	@tipoUsuario varchar(100)

AS
Begin
		INSERT INTO [dbo].Usuarios(nombreCompleto, correoElectronico, contrasena, 
		tipoUsuario)
		VALUES (
		@nombreCompleto, 
		@correoElectronico, 
		@contrasena, 
		@tipoUsuario)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioModifica]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UsuarioModifica]
--Parametros
	@id_Usuario int,
	@nombreCompleto varchar(50),
	@correoElectronico varchar(100),
	@tipoUsuario varchar(100)
AS
Begin
	UPDATE Usuarios	SET
	nombreCompleto = @nombreCompleto,
	correoElectronico = @correoElectronico,
	tipoUsuario = @tipoUsuario
	WHERE id_Usuario = @id_Usuario
End
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioRetorna]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioRetorna]

AS
	
SELECT id_Usuario
	  ,nombreCompleto
	  ,correoElectronico
      ,contrasena
      ,tipoUsuario

FROM [dbo].Usuarios 
GO
/****** Object:  StoredProcedure [dbo].[sp_UsuarioRetornaID]    Script Date: 23/7/2022 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UsuarioRetornaID]
@id_Usuario int

AS
	
SELECT id_Usuario
	  ,nombreCompleto
	  ,correoElectronico
      ,contrasena
      ,tipoUsuario

FROM [dbo].Usuarios 
WHERE id_Usuario = @id_Usuario
GO
USE [master]
GO
ALTER DATABASE [Planillas] SET  READ_WRITE 
GO
