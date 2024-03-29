USE [master]
GO
/****** Object:  Database [StoreManagementDB]    Script Date: 15/01/2021 11:45:43 PM ******/
CREATE DATABASE [StoreManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreManagementDB', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoreManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreManagementDB_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoreManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StoreManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [StoreManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StoreManagementDB] SET QUERY_STORE = OFF
GO
USE [StoreManagementDB]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 15/01/2021 11:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[age] [int] NULL,
	[phone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 15/01/2021 11:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[phone_number] [varchar](255) NULL,
	[company] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (1, N'Gia Tuan', N'male', 21, 1)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (2, N'Manh Tuan', N'male', 21, 2)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (3, N'Tung Nguyen', N'male', 21, 3)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (4, N'Tung Thai', N'male', 21, 4)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (5, N'Nguyen A', N'female', 30, 5)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (6, N'Tran B', N'female', 50, 6)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (7, N'Giang C', N'male', 9, 7)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (8, N'Nong D', N'female', 25, 8)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (9, N'Le E', N'male', 60, 9)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (10, N'Tran F', N'male', 70, 10)
INSERT [dbo].[customer] ([customer_id], [name], [gender], [age], [phone]) VALUES (11, N'Nguyen Thanh Tung', N'male', 22, NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[phone] ON 

INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (1, N'111', N'Viettel')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (2, N'222', N'MobiFone')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (3, N'333', N'Vietnamobile')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (4, N'444', N'Gmobile')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (5, N'555', N'Gmobile')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (6, N'666', N'Viettel')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (7, N'777', N'MobiFone')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (8, N'888', N'MobiFone')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (9, N'999', N'Gmobile')
INSERT [dbo].[phone] ([phone_id], [phone_number], [company]) VALUES (10, N'1010', N'Gmobile')
SET IDENTITY_INSERT [dbo].[phone] OFF
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_phone] FOREIGN KEY([phone])
REFERENCES [dbo].[phone] ([phone_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_phone]
GO
USE [master]
GO
ALTER DATABASE [StoreManagementDB] SET  READ_WRITE 
GO
