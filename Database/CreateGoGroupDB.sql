
/*
SQL Employee Database file for
Go Group Project at GMIT 2016
Date:    Nov 17, 2016
Adapted from: Murach's ADO.NET 4 with Visual Basic 2010
*/

/* Check if database already exists and delete it if it does exist*/
IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases WHERE name = 'GoGroupDB') 
BEGIN
DROP DATABASE GoGroupDB
END
GO

CREATE DATABASE GoGroupDB
GO

USE [GoGroupDB]
GO

/****** Object:  Table [dbo].[Employees]    Script Date: 05/23/2013 13:58:32  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[employeeID] [int] IDENTITY(5,1) NOT NULL,
	[firstName] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[lastName] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[userName] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[email] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[password] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([employeeID], [firstName], [lastName], [userName], [email], [password]) VALUES (0, N'Alanna', N'Curran', N'Alna132', N'alanna@gomail.com', N'password1')
INSERT [dbo].[Employees] ([employeeID], [firstName], [lastName], [userName], [email], [password]) VALUES (1, N'Declan', N'Duffy', N'Dec123', N'declan@gomail.com', N'password2')
INSERT [dbo].[Employees] ([employeeID], [firstName], [lastName], [userName], [email], [password]) VALUES (2, N'Claire', N'Finn', N'Claire123', N'claire@gomail.com', N'password3')
INSERT [dbo].[Employees] ([employeeID], [firstName], [lastName], [userName], [email], [password]) VALUES (3, N'Thomas', N'McNamara', N'Tom123', N'thomas@gomail.com', N'password4')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Jobs]    Script Date: 05/23/2013 13:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Jobs](
	[jobID] [int] IDENTITY(1010,1) NOT NULL,
	[jobTitle] [nchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[wageRate] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
)
END
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (0, N'Beautician', 9.25)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (1, N'Builder', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (2, N'Carpenter', 10.00)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (3, N'Cleaner', 9.00)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (4, N'Delivery', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (5, N'Electrician', 10.25)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (6, N'Farmer', 8.50)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (7, N'Gardener', 12.30)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (8, N'Hair and Beauty', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (9, N'Hairdresser', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (10, N'Mechanic', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (11, N'Painter', 9.15)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (12, N'Plumber', 16.74)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (13, N'Technician', 20.83)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (14, N'Tiler', 13.43)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (15, N'Transport', 18.11)
INSERT [dbo].[Jobs] ([jobID], [jobTitle], [wageRate]) VALUES (16, N'Other', 14.20)
SET IDENTITY_INSERT [dbo].[Jobs] OFF

/****** Object:  Table [dbo].[EmployeeJobs]    Script Date: 05/23/2013 13:58:32  ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeJobs](
	[employeeID] [int] NOT NULL,
	[jobID] [int] NOT NULL,
	[wosQuantity] [int] NOT NULL,
	[wosCost] [money] NOT NULL,
 CONSTRAINT [PK_EmployeeJobs] PRIMARY KEY CLUSTERED 
(
    [employeeID] ASC,
	[jobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[EmployeeJobs] ([employeeID],[jobID],[wosQuantity], [wosCost]) VALUES (9999, 1000,  11, 11.11)
SET ANSI_PADDING OFF
GO /

/****** Object:  ForeignKey [FK_EmployeeJobs_Employees]     ******/
/*ALTER TABLE [dbo].[EmployeeJobs]  WITH NOCHECK ADD CONSTRAINT [FK_EmployeeJobs_Employees] FOREIGN KEY([employeeID])
REFERENCES [dbo].[Employees] ([employeeID])
GO
ALTER TABLE [dbo].[EmployeeJobs] CHECK CONSTRAINT [FK_EmployeeJobs_Employees]
GO */

/****** Object:  ForeignKey [FK_EmployeeJobs_Jobs]     ******/
/*ALTER TABLE [dbo].[EmployeeJobs]  WITH CHECK ADD CONSTRAINT [FK_EmployeeJobs_Jobs] FOREIGN KEY([jobID])
REFERENCES [dbo].[Jobs] ([jobID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmployeeJobs] CHECK CONSTRAINT [FK_EmployeeJobs_Jobs]
GO */
