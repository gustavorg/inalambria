USE [inalambria]
GO
/****** Object:  StoredProcedure [dbo].[usp_sales_s_sales]    Script Date: 24/04/2021 12:08:53 ******/
DROP PROCEDURE [dbo].[usp_sales_s_sales]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sales]') AND type in (N'U'))
DROP TABLE [dbo].[sales]
GO
/****** Object:  Table [dbo].[sale_products]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sale_products]') AND type in (N'U'))
DROP TABLE [dbo].[sale_products]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[providers]') AND type in (N'U'))
DROP TABLE [dbo].[providers]
GO
/****** Object:  Table [dbo].[products]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND type in (N'U'))
DROP TABLE [dbo].[products]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 24/04/2021 12:08:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categories]') AND type in (N'U'))
DROP TABLE [dbo].[categories]
GO
USE [master]
GO
/****** Object:  Database [inalambria]    Script Date: 24/04/2021 12:08:53 ******/
DROP DATABASE [inalambria]
GO
/****** Object:  Database [inalambria]    Script Date: 24/04/2021 12:08:53 ******/
CREATE DATABASE [inalambria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inalambria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\inalambria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inalambria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\inalambria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [inalambria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inalambria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inalambria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inalambria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inalambria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inalambria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inalambria] SET ARITHABORT OFF 
GO
ALTER DATABASE [inalambria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inalambria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inalambria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inalambria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inalambria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inalambria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inalambria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inalambria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inalambria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inalambria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inalambria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inalambria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inalambria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inalambria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inalambria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inalambria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inalambria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inalambria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inalambria] SET  MULTI_USER 
GO
ALTER DATABASE [inalambria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inalambria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inalambria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inalambria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inalambria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inalambria] SET QUERY_STORE = OFF
GO
USE [inalambria]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](200) NULL,
	[lastName] [varchar](200) NULL,
 CONSTRAINT [PK_customers2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProvider] [int] NULL,
	[idCategory] [int] NULL,
	[name] [varchar](500) NULL,
	[price] [decimal](18, 2) NULL,
	[photo] [varchar](500) NULL,
	[createdAt] [datetime] NULL,
	[createdBy] [int] NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [int] NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_products2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[providers]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[providers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NULL,
 CONSTRAINT [PK_providers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_products]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSale] [int] NULL,
	[idProduct] [int] NULL,
	[unitPrice] [decimal](18, 2) NULL,
	[qty] [int] NULL,
	[discount] [decimal](18, 2) NULL,
	[createdAt] [datetime] NULL,
 CONSTRAINT [PK_sale_products2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NULL,
	[date] [date] NULL,
	[amount] [decimal](18, 2) NULL,
	[tax] [decimal](18, 2) NULL,
	[discount] [decimal](18, 2) NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[itemQty] [int] NULL,
	[createdAt] [datetime] NULL,
	[createdBy] [int] NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [int] NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'categoria 1')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'categoria 2')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [firstName], [lastName]) VALUES (1, N'prueba', N'1')
INSERT [dbo].[customers] ([id], [firstName], [lastName]) VALUES (2, N'prueba', N'2')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (1, 1, 1, N'producto1', CAST(20.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (2, 1, 1, N'producto2', CAST(120.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (3, 1, 1, N'producto3', CAST(240.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (4, 1, 2, N'producto4', CAST(50.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (5, 1, 2, N'producto5', CAST(80.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (6, 1, 1, N'producto6', CAST(60.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (7, 2, 1, N'producto7', CAST(50.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[products] ([id], [idProvider], [idCategory], [name], [price], [photo], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (8, 2, 1, N'producto8', CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[providers] ON 

INSERT [dbo].[providers] ([id], [name]) VALUES (1, N'proveedor1')
INSERT [dbo].[providers] ([id], [name]) VALUES (2, N'proveedor2')
SET IDENTITY_INSERT [dbo].[providers] OFF
GO
SET IDENTITY_INSERT [dbo].[sale_products] ON 

INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (1, 1, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (2, 1, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (3, 1, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (4, 1, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (5, 2, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (6, 2, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (7, 2, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (8, 2, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (9, 1, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (10, 4, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (11, 4, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (12, 3, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (13, 3, 1, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sale_products] ([id], [idSale], [idProduct], [unitPrice], [qty], [discount], [createdAt]) VALUES (14, 3, 2, CAST(10.00 AS Decimal(18, 2)), 10, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sale_products] OFF
GO
SET IDENTITY_INSERT [dbo].[sales] ON 

INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (1, 1, CAST(N'2020-01-01' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (2, 1, CAST(N'2020-01-02' AS Date), CAST(100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (3, 1, CAST(N'2020-01-03' AS Date), CAST(540.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (4, 1, CAST(N'2020-04-24' AS Date), CAST(90.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (5, 1, CAST(N'2020-05-28' AS Date), CAST(400.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (6, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (7, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (8, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (9, 1, CAST(N'2020-01-01' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (10, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (11, 1, CAST(N'2020-01-01' AS Date), CAST(5100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (12, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (13, 1, CAST(N'2020-05-28' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[sales] ([id], [idCustomer], [date], [amount], [tax], [discount], [totalAmount], [itemQty], [createdAt], [createdBy], [updatedAt], [updatedBy], [isActive]) VALUES (14, 1, CAST(N'2020-04-27' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[sales] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_sales_s_sales]    Script Date: 24/04/2021 12:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_sales_s_sales] 
@pprovider_id INT,
@pproduct_id INT,
@pdate1 varchar(50),
@pdate2 varchar(50)
AS
BEGIN

	IF @pprovider_id = 0 
	   BEGIN
			set @pprovider_id = NULL;
	   END

	 IF @pproduct_id = 0 
	   BEGIN
			set @pproduct_id = NULL;
	   END

	 IF @pdate1 = '0' 
	   BEGIN
			set @pdate1 = NULL;
	   END

	 IF @pdate2 = '0'
	   BEGIN
			set @pdate2 = NULL;
	   END

	SELECT 
	 sales.*,
	 customers.firstName + ' ' + customers.lastName as customer,
	 providers.name as provider
	 FROM
	 sales
	 INNER JOIN sale_products ON sale_products.idSale = sales.id
	 INNER JOIN products ON products.id = sale_products.idProduct
	 INNER JOIN providers ON providers.id = products.idProvider
	 INNER JOIN customers ON customers.id = sales.idCustomer
	 WHERE
	 providers.id = ISNULL(@pprovider_id,providers.id) AND
	 sale_products.idProduct = ISNULL(@pproduct_id,sale_products.idProduct) AND
	 sales.date >= ISNULL(@pdate1,sales.date) AND
	 sales.date <= ISNULL(@pdate2,sales.date)
END
GO
USE [master]
GO
ALTER DATABASE [inalambria] SET  READ_WRITE 
GO
