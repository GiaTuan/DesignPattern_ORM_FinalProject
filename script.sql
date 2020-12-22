USE [test]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 12/22/2020 5:23:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 12/22/2020 5:23:27 PM ******/
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

INSERT [dbo].[customer] ([id], [name]) VALUES (1, N'hoa')
INSERT [dbo].[customer] ([id], [name]) VALUES (2, N'tuan')
INSERT [dbo].[customer] ([id], [name]) VALUES (3, N'LOL')
INSERT [dbo].[customer] ([id], [name]) VALUES (4, N'LOL')
INSERT [dbo].[customer] ([id], [name]) VALUES (5, N'lol')
INSERT [dbo].[customer] ([id], [name]) VALUES (6, N'lol')
INSERT [dbo].[customer] ([id], [name]) VALUES (7, N'lol')
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[phone] ON 

INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (1, N'123       ', N'2121      ')
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (2, N'456       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (3, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (4, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (5, N'lol       ', NULL)
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (6, N'lol       ', N'abc       ')
INSERT [dbo].[phone] ([ID], [phone], [other]) VALUES (7, NULL, N'abc       ')
SET IDENTITY_INSERT [dbo].[phone] OFF
