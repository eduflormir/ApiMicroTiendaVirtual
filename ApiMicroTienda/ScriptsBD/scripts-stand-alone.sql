USE [master]
GO
/****** Object:  Database [MicroTiendaVirtual]    Script Date: 27/11/2015 14:28:27 ******/
CREATE DATABASE [MicroTiendaVirtual]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MicroTiendaVirtual', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MicroTiendaVirtual.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MicroTiendaVirtual_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MicroTiendaVirtual_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MicroTiendaVirtual] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MicroTiendaVirtual].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MicroTiendaVirtual] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET ARITHABORT OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MicroTiendaVirtual] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MicroTiendaVirtual] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MicroTiendaVirtual] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MicroTiendaVirtual] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MicroTiendaVirtual] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET RECOVERY FULL 
GO
ALTER DATABASE [MicroTiendaVirtual] SET  MULTI_USER 
GO
ALTER DATABASE [MicroTiendaVirtual] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MicroTiendaVirtual] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MicroTiendaVirtual] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MicroTiendaVirtual] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MicroTiendaVirtual', N'ON'
GO
USE [MicroTiendaVirtual]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 27/11/2015 14:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/11/2015 14:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[apellidos] [nvarchar](500) NOT NULL,
	[dni] [nvarchar](15) NOT NULL,
	[domicilio] [nvarchar](1000) NULL,
	[numTarjeta] [nvarchar](50) NULL,
	[login] [nvarchar](500) NULL,
	[password] [nvarchar](500) NULL,
	[email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 27/11/2015 14:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[precioDescuento] [decimal](18, 2) NULL,
	[idCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/11/2015 14:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VentaProducto]    Script Date: 27/11/2015 14:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaProducto](
	[idVenta] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[unidades] [int] NOT NULL,
 CONSTRAINT [PK_VentaProducto] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([id], [nombre], [descripcion]) VALUES (1, N'Mobil', N'Articulos de electronica')
INSERT [dbo].[Categoria] ([id], [nombre], [descripcion]) VALUES (2, N'VideoConsola', N'Video consolas')
INSERT [dbo].[Categoria] ([id], [nombre], [descripcion]) VALUES (3, N'Tablet', N'Mobiles')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [nombre], [apellidos], [dni], [domicilio], [numTarjeta], [login], [password], [email]) VALUES (1, N'Jose Ignacio', N'Rodriguez', N'1234567A', N'Toledo', N'1234567890', N'nacho', N'7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL)
INSERT [dbo].[Cliente] ([id], [nombre], [apellidos], [dni], [domicilio], [numTarjeta], [login], [password], [email]) VALUES (2, N'Eduardo', N'Flores', N'123456789B', N'Madrid', N'1234567890', N'edu', N'7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (1, N'Iphone6', N'iphone', CAST(800.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (2, N'Lumia1230', N'Microsoft lumia', CAST(500.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (4, N'XBox', N'Xbox', CAST(400.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (5, N'Nintendo', N'Nintendo', CAST(400.00 AS Decimal(18, 2)), NULL, 2)
INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (6, N'IPad Pro', N'Ipad Pro', CAST(1000.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Producto] ([id], [nombre], [descripcion], [precio], [precioDescuento], [idCategoria]) VALUES (7, N'Surface 4 Pro', N'Surface 4 pro', CAST(3000.00 AS Decimal(18, 2)), NULL, 3)
SET IDENTITY_INSERT [dbo].[Producto] OFF
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaProducto]  WITH CHECK ADD  CONSTRAINT [FK_VentaProducto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[VentaProducto] CHECK CONSTRAINT [FK_VentaProducto_Producto]
GO
ALTER TABLE [dbo].[VentaProducto]  WITH CHECK ADD  CONSTRAINT [FK_VentaProducto_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[VentaProducto] CHECK CONSTRAINT [FK_VentaProducto_Venta]
GO
USE [master]
GO
ALTER DATABASE [MicroTiendaVirtual] SET  READ_WRITE 
GO
