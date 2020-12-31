USE [master]
GO
/****** Object:  Database [test]    Script Date: 31/12/2020 11:22:57 PM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 31/12/2020 11:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[age] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 31/12/2020 11:22:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[phone] [nchar](10) NULL,
	[other] [nchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (1, N'Nguyen Thanh Tung', N'male', 22)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (2, N'tuan', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (3, N'LOL', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (4, N'LOL', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (5, N'lol', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (6, N'lol', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (7, N'lol', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (8, N'tung', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (9, N'tung', NULL, NULL)
INSERT [dbo].[customer] ([id], [name], [gender], [age]) VALUES (25, N'ntt', N'male', 22)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[phone] ON 

INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (1, N'123       ', N'2121      ')
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (2, N'456       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (3, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (4, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (5, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (6, N'lol       ', N'abc       ')
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (7, NULL, N'abc       ')
SET IDENTITY_INSERT [dbo].[phone] OFF
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
