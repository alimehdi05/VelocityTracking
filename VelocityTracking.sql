USE [master]
GO
/****** Object:  Database [VelocityTracking]    Script Date: 11/7/2022 8:38:22 PM ******/
CREATE DATABASE [VelocityTracking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VelocityTracking', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VelocityTracking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VelocityTracking_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VelocityTracking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VelocityTracking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VelocityTracking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VelocityTracking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VelocityTracking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VelocityTracking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VelocityTracking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VelocityTracking] SET ARITHABORT OFF 
GO
ALTER DATABASE [VelocityTracking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VelocityTracking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VelocityTracking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VelocityTracking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VelocityTracking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VelocityTracking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VelocityTracking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VelocityTracking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VelocityTracking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VelocityTracking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VelocityTracking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VelocityTracking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VelocityTracking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VelocityTracking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VelocityTracking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VelocityTracking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VelocityTracking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VelocityTracking] SET RECOVERY FULL 
GO
ALTER DATABASE [VelocityTracking] SET  MULTI_USER 
GO
ALTER DATABASE [VelocityTracking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VelocityTracking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VelocityTracking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VelocityTracking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VelocityTracking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VelocityTracking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VelocityTracking', N'ON'
GO
ALTER DATABASE [VelocityTracking] SET QUERY_STORE = OFF
GO
USE [VelocityTracking]
GO
/****** Object:  User [VT]    Script Date: 11/7/2022 8:38:23 PM ******/
CREATE USER [VT] FOR LOGIN [VT] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS]    Script Date: 11/7/2022 8:38:23 PM ******/
CREATE USER [IIS] FOR LOGIN [IIS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_InsertEmployeeDetails]    Script Date: 11/7/2022 8:38:23 PM ******/
CREATE TYPE [dbo].[udt_InsertEmployeeDetails] AS TABLE(
	[Employees] [int] NULL,
	[EstimatedHours] [float] NULL,
	[ActualHours] [float] NULL,
	[CreateDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[EmployeeDetail]    Script Date: 11/7/2022 8:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetail](
	[emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employees] [int] NULL,
	[EstimatedHours] [float] NULL,
	[ActualHours] [float] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeDetail] PRIMARY KEY CLUSTERED 
(
	[emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectDetail]    Script Date: 11/7/2022 8:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDetail](
	[pd_ID] [int] IDENTITY(1,1) NOT NULL,
	[Projects] [int] NULL,
	[TaskTitle] [nvarchar](100) NULL,
	[TaskDescription] [nvarchar](300) NULL,
	[TotalEstimate] [float] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProjectDetail] PRIMARY KEY CLUSTERED 
(
	[pd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProjectDetail] ON 

INSERT [dbo].[ProjectDetail] ([pd_ID], [Projects], [TaskTitle], [TaskDescription], [TotalEstimate], [IsActive], [IsDeleted], [CreateDate], [UpdateDate]) VALUES (1, 1, N'Test', N'Testing', 12.100000381469727, 1, 0, CAST(N'2022-11-07T15:30:04.917' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProjectDetail] OFF
GO
ALTER TABLE [dbo].[ProjectDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProjectDetail] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProjectAndEmployeeDetails]    Script Date: 11/7/2022 8:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================

-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertProjectAndEmployeeDetails]
	-- Add the parameters for the stored procedure here
	@udt_insEmpDetails udt_InsertEmployeeDetails readonly,
    @Projects int,
	@TaskTitle nVarChar(100),
	@TaskDescription nvarchar(300), 
	@TotalEstimate float
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
		
	DECLARE @iRetID int
    INSERT INTO  ProjectDetail
	(
			Projects,
			TaskTitle,
			TaskDescription, 
			TotalEstimate,
			IsActive,
			IsDeleted, 
			CreateDate
	)
	VALUES
	(
			@Projects,
			@TaskTitle,
			@TaskDescription, 
			@TotalEstimate,
			1,
			0, 
			GETUTCDATE()
	)
	SET @iRetID = SCOPE_IDENTITY()
		
    -- Insert statements for procedure here
DECLARE @iRetID2 int

	 INSERT INTO  EmployeeDetail
	(
			Employees,
			EstimatedHours,
			ActualHours, 
			CreateDate
	)
 
	(SELECT 
	 [Employees] 
	,[EstimatedHours] 
	,[ActualHours] 
	,GETUTCDATE() 
	FROM @udt_insEmpDetails)
			
	
	SET @iRetID2 = SCOPE_IDENTITY()


	IF @@ERROR <> 0 
	BEGIN
	SELECT -1 pd_ID,'' AS [Status];  
    RETURN 0
    END
    ELSE
    BEGIN          
	SELECT @iRetID pd_ID, @iRetID2 AS [Status];
    RETURN 1;
    END;

 
END







GO
USE [master]
GO
ALTER DATABASE [VelocityTracking] SET  READ_WRITE 
GO
