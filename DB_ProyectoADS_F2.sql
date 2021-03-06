USE [master]
GO
/****** Object:  Database [ProyectoADS_F2]    Script Date: 5/30/2022 6:31:08 PM ******/
CREATE DATABASE [ProyectoADS_F2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoADS_F2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoADS_F2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoADS_F2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoADS_F2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoADS_F2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoADS_F2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoADS_F2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoADS_F2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoADS_F2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoADS_F2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoADS_F2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoADS_F2] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoADS_F2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoADS_F2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoADS_F2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoADS_F2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoADS_F2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoADS_F2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoADS_F2', N'ON'
GO
ALTER DATABASE [ProyectoADS_F2] SET QUERY_STORE = OFF
GO
USE [ProyectoADS_F2]
GO
/****** Object:  Table [dbo].[Arqueo]    Script Date: 5/30/2022 6:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arqueo](
	[id_arqueo] [int] NOT NULL,
	[id_gestion] [int] NOT NULL,
	[id_cajero] [int] NOT NULL,
	[fecha_arqueo] [date] NOT NULL,
	[saldo] [int] NOT NULL,
	[tarjetas_contenidas] [int] NOT NULL,
 CONSTRAINT [PK_Arqueo] PRIMARY KEY CLUSTERED 
(
	[id_arqueo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cajero]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cajero](
	[id_cajero] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[tipo] [varchar](50) NULL,
	[division] [varchar](50) NULL,
	[comentario] [ntext] NOT NULL,
	[id_comprobante] [int] NOT NULL,
 CONSTRAINT [PK_Cajero] PRIMARY KEY CLUSTERED 
(
	[id_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[id_comprobante] [int] NOT NULL,
	[numero_cuenta] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[deposito] [int] NOT NULL,
	[numeros_tarjeta] [int] NOT NULL,
	[cod_transaccion] [int] NOT NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[correo_electronico] [varchar](70) NOT NULL,
	[tipo_cuenta] [varchar](60) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[contraseña] [varchar](70) NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gestion]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gestion](
	[id_gestion] [int] NOT NULL,
	[id_titular] [int] NOT NULL,
	[numero_gestion] [int] NOT NULL,
 CONSTRAINT [PK_Gestion] PRIMARY KEY CLUSTERED 
(
	[id_gestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resolucion]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolucion](
	[id_resolucion] [int] NOT NULL,
	[id_arqueo] [int] NOT NULL,
	[solucion_cliente] [ntext] NOT NULL,
 CONSTRAINT [PK_Resolucion] PRIMARY KEY CLUSTERED 
(
	[id_resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titular]    Script Date: 5/30/2022 6:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titular](
	[id_titular] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[ultimos_digitos] [smallint] NOT NULL,
	[fecha_transaccion] [date] NOT NULL,
	[ubicacion_cajero] [varchar](70) NOT NULL,
	[monto_retenido] [int] NOT NULL,
 CONSTRAINT [PK_Titular] PRIMARY KEY CLUSTERED 
(
	[id_titular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (1, 1, 1, CAST(N'2020-12-24' AS Date), 50000, 20)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (2, 2, 1, CAST(N'2020-12-24' AS Date), 50000, 3)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (3, 3, 5, CAST(N'2020-12-24' AS Date), 70000, 3)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (4, 12, 4, CAST(N'2020-12-24' AS Date), 80000, 6)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (5, 18, 9, CAST(N'2020-12-24' AS Date), 120000, 5)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (6, 6, 12, CAST(N'2020-12-24' AS Date), 90000, 2)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (7, 13, 4, CAST(N'2020-12-24' AS Date), 45000, 13)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (8, 7, 11, CAST(N'2020-12-24' AS Date), 60000, 2)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (9, 12, 8, CAST(N'2020-12-24' AS Date), 900000, 1)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (10, 1, 2, CAST(N'2020-11-13' AS Date), 900000, 1)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (11, 1, 5, CAST(N'2020-08-15' AS Date), 900000, 20)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (12, 12, 5, CAST(N'2020-08-14' AS Date), 900000, 5)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (13, 18, 5, CAST(N'2020-09-06' AS Date), 900000, 7)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (14, 18, 7, CAST(N'2020-11-08' AS Date), 900000, 9)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (15, 1, 5, CAST(N'2020-11-13' AS Date), 450000, 1)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (16, 1, 6, CAST(N'2022-08-15' AS Date), 434000, 6)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (17, 3, 8, CAST(N'2022-08-14' AS Date), 878000, 4)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (18, 12, 9, CAST(N'2022-09-06' AS Date), 560000, 17)
INSERT [dbo].[Arqueo] ([id_arqueo], [id_gestion], [id_cajero], [fecha_arqueo], [saldo], [tarjetas_contenidas]) VALUES (20, 6, 7, CAST(N'2022-11-08' AS Date), 700000, 9)
GO
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (1, N'Cajero BAC', N'Electronicos', N'Zona central', N'Seguridad diaria', 1)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (2, N'Cajero BAC', N'Electronicos', N'Zona central', N'Seguridad diaria', 2)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (3, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 3)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (4, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 4)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (5, N'Cajero BAC', N'Electronicos', N'Zona central', N'Seguridad diaria', 5)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (6, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 6)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (7, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 7)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (8, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 8)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (9, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 9)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (10, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 10)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (11, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 11)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (12, N'Cajero BAC', N'Electronicos', N'Zona central', N'Seguridad diaria', 12)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (13, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 13)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (14, N'Cajero BAC', N'Electronicos', N'Zona central', N'Mantenimiento', 14)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (15, N'Cajero BAC', N'Electronicos', N'Zona central', N'Mantenimiento', 15)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (16, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 16)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (17, N'Cajero BAC', N'Electronicos', N'Zona central', N'Seguridad diaria', 17)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (18, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 18)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (19, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 19)
INSERT [dbo].[Cajero] ([id_cajero], [nombre], [tipo], [division], [comentario], [id_comprobante]) VALUES (20, N'Cajero BAC', N'Electronicos', N'Zona central', N'', 20)
GO
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (1, 423423424, CAST(N'2015-09-25' AS Date), 300, 9937, 823942734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (2, 423423424, CAST(N'2019-10-21' AS Date), 900, 9937, 823942734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (3, 423423424, CAST(N'2020-12-12' AS Date), 800, 8847, 823452734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (4, 423423424, CAST(N'2021-11-11' AS Date), 300, 8843, 823453734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (5, 423423424, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (6, 423423424, CAST(N'2021-06-13' AS Date), 30, 9937, 678942734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (7, 423423424, CAST(N'2022-06-13' AS Date), 700, 8834, 45342734)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (8, 33523423, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (9, 2245455, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (10, 5436536, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (11, 89542324, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (12, 653423424, CAST(N'2021-11-12' AS Date), 600, 7443, 23423942)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (13, 76573453, CAST(N'2020-10-04' AS Date), 700, 8895, 9842732)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (14, 9875763, CAST(N'2022-11-04' AS Date), 70, 7895, 9885732)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (15, 2343453, CAST(N'2022-03-04' AS Date), 900, 8595, 984752)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (16, 4453453, CAST(N'2022-05-04' AS Date), 800, 7895, 9842732)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (17, 34573453, CAST(N'2022-05-04' AS Date), 50, 8595, 5436732)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (18, 3544536, CAST(N'2022-05-04' AS Date), 120, 7895, 9842542)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (19, 7745642, CAST(N'2022-08-04' AS Date), 15, 9895, 7657655)
INSERT [dbo].[Comprobante] ([id_comprobante], [numero_cuenta], [fecha], [deposito], [numeros_tarjeta], [cod_transaccion]) VALUES (20, 96432543, CAST(N'2022-09-04' AS Date), 25, 6865, 4564456)
GO
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (1, N'leo', N'Leo342', N'leo.fer@hotmail.com', N'cuenta de ahorro', CAST(N'2003-12-17' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (2, N'claudia ramirez', N'claudy', N'claudy@hotmail.com', N'cuenta corriente', CAST(N'1973-09-23' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (3, N'pedro enrique', N'pedroer23', N'pedroer23@hotmail.com', N'cuenta de ahorro', CAST(N'1956-03-13' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (4, N'lucia hernandez', N'luciahernandez53', N'luciahernandez53@hotmail.com', N'cuenta de ahorro', CAST(N'1984-12-07' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (5, N'pablo martinez', N'pablo342', N'pablo342@hotmail.com', N'cuenta de ahorro', CAST(N'1997-08-24' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (6, N'sergio sanchez', N'sergisanchez', N'sergisanchez@hotmail.com', N'cuenta corriente', CAST(N'1997-12-16' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (7, N'david rodriguez', N'daviguez', N'daviguez@hotmail.com', N'cuenta corriente', CAST(N'1986-12-10' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (8, N'juan ortiz', N'ortuan23', N'ortuan23@hotmail.com', N'cuenta de ahorro', CAST(N'2001-12-13' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (9, N'selene gomez', N'selngomez', N'selngomez@hotmail.com', N'cuenta corriente', CAST(N'2002-12-22' AS Date), N'3b1d636a3b3f06e8a6edab11123483ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (10, N'Harley Gardner', N'gardnerly', N'gardnerly@hotmail.com', N'cuenta de ahorro', CAST(N'1978-06-11' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (11, N'Korben Franks', N'korben85', N'korben85@hotmail.com', N'cuenta de ahorro', CAST(N'1968-05-15' AS Date), N'3b1d636a3b3f06e8a6e432b11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (12, N'Lorelai Crane', N'LoreCrane', N'LoreCrane@hotmail.com', N'ahorro elite', CAST(N'1987-05-12' AS Date), N'3b1d636a3b3f06e8a6edab43281183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (13, N'Amirah Ahmad', N'amiraDah', N'amiraDah@hotmail.com', N'cuenta de ahorro', CAST(N'1993-06-16' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (14, N'Nasir Wood', N'Woosir', N'Woosir@hotmail.com', N'cuenta de ahorro', CAST(N'1994-07-20' AS Date), N'3b1d636a3b3f06e8a6edab14321183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (15, N'Emer Connor', N'Commer3756', N'Commer3756@hotmail.com', N'cuenta de ahorro', CAST(N'2001-03-03' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (16, N'Geoffrey Mcleod', N'GeoMcLod876', N'GeoMcLod876@hotmail.com', N'cuenta de ahorro', CAST(N'2003-02-18' AS Date), N'3b1d636a3b3f06e8a6edab421183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (17, N'Nawal Pitts', N'Pitts932', N'lPitts932@hotmail.com', N'cuenta de ahorro', CAST(N'1987-02-25' AS Date), N'3b1d636a3b3f06e8a6edab111814323ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (18, N'Roger Mcgrath', N'Mcgrath45856', N'Mcgrath45856@hotmail.com', N'cuenta de ahorro', CAST(N'1934-01-12' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (19, N'Velma Robbins', N'Velma882349', N'Velma882349@hotmail.com', N'cuenta corriente', CAST(N'1999-06-16' AS Date), N'3b1d636a3b3f06e8a6eda4324181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (20, N'Lexi Martin', N'LeximarTn648', N'LeximarTn648@hotmail.com', N'cuenta de ahorro', CAST(N'2003-09-18' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (21, N'Liliana Morton', N'MortonLian', N'MortonLian@hotmail.com', N'cuenta de ahorro', CAST(N'1967-10-27' AS Date), N'3b1d636a3b3f06e8a6sd2b11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (22, N'Nellie Hansen', N'HansenLlie', N'HansenLlie@hotmail.com', N'cuenta corriente', CAST(N'2003-11-28' AS Date), N'3b1d636a3b3f06e8a6eda233281183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (23, N'Ianis Tapia', N'TapiTanis6654', N'TapiTanis6654@hotmail.com', N'cuenta de ahorro', CAST(N'2003-07-14' AS Date), N'3b1d636a3bfd2206e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (24, N'Kaya Baird', N'BairdYaKa', N'BairdYaKa@hotmail.com', N'cuenta de ahorro', CAST(N'1964-03-17' AS Date), N'3b1d636a3b3f06e8aasd7111181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (25, N'Ayden Cardenas', N'CardenAy75', N'CardenAy75@hotmail.com', N'cuenta de ahorro', CAST(N'1985-05-27' AS Date), N'3b1d636a3b3f06ef326edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (26, N'James Castillo', N'jamestillo23', N'jamestillo23@hotmail.com', N'cuenta corriente', CAST(N'1973-09-23' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (27, N'Aaron Castillo', N'aaron932', N'aaron932@hotmail.com', N'cuenta de ahorro', CAST(N'1956-03-13' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (28, N'lucia hernandez', N'luciahernandez53', N'luciahernandez53@hotmail.com', N'cuenta de ahorro', CAST(N'1984-12-07' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (29, N'pablo martinez', N'pablo342', N'pablo342@hotmail.com', N'cuenta de ahorro', CAST(N'1997-08-24' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (30, N'Oscar Castillo', N'ostillo213', N'ostillo213@hotmail.com', N'cuenta corriente', CAST(N'1997-12-16' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (31, N'david rodriguez', N'daviguez', N'daviguez@hotmail.com', N'cuenta corriente', CAST(N'1986-12-10' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (32, N'juan ortiz', N'ortuan23', N'ortuan23@hotmail.com', N'cuenta de ahorro', CAST(N'1873-12-13' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (33, N'selene gomez', N'selngomez', N'selngomez@hotmail.com', N'cuenta corriente', CAST(N'2002-12-22' AS Date), N'3b1d636a3b3f06e8a6edab11123483ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (34, N'Harley Gardner', N'gardnerly', N'gardnerly@hotmail.com', N'cuenta de ahorro', CAST(N'1978-06-11' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (35, N'Korben Franks', N'korben85', N'korben85@hotmail.com', N'cuenta de ahorro', CAST(N'1968-05-15' AS Date), N'3b1d636a3b3f06e8a6e432b11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (36, N'Lorelai Crane', N'LoreCrane', N'LoreCrane@hotmail.com', N'ahorro elite', CAST(N'1987-05-12' AS Date), N'3b1d636a3b3f06e8a6edab43281183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (37, N'Amirah Ahmad', N'amiraDah', N'amiraDah@hotmail.com', N'cuenta de ahorro', CAST(N'1993-06-16' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (38, N'Nasir Wood', N'Woosir', N'Woosir@hotmail.com', N'cuenta de ahorro', CAST(N'1994-07-20' AS Date), N'3b1d636a3b3f06e8a6edab14321183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (39, N'Emer Connor', N'Commer3756', N'Commer3756@hotmail.com', N'cuenta de ahorro', CAST(N'2001-03-03' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (40, N'Geoffrey Mcleod', N'GeoMcLod876', N'GeoMcLod876@hotmail.com', N'cuenta de ahorro', CAST(N'2003-02-18' AS Date), N'3b1d636a3b3f06e8a6edab421183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (41, N'Nawal Pitts', N'Pitts932', N'lPitts932@hotmail.com', N'cuenta de ahorro', CAST(N'1987-02-25' AS Date), N'3b1d636a3b3f06e8a6edab111814323ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (42, N'Roger Mcgrath', N'Mcgrath45856', N'Mcgrath45856@hotmail.com', N'cuenta de ahorro', CAST(N'1934-01-12' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (43, N'Velma Robbins', N'Velma882349', N'Velma882349@hotmail.com', N'cuenta corriente', CAST(N'1999-06-16' AS Date), N'3b1d636a3b3f06e8a6eda4324181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (44, N'Lexi Martin', N'LeximarTn648', N'LeximarTn648@hotmail.com', N'cuenta de ahorro', CAST(N'2003-09-18' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (45, N'Liliana Morton', N'MortonLian', N'MortonLian@hotmail.com', N'cuenta de ahorro', CAST(N'1967-10-27' AS Date), N'3b1d636a3b3f06e8a6sd2b11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (46, N'Nellie Hansen', N'HansenLlie', N'HansenLlie@hotmail.com', N'cuenta corriente', CAST(N'1964-11-28' AS Date), N'3b1d636a3b3f06e8a6eda233281183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (47, N'Ianis Tapia', N'TapiTanis6654', N'TapiTanis6654@hotmail.com', N'cuenta de ahorro', CAST(N'2003-07-14' AS Date), N'3b1d636a3bfd2206e8a6edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (48, N'Kaya Baird', N'BairdYaKa', N'BairdYaKa@hotmail.com', N'cuenta de ahorro', CAST(N'1964-03-17' AS Date), N'3b1d636a3b3f06e8aasd7111181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (49, N'Ayden Cardenas', N'CardenAy75', N'CardenAy75@hotmail.com', N'cuenta de ahorro', CAST(N'1985-05-27' AS Date), N'3b1d636a3b3f06ef326edab11181183ce64568578')
INSERT [dbo].[Cuenta] ([id_usuario], [nombre], [usuario], [correo_electronico], [tipo_cuenta], [fecha_nacimiento], [contraseña]) VALUES (50, N'Harry Castillo', N'Harry882', N'Harry882@hotmail.com', N'cuenta de ahorro', CAST(N'1998-12-17' AS Date), N'3b1d636a3b3f06e8a6edab11181183ce64568578')
GO
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (1, 4, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (2, 6, 5671)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (3, 7, 5641)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (4, 8, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (5, 10, 5718)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (6, 2, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (7, 3, 3325)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (8, 14, 2185)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (9, 2, 5434)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (10, 1, 5284)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (11, 5, 1467)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (12, 3, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (13, 2, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (14, 7, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (15, 10, 1129)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (16, 12, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (17, 19, 5970)
INSERT [dbo].[Gestion] ([id_gestion], [id_titular], [numero_gestion]) VALUES (18, 4, 5970)
GO
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (1, 1, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (2, 2, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (3, 3, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (4, 4, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (5, 5, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (6, 6, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (7, 7, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (8, 8, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (9, 9, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (10, 10, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (11, 11, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (12, 12, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (13, 13, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (14, 14, N'Su reclamo ha sido aprobado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (15, 15, N'Su reclamo ha sido denegado')
INSERT [dbo].[Resolucion] ([id_resolucion], [id_arqueo], [solucion_cliente]) VALUES (16, 16, N'Su reclamo ha sido aprobado')
GO
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (1, 1, 985, CAST(N'2012-12-03' AS Date), N'Multiplaza', 150)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (2, 2, 985, CAST(N'2019-11-05' AS Date), N'Multiplaza', 150)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (3, 3, 985, CAST(N'2016-08-22' AS Date), N'Merliot', 50)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (4, 4, 985, CAST(N'2020-09-23' AS Date), N'Multiplaza', 20)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (5, 5, 985, CAST(N'2022-09-15' AS Date), N'Multiplaza', 300)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (6, 6, 985, CAST(N'2021-09-21' AS Date), N'Multiplaza', 700)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (7, 7, 985, CAST(N'2016-07-20' AS Date), N'Multiplaza', 25)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (8, 8, 985, CAST(N'2017-07-26' AS Date), N'Plaza mundo', 15)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (9, 9, 985, CAST(N'2019-05-25' AS Date), N'Multiplaza', 10)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (10, 10, 985, CAST(N'2013-03-19' AS Date), N'Multiplaza', 80)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (11, 11, 985, CAST(N'2019-07-15' AS Date), N'La gran via', 950)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (12, 12, 985, CAST(N'2019-03-15' AS Date), N'Multiplaza', 45)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (13, 13, 985, CAST(N'2019-02-15' AS Date), N'Merliot', 60)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (14, 14, 985, CAST(N'2019-09-17' AS Date), N'Multiplaza', 35)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (15, 15, 985, CAST(N'2019-10-15' AS Date), N'Multiplaza', 70)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (16, 16, 985, CAST(N'2019-10-12' AS Date), N'Multiplaza', 80)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (17, 17, 985, CAST(N'2019-11-03' AS Date), N'Plaza mundo', 120)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (18, 18, 985, CAST(N'2019-11-23' AS Date), N'Multiplaza', 100)
INSERT [dbo].[Titular] ([id_titular], [id_usuario], [ultimos_digitos], [fecha_transaccion], [ubicacion_cajero], [monto_retenido]) VALUES (19, 19, 985, CAST(N'2019-11-13' AS Date), N'Galerias', 55)
GO
ALTER TABLE [dbo].[Arqueo]  WITH CHECK ADD  CONSTRAINT [FK_Arqueo_Cajero] FOREIGN KEY([id_cajero])
REFERENCES [dbo].[Cajero] ([id_cajero])
GO
ALTER TABLE [dbo].[Arqueo] CHECK CONSTRAINT [FK_Arqueo_Cajero]
GO
ALTER TABLE [dbo].[Arqueo]  WITH CHECK ADD  CONSTRAINT [FK_Arqueo_Gestion] FOREIGN KEY([id_gestion])
REFERENCES [dbo].[Gestion] ([id_gestion])
GO
ALTER TABLE [dbo].[Arqueo] CHECK CONSTRAINT [FK_Arqueo_Gestion]
GO
ALTER TABLE [dbo].[Cajero]  WITH CHECK ADD  CONSTRAINT [FK_Cajero_Comprobante] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[Comprobante] ([id_comprobante])
GO
ALTER TABLE [dbo].[Cajero] CHECK CONSTRAINT [FK_Cajero_Comprobante]
GO
ALTER TABLE [dbo].[Gestion]  WITH CHECK ADD  CONSTRAINT [FK_Gestion_Titular] FOREIGN KEY([id_titular])
REFERENCES [dbo].[Titular] ([id_titular])
GO
ALTER TABLE [dbo].[Gestion] CHECK CONSTRAINT [FK_Gestion_Titular]
GO
ALTER TABLE [dbo].[Resolucion]  WITH CHECK ADD  CONSTRAINT [FK_Resolucion_Arqueo] FOREIGN KEY([id_arqueo])
REFERENCES [dbo].[Arqueo] ([id_arqueo])
GO
ALTER TABLE [dbo].[Resolucion] CHECK CONSTRAINT [FK_Resolucion_Arqueo]
GO
ALTER TABLE [dbo].[Titular]  WITH CHECK ADD  CONSTRAINT [FK_Titular_Cuenta] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Cuenta] ([id_usuario])
GO
ALTER TABLE [dbo].[Titular] CHECK CONSTRAINT [FK_Titular_Cuenta]
GO
USE [master]
GO
ALTER DATABASE [ProyectoADS_F2] SET  READ_WRITE 
GO
