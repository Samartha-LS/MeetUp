CREATE DATABASE [MeetUp]
GO
USE [MeetUp]
/****** Object:  Table [dbo].[Appointment]    Script Date: 20-09-2018 21:46:50 ******/
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
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 20-09-2018 21:46:51 ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 20-09-2018 21:46:51 ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 20-09-2018 21:46:51 ******/
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
