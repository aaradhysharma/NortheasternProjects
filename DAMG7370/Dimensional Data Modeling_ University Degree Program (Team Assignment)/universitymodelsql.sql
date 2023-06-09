USE [master]
GO
/****** Object:  Database [university]    Script Date: 24-02-2022 16:53:02 ******/
CREATE DATABASE [university]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'university', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\university.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'university_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\university_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [university] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [university].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [university] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [university] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [university] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [university] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [university] SET ARITHABORT OFF 
GO
ALTER DATABASE [university] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [university] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [university] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [university] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [university] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [university] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [university] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [university] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [university] SET  ENABLE_BROKER 
GO
ALTER DATABASE [university] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [university] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [university] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [university] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [university] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [university] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [university] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [university] SET RECOVERY FULL 
GO
ALTER DATABASE [university] SET  MULTI_USER 
GO
ALTER DATABASE [university] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [university] SET DB_CHAINING OFF 
GO
ALTER DATABASE [university] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [university] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [university] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [university] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'university', N'ON'
GO
ALTER DATABASE [university] SET QUERY_STORE = OFF
GO
USE [university]
GO
/****** Object:  Table [dbo].[dim_CoreRequirement]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_CoreRequirement](
	[prereq_id] [int] NOT NULL,
	[department_id] [varchar](255) NOT NULL,
	[semester_season] [varchar](255) NULL,
	[course_description] [varchar](255) NULL,
	[year] [varchar](255) NULL,
 CONSTRAINT [PK5] PRIMARY KEY CLUSTERED 
(
	[prereq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Department]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Department](
	[department_id] [varchar](255) NOT NULL,
	[elective_course_id] [int] NOT NULL,
	[instructor_id] [int] NULL,
	[Location] [varchar](255) NULL,
	[DepartmentName] [varchar](255) NULL,
	[SpecializationOffered] [varchar](255) NULL,
 CONSTRAINT [PK2] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_ElectiveCourse]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_ElectiveCourse](
	[elective_course_id] [int] IDENTITY(100,1) NOT NULL,
	[instructor_id] [int] NOT NULL,
	[prereq_id] [int] NOT NULL,
	[course_name] [varchar](255) NULL,
	[course_description] [varchar](255) NULL,
	[other_details] [varchar](255) NULL,
	[class_details] [varchar](255) NULL,
	[credit_hours] [int] NULL,
	[course_start_date] [date] NULL,
	[course_end_state] [date] NULL,
	[specialization_id] [int] NULL,
	[specialization_name] [varchar](255) NULL,
	[course_fees] [varchar](20) NULL,
	[course_location_offered] [varchar](255) NULL,
 CONSTRAINT [PK4] PRIMARY KEY CLUSTERED 
(
	[elective_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_EnrollementDetails]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_EnrollementDetails](
	[enrollement_id] [int] IDENTITY(500,1) NOT NULL,
	[student_id] [int] NULL,
	[course_id] [int] NOT NULL,
	[course_start_date] [datetime] NULL,
	[course_end_date] [datetime] NULL,
	[enrollement_date] [date] NULL,
	[enrollement_drop_date] [date] NULL,
	[semester_season] [varchar](255) NULL,
 CONSTRAINT [PK9] PRIMARY KEY CLUSTERED 
(
	[enrollement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_GradeDetails]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_GradeDetails](
	[grade] [nvarchar](10) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] IDENTITY(100,1) NOT NULL,
	[semester_season] [varchar](255) NULL,
	[year] [varchar](255) NULL,
 CONSTRAINT [PK8] PRIMARY KEY CLUSTERED 
(
	[grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Instructor]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Instructor](
	[instructor_id] [int] IDENTITY(250,1) NOT NULL,
	[instructor_name] [varchar](255) NULL,
	[instructor_email] [varchar](255) NULL,
	[instructor_department] [varchar](255) NULL,
 CONSTRAINT [PK11] PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_PreviousCoursesTakenByStudent]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_PreviousCoursesTakenByStudent](
	[prevcourse_id] [int] IDENTITY(400,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[credit_hours_completed] [int] NOT NULL,
	[prereq_id] [int] NOT NULL,
	[course_name] [varchar](255) NULL,
	[semester_season] [varchar](255) NULL,
	[year] [varchar](255) NULL,
 CONSTRAINT [PK10] PRIMARY KEY NONCLUSTERED 
(
	[prevcourse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Registration]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Registration](
	[registration_id] [int] IDENTITY(50,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_name] [varchar](255) NULL,
	[date_of_registration] [date] NULL,
 CONSTRAINT [PK7] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_SemesterDetails]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_SemesterDetails](
	[semester_id] [int] IDENTITY(10,1) NOT NULL,
	[SemesterSeason] [varchar](255) NULL,
	[department_id] [varchar](255) NULL,
	[year] [varchar](255) NULL,
 CONSTRAINT [PK3] PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_University]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_University](
	[department_id] [varchar](255) NOT NULL,
	[Location] [varchar](255) NOT NULL,
	[course_id] [int] IDENTITY(100,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_StudentDetails]    Script Date: 24-02-2022 16:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_StudentDetails](
	[student_id] [int] IDENTITY(300,1) NOT NULL,
	[department_id] [varchar](255) NOT NULL,
	[elective_course_id] [int] NOT NULL,
	[email] [varchar](255) NULL,
	[major] [varchar](255) NULL,
	[specialization_id] [int] NOT NULL,
	[address] [varchar](255) NULL,
	[mode_of_accomodation] [varchar](255) NULL,
 CONSTRAINT [PK6] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [Ref461]    Script Date: 24-02-2022 16:53:02 ******/
