CREATE DATABASE [MeetUp]
GO
USE [MeetUp]
/****** Object:  Table [dbo].[Appointment]    Script Date: 20-09-2018 21:45:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1001,1) NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[FromEmployeeId] [int] NULL,
	[ToEmployeeId] [int] NULL,
	[Date] [date] NULL,
	[FromTime] [time](7) NULL,
	[ToTime] [time](7) NULL,
	[Remark] [nvarchar](100) NULL,
	[ModifiedOn] [smalldatetime] NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK__Appointm__8ECDFCC28A276EE9] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 20-09-2018 21:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[EmployeePhone] [numeric](10, 0) NULL,
	[EmployeeMailId] [nvarchar](max) NULL,
	[EmployeeAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 20-09-2018 21:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[Password] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 20-09-2018 21:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] NOT NULL,
	[Status] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7001, N'Samartha L S', CAST(9986781299 AS Numeric(10, 0)), N'samartha.sachu@gmail.com', N'Bangalore')
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7002, N'Sachin L S', CAST(9686469649 AS Numeric(10, 0)), N'sachu26@gmail.com', N'Mumbai')
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7003, N'Sujay S', CAST(9448686333 AS Numeric(10, 0)), N'sujay.isiri@gmail.com ', N'Sagara')
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7004, N'Shreesha', CAST(8765237263 AS Numeric(10, 0)), N'samartha.sachu@gmail.com', N'Shivamoga')
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7005, N'Mythri Bhat', CAST(9873265322 AS Numeric(10, 0)), N'maithriibhat@gmail.com', N'Bangalore')
GO
INSERT [dbo].[EmployeeDetails] ([EmployeeId], [EmployeeName], [EmployeePhone], [EmployeeMailId], [EmployeeAddress]) VALUES (7006, N'Lavanya R ', CAST(9845152000 AS Numeric(10, 0)), N'mrajanlavanya@gmail.com', N'Bangalore')
GO
SET IDENTITY_INSERT [dbo].[Login] ON 
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (1, 7001, N'qwerty123')
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (2, 7002, N'qwerty123')
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (3, 7003, N'qwerty123')
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (4, 7004, N'qwerty123')
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (5, 7005, N'qwerty123')
GO
INSERT [dbo].[Login] ([LoginId], [EmployeeId], [Password]) VALUES (6, 7006, N'qwerty123')
GO
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (1, N'Not Confirmed')
GO
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (2, N'Accepted')
GO
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (3, N'Declined')
GO
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (4, N'Cancelled')
GO
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (5, N'Re-Scheduled')
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__FromE__6A30C649] FOREIGN KEY([FromEmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointme__FromE__6A30C649]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__Statu__6C190EBB] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointme__Statu__6C190EBB]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__ToEmp__6B24EA82] FOREIGN KEY([ToEmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointme__ToEmp__6B24EA82]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK__Login__EmployeeI__3C69FB99] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK__Login__EmployeeI__3C69FB99]
GO
USE [master]
GO
ALTER DATABASE [MeetUp] SET  READ_WRITE 
GO
