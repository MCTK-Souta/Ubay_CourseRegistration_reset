USE [Course_Selection_System_of_UBAY]
GO
/****** Object:  Table [dbo].[Account_summary]    Script Date: 2021/6/4 下午 08:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_summary](
	[Acc_sum_ID] [uniqueidentifier] NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[Type] [bit] NOT NULL,
 CONSTRAINT [PK_Account_summary_1] PRIMARY KEY CLUSTERED 
(
	[Acc_sum_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Student_ID] [uniqueidentifier] NOT NULL,
	[Course_ID] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [varchar](50) NOT NULL,
	[Teacher_ID] [int] NOT NULL,
	[C_Name] [nvarchar](50) NOT NULL,
	[MaxNumEnrolled] [int] NOT NULL,
	[MinNumEnrolled] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[StartTime] [time](4) NOT NULL,
	[EndDate] [date] NOT NULL,
	[Place_ID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Remarks] [nvarchar](255) NULL,
	[CourseIntroduction] [nvarchar](4000) NULL,
	[b_empno] [uniqueidentifier] NOT NULL,
	[b_date] [datetime] NOT NULL,
	[e_empno] [uniqueidentifier] NULL,
	[e_date] [datetime] NULL,
	[d_empno] [uniqueidentifier] NULL,
	[d_date] [datetime] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DropCart]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DropCart](
	[Student_ID] [uniqueidentifier] NOT NULL,
	[Course_ID] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Manager_ID] [uniqueidentifier] NOT NULL,
	[Manager_FirstName] [nvarchar](50) NOT NULL,
	[Manager_LastName] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[b_empno] [uniqueidentifier] NOT NULL,
	[b_date] [datetime] NOT NULL,
	[e_empno] [uniqueidentifier] NULL,
	[e_date] [datetime] NULL,
	[d_empno] [uniqueidentifier] NULL,
	[d_date] [datetime] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Manager_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[Place_ID] [int] NOT NULL,
	[Place_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[Place_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration_record]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration_record](
	[Record_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [uniqueidentifier] NOT NULL,
	[Course_ID] [varchar](50) NOT NULL,
	[b_date] [datetime] NOT NULL,
	[d_date] [datetime] NULL,
 CONSTRAINT [PK_Registration_record] PRIMARY KEY CLUSTERED 
(
	[Record_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[School_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sch_name_tw] [nvarchar](100) NOT NULL,
	[Sch_name_en] [varchar](200) NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[School_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [uniqueidentifier] NOT NULL,
	[S_FirstName] [nvarchar](50) NOT NULL,
	[S_LastName] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Idn] [varchar](10) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Address] [nvarchar](400) NOT NULL,
	[CellPhone] [char](10) NOT NULL,
	[Education] [tinyint] NOT NULL,
	[School_ID] [int] NULL,
	[Experience] [bit] NOT NULL,
	[ExYear] [tinyint] NULL,
	[gender] [bit] NOT NULL,
	[PassNumber] [varchar](20) NULL,
	[PassPic] [varchar](50) NULL,
	[b_empno] [uniqueidentifier] NOT NULL,
	[b_date] [datetime] NOT NULL,
	[e_empno] [uniqueidentifier] NULL,
	[e_date] [datetime] NULL,
	[d_empno] [uniqueidentifier] NULL,
	[d_date] [datetime] NULL,
 CONSTRAINT [PK_Student_1] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2021/6/4 下午 08:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Teacher_ID] [int] NOT NULL,
	[Teacher_FirstName] [nvarchar](50) NOT NULL,
	[Teacher_LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Teacher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'f65925ef-25cb-4a77-b259-21e5a0e78df3', N'sdfsf', N'123', 1)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'3cb938be-af92-4264-866b-2feb788526e6', N'A123456777', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'2c70ef89-6ad8-4575-8cd7-37cc6318c6e3', N'S124489867', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'1c9e2c2f-a73d-4bfb-a9bc-586d6218551c', N'A123456788', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'223df17d-16b3-4312-b06a-71eceac98479', N'N257373578', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'989bf025-b179-4c19-996c-9f84c40cdf2e', N'M123456789', N'123', 1)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'53f2d833-7cce-47c1-8ae4-a95d02bca763', N'S124489867', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'A123456666', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'34ac731f-8911-4094-b7c7-f12d853a382e', N'D261415750', N'123', 0)
INSERT [dbo].[Account_summary] ([Acc_sum_ID], [Account], [password], [Type]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'A123456789', N'123', 0)
GO
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T001', 1, N'JAVA', 50, 3, CAST(N'2021-06-01' AS Date), CAST(N'09:00:00' AS Time), CAST(N'2021-06-30' AS Date), 1, 5000.0000, NULL, N'JAVA~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-23T00:00:00.000' AS DateTime), NULL, NULL, N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T002', 2, N'Ruby', 50, 1, CAST(N'2021-06-01' AS Date), CAST(N'09:00:00' AS Time), CAST(N'2021-06-30' AS Date), 2, 5500.0000, NULL, N'Ruby~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T003', 1, N'HTML', 50, 1, CAST(N'2021-06-01' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2021-06-30' AS Date), 1, 5000.0000, NULL, N'Ruby~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-23T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T004', 2, N'Python', 50, 1, CAST(N'2021-06-01' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2021-07-15' AS Date), 2, 4000.0000, NULL, N'Ruby~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-27T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T005', 3, N'HTTP', 50, 1, CAST(N'2021-06-02' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2021-08-30' AS Date), 3, 5000.0000, NULL, N'HTTP~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-28T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T006', 3, N'HTTP', 50, 1, CAST(N'2021-06-02' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2021-08-31' AS Date), 3, 5000.0000, NULL, N'HTTP~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-28T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T007', 4, N'JAVA', 50, 1, CAST(N'2021-06-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5000.0000, NULL, N'JAVA~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T008', 4, N'Ruby', 50, 1, CAST(N'2021-06-02' AS Date), CAST(N'09:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5500.0000, NULL, N'Ruby~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T009', 4, N'HTML', 50, 1, CAST(N'2021-06-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5000.0000, NULL, N'HTML~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T010', 4, N'Python', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 4000.0000, NULL, N'Python~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T011', 4, N'CSS', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'12:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 6000.0000, NULL, N'CSS~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T012', 4, N'C++', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'13:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5000.0000, NULL, N'C++~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T013', 4, N'HTML', 50, 0, CAST(N'2021-06-03' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5000.0000, NULL, N'HTML~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T014', 4, N'JAVA', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5000.0000, NULL, N'JAVA~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T015', 4, N'Ruby', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'16:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 5500.0000, NULL, N'Ruby~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T016', 4, N'Python', 50, 1, CAST(N'2021-06-03' AS Date), CAST(N'17:00:00' AS Time), CAST(N'2021-08-31' AS Date), 4, 4000.0000, NULL, N'Python~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T017', 3, N'HTML', 50, 1, CAST(N'2021-06-04' AS Date), CAST(N'11:00:00' AS Time), CAST(N'2021-08-31' AS Date), 3, 5000.0000, NULL, N'HTML~This is a good course.', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T018', 3, N'法學概論', 50, 0, CAST(N'2021-06-04' AS Date), CAST(N'10:00:00' AS Time), CAST(N'2021-08-31' AS Date), 3, 2000.0000, NULL, N'法學概論~內容涵蓋法學緒論與法學大意', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T019', 3, N'西方藝術史', 50, 0, CAST(N'2021-06-04' AS Date), CAST(N'09:00:00' AS Time), CAST(N'2021-08-31' AS Date), 3, 3500.0000, NULL, N'西方藝術史~從文藝復興到後印象主義', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T020', 3, N'國學戲曲導論', 50, 0, CAST(N'2021-06-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'2021-09-22' AS Date), 3, 7300.0000, NULL, N'戲曲學》含十二論：導論、資料論、劇場論、題材關目論、腳色 ... ', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T021', 3, N'東洋藝術史', 50, 1, CAST(N'2021-06-04' AS Date), CAST(N'13:00:00' AS Time), CAST(N'2021-09-22' AS Date), 3, 5200.0000, NULL, N'東洋藝術史~對照西方與東洋藝術表現，提煉出「日本人眼中的美」 追溯「日本人特殊的審美意識所為何來」', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T022', 3, N'柏拉圖的政治哲學', 50, 1, CAST(N'2021-06-04' AS Date), CAST(N'14:00:00' AS Time), CAST(N'2021-09-22' AS Date), 3, 3500.0000, NULL, N'柏拉圖的實踐政治哲學推崇一種混合政治，它融合了君主制和民主制，因此構建出了具有可行性的最佳城邦。', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T023', 3, N'英國經驗論', 50, 1, CAST(N'2021-06-04' AS Date), CAST(N'15:00:00' AS Time), CAST(N'2021-09-22' AS Date), 3, 4300.0000, NULL, N'所有觀念皆來自感官所得的印象或內在感覺。指出人類瞭解的範圍極為有限，懷疑乃是對知識應有的健全態度。', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Course] ([Course_ID], [Teacher_ID], [C_Name], [MaxNumEnrolled], [MinNumEnrolled], [StartDate], [StartTime], [EndDate], [Place_ID], [Price], [Remarks], [CourseIntroduction], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'T024', 3, N'經驗主義', 50, 1, CAST(N'2021-06-04' AS Date), CAST(N'16:00:00' AS Time), CAST(N'2021-09-22' AS Date), 3, 5500.0000, NULL, NULL, N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T011', 6000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T012', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T014', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T013', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T001', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T002', 5500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T023', 4300.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T024', 5500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T022', 3500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T001', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T003', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T012', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T011', 6000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T008', 5500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T010', 4000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T007', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T005', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T004', 4000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T002', 5500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T009', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T006', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T014', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T015', 5500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T016', 4000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T017', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T013', 5000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T018', 2000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T019', 3500.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T010', 4000.0000)
INSERT [dbo].[DropCart] ([Student_ID], [Course_ID], [Price]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T020', 7300.0000)
GO
INSERT [dbo].[Manager] ([Manager_ID], [Manager_FirstName], [Manager_LastName], [Department], [Account], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'f65925ef-25cb-4a77-b259-21e5a0e78df3', N'dasd', N'asdas', N'asdasd', N'sdfsf', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-04-22T15:56:30.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Manager] ([Manager_ID], [Manager_FirstName], [Manager_LastName], [Department], [Account], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'989bf025-b179-4c19-996c-9f84c40cdf2e', N'關', N'裡人', N'工程部', N'M123456789', N'f65925ef-25cb-4a77-b259-21e5a0e78df3', CAST(N'2021-05-27T16:48:27.000' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (1, N'教室一')
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (2, N'教室二')
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (3, N'教室三')
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (4, N'教室四')
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (5, N'教室五')
INSERT [dbo].[Place] ([Place_ID], [Place_Name]) VALUES (6, N'教室六')
GO
SET IDENTITY_INSERT [dbo].[Registration_record] ON 

INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3026, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T011', CAST(N'2021-05-11T16:55:19.963' AS DateTime), CAST(N'2021-05-12T15:39:20.047' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3027, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T012', CAST(N'2021-05-11T16:55:19.963' AS DateTime), CAST(N'2021-05-12T15:39:20.047' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3028, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T013', CAST(N'2021-05-11T16:55:19.963' AS DateTime), CAST(N'2021-05-12T15:39:20.047' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3029, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T014', CAST(N'2021-05-11T16:55:19.963' AS DateTime), CAST(N'2021-05-12T15:39:20.047' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3030, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T001', CAST(N'2021-05-11T17:26:57.337' AS DateTime), CAST(N'2021-05-24T16:02:03.933' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3031, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T003', CAST(N'2021-05-11T17:26:57.337' AS DateTime), CAST(N'2021-05-16T21:50:17.753' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3032, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T006', CAST(N'2021-05-11T17:26:57.337' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3033, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T009', CAST(N'2021-05-11T17:26:57.337' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3034, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T002', CAST(N'2021-05-12T09:30:29.343' AS DateTime), CAST(N'2021-05-24T16:02:03.933' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3035, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T013', CAST(N'2021-05-12T09:32:48.900' AS DateTime), CAST(N'2021-05-26T10:56:18.940' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3036, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T004', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3037, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T005', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3038, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T007', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3039, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T010', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3040, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T008', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3041, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T011', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3042, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T012', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T21:50:43.487' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3043, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T014', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-24T15:59:39.640' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3044, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T015', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-24T15:59:39.640' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3045, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T016', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-24T15:59:39.640' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3046, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T017', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-24T15:59:39.640' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3047, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T018', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-26T10:56:18.940' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3048, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T019', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-26T10:56:18.940' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3049, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T020', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-26T10:56:18.940' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3050, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T021', CAST(N'2021-05-12T11:01:58.440' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3051, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T022', CAST(N'2021-05-12T11:01:58.440' AS DateTime), CAST(N'2021-05-16T20:41:35.693' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3052, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T024', CAST(N'2021-05-12T14:46:39.140' AS DateTime), CAST(N'2021-05-16T20:41:35.693' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3053, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T023', CAST(N'2021-05-12T15:35:12.617' AS DateTime), CAST(N'2021-05-16T20:41:35.693' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3054, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T001', CAST(N'2021-05-12T16:36:18.877' AS DateTime), CAST(N'2021-05-12T16:41:26.863' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3055, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T002', CAST(N'2021-05-12T16:36:18.877' AS DateTime), CAST(N'2021-05-12T16:39:05.157' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3056, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T001', CAST(N'2021-05-12T16:41:15.070' AS DateTime), CAST(N'2021-05-12T16:41:26.863' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3057, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T010', CAST(N'2021-05-12T16:41:15.070' AS DateTime), CAST(N'2021-05-17T09:22:55.037' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3058, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T022', CAST(N'2021-05-16T21:48:34.727' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3059, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T023', CAST(N'2021-05-16T21:48:34.727' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3060, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T024', CAST(N'2021-05-16T21:48:34.727' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3061, N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'T001', CAST(N'2021-05-17T09:22:48.583' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3062, N'223df17d-16b3-4312-b06a-71eceac98479', N'T001', CAST(N'2021-05-17T15:11:44.293' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3063, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T001', CAST(N'2021-05-17T15:34:46.100' AS DateTime), CAST(N'2021-05-24T16:02:03.933' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3064, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T002', CAST(N'2021-05-17T15:34:46.100' AS DateTime), CAST(N'2021-05-24T16:02:03.933' AS DateTime))
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3065, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T003', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3066, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T004', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3067, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T005', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3068, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T006', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3069, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T008', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3070, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T007', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3071, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T009', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3072, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T010', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3073, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T011', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (3074, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T012', CAST(N'2021-05-17T15:34:46.100' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4061, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T001', CAST(N'2021-05-24T16:03:58.913' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4062, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T014', CAST(N'2021-05-25T09:55:09.310' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4063, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T002', CAST(N'2021-05-25T09:55:09.310' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4064, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T015', CAST(N'2021-05-25T09:55:09.310' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4065, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T016', CAST(N'2021-05-25T09:55:09.310' AS DateTime), NULL)
INSERT [dbo].[Registration_record] ([Record_ID], [Student_ID], [Course_ID], [b_date], [d_date]) VALUES (4066, N'f9b00778-b226-4f73-b525-fb923e4db80f', N'T017', CAST(N'2021-05-25T09:55:09.310' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Registration_record] OFF
GO
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (1, N'國立政治大學
', N'National Chengchi University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (2, N'國立清華大學
', N'National Tsing Hua University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (3, N'國立臺灣大學
', N'NATIONAL TAIWAN UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (4, N'國立臺灣師範大學
', N'National Taiwan Normal University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (5, N'國立成功大學
', N'National Cheng Kung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (6, N'國立中興大學
', N'National Chung Hsing University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (7, N'國立交通大學
', N'National Chiao Tung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (8, N'國立中央大學
', N'National Central University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (9, N'國立中山大學
', N'National Sun Yat-sen University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (10, N'國立臺灣海洋大學
', N'National Taiwan Ocean University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (11, N'國立中正大學
', N'National Chung Cheng University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (12, N'國立高雄師範大學
', N'National Kaohsiung Normal University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (13, N'國立彰化師範大學
', N'National Changhua University of Education
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (14, N'國立陽明大學
', N'National Yang-Ming University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (15, N'國立臺北大學
', N'NATIONAL TAIPEI UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (16, N'國立嘉義大學
', N'National Chiayi University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (17, N'國立高雄大學
', N'National University of Kaohsiung
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (18, N'國立東華大學
', N'National Dong Hwa University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (19, N'國立暨南國際大學
', N'National Chi Nan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (20, N'國立臺灣科技大學
', N'National Taiwan University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (21, N'國立雲林科技大學
', N'National Yunlin University of Science & Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (22, N'國立屏東科技大學
', N'National Pingtung University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (23, N'國立臺北科技大學
', N'National Taipei University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (24, N'國立臺北藝術大學
', N'Taipei National University of the Arts
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (25, N'國立臺灣藝術大學
', N'National Taiwan University of Arts
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (26, N'國立臺東大學
', N'National Taitung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (27, N'國立宜蘭大學
', N'National Ilan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (28, N'國立聯合大學
', N'National United University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (29, N'國立虎尾科技大學
', N'National Formosa University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (30, N'國立臺南藝術大學
', N'Tainan National University of the Arts
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (31, N'國立臺南大學
', N'National University of Tainan
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (32, N'國立臺北教育大學
', N'National Taipei University of Education
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (33, N'國立臺中教育大學
', N'National Taichung University of Education
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (34, N'國立澎湖科技大學
', N'National Penghu University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (35, N'國立勤益科技大學
', N'National Chin-Yi University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (36, N'國立體育大學
', N'National Taiwan Sport University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (37, N'國立臺北護理健康大學
', N'National Taipei University of Nursing and Health Sciences
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (38, N'國立高雄餐旅大學
', N'National Kaohsiung University of Hospitality and Tourism
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (39, N'國立金門大學
', N'National Quemoy University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (40, N'國立臺灣體育運動大學
', N'National Taiwan University of Sport
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (41, N'國立臺中科技大學
', N'National  Taichung University Of  Science And Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (42, N'國立臺北商業大學
', N'National Taipei University of  Business
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (43, N'國立屏東大學
', N'National Pingtung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (44, N'國立高雄科技大學
', N'National Kaohsiung University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (45, N'國立臺灣戲曲學院
', N'National Taiwan College of Performing Arts
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (46, N'國立臺南護理專科學校
', N'National Tainan Junior College of Nursing
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (47, N'國立臺東專科學校
', N'National Taitung Junior College
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (48, N'國立空中大學
', N'National Open University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (49, N'東海大學
', N'Tunghai University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (50, N'輔仁大學
', N'Fu Jen Catholic University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (51, N'東吳大學
', N'Soochow University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (52, N'中原大學
', N'Chung Yuan Christian University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (53, N'淡江大學學校財團法人淡江大學
', N'Tamkang University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (54, N'中國文化大學
', N'Chinese Culture University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (55, N'逢甲大學
', N'Feng Chia University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (56, N'靜宜大學
', N'PROVIDENCE UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (57, N'長庚大學
', N'Chang Gung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (58, N'元智大學
', N'Yuan Ze University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (59, N'中華大學學校財團法人中華大學
', N'Chung Hua University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (60, N'大葉大學
', N'Da-Yeh University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (61, N'華梵大學
', N'Huafan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (62, N'義守大學
', N'I-Shou University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (63, N'世新大學
', N'Shih Hsin University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (64, N'銘傳大學
', N'Ming Chuan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (65, N'實踐大學
', N'Shih Chien University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (66, N'朝陽科技大學
', N'Chaoyang University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (67, N'高雄醫學大學
', N'Kaohsiung Medical University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (68, N'南華大學
', N'Nanhua university
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (69, N'真理大學
', N'Aletheia University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (70, N'大同大學
', N'Tatung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (71, N'南臺學校財團法人南臺科技大學
', N'Southern Taiwan University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (72, N'崑山科技大學
', N'Kun Shan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (73, N'嘉藥學校財團法人嘉南藥理大學
', N'Chia Nan University of Pharmacy & Science
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (74, N'樹德科技大學
', N'Shu-Te University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (75, N'慈濟學校財團法人慈濟大學
', N'Tzu Chi University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (76, N'臺北醫學大學
', N'Taipei Medical University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (77, N'中山醫學大學
', N'CHUNG SHAN MEDICAL UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (78, N'龍華科技大學
', N'Lunghwa University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (79, N'輔英科技大學
', N'Fooyin University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (80, N'明新學校財團法人明新科技大學
', N'Minghsin University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (81, N'長榮大學
', N'Chang Jung Christian University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (82, N'弘光科技大學
', N'Hungkuang University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (83, N'中國醫藥大學
', N'CHINA MEDICAL UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (84, N'健行學校財團法人健行科技大學
', N'Chien Hsin University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (85, N'正修學校財團法人正修科技大學
', N'Cheng Shiu University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (86, N'萬能學校財團法人萬能科技大學
', N'Vanung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (87, N'玄奘大學
', N'Hsuan Chuang University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (88, N'建國科技大學
', N'Chienkuo Technology University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (89, N'明志科技大學
', N'Ming Chi University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (90, N'高苑科技大學
', N'Kao Yuan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (91, N'大仁科技大學
', N'Tajen University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (92, N'聖約翰科技大學
', N'St. John’s University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (93, N'嶺東科技大學
', N'Ling Tung University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (94, N'中國科技大學
', N'China University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (95, N'中臺科技大學
', N'Central Taiwan University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (96, N'亞洲大學
', N'Asia University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (97, N'開南大學
', N'Kainan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (98, N'佛光大學
', N'Fo Guang University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (99, N'台南家專學校財團法人台南應用科技大學
', N'Tainan School of Home Economics Foundation at Tainan University of Technology
')
GO
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (100, N'遠東科技大學
', N'Far East University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (101, N'光宇學校財團法人元培醫事科技大學
', N'Yuanpei University of Medical Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (102, N'景文科技大學
', N'Jinwen University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (103, N'中華醫事科技大學
', N'Chung Hwa University of Medical Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (104, N'東南科技大學
', N'Tungnan University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (105, N'德明財經科技大學
', N'Takming University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (106, N'明道學校財團法人明道大學
', N'MINGDAO UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (107, N'南開科技大學
', N'Nan Kai University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (108, N'中華學校財團法人中華科技大學
', N'China University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (109, N'僑光科技大學
', N'Overseas Chinese University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (110, N'廣亞學校財團法人育達科技大學
', N'Yu Da University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (111, N'美和學校財團法人美和科技大學
', N'Meiho University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (112, N'吳鳳科技大學
', N'WuFeng University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (113, N'環球學校財團法人環球科技大學
', N'TransWorld University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (114, N'台灣首府學校財團法人台灣首府大學
', N'Taiwan Shoufu University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (115, N'中州學校財團法人中州科技大學
', N'Chung Chou University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (116, N'修平學校財團法人修平科技大學
', N'Hsiuping University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (117, N'長庚學校財團法人長庚科技大學
', N'Chang Gung University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (118, N'城市學校財團法人臺北城市科技大學
', N'Taipei City University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (119, N'大華學校財團法人敏實科技大學
', N'Minth University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (120, N'醒吾學校財團法人醒吾科技大學
', N'Hsing Wu University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (121, N'文藻學校財團法人文藻外語大學
', N'Wenzao Ursuline University of Languages
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (122, N'華夏學校財團法人華夏科技大學
', N'Hwa Hsia University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (123, N'慈濟學校財團法人慈濟科技大學
', N'Tzu Chi University of Science and Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (124, N'致理學校財團法人致理科技大學
', N'Chihlee University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (125, N'康寧學校財團法人康寧大學
', N'University of Kang Ning
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (126, N'宏國學校財團法人宏國德霖科技大學
', N'Hungkuo Delin University of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (127, N'東方學校財團法人東方設計大學
', N'TungFang Design University
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (128, N'崇右學校財團法人崇右影藝科技大學
', N'Chungyu University of Film and Arts
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (129, N'台北海洋學校財團法人台北海洋科技大學
', N'Taipei University of Marine Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (130, N'中信金融管理學院
', N'CTBC Business School
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (131, N'大漢技術學院
', N'Dahan Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (132, N'和春技術學院
', N'Fortune Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (133, N'亞東技術學院
', N'Oriental Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (134, N'南亞科技學校財團法人南亞技術學院
', N'Nanya Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (135, N'稻江科技暨管理學院
', N'TOKO  UNIVERSITY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (136, N'蘭陽技術學院
', N'Lan Yang Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (137, N'黎明技術學院
', N'Lee-Ming Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (138, N'經國管理暨健康學院
', N'CHING KUO INSTITUTE OF MANAGEMENT AND HEALTH
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (139, N'大同技術學院
', N'Tatung Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (140, N'臺灣觀光學院
', N'The Culinary Institute of Taiwan
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (141, N'馬偕學校財團法人馬偕醫學院
', N'MacKay Medical College
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (142, N'法鼓學校財團法人法鼓文理學院
', N'Dharma Drum Institute of Liberal Art
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (143, N'馬偕學校財團法人馬偕醫護管理專科學校
', N'MacKay Junior College of Medicine, Nursing, and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (144, N'仁德醫護管理專科學校
', N'Jen-Teh Junior College of Medicine, Nursing and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (145, N'樹人醫護管理專科學校
', N'Shu-Zen Junior College of Medicine and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (146, N'慈惠醫護管理專科學校
', N'TZU HUI Institute of Technology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (147, N'耕莘健康管理專科學校
', N'Cardinal Tien Junior College of Healthcare And Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (148, N'敏惠醫護管理專科學校
', N'Min-Hwei Junior College of Health Care Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (149, N'育英醫護管理專科學校
', N'Yuh-Ing Junior College of Health Care & Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (150, N'聖母醫護管理專科學校
', N'St. Mary&acute;s Junior College of Medicine, Nursing and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (151, N'新生醫護管理專科學校
', N'Hsin Sheng Junior College of Medical Care and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (152, N'崇仁醫護管理專科學校
', N'Chung-Jen Junior College of Nursing, Health Sciences and Management
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (153, N'學校財團法人中華浸信會基督教台灣浸會神學院
', N'TAIWAN BAPTIST CHRISTIAN SEMINARY
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (154, N'臺北基督學院
', N'Christ''''s College Taipei
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (155, N'財團法人一貫道天皇基金會一貫道天皇學院
', N'I-Kuan Tao College
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (156, N'台神學校財團法人台灣神學研究學院
', N'Taiwan Graduate School of Theology
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (157, N'一貫道崇德學院
', N'i.k.t chong-de school
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (158, N'台灣基督長老教會南神神學院
', N'Tainan Theological College
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (159, N'臺北市立大學
', N'University of Taipei
')
INSERT [dbo].[School] ([School_ID], [Sch_name_tw], [Sch_name_en]) VALUES (160, N'高雄市立空中大學
', N'Open University of Kaohsiung
')
SET IDENTITY_INSERT [dbo].[School] OFF
GO
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'3cb938be-af92-4264-866b-2feb788526e6', N'gfhfh', N'fghfgh', CAST(N'2021-04-21' AS Date), N'A123456777', N'ghfgh@dhgfh', N'gerg', N'0987654321', 0, 0, 1, 1, 0, N'', N'', N'3cb938be-af92-4264-866b-2feb788526e6', CAST(N'2021-04-22T14:06:02.843' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'2c70ef89-6ad8-4575-8cd7-37cc6318c6e3', N'sdfsdf', N'asdasa', CAST(N'2021-04-15' AS Date), N'S124489867', N'sdsgsd@retret', N'sgsfg', N'0967867868', 0, 1, 1, 0, 0, N'', N'', N'2c70ef89-6ad8-4575-8cd7-37cc6318c6e3', CAST(N'2021-04-21T18:19:14.423' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'1c9e2c2f-a73d-4bfb-a9bc-586d6218551c', N'asda', N'qdqwd', CAST(N'2021-03-29' AS Date), N'A123456788', N'sdfsd@werwer', N'fdgdfgd', N'0987654321', 0, 0, 0, 0, 0, N'', N'', N'1c9e2c2f-a73d-4bfb-a9bc-586d6218551c', CAST(N'2021-04-22T15:45:51.500' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'223df17d-16b3-4312-b06a-71eceac98479', N'胡', N'小春', CAST(N'2009-01-07' AS Date), N'N257373578', N'wo@ubay.com', N'台北市萬華區萬大路28巷29號', N'0987654321', 1, 0, 0, 0, 1, N'', N'', N'223df17d-16b3-4312-b06a-71eceac98479', CAST(N'2021-05-07T15:31:48.707' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'53f2d833-7cce-47c1-8ae4-a95d02bca763', N'sdfsdf', N'asdasa', CAST(N'2021-04-15' AS Date), N'S124489867', N'sdsgsd@retret', N'sgsfg', N'0967867868', 0, 1, 1, 0, 0, N'', N'', N'53f2d833-7cce-47c1-8ae4-a95d02bca763', CAST(N'2021-04-21T18:22:05.160' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'3ee5dac6-8554-4a19-a957-c9ce18331299', N'dsf', N'wfwdfw', CAST(N'2021-04-14' AS Date), N'A123456666', N'sadsd@fvdf', N'dffdg', N'0987654321', 0, 1, 1, 0, 0, N'', N'', N'3ee5dac6-8554-4a19-a957-c9ce18331299', CAST(N'2021-04-22T14:50:39.010' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'34ac731f-8911-4094-b7c7-f12d853a382e', N'甘', N'家齊', CAST(N'1994-01-01' AS Date), N'D261415750', N'Jachi@ubay.com', N'台北市萬華區萬大路11巷29號', N'0987654432', 3, 1, 1, 0, 1, N'', N'', N'34ac731f-8911-4094-b7c7-f12d853a382e', CAST(N'2021-05-06T14:45:50.837' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([Student_ID], [S_FirstName], [S_LastName], [Birthday], [Idn], [Email], [Address], [CellPhone], [Education], [School_ID], [Experience], [ExYear], [gender], [PassNumber], [PassPic], [b_empno], [b_date], [e_empno], [e_date], [d_empno], [d_date]) VALUES (N'f9b00778-b226-4f73-b525-fb923e4db80f', N'王', N'小明', CAST(N'2000-01-01' AS Date), N'A123456789', N'WANG@ubay.com', N'台北市萬華區萬大路188巷29號', N'0987654321', 0, 0, 0, 0, 0, N'', N'', N'f9b00778-b226-4f73-b525-fb923e4db80f', CAST(N'2021-04-22T16:15:48.607' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (1, N'陳', N'一')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (2, N'李', N'二')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (3, N'林', N'三')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (4, N'王', N'四')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (5, N'錢', N'五')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (6, N'趙', N'六')
INSERT [dbo].[Teacher] ([Teacher_ID], [Teacher_FirstName], [Teacher_LastName]) VALUES (7, N'孫', N'七')
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Place] FOREIGN KEY([Place_ID])
REFERENCES [dbo].[Place] ([Place_ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Place]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[Teacher] ([Teacher_ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Account_summary] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[Account_summary] ([Acc_sum_ID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Account_summary]
GO
ALTER TABLE [dbo].[Registration_record]  WITH CHECK ADD  CONSTRAINT [FK_Registration_record_Registration_record] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Registration_record] CHECK CONSTRAINT [FK_Registration_record_Registration_record]
GO
ALTER TABLE [dbo].[Registration_record]  WITH CHECK ADD  CONSTRAINT [FK_Registration_record_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Registration_record] CHECK CONSTRAINT [FK_Registration_record_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account_summary] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Account_summary] ([Acc_sum_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account_summary]
GO