CREATE NONCLUSTERED INDEX [Ref461] ON [dbo].[dim_Department]
(
	[elective_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Ref669]    Script Date: 24-02-2022 16:53:02 ******/
CREATE NONCLUSTERED INDEX [Ref669] ON [dbo].[dim_Registration]
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Ref251]    Script Date: 24-02-2022 16:53:02 ******/
CREATE NONCLUSTERED INDEX [Ref251] ON [dbo].[dim_University]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Ref263]    Script Date: 24-02-2022 16:53:02 ******/
CREATE NONCLUSTERED INDEX [Ref263] ON [dbo].[Fact_StudentDetails]
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Ref464]    Script Date: 24-02-2022 16:53:02 ******/
CREATE NONCLUSTERED INDEX [Ref464] ON [dbo].[Fact_StudentDetails]
(
	[elective_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_CoreRequirement]  WITH CHECK ADD  CONSTRAINT [Refdim_Department76] FOREIGN KEY([department_id])
REFERENCES [dbo].[dim_Department] ([department_id])
GO
ALTER TABLE [dbo].[dim_CoreRequirement] CHECK CONSTRAINT [Refdim_Department76]
GO
ALTER TABLE [dbo].[dim_ElectiveCourse]  WITH CHECK ADD  CONSTRAINT [Refdim_Instructor62] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[dim_Instructor] ([instructor_id])
GO
ALTER TABLE [dbo].[dim_ElectiveCourse] CHECK CONSTRAINT [Refdim_Instructor62]
GO
ALTER TABLE [dbo].[dim_EnrollementDetails]  WITH CHECK ADD  CONSTRAINT [RefFact_StudentDetails79] FOREIGN KEY([student_id])
REFERENCES [dbo].[Fact_StudentDetails] ([student_id])
GO
ALTER TABLE [dbo].[dim_EnrollementDetails] CHECK CONSTRAINT [RefFact_StudentDetails79]
GO
ALTER TABLE [dbo].[dim_GradeDetails]  WITH CHECK ADD  CONSTRAINT [RefFact_StudentDetails68] FOREIGN KEY([student_id])
REFERENCES [dbo].[Fact_StudentDetails] ([student_id])
GO
ALTER TABLE [dbo].[dim_GradeDetails] CHECK CONSTRAINT [RefFact_StudentDetails68]
GO
ALTER TABLE [dbo].[dim_PreviousCoursesTakenByStudent]  WITH CHECK ADD  CONSTRAINT [RefFact_StudentDetails67] FOREIGN KEY([student_id])
REFERENCES [dbo].[Fact_StudentDetails] ([student_id])
GO
ALTER TABLE [dbo].[dim_PreviousCoursesTakenByStudent] CHECK CONSTRAINT [RefFact_StudentDetails67]
GO
ALTER TABLE [dbo].[dim_Registration]  WITH CHECK ADD  CONSTRAINT [RefFact_StudentDetails69] FOREIGN KEY([student_id])
REFERENCES [dbo].[Fact_StudentDetails] ([student_id])
GO
ALTER TABLE [dbo].[dim_Registration] CHECK CONSTRAINT [RefFact_StudentDetails69]
GO
ALTER TABLE [dbo].[dim_University]  WITH CHECK ADD  CONSTRAINT [Refdim_Department51] FOREIGN KEY([department_id])
REFERENCES [dbo].[dim_Department] ([department_id])
GO
ALTER TABLE [dbo].[dim_University] CHECK CONSTRAINT [Refdim_Department51]
GO
ALTER TABLE [dbo].[Fact_StudentDetails]  WITH CHECK ADD  CONSTRAINT [Refdim_Department63] FOREIGN KEY([department_id])
REFERENCES [dbo].[dim_Department] ([department_id])
GO
ALTER TABLE [dbo].[Fact_StudentDetails] CHECK CONSTRAINT [Refdim_Department63]
GO
USE [master]
GO
ALTER DATABASE [university] SET  READ_WRITE 
GO
