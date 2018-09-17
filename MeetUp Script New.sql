CREATE DATABASE [MeetUp]
GO
USE [MeetUp]
/****** Object:  Table [dbo].[Appointment]    Script Date: 15-09-2018 16:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[FromEmployeeId] [int] NULL,
	[ToEmployeeId] [int] NULL,
	[Date] [date] NULL,
	[FromTime] [time](7) NULL,
	[ToTime] [time](7) NULL,
	[remark] [nvarchar](max) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 15-09-2018 16:35:17 ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 15-09-2018 16:35:21 ******/
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
SET IDENTITY_INSERT [dbo].[Appointment] ON 
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (13, 7005, 7001, CAST(N'2018-09-11' AS Date), CAST(N'17:12:00' AS Time), CAST(N'22:12:00' AS Time), N'Proj Demo!!!', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (14, 7004, 7001, CAST(N'2018-09-12' AS Date), CAST(N'20:07:00' AS Time), CAST(N'23:05:00' AS Time), N'Email Check!!!', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (18, 7001, 7006, CAST(N'2018-09-09' AS Date), CAST(N'17:12:00' AS Time), CAST(N'20:07:00' AS Time), N'Check Booking', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (19, 7003, 7001, CAST(N'2018-09-14' AS Date), CAST(N'21:18:00' AS Time), CAST(N'22:18:00' AS Time), N'Test', 0)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (20, 7004, 7001, CAST(N'2018-09-21' AS Date), CAST(N'22:16:00' AS Time), CAST(N'23:16:00' AS Time), N'hey', 0)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (21, 7004, 7001, CAST(N'2018-10-18' AS Date), CAST(N'22:16:00' AS Time), CAST(N'23:16:00' AS Time), N'hey', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (22, 7004, 7001, CAST(N'2018-11-16' AS Date), CAST(N'22:16:00' AS Time), CAST(N'23:16:00' AS Time), N'hey', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (23, 7001, 7004, CAST(N'2018-09-11' AS Date), CAST(N'15:14:00' AS Time), CAST(N'16:14:00' AS Time), N'jkh', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (24, 7001, 7004, CAST(N'2018-08-22' AS Date), CAST(N'15:14:00' AS Time), CAST(N'16:14:00' AS Time), N'jkh', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (25, 7001, 7006, CAST(N'2018-09-13' AS Date), CAST(N'15:52:00' AS Time), CAST(N'18:52:00' AS Time), N'saas', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (26, 7001, 7006, CAST(N'2018-09-12' AS Date), CAST(N'15:58:00' AS Time), CAST(N'17:58:00' AS Time), N'asas', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (27, 7001, 7006, CAST(N'2018-09-03' AS Date), CAST(N'16:14:00' AS Time), CAST(N'17:14:00' AS Time), N'as', 1)
GO
INSERT [dbo].[Appointment] ([AppointmentId], [FromEmployeeId], [ToEmployeeId], [Date], [FromTime], [ToTime], [remark], [status]) VALUES (28, 7001, 7006, CAST(N'2018-09-15' AS Date), CAST(N'18:34:00' AS Time), CAST(N'19:34:00' AS Time), N'hey check date and time', 1)
GO
SET IDENTITY_INSERT [dbo].[Appointment] OFF
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
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([FromEmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([ToEmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
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
