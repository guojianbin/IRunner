USE [master]
GO
/****** Object:  Database [DB_ECCRM]    Script Date: 11/13/2013 13:53:32 ******/
CREATE DATABASE [DB_ECCRM] ON  PRIMARY 
( NAME = N'DB_CRM', FILENAME = N'D:\DATA\DB_CRM.mdf' , SIZE = 12454080KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_CRM_log', FILENAME = N'D:\DATA\DB_ECCRM_log.LDF' , SIZE = 13632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_ECCRM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ECCRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ECCRM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_ECCRM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_ECCRM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_ECCRM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_ECCRM] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_ECCRM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DB_ECCRM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_ECCRM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_ECCRM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_ECCRM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_ECCRM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_ECCRM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_ECCRM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_ECCRM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_ECCRM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_ECCRM] SET  DISABLE_BROKER
GO
ALTER DATABASE [DB_ECCRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_ECCRM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_ECCRM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_ECCRM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_ECCRM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_ECCRM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_ECCRM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_ECCRM] SET  READ_WRITE
GO
ALTER DATABASE [DB_ECCRM] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DB_ECCRM] SET  MULTI_USER
GO
ALTER DATABASE [DB_ECCRM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_ECCRM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_ECCRM', N'ON'
GO
USE [DB_ECCRM]
GO
/****** Object:  User [gzsystem]    Script Date: 11/13/2013 13:53:32 ******/
CREATE USER [gzsystem] FOR LOGIN [gzsystem] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[t_CRM_FollowUp]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_FollowUp](
	[CRM_FollowUp_ID] [uniqueidentifier] NOT NULL,
	[CRM_FollowUp_FollowUpClass_ID] [int] NULL,
	[CRM_FollowUp_CreateTime] [datetime] NULL,
	[CRM_FollowUp_Customer_ID] [uniqueidentifier] NULL,
	[CRM_FollowUp_ProjectInfo_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_t_CRM_FollowUp] PRIMARY KEY CLUSTERED 
(
	[CRM_FollowUp_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_EventNotification]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_EventNotification](
	[CRM_EventNotification_ID] [uniqueidentifier] NOT NULL,
	[CRM_EventNotification_Content] [varchar](5000) NULL,
	[CRM_EventNotification_Title] [varchar](200) NULL,
	[CRM_EventNotification_CreateTime] [datetime] NULL,
	[CRM_EventNotification_Days] [int] NULL,
 CONSTRAINT [PK_t_CRM_EventNotification] PRIMARY KEY CLUSTERED 
(
	[CRM_EventNotification_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_Employee]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Employee](
	[Emp_ID] [uniqueidentifier] NOT NULL,
	[Emp_Code] [nvarchar](20) NOT NULL,
	[Emp_Name] [nvarchar](20) NULL,
	[Dept_Code] [nvarchar](200) NULL,
	[Level] [smallint] NULL,
	[Title] [nvarchar](20) NULL,
	[Sex] [smallint] NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[telent] [nvarchar](30) NULL,
	[Family_Phone] [nvarchar](30) NULL,
	[MSN] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[Licence_NO] [nvarchar](30) NULL,
	[Marry] [smallint] NULL,
	[Memo] [nvarchar](1000) NULL,
	[Status] [smallint] NULL,
	[Is_Receive] [bit] NULL,
	[Roles] [nvarchar](1000) NULL,
	[Create_Date] [datetime] NULL,
	[Src_Guid] [nvarchar](50) NULL,
	[Is_Sale] [bit] NULL,
 CONSTRAINT [BS_Employee_PK] PRIMARY KEY CLUSTERED 
(
	[Emp_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Department]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Department](
	[Dept_ID] [uniqueidentifier] NOT NULL,
	[Dept_Code] [nvarchar](200) NOT NULL,
	[Dept_Name] [nvarchar](20) NOT NULL,
	[Dept_FullCode] [nvarchar](200) NOT NULL,
	[Parent_Code] [nvarchar](200) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Contact] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[Fax] [nvarchar](30) NOT NULL,
	[Serial_Code] [nvarchar](50) NOT NULL,
	[Is_Business] [bit] NOT NULL,
	[Is_Enabled] [bit] NOT NULL,
	[Create_Date] [datetime] NOT NULL,
	[Src_Guid] [nvarchar](50) NULL,
 CONSTRAINT [BS_Department_PK] PRIMARY KEY CLUSTERED 
(
	[Dept_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_CustomerType_History]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_CustomerType_History](
	[CRM_History_CustomerType_ID] [uniqueidentifier] NOT NULL,
	[CRM_History_CustomerType_TypeClass_ID] [int] NULL,
	[CRM_Customer_History_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_t_CRM_CustomerType_History] PRIMARY KEY CLUSTERED 
(
	[CRM_History_CustomerType_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_CustomerType]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_CustomerType](
	[CRM_CustomerType_ID] [uniqueidentifier] NOT NULL,
	[CRM_CustomerType_Customer_ID] [uniqueidentifier] NULL,
	[CRM_CustomerType_TypeClass_ID] [int] NULL,
 CONSTRAINT [PK_t_CRM_CustomerType] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerType_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Customerbak]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_Customerbak](
	[CRM_Customer_ID] [uniqueidentifier] NOT NULL,
	[CRM_Customer_Name] [nvarchar](50) NULL,
	[CRM_Customer_Phone] [varchar](100) NULL,
	[CRM_Customer_Sex] [bit] NULL,
	[CRM_Customer_Age] [tinyint] NULL,
	[CRM_Customer_SourceClass_ID] [int] NULL,
	[CRM_Customer_CarType] [nvarchar](50) NULL,
	[CRM_Customer_CarEngineType] [nvarchar](50) NULL,
	[CRM_Customer_CarNumber] [varchar](20) NULL,
	[CRM_Customer_Region] [nvarchar](50) NULL,
	[CRM_Customer_BuildingAddress] [nvarchar](200) NULL,
	[CRM_Customer_BuildingArea] [numeric](18, 2) NULL,
	[CRM_Customer_CustomerState_ID] [int] NULL,
	[CRM_Customer_Remark] [nvarchar](1000) NULL,
	[CRM_Customer_Email] [varchar](200) NULL,
	[CRM_Customer_CreateTime] [datetime] NULL,
	[CRM_Customer_IsPrivate] [int] NULL,
	[CRM_Customer_City] [nvarchar](50) NULL,
	[CRM_Customer_Company] [nvarchar](50) NULL,
	[CRM_Customer_DirectLine] [varchar](20) NULL,
	[CRM_Customer_CustomerSourceType_ID] [int] NULL,
	[CRM_Customer_Phone_One] [varchar](20) NULL,
	[CRM_Customer_Phone_Two] [varchar](20) NULL,
	[CRM_Customer_DirectLine_One] [varchar](20) NULL,
	[CRM_Customer_BuildingName] [nvarchar](50) NULL,
	[CRM_Customer_StateDetail] [nvarchar](50) NULL,
	[CRM_Customer_RequirementRemark] [nvarchar](1000) NULL,
	[CRM_Customer_SourceRemark] [nvarchar](1000) NULL,
	[CRM_CustomerActiveStatus_ID] [int] NULL,
	[CRM_Customer_FollowUpClass_ID] [int] NULL,
	[CRM_Customer_ExpectPrice] [numeric](18, 2) NULL,
	[CRM_Customer_RowID] [bigint] NULL,
 CONSTRAINT [PK_t_CRM_Customer-2013-10-29-02] PRIMARY KEY CLUSTERED 
(
	[CRM_Customer_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_CustomerAssign_Cache]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_CustomerAssign_Cache](
	[CRM_CustomerAssign_ID] [uniqueidentifier] NOT NULL,
	[CRM_CustomerAssign_Customer_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_EM_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_CreateTime] [datetime] NULL,
	[CRM_CustomerAssign_Remark] [nvarchar](1000) NULL,
	[CRM_CustomerAssign_ProjectInfo_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_SalesName] [nvarchar](50) NULL,
	[CRM_CustomerAssign_SuperName] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_CustomerAssign_Cache] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerAssign_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_CustomerAssign]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_CustomerAssign](
	[CRM_CustomerAssign_ID] [uniqueidentifier] NOT NULL,
	[CRM_CustomerAssign_Customer_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_EM_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_CreateTime] [datetime] NULL,
	[CRM_CustomerAssign_Remark] [nvarchar](1000) NULL,
	[CRM_CustomerAssign_ProjectInfo_ID] [uniqueidentifier] NULL,
	[CRM_CustomerAssign_SalesName] [nvarchar](50) NULL,
	[CRM_CustomerAssign_SuperName] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_CustomerAssign88] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerAssign_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Customer_History]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_Customer_History](
	[CRM_Customer_History_ID] [uniqueidentifier] NOT NULL,
	[CRM_Customer_History_AlterUser_EM_ID] [uniqueidentifier] NULL,
	[CRM_Customer_History_AlterUser_Name] [nvarchar](50) NULL,
	[CRM_Customer_History_CreateTime] [datetime] NULL,
	[CRM_History_Customer_ID] [uniqueidentifier] NULL,
	[CRM_History_Customer_Name] [nvarchar](50) NULL,
	[CRM_History_Customer_Phone] [varchar](100) NULL,
	[CRM_History_Customer_Sex] [bit] NULL,
	[CRM_History_Customer_Age] [tinyint] NULL,
	[CRM_History_Customer_SourceClass_ID] [int] NULL,
	[CRM_History_Customer_CarType] [nvarchar](50) NULL,
	[CRM_History_Customer_CarEngineType] [nvarchar](50) NULL,
	[CRM_History_Customer_CarNumber] [varchar](20) NULL,
	[CRM_History_Customer_Region] [nvarchar](50) NULL,
	[CRM_History_Customer_BuildingAddress] [nvarchar](200) NULL,
	[CRM_History_Customer_BuildingArea] [numeric](18, 2) NULL,
	[CRM_History_Customer_CustomerState_ID] [int] NULL,
	[CRM_History_Customer_Remark] [nvarchar](1000) NULL,
	[CRM_History_Customer_Email] [varchar](200) NULL,
	[CRM_History_Customer_CreateTime] [datetime] NULL,
	[CRM_History_Customer_IsPrivate] [int] NULL,
	[CRM_History_Customer_City] [nvarchar](50) NULL,
	[CRM_History_Customer_Company] [nvarchar](50) NULL,
	[CRM_History_Customer_DirectLine] [varchar](20) NULL,
	[CRM_History_Customer_CustomerSourceType_ID] [int] NULL,
	[CRM_History_Customer_Phone_One] [varchar](20) NULL,
	[CRM_History_Customer_Phone_Two] [varchar](20) NULL,
	[CRM_History_Customer_DirectLine_One] [varchar](20) NULL,
	[CRM_History_Customer_BuildingName] [nvarchar](50) NULL,
	[CRM_History_Customer_StateDetail] [nvarchar](50) NULL,
	[CRM_History_Customer_RequirementRemark] [nvarchar](1000) NULL,
	[CRM_History_Customer_SourceRemark] [nvarchar](1000) NULL,
	[CRM_History_Customer_CustomerActiveStatus_ID] [int] NULL,
	[CRM_History_Customer_FollowUpClass_ID] [int] NULL,
	[CRM_History_Customer_ExpectPrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_t_CRM_Customer_History] PRIMARY KEY CLUSTERED 
(
	[CRM_Customer_History_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_Customer]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_Customer](
	[CRM_Customer_ID] [uniqueidentifier] NOT NULL,
	[CRM_Customer_Name] [nvarchar](50) NULL,
	[CRM_Customer_Phone] [varchar](100) NULL,
	[CRM_Customer_Sex] [bit] NULL,
	[CRM_Customer_Age] [tinyint] NULL,
	[CRM_Customer_SourceClass_ID] [int] NULL,
	[CRM_Customer_CarType] [nvarchar](50) NULL,
	[CRM_Customer_CarEngineType] [nvarchar](50) NULL,
	[CRM_Customer_CarNumber] [varchar](20) NULL,
	[CRM_Customer_Region] [nvarchar](50) NULL,
	[CRM_Customer_BuildingAddress] [nvarchar](200) NULL,
	[CRM_Customer_BuildingArea] [numeric](18, 2) NULL,
	[CRM_Customer_CustomerState_ID] [int] NULL,
	[CRM_Customer_Remark] [nvarchar](1000) NULL,
	[CRM_Customer_Email] [varchar](200) NULL,
	[CRM_Customer_CreateTime] [datetime] NULL,
	[CRM_Customer_IsPrivate] [int] NULL,
	[CRM_Customer_City] [nvarchar](50) NULL,
	[CRM_Customer_Company] [nvarchar](50) NULL,
	[CRM_Customer_DirectLine] [varchar](20) NULL,
	[CRM_Customer_CustomerSourceType_ID] [int] NULL,
	[CRM_Customer_Phone_One] [varchar](20) NULL,
	[CRM_Customer_Phone_Two] [varchar](20) NULL,
	[CRM_Customer_DirectLine_One] [varchar](20) NULL,
	[CRM_Customer_BuildingName] [nvarchar](50) NULL,
	[CRM_Customer_StateDetail] [nvarchar](50) NULL,
	[CRM_Customer_RequirementRemark] [nvarchar](1000) NULL,
	[CRM_Customer_SourceRemark] [nvarchar](1000) NULL,
	[CRM_CustomerActiveStatus_ID] [int] NULL,
	[CRM_Customer_FollowUpClass_ID] [int] NULL,
	[CRM_Customer_ExpectPrice] [numeric](18, 2) NULL,
	[CRM_Customer_RowID] [bigint] NULL,
 CONSTRAINT [PK_t_CRM_Customer_BAK_2013-10-24-1818] PRIMARY KEY CLUSTERED 
(
	[CRM_Customer_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_CallRecord]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_CallRecord](
	[CRM_CallRecord_ID] [uniqueidentifier] NOT NULL,
	[CRM_CallRecord_EnterpriseID] [nvarchar](50) NULL,
	[CRM_CallRecord_UserName] [nvarchar](50) NULL,
	[CRM_CallRecord_SessionId] [nvarchar](200) NULL,
	[CRM_CallRecord_ANI] [nvarchar](50) NULL,
	[CRM_CallRecord_DNIS] [nvarchar](50) NULL,
	[CRM_CallRecord_Context] [nvarchar](1000) NULL,
	[CRM_CallRecord_CreateTime] [datetime] NULL,
	[CRM_CallRecord_RecordURL] [nvarchar](1000) NULL,
 CONSTRAINT [PK_t_CRM_CallRecord] PRIMARY KEY CLUSTERED 
(
	[CRM_CallRecord_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Attendance]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Attendance](
	[CRM_Attendance_ID] [uniqueidentifier] NOT NULL,
	[CRM_Attendance_Code] [nvarchar](20) NULL,
	[CRM_Attendance_LoginTime] [datetime] NULL,
	[CRM_Attendance_LogoutTime] [datetime] NULL,
 CONSTRAINT [PK_t_CRM_Attendance] PRIMARY KEY CLUSTERED 
(
	[CRM_Attendance_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_AgentWithCode]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_AgentWithCode](
	[CRM_AgentWithCode_ID] [uniqueidentifier] NOT NULL,
	[CRM_AgentWithCode_AgentManage_ID] [uniqueidentifier] NULL,
	[CRM_AgentWithCode_Code] [nvarchar](50) NULL,
	[CRM_AgentWithCode_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_CRM_AgentWithCode] PRIMARY KEY CLUSTERED 
(
	[CRM_AgentWithCode_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_AgentManage]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_AgentManage](
	[CRM_AgentManage_ID] [uniqueidentifier] NOT NULL,
	[CRM_AgentManage_Number] [nvarchar](50) NULL,
	[CRM_AgentManage_AgentID] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_CRM_AgentManage] PRIMARY KEY CLUSTERED 
(
	[CRM_AgentManage_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SZData]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SZData](
	[城市] [nvarchar](255) NULL,
	[区域] [nvarchar](255) NULL,
	[状态] [nvarchar](255) NULL,
	[楼盘名称] [nvarchar](255) NULL,
	[楼盘地址] [nvarchar](255) NULL,
	[面积] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[手机] [float] NULL,
	[手机1] [nvarchar](255) NULL,
	[手机2] [nvarchar](255) NULL,
	[直线电话] [nvarchar](255) NULL,
	[直线电话1] [nvarchar](255) NULL,
	[性别] [nvarchar](255) NULL,
	[年龄] [nvarchar](255) NULL,
	[投资/自用] [nvarchar](255) NULL,
	[车型] [nvarchar](255) NULL,
	[发动机型号] [nvarchar](255) NULL,
	[车牌号码] [nvarchar](255) NULL,
	[公司名称] [nvarchar](255) NULL,
	[资料来源] [nvarchar](255) NULL,
	[备注] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZSData]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZSData](
	[城市] [nvarchar](255) NULL,
	[区域] [nvarchar](255) NULL,
	[状态] [nvarchar](255) NULL,
	[楼盘名称] [nvarchar](255) NULL,
	[楼盘地址] [nvarchar](255) NULL,
	[面积] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[手机] [float] NULL,
	[手机1] [nvarchar](255) NULL,
	[手机2] [nvarchar](255) NULL,
	[直线电话] [nvarchar](255) NULL,
	[直线电话1] [nvarchar](255) NULL,
	[性别] [nvarchar](255) NULL,
	[年龄] [nvarchar](255) NULL,
	[投资/自用] [nvarchar](255) NULL,
	[车型] [nvarchar](255) NULL,
	[发动机型号] [nvarchar](255) NULL,
	[车牌号码] [nvarchar](255) NULL,
	[公司名称] [nvarchar](255) NULL,
	[资料来源] [nvarchar](255) NULL,
	[备注] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZHData]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZHData](
	[城市] [nvarchar](255) NULL,
	[区域] [nvarchar](255) NULL,
	[状态] [nvarchar](255) NULL,
	[楼盘名称] [nvarchar](255) NULL,
	[楼盘地址] [nvarchar](255) NULL,
	[面积] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[手机] [float] NULL,
	[手机1] [nvarchar](255) NULL,
	[手机2] [nvarchar](255) NULL,
	[直线电话] [nvarchar](255) NULL,
	[直线电话1] [nvarchar](255) NULL,
	[性别] [nvarchar](255) NULL,
	[年龄] [nvarchar](255) NULL,
	[投资/自用] [nvarchar](255) NULL,
	[车型] [nvarchar](255) NULL,
	[发动机型号] [nvarchar](255) NULL,
	[车牌号码] [nvarchar](255) NULL,
	[公司名称] [nvarchar](255) NULL,
	[资料来源] [nvarchar](255) NULL,
	[备注] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Log]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Log](
	[Log_ID] [uniqueidentifier] NOT NULL,
	[Log_EmployeeID] [nvarchar](10) NULL,
	[Log_EmployeeName] [nvarchar](50) NULL,
	[Log_OperateTime] [datetime] NULL,
	[Log_OperateModuleID] [int] NULL,
	[Log_OperateModuleMainID] [uniqueidentifier] NULL,
	[Log_OperateID] [int] NULL,
	[Log_OperateDesc] [nvarchar](1000) NULL,
	[Log_ComputerName] [nvarchar](1000) NULL,
 CONSTRAINT [PK_t_Log] PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_Log_OperateModule]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_Log_OperateModule](
	[OperateModule_ID] [int] NOT NULL,
	[OperateModule_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_Log_OperateModule] PRIMARY KEY CLUSTERED 
(
	[OperateModule_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_Log_Operate]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_Log_Operate](
	[Operate_ID] [int] NOT NULL,
	[Operate_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_Log_Operate] PRIMARY KEY CLUSTERED 
(
	[Operate_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_TypeClass]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_TypeClass](
	[CRM_TypeClass_ID] [int] NOT NULL,
	[CRM_TypeClass_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_TypeClass] PRIMARY KEY CLUSTERED 
(
	[CRM_TypeClass_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_SourceClass]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_SourceClass](
	[CRM_SourceClass_ID] [int] NOT NULL,
	[CRM_SourceClass_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_SourceClass] PRIMARY KEY CLUSTERED 
(
	[CRM_SourceClass_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_RequirementClass]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_RequirementClass](
	[CRM_RequirementClass_ID] [int] NOT NULL,
	[CRM_RequirementClass_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_RequirementClass] PRIMARY KEY CLUSTERED 
(
	[CRM_RequirementClass_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_FollowUpClass]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_FollowUpClass](
	[CRM_FollowUpClass_ID] [int] NOT NULL,
	[CRM_FollowUpClass_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_FollowUpClass] PRIMARY KEY CLUSTERED 
(
	[CRM_FollowUpClass_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_CustomerState]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_CustomerState](
	[CRM_CustomerState_ID] [int] NOT NULL,
	[CRM_CustomerState_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Dic_CRM_CustomerState] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerState_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_CustomerSourceType]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_CustomerSourceType](
	[CRM_CustomerSourceType_ID] [int] NOT NULL,
	[CRM_CustomerSourceType_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_t_Dic_CRM_CustomerSourceType] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerSourceType_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Dic_CRM_CustomerActiveStatus]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Dic_CRM_CustomerActiveStatus](
	[CRM_CustomerActiveStatus_ID] [int] NOT NULL,
	[CRM_CustomerActiveStatus_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_t_Dic_CRM_CustomerActiveStatus] PRIMARY KEY CLUSTERED 
(
	[CRM_CustomerActiveStatus_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_TalkTime]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_TalkTime](
	[CRM_TalkTime_ID] [uniqueidentifier] NOT NULL,
	[CRM_TalkTime_Customer_ID] [uniqueidentifier] NULL,
	[CRM_TalkTime_EM_ID] [uniqueidentifier] NULL,
	[CRM_TalkTime_BeginTime] [datetime] NULL,
	[CRM_TalkTime_EndTime] [datetime] NULL,
	[CRM_TalkTime_TotalSecTime] [numeric](18, 2) NULL,
 CONSTRAINT [PK_t_CRM_TalkTime] PRIMARY KEY CLUSTERED 
(
	[CRM_TalkTime_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_SMS_Recharge]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_SMS_Recharge](
	[CRM_SMS_Recharge_ID] [uniqueidentifier] NOT NULL,
	[CRM_SMS_Recharge_LimitAmount_ID] [uniqueidentifier] NULL,
	[CRM_SMS_Recharge_Recharge] [bigint] NULL,
	[CRM_SMS_Recharge_Time] [datetime] NULL,
 CONSTRAINT [PK_t_CRM_SMS_Recharge] PRIMARY KEY CLUSTERED 
(
	[CRM_SMS_Recharge_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_SMS_LimitAmount]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_SMS_LimitAmount](
	[CRM_SMS_LimitAmount_ID] [uniqueidentifier] NOT NULL,
	[CRM_SMS_LimitAmount_EM_ID] [uniqueidentifier] NULL,
	[CRM_SMS_LimitAmount_EM_Name] [nvarchar](50) NULL,
	[CRM_SMS_LimitAmount_Code] [nvarchar](50) NULL,
	[CRM_SMS_LimitAmount_Level] [nvarchar](50) NULL,
	[CRM_SMS_LimitAmount_Dept] [nvarchar](50) NULL,
	[CRM_SMS_LimitAmount_Amount] [bigint] NULL,
	[CRM_SMS_LimitAmount_Type] [nvarchar](50) NULL,
	[CRM_SMS_LimitAmount_Balance] [bigint] NULL,
	[CRM_SMS_LimitAmount_Month] [datetime] NULL,
 CONSTRAINT [PK_t_CRM_SMS_LimitAmount] PRIMARY KEY CLUSTERED 
(
	[CRM_SMS_LimitAmount_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_SMS_bak]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_SMS_bak](
	[CRM_SMS_ID] [uniqueidentifier] NOT NULL,
	[CRM_SMS_Operator_EM_ID] [uniqueidentifier] NULL,
	[CRM_SMS_Operator_EM_Name] [nvarchar](50) NULL,
	[CRM_SMS_Customer_ID] [uniqueidentifier] NULL,
	[CRM_SMS_Customer_Phone] [varchar](100) NULL,
	[CRM_SMS_SendTime] [datetime] NULL,
	[CRM_SMS_Content] [nvarchar](1000) NULL,
 CONSTRAINT [PK_t_CRM_SMS_bak] PRIMARY KEY CLUSTERED 
(
	[CRM_SMS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_SMS]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_CRM_SMS](
	[CRM_SMS_ID] [uniqueidentifier] NOT NULL,
	[CRM_SMS_Operator_EM_Code] [nvarchar](50) NULL,
	[CRM_SMS_Operator_EM_Name] [nvarchar](50) NULL,
	[CRM_SMS_Customer_ID] [uniqueidentifier] NULL,
	[CRM_SMS_Customer_Phone] [varchar](100) NULL,
	[CRM_SMS_SendTime] [datetime] NULL,
	[CRM_SMS_Content] [nvarchar](1000) NULL,
	[CRM_SMS_SendCount] [int] NULL,
	[CRM_SMS_ReturnStatus] [nvarchar](50) NULL,
	[CRM_SMS_Message] [nvarchar](50) NULL,
	[CRM_SMS_TaskID] [nvarchar](50) NULL,
	[CRM_SMS_TaskID_SuccessCounts] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_CRM_SMS] PRIMARY KEY CLUSTERED 
(
	[CRM_SMS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_CRM_RoleAssign]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_RoleAssign](
	[CRM_RoleAssign_ID] [uniqueidentifier] NOT NULL,
	[CRM_RoleAssign_Code] [nvarchar](50) NULL,
	[CRM_RoleAssign_RoleName] [nvarchar](20) NULL,
	[CRM_RoleAssign_CreateTime] [datetime] NULL,
 CONSTRAINT [PK_t_CRM_RoleAssign] PRIMARY KEY CLUSTERED 
(
	[CRM_RoleAssign_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Role]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Role](
	[Role_ID] [uniqueidentifier] NOT NULL,
	[Role_Name] [nvarchar](20) NOT NULL,
	[Descr] [nvarchar](100) NOT NULL,
	[Data_Extend] [nvarchar](20) NOT NULL,
	[Extend_Dept] [text] NOT NULL,
	[Permission] [nvarchar](4000) NOT NULL,
	[Create_Date] [datetime] NOT NULL,
 CONSTRAINT [BS_Role_PK] PRIMARY KEY CLUSTERED 
(
	[Role_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Requirement_History]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Requirement_History](
	[CRM_History_Requirement_ID] [uniqueidentifier] NOT NULL,
	[CRM_History_Requirement_RequirementClass_ID] [int] NULL,
	[CRM_Customer_History_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_t_CRM_Requirement_History] PRIMARY KEY CLUSTERED 
(
	[CRM_History_Requirement_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_Requirement]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Requirement](
	[CRM_Requirement_ID] [uniqueidentifier] NOT NULL,
	[CRM_Requirement_Customer_ID] [uniqueidentifier] NOT NULL,
	[CRM_Requirement_RequirementClass_ID] [int] NULL,
 CONSTRAINT [PK_t_CRM_Requirement] PRIMARY KEY CLUSTERED 
(
	[CRM_Requirement_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_ProjectInfo]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_ProjectInfo](
	[CRM_ProjectInfo_ID] [uniqueidentifier] NOT NULL,
	[CRM_ProjectInfo_Name] [nvarchar](100) NULL,
	[CRM_ProjectInfo_Remark] [nvarchar](1000) NULL,
	[CRM_ProjectInfo_ContactMan] [nvarchar](50) NULL,
	[CRM_ProjectInfo_ContactWay] [nvarchar](50) NULL,
	[CRM_ProjectInfo_BeginTime] [datetime] NULL,
	[CRM_ProjectInfo_EndTime] [datetime] NULL,
	[CRM_ProjectInfo_PY] [nvarchar](100) NULL,
 CONSTRAINT [PK_t_CRM_ProjectInfo] PRIMARY KEY CLUSTERED 
(
	[CRM_ProjectInfo_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_ProjectFile]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_ProjectFile](
	[CRM_ProjectFile_ID] [uniqueidentifier] NOT NULL,
	[CRM_ProjectFile_Name] [nvarchar](200) NULL,
	[CRM_ProjectFile_Extensions] [nvarchar](200) NULL,
	[CRM_ProjectFile_Path] [nvarchar](1000) NULL,
	[CRM_ProjectFile_CreateTime] [datetime] NULL,
	[CRM_ProjectFile_ProjectInfo_ID] [uniqueidentifier] NULL,
	[CRM_ProjectFile_Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_t_CRM_ProjectFile] PRIMARY KEY CLUSTERED 
(
	[CRM_ProjectFile_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_PartTimeJobToDept]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_PartTimeJobToDept](
	[CRM_PartTimeJobToDept_ID] [uniqueidentifier] NOT NULL,
	[CRM_PartTimeJobToDept_DeptName] [nvarchar](50) NULL,
	[CRM_PartTimeJobToDept_EmpCode] [nvarchar](20) NULL,
	[CRM_PartTimeJobToDept_EmpID] [uniqueidentifier] NULL,
	[CRM_PartTimeJobToDept_SuperVisorID] [uniqueidentifier] NULL,
	[CRM_PartTimeJobToDept_SuperVisorCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_t_CRM_PartTimeJobToDept] PRIMARY KEY CLUSTERED 
(
	[CRM_PartTimeJobToDept_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_CRM_PartTimeJobEAssign]    Script Date: 11/13/2013 13:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_PartTimeJobEAssign](
	[CRM_PartTimeJobEAssign_ID] [uniqueidentifier] NOT NULL,
	[CRM_PartTimeJobEAssign_Customer_ID] [uniqueidentifier] NULL,
	[CRM_PartTimeJobEAssign_Code] [nvarchar](20) NULL,
	[CRM_PartTimeJobEAssign_CreateTime] [datetime] NULL,
	[CRM_PartTimeJobEAssign_Remark] [nvarchar](1000) NULL,
	[CRM_PartTimeJobEAssign_ProjectInfo_ID] [uniqueidentifier] NULL,
	[CRM_PartTimeJobEAssign_SalesName] [nvarchar](50) NULL,
	[CRM_PartTimeJobEAssign_SuperName] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_CRM_PartTimeJobEAssign88] PRIMARY KEY CLUSTERED 
(
	[CRM_PartTimeJobEAssign_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pr_EC_Login_Check]    Script Date: 11/13/2013 13:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************
'程序代号：[dbo].[pr_BS_Login_Check] 
'程序名称：检查登陆
'目　　的：
'参数说明：
(
	@uKDHRID 用户金蝶代码
	@sPassword 用户密码
	@bLogin_IsBusiness 判断员工是否总部人员
)    
'返回值　：员工属性
'副作用　：无
'备　注  ：所有参数均需传入
'例  子　：
'业务逻辑：
'版本变更：

********************************************************************************************/

CREATE PROCEDURE [dbo].[pr_EC_Login_Check]
	@guidLogin_KDHRID uniqueidentifier,
	@sLogin_Password nvarchar(20),
	@bLogin_IsBusiness bit output,
	@iLogin_ID int output
AS

if exists (select * from [gzs-systemdb01].DB_EcSystemPowerManage.dbo.t_System_Login where Login_Password=@sLogin_Password and Login_KDHRID=@guidLogin_KDHRID)
begin
	select @bLogin_IsBusiness=Login_IsBusiness from [gzs-systemdb01].DB_EcSystemPowerManage.dbo.t_System_Login where Login_KDHRID=@guidLogin_KDHRID
	select @iLogin_ID=Login_ID from [gzs-systemdb01].DB_EcSystemPowerManage.dbo.t_System_Login where Login_KDHRID=@guidLogin_KDHRID
	insert into [gzs-systemdb01].DB_EcSystemPowerManage.dbo.t_System_Using(Using_LoginID,Using_SystemID,Login_LoginTime) values
	(@iLogin_ID,1,GETDATE())
	return 1
end
GO
/****** Object:  Table [dbo].[HJMDData]    Script Date: 11/13/2013 13:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HJMDData](
	[城市] [nvarchar](255) NULL,
	[区域] [nvarchar](255) NULL,
	[状态] [nvarchar](255) NULL,
	[楼盘名称] [nvarchar](255) NULL,
	[楼盘地址] [nvarchar](255) NULL,
	[面积] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[手机] [float] NULL,
	[手机1] [nvarchar](255) NULL,
	[手机2] [nvarchar](255) NULL,
	[直线电话] [nvarchar](255) NULL,
	[直线电话1] [nvarchar](255) NULL,
	[性别] [nvarchar](255) NULL,
	[年龄] [nvarchar](255) NULL,
	[投资/自用] [nvarchar](255) NULL,
	[车型] [nvarchar](255) NULL,
	[发动机型号] [nvarchar](255) NULL,
	[车牌号码] [nvarchar](255) NULL,
	[公司名称] [nvarchar](255) NULL,
	[资料来源] [nvarchar](255) NULL,
	[备注] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GZData]    Script Date: 11/13/2013 13:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GZData](
	[城市] [nvarchar](255) NULL,
	[区域] [nvarchar](255) NULL,
	[状态] [nvarchar](255) NULL,
	[楼盘名称] [nvarchar](255) NULL,
	[楼盘地址] [nvarchar](255) NULL,
	[面积] [nvarchar](255) NULL,
	[姓名] [nvarchar](255) NULL,
	[手机] [float] NULL,
	[手机1] [nvarchar](255) NULL,
	[手机2] [nvarchar](255) NULL,
	[直线电话] [nvarchar](255) NULL,
	[直线电话1] [nvarchar](255) NULL,
	[性别] [nvarchar](255) NULL,
	[年龄] [nvarchar](255) NULL,
	[投资/自用] [nvarchar](255) NULL,
	[车型] [nvarchar](255) NULL,
	[发动机型号] [nvarchar](255) NULL,
	[车牌号码] [nvarchar](255) NULL,
	[公司名称] [nvarchar](255) NULL,
	[资料来源] [nvarchar](255) NULL,
	[备注] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_FollowUp_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_FollowUp'
-- Gets: @guidCRM_FollowUp_ID uniqueidentifier
-- Gets: @iCRM_FollowUp_FollowUpClass_ID int
-- Gets: @daCRM_FollowUp_CreateTime datetime
-- Gets: @iCRM_FollowUp_Customer_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_FollowUp_Update]
	@guidCRM_FollowUp_ID uniqueidentifier,
	@iCRM_FollowUp_FollowUpClass_ID int,
	@daCRM_FollowUp_CreateTime datetime,
	@iCRM_FollowUp_Customer_ID uniqueidentifier,
	@guidCRM_FollowUp_ProjectInfo_ID uniqueidentifier
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_FollowUp]
SET 
	[CRM_FollowUp_FollowUpClass_ID] = @iCRM_FollowUp_FollowUpClass_ID,
	[CRM_FollowUp_CreateTime] = @daCRM_FollowUp_CreateTime,
	[CRM_FollowUp_Customer_ID] = @iCRM_FollowUp_Customer_ID,
	[CRM_FollowUp_ProjectInfo_ID] = @guidCRM_FollowUp_ProjectInfo_ID
WHERE
	[CRM_FollowUp_ID] = @guidCRM_FollowUp_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_FollowUp_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_FollowUp'
-- based on the Primary Key.
-- Gets: @guidCRM_FollowUp_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_FollowUp_SelectOne]
	@guidCRM_FollowUp_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_FollowUp_ID],
	[CRM_FollowUp_FollowUpClass_ID],
	[CRM_FollowUp_CreateTime],
	[CRM_FollowUp_Customer_ID],
	[CRM_FollowUp_ProjectInfo_ID]
FROM [dbo].[t_CRM_FollowUp]
WHERE
	[CRM_FollowUp_ID] = @guidCRM_FollowUp_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_FollowUp_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_FollowUp'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_FollowUp_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_FollowUp_ID],
	[CRM_FollowUp_FollowUpClass_ID],
	[CRM_FollowUp_CreateTime],
	[CRM_FollowUp_Customer_ID],
	[CRM_FollowUp_ProjectInfo_ID]
FROM [dbo].[t_CRM_FollowUp]
ORDER BY 
	[CRM_FollowUp_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_FollowUp_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_FollowUp'
-- Gets: @guidCRM_FollowUp_ID uniqueidentifier
-- Gets: @iCRM_FollowUp_FollowUpClass_ID int
-- Gets: @daCRM_FollowUp_CreateTime datetime
-- Gets: @iCRM_FollowUp_Customer_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_FollowUp_Insert]
	@guidCRM_FollowUp_ID uniqueidentifier,
	@iCRM_FollowUp_FollowUpClass_ID int,
	@daCRM_FollowUp_CreateTime datetime,
	@iCRM_FollowUp_Customer_ID uniqueidentifier,
	@guidCRM_FollowUp_ProjectInfo_ID uniqueidentifier
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_FollowUp]
(
	[CRM_FollowUp_ID],
	[CRM_FollowUp_FollowUpClass_ID],
	[CRM_FollowUp_CreateTime],
	[CRM_FollowUp_Customer_ID]
	,[CRM_FollowUp_ProjectInfo_ID]
)
VALUES
(
	@guidCRM_FollowUp_ID,
	@iCRM_FollowUp_FollowUpClass_ID,
	@daCRM_FollowUp_CreateTime,
	@iCRM_FollowUp_Customer_ID,
	@guidCRM_FollowUp_ProjectInfo_ID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_FollowUp_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_FollowUp'
-- using the Primary Key. 
-- Gets: @guidCRM_FollowUp_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_FollowUp_Delete]
	@guidCRM_FollowUp_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_FollowUp]
WHERE
	[CRM_FollowUp_ID] = @guidCRM_FollowUp_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_EventNotification_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_EventNotification'
-- Gets: @guidCRM_EventNotification_ID uniqueidentifier
-- Gets: @sCRM_EventNotification_Content varchar(5000)
-- Gets: @sCRM_EventNotification_Title varchar(200)
-- Gets: @daCRM_EventNotification_CreateTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_EventNotification_Update]
	@guidCRM_EventNotification_ID uniqueidentifier,
	@sCRM_EventNotification_Content varchar(5000),
	@sCRM_EventNotification_Title varchar(200),
	@daCRM_EventNotification_CreateTime datetime,
	@iCRM_EventNotification_Days int
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_EventNotification]
SET 
	[CRM_EventNotification_Content] = @sCRM_EventNotification_Content,
	[CRM_EventNotification_Title] = @sCRM_EventNotification_Title,
	[CRM_EventNotification_CreateTime] = @daCRM_EventNotification_CreateTime,
	[CRM_EventNotification_Days] = @iCRM_EventNotification_Days
	
WHERE
	[CRM_EventNotification_ID] = @guidCRM_EventNotification_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_EventNotification_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_EventNotification'
-- based on the Primary Key.
-- Gets: @guidCRM_EventNotification_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_EventNotification_SelectOne]
	@guidCRM_EventNotification_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_EventNotification_ID],
	[CRM_EventNotification_Content],
	[CRM_EventNotification_Title],
	[CRM_EventNotification_CreateTime],
	[CRM_EventNotification_Days]
FROM [dbo].[t_CRM_EventNotification]
WHERE
	[CRM_EventNotification_ID] = @guidCRM_EventNotification_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_EventNotification_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_EventNotification'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_EventNotification_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_EventNotification_ID],
	[CRM_EventNotification_Content],
	[CRM_EventNotification_Title],
	[CRM_EventNotification_CreateTime],
	[CRM_EventNotification_Days]
FROM [dbo].[t_CRM_EventNotification]
ORDER BY 
	[CRM_EventNotification_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_EventNotification_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_EventNotification'
-- Gets: @guidCRM_EventNotification_ID uniqueidentifier
-- Gets: @sCRM_EventNotification_Content varchar(5000)
-- Gets: @sCRM_EventNotification_Title varchar(200)
-- Gets: @daCRM_EventNotification_CreateTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_EventNotification_Insert]
	@guidCRM_EventNotification_ID uniqueidentifier,
	@sCRM_EventNotification_Content varchar(5000),
	@sCRM_EventNotification_Title varchar(200),
	@daCRM_EventNotification_CreateTime datetime,
	@iCRM_EventNotification_Days int
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_EventNotification]
(
	[CRM_EventNotification_ID],
	[CRM_EventNotification_Content],
	[CRM_EventNotification_Title],
	[CRM_EventNotification_CreateTime],
	[CRM_EventNotification_Days]
)
VALUES
(
	@guidCRM_EventNotification_ID,
	@sCRM_EventNotification_Content,
	@sCRM_EventNotification_Title,
	@daCRM_EventNotification_CreateTime,
	@iCRM_EventNotification_Days
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_EventNotification_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_EventNotification'
-- using the Primary Key. 
-- Gets: @guidCRM_EventNotification_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_EventNotification_Delete]
	@guidCRM_EventNotification_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_EventNotification]
WHERE
	[CRM_EventNotification_ID] = @guidCRM_EventNotification_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Employee_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Employee'
-- Gets: @guidEmp_ID uniqueidentifier
-- Gets: @sEmp_Code nvarchar(20)
-- Gets: @sEmp_Name nvarchar(20)
-- Gets: @sDept_Code nvarchar(200)
-- Gets: @siLevel smallint
-- Gets: @sTitle nvarchar(20)
-- Gets: @siSex smallint
-- Gets: @sPhone nvarchar(30)
-- Gets: @sFax nvarchar(30)
-- Gets: @sMobile nvarchar(30)
-- Gets: @stelent nvarchar(30)
-- Gets: @sFamily_Phone nvarchar(30)
-- Gets: @sMSN nvarchar(30)
-- Gets: @sEmail nvarchar(30)
-- Gets: @sAddress nvarchar(100)
-- Gets: @sLicence_NO nvarchar(30)
-- Gets: @siMarry smallint
-- Gets: @sMemo nvarchar(1000)
-- Gets: @siStatus smallint
-- Gets: @bIs_Receive bit
-- Gets: @sRoles nvarchar(1000)
-- Gets: @daCreate_Date datetime
-- Gets: @sSrc_Guid nvarchar(50)
-- Gets: @bIs_Sale bit
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Employee_Update]
	@guidEmp_ID uniqueidentifier,
	@sEmp_Code nvarchar(20),
	@sEmp_Name nvarchar(20),
	@sDept_Code nvarchar(200),
	@siLevel smallint,
	@sTitle nvarchar(20),
	@siSex smallint,
	@sPhone nvarchar(30),
	@sFax nvarchar(30),
	@sMobile nvarchar(30),
	@stelent nvarchar(30),
	@sFamily_Phone nvarchar(30),
	@sMSN nvarchar(30),
	@sEmail nvarchar(30),
	@sAddress nvarchar(100),
	@sLicence_NO nvarchar(30),
	@siMarry smallint,
	@sMemo nvarchar(1000),
	@siStatus smallint,
	@bIs_Receive bit,
	@sRoles nvarchar(1000),
	@daCreate_Date datetime,
	@sSrc_Guid nvarchar(50),
	@bIs_Sale bit
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Employee]
SET 
	[Emp_ID] = @guidEmp_ID,
	[Emp_Name] = @sEmp_Name,
	[Dept_Code] = @sDept_Code,
	[Level] = @siLevel,
	[Title] = @sTitle,
	[Sex] = @siSex,
	[Phone] = @sPhone,
	[Fax] = @sFax,
	[Mobile] = @sMobile,
	[telent] = @stelent,
	[Family_Phone] = @sFamily_Phone,
	[MSN] = @sMSN,
	[Email] = @sEmail,
	[Address] = @sAddress,
	[Licence_NO] = @sLicence_NO,
	[Marry] = @siMarry,
	[Memo] = @sMemo,
	[Status] = @siStatus,
	[Is_Receive] = @bIs_Receive,
	[Roles] = @sRoles,
	[Create_Date] = @daCreate_Date,
	[Src_Guid] = @sSrc_Guid,
	[Is_Sale] = @bIs_Sale
WHERE
	[Emp_Code] = @sEmp_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Employee_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Employee'
-- based on the Primary Key.
-- Gets: @sEmp_Code nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Employee_SelectOne]
	@sEmp_Code nvarchar(20)
AS
-- SELECT an existing row from the table.
SELECT
	[Emp_ID],
	[Emp_Code],
	[Emp_Name],
	[Dept_Code],
	[Level],
	[Title],
	[Sex],
	[Phone],
	[Fax],
	[Mobile],
	[telent],
	[Family_Phone],
	[MSN],
	[Email],
	[Address],
	[Licence_NO],
	[Marry],
	[Memo],
	[Status],
	[Is_Receive],
	[Roles],
	[Create_Date],
	[Src_Guid],
	[Is_Sale]
FROM [dbo].[t_CRM_Employee]
WHERE
	[Emp_Code] = @sEmp_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Employee_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Employee'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Employee_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Emp_ID],
	[Emp_Code],
	[Emp_Name],
	[Dept_Code],
	[Level],
	[Title],
	[Sex],
	[Phone],
	[Fax],
	[Mobile],
	[telent],
	[Family_Phone],
	[MSN],
	[Email],
	[Address],
	[Licence_NO],
	[Marry],
	[Memo],
	[Status],
	[Is_Receive],
	[Roles],
	[Create_Date],
	[Src_Guid],
	[Is_Sale]
FROM [dbo].[t_CRM_Employee]
ORDER BY 
	[Emp_Code] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Employee_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Employee'
-- Gets: @guidEmp_ID uniqueidentifier
-- Gets: @sEmp_Code nvarchar(20)
-- Gets: @sEmp_Name nvarchar(20)
-- Gets: @sDept_Code nvarchar(200)
-- Gets: @siLevel smallint
-- Gets: @sTitle nvarchar(20)
-- Gets: @siSex smallint
-- Gets: @sPhone nvarchar(30)
-- Gets: @sFax nvarchar(30)
-- Gets: @sMobile nvarchar(30)
-- Gets: @stelent nvarchar(30)
-- Gets: @sFamily_Phone nvarchar(30)
-- Gets: @sMSN nvarchar(30)
-- Gets: @sEmail nvarchar(30)
-- Gets: @sAddress nvarchar(100)
-- Gets: @sLicence_NO nvarchar(30)
-- Gets: @siMarry smallint
-- Gets: @sMemo nvarchar(1000)
-- Gets: @siStatus smallint
-- Gets: @bIs_Receive bit
-- Gets: @sRoles nvarchar(1000)
-- Gets: @daCreate_Date datetime
-- Gets: @sSrc_Guid nvarchar(50)
-- Gets: @bIs_Sale bit
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Employee_Insert]
	@guidEmp_ID uniqueidentifier,
	@sEmp_Code nvarchar(20),
	@sEmp_Name nvarchar(20),
	@sDept_Code nvarchar(200),
	@siLevel smallint,
	@sTitle nvarchar(20),
	@siSex smallint,
	@sPhone nvarchar(30),
	@sFax nvarchar(30),
	@sMobile nvarchar(30),
	@stelent nvarchar(30),
	@sFamily_Phone nvarchar(30),
	@sMSN nvarchar(30),
	@sEmail nvarchar(30),
	@sAddress nvarchar(100),
	@sLicence_NO nvarchar(30),
	@siMarry smallint,
	@sMemo nvarchar(1000),
	@siStatus smallint,
	@bIs_Receive bit,
	@sRoles nvarchar(1000),
	@daCreate_Date datetime,
	@sSrc_Guid nvarchar(50),
	@bIs_Sale bit
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Employee]
(
	[Emp_ID],
	[Emp_Code],
	[Emp_Name],
	[Dept_Code],
	[Level],
	[Title],
	[Sex],
	[Phone],
	[Fax],
	[Mobile],
	[telent],
	[Family_Phone],
	[MSN],
	[Email],
	[Address],
	[Licence_NO],
	[Marry],
	[Memo],
	[Status],
	[Is_Receive],
	[Roles],
	[Create_Date],
	[Src_Guid],
	[Is_Sale]
)
VALUES
(
	ISNULL(@guidEmp_ID, (newid())),
	@sEmp_Code,
	@sEmp_Name,
	@sDept_Code,
	ISNULL(@siLevel, ((0))),
	@sTitle,
	ISNULL(@siSex, ((0))),
	@sPhone,
	@sFax,
	@sMobile,
	@stelent,
	@sFamily_Phone,
	@sMSN,
	@sEmail,
	@sAddress,
	@sLicence_NO,
	ISNULL(@siMarry, ((0))),
	@sMemo,
	ISNULL(@siStatus, ((0))),
	ISNULL(@bIs_Receive, ((0))),
	@sRoles,
	ISNULL(@daCreate_Date, (getdate())),
	@sSrc_Guid,
	ISNULL(@bIs_Sale, ((0)))
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Employee_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Employee'
-- using the Primary Key. 
-- Gets: @sEmp_Code nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Employee_Delete]
	@sEmp_Code nvarchar(20)
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Employee]
WHERE
	[Emp_Code] = @sEmp_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Department_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Department'
-- Gets: @guidDept_ID uniqueidentifier
-- Gets: @sDept_Code nvarchar(200)
-- Gets: @sDept_Name nvarchar(20)
-- Gets: @sDept_FullCode nvarchar(200)
-- Gets: @sParent_Code nvarchar(200)
-- Gets: @sAddress nvarchar(100)
-- Gets: @sContact nvarchar(20)
-- Gets: @sPhone nvarchar(30)
-- Gets: @sFax nvarchar(30)
-- Gets: @sSerial_Code nvarchar(50)
-- Gets: @bIs_Business bit
-- Gets: @bIs_Enabled bit
-- Gets: @daCreate_Date datetime
-- Gets: @sSrc_Guid nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Department_Update]
	@guidDept_ID uniqueidentifier,
	@sDept_Code nvarchar(200),
	@sDept_Name nvarchar(20),
	@sDept_FullCode nvarchar(200),
	@sParent_Code nvarchar(200),
	@sAddress nvarchar(100),
	@sContact nvarchar(20),
	@sPhone nvarchar(30),
	@sFax nvarchar(30),
	@sSerial_Code nvarchar(50),
	@bIs_Business bit,
	@bIs_Enabled bit,
	@daCreate_Date datetime,
	@sSrc_Guid nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Department]
SET 
	[Dept_ID] = @guidDept_ID,
	[Dept_Name] = @sDept_Name,
	[Dept_FullCode] = @sDept_FullCode,
	[Parent_Code] = @sParent_Code,
	[Address] = @sAddress,
	[Contact] = @sContact,
	[Phone] = @sPhone,
	[Fax] = @sFax,
	[Serial_Code] = @sSerial_Code,
	[Is_Business] = @bIs_Business,
	[Is_Enabled] = @bIs_Enabled,
	[Create_Date] = @daCreate_Date,
	[Src_Guid] = @sSrc_Guid
WHERE
	[Dept_Code] = @sDept_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Department_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Department'
-- based on the Primary Key.
-- Gets: @sDept_Code nvarchar(200)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Department_SelectOne]
	@sDept_Code nvarchar(200)
AS
-- SELECT an existing row from the table.
SELECT
	[Dept_ID],
	[Dept_Code],
	[Dept_Name],
	[Dept_FullCode],
	[Parent_Code],
	[Address],
	[Contact],
	[Phone],
	[Fax],
	[Serial_Code],
	[Is_Business],
	[Is_Enabled],
	[Create_Date],
	[Src_Guid]
FROM [dbo].[t_CRM_Department]
WHERE
	[Dept_Code] = @sDept_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Department_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Department'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Department_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Dept_ID],
	[Dept_Code],
	[Dept_Name],
	[Dept_FullCode],
	[Parent_Code],
	[Address],
	[Contact],
	[Phone],
	[Fax],
	[Serial_Code],
	[Is_Business],
	[Is_Enabled],
	[Create_Date],
	[Src_Guid]
FROM [dbo].[t_CRM_Department]
ORDER BY 
	[Dept_Code] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Department_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Department'
-- Gets: @guidDept_ID uniqueidentifier
-- Gets: @sDept_Code nvarchar(200)
-- Gets: @sDept_Name nvarchar(20)
-- Gets: @sDept_FullCode nvarchar(200)
-- Gets: @sParent_Code nvarchar(200)
-- Gets: @sAddress nvarchar(100)
-- Gets: @sContact nvarchar(20)
-- Gets: @sPhone nvarchar(30)
-- Gets: @sFax nvarchar(30)
-- Gets: @sSerial_Code nvarchar(50)
-- Gets: @bIs_Business bit
-- Gets: @bIs_Enabled bit
-- Gets: @daCreate_Date datetime
-- Gets: @sSrc_Guid nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Department_Insert]
	@guidDept_ID uniqueidentifier,
	@sDept_Code nvarchar(200),
	@sDept_Name nvarchar(20),
	@sDept_FullCode nvarchar(200),
	@sParent_Code nvarchar(200),
	@sAddress nvarchar(100),
	@sContact nvarchar(20),
	@sPhone nvarchar(30),
	@sFax nvarchar(30),
	@sSerial_Code nvarchar(50),
	@bIs_Business bit,
	@bIs_Enabled bit,
	@daCreate_Date datetime,
	@sSrc_Guid nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Department]
(
	[Dept_ID],
	[Dept_Code],
	[Dept_Name],
	[Dept_FullCode],
	[Parent_Code],
	[Address],
	[Contact],
	[Phone],
	[Fax],
	[Serial_Code],
	[Is_Business],
	[Is_Enabled],
	[Create_Date],
	[Src_Guid]
)
VALUES
(
	ISNULL(@guidDept_ID, (newid())),
	@sDept_Code,
	@sDept_Name,
	@sDept_FullCode,
	@sParent_Code,
	@sAddress,
	@sContact,
	@sPhone,
	@sFax,
	ISNULL(@sSerial_Code, ('')),
	ISNULL(@bIs_Business, ((0))),
	ISNULL(@bIs_Enabled, ((1))),
	ISNULL(@daCreate_Date, (getdate())),
	@sSrc_Guid
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Department_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Department'
-- using the Primary Key. 
-- Gets: @sDept_Code nvarchar(200)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Department_Delete]
	@sDept_Code nvarchar(200)
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Department]
WHERE
	[Dept_Code] = @sDept_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_CustomerType'
-- Gets: @guidCRM_CustomerType_ID uniqueidentifier
-- Gets: @iCRM_CustomerType_Customer_ID int
-- Gets: @iCRM_CustomerType_TypeClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_Update]
	@guidCRM_CustomerType_ID uniqueidentifier,
	@iCRM_CustomerType_Customer_ID uniqueidentifier,
	@iCRM_CustomerType_TypeClass_ID int
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_CustomerType]
SET 
	[CRM_CustomerType_Customer_ID] = @iCRM_CustomerType_Customer_ID,
	[CRM_CustomerType_TypeClass_ID] = @iCRM_CustomerType_TypeClass_ID
WHERE
	[CRM_CustomerType_ID] = @guidCRM_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_CustomerType'
-- based on the Primary Key.
-- Gets: @guidCRM_CustomerType_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_SelectOne]
	@guidCRM_CustomerType_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CustomerType_ID],
	[CRM_CustomerType_Customer_ID],
	[CRM_CustomerType_TypeClass_ID]
FROM [dbo].[t_CRM_CustomerType]
WHERE
	[CRM_CustomerType_ID] = @guidCRM_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_CustomerType'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CustomerType_ID],
	[CRM_CustomerType_Customer_ID],
	[CRM_CustomerType_TypeClass_ID]
FROM [dbo].[t_CRM_CustomerType]
ORDER BY 
	[CRM_CustomerType_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_CustomerType'
-- Gets: @guidCRM_CustomerType_ID uniqueidentifier
-- Gets: @iCRM_CustomerType_Customer_ID int
-- Gets: @iCRM_CustomerType_TypeClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_Insert]
	@guidCRM_CustomerType_ID uniqueidentifier,
	@iCRM_CustomerType_Customer_ID uniqueidentifier,
	@iCRM_CustomerType_TypeClass_ID int
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_CustomerType]
(
	[CRM_CustomerType_ID],
	[CRM_CustomerType_Customer_ID],
	[CRM_CustomerType_TypeClass_ID]
)
VALUES
(
	@guidCRM_CustomerType_ID,
	@iCRM_CustomerType_Customer_ID,
	@iCRM_CustomerType_TypeClass_ID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_History_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_CustomerType_History'
-- Gets: @guidCRM_History_CustomerType_ID uniqueidentifier
-- Gets: @iCRM_History_CustomerType_TypeClass_ID int
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_History_Update]
	@guidCRM_History_CustomerType_ID uniqueidentifier,
	@iCRM_History_CustomerType_TypeClass_ID int,
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_CustomerType_History]
SET 
	[CRM_History_CustomerType_TypeClass_ID] = @iCRM_History_CustomerType_TypeClass_ID,
	[CRM_Customer_History_ID] = @guidCRM_Customer_History_ID
WHERE
	[CRM_History_CustomerType_ID] = @guidCRM_History_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_History_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_CustomerType_History'
-- based on the Primary Key.
-- Gets: @guidCRM_History_CustomerType_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_History_SelectOne]
	@guidCRM_History_CustomerType_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_History_CustomerType_ID],
	[CRM_History_CustomerType_TypeClass_ID],
	[CRM_Customer_History_ID]
FROM [dbo].[t_CRM_CustomerType_History]
WHERE
	[CRM_History_CustomerType_ID] = @guidCRM_History_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_History_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_CustomerType_History'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_History_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_History_CustomerType_ID],
	[CRM_History_CustomerType_TypeClass_ID],
	[CRM_Customer_History_ID]
FROM [dbo].[t_CRM_CustomerType_History]
ORDER BY 
	[CRM_History_CustomerType_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_History_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_CustomerType_History'
-- Gets: @guidCRM_History_CustomerType_ID uniqueidentifier
-- Gets: @iCRM_History_CustomerType_TypeClass_ID int
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_History_Insert]
	@guidCRM_History_CustomerType_ID uniqueidentifier,
	@iCRM_History_CustomerType_TypeClass_ID int,
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_CustomerType_History]
(
	[CRM_History_CustomerType_ID],
	[CRM_History_CustomerType_TypeClass_ID],
	[CRM_Customer_History_ID]
)
VALUES
(
	@guidCRM_History_CustomerType_ID,
	@iCRM_History_CustomerType_TypeClass_ID,
	@guidCRM_Customer_History_ID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_History_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_CustomerType_History'
-- using the Primary Key. 
-- Gets: @guidCRM_History_CustomerType_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_History_Delete]
	@guidCRM_History_CustomerType_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_CustomerType_History]
WHERE
	[CRM_History_CustomerType_ID] = @guidCRM_History_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerType_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_CustomerType'
-- using the Primary Key. 
-- Gets: @guidCRM_CustomerType_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerType_Delete]
	@guidCRM_CustomerType_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_CustomerType]
WHERE
	[CRM_CustomerType_ID] = @guidCRM_CustomerType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerAssign_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_CustomerAssign'
-- Gets: @guidCRM_CustomerAssign_ID uniqueidentifier
-- Gets: @guidCRM_CustomerAssign_Customer_ID uniqueidentifier
-- Gets: @guidCRM_CustomerAssign_EM_ID uniqueidentifier
-- Gets: @daCRM_CustomerAssign_CreateTime datetime
-- Gets: @sCRM_CustomerAssign_Remark nvarchar(1000)
-- Gets: @guidCRM_CustomerAssign_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_CustomerAssign_SalesName nvarchar(50)
-- Gets: @sCRM_CustomerAssign_SuperName nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerAssign_Update]
	@guidCRM_CustomerAssign_ID uniqueidentifier,
	@guidCRM_CustomerAssign_Customer_ID uniqueidentifier,
	@guidCRM_CustomerAssign_EM_ID uniqueidentifier,
	@daCRM_CustomerAssign_CreateTime datetime,
	@sCRM_CustomerAssign_Remark nvarchar(1000),
	@guidCRM_CustomerAssign_ProjectInfo_ID uniqueidentifier,
	@sCRM_CustomerAssign_SalesName nvarchar(50),
	@sCRM_CustomerAssign_SuperName nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_CustomerAssign]
SET 
	[CRM_CustomerAssign_Customer_ID] = @guidCRM_CustomerAssign_Customer_ID,
	[CRM_CustomerAssign_EM_ID] = @guidCRM_CustomerAssign_EM_ID,
	[CRM_CustomerAssign_CreateTime] = @daCRM_CustomerAssign_CreateTime,
	[CRM_CustomerAssign_Remark] = @sCRM_CustomerAssign_Remark,
	[CRM_CustomerAssign_ProjectInfo_ID] = @guidCRM_CustomerAssign_ProjectInfo_ID,
	[CRM_CustomerAssign_SalesName] = @sCRM_CustomerAssign_SalesName,
	[CRM_CustomerAssign_SuperName] = @sCRM_CustomerAssign_SuperName
WHERE
	[CRM_CustomerAssign_ID] = @guidCRM_CustomerAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerAssign_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_CustomerAssign'
-- based on the Primary Key.
-- Gets: @guidCRM_CustomerAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerAssign_SelectOne]
	@guidCRM_CustomerAssign_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CustomerAssign_ID],
	[CRM_CustomerAssign_Customer_ID],
	[CRM_CustomerAssign_EM_ID],
	[CRM_CustomerAssign_CreateTime],
	[CRM_CustomerAssign_Remark],
	[CRM_CustomerAssign_ProjectInfo_ID],
	[CRM_CustomerAssign_SalesName],
	[CRM_CustomerAssign_SuperName]
FROM [dbo].[t_CRM_CustomerAssign]
WHERE
	[CRM_CustomerAssign_ID] = @guidCRM_CustomerAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerAssign_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_CustomerAssign'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerAssign_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CustomerAssign_ID],
	[CRM_CustomerAssign_Customer_ID],
	[CRM_CustomerAssign_EM_ID],
	[CRM_CustomerAssign_CreateTime],
	[CRM_CustomerAssign_Remark],
	[CRM_CustomerAssign_ProjectInfo_ID],
	[CRM_CustomerAssign_SalesName],
	[CRM_CustomerAssign_SuperName]
FROM [dbo].[t_CRM_CustomerAssign]
ORDER BY 
	[CRM_CustomerAssign_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerAssign_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_CustomerAssign'
-- Gets: @guidCRM_CustomerAssign_ID uniqueidentifier
-- Gets: @guidCRM_CustomerAssign_Customer_ID uniqueidentifier
-- Gets: @guidCRM_CustomerAssign_EM_ID uniqueidentifier
-- Gets: @daCRM_CustomerAssign_CreateTime datetime
-- Gets: @sCRM_CustomerAssign_Remark nvarchar(1000)
-- Gets: @guidCRM_CustomerAssign_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_CustomerAssign_SalesName nvarchar(50)
-- Gets: @sCRM_CustomerAssign_SuperName nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerAssign_Insert]
	@guidCRM_CustomerAssign_ID uniqueidentifier,
	@guidCRM_CustomerAssign_Customer_ID uniqueidentifier,
	@guidCRM_CustomerAssign_EM_ID uniqueidentifier,
	@daCRM_CustomerAssign_CreateTime datetime,
	@sCRM_CustomerAssign_Remark nvarchar(1000),
	@guidCRM_CustomerAssign_ProjectInfo_ID uniqueidentifier,
	@sCRM_CustomerAssign_SalesName nvarchar(50),
	@sCRM_CustomerAssign_SuperName nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_CustomerAssign]
(
	[CRM_CustomerAssign_ID],
	[CRM_CustomerAssign_Customer_ID],
	[CRM_CustomerAssign_EM_ID],
	[CRM_CustomerAssign_CreateTime],
	[CRM_CustomerAssign_Remark],
	[CRM_CustomerAssign_ProjectInfo_ID],
	[CRM_CustomerAssign_SalesName],
	[CRM_CustomerAssign_SuperName]
)
VALUES
(
	@guidCRM_CustomerAssign_ID,
	@guidCRM_CustomerAssign_Customer_ID,
	@guidCRM_CustomerAssign_EM_ID,
	@daCRM_CustomerAssign_CreateTime,
	@sCRM_CustomerAssign_Remark,
	@guidCRM_CustomerAssign_ProjectInfo_ID,
	@sCRM_CustomerAssign_SalesName,
	@sCRM_CustomerAssign_SuperName
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CustomerAssign_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_CustomerAssign'
-- using the Primary Key. 
-- Gets: @guidCRM_CustomerAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CustomerAssign_Delete]
	@guidCRM_CustomerAssign_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_CustomerAssign]
WHERE
	[CRM_CustomerAssign_ID] = @guidCRM_CustomerAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Customer'
-- Gets: @guidCRM_Customer_ID uniqueidentifier
-- Gets: @sCRM_Customer_Name nvarchar(50)
-- Gets: @sCRM_Customer_Phone varchar(20)
-- Gets: @bCRM_Customer_Sex bit
-- Gets: @byCRM_Customer_Age tinyint
-- Gets: @iCRM_Customer_SourceClass_ID int
-- Gets: @sCRM_Customer_CarType nvarchar(50)
-- Gets: @sCRM_Customer_CarEngineType nvarchar(50)
-- Gets: @sCRM_Customer_CarNumber varchar(20)
-- Gets: @sCRM_Customer_Region nvarchar(50)
-- Gets: @sCRM_Customer_BuildingAddress nvarchar(200)
-- Gets: @dcCRM_Customer_BuildingArea numeric(18, 2)
-- Gets: @iCRM_Customer_CustomerState_ID int
-- Gets: @sCRM_Customer_Remark nvarchar(200)
-- Gets: @sCRM_Customer_Email varchar(200)
-- Gets: @daCRM_Customer_CreateTime datetime
-- Gets: @bCRM_Customer_IsPrivate bit
-- Gets: @sCRM_Customer_City nvarchar(50)
-- Gets: @sCRM_Customer_Company nvarchar(50)
-- Gets: @sCRM_Customer_DirectLine varchar(20)
-- Gets: @iCRM_Customer_CustomerSourceType_ID int
-- Gets: @sCRM_Customer_Phone_One varchar(20)
-- Gets: @sCRM_Customer_Phone_Two varchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_Update]
	@guidCRM_Customer_ID uniqueidentifier,
	@sCRM_Customer_Name nvarchar(50),
	@sCRM_Customer_Phone varchar(100),
	@bCRM_Customer_Sex bit,
	@byCRM_Customer_Age tinyint,
	@iCRM_Customer_SourceClass_ID int,
	@sCRM_Customer_CarType nvarchar(50),
	@sCRM_Customer_CarEngineType nvarchar(50),
	@sCRM_Customer_CarNumber varchar(20),
	@sCRM_Customer_Region nvarchar(50),
	@sCRM_Customer_BuildingAddress nvarchar(200),
	@dcCRM_Customer_BuildingArea numeric(18, 2),
	@iCRM_Customer_CustomerState_ID int,
	@sCRM_Customer_Remark nvarchar(1000),
	@sCRM_Customer_Email varchar(200),
	@daCRM_Customer_CreateTime datetime,
	@bCRM_Customer_IsPrivate int,
	@sCRM_Customer_City nvarchar(50),
	@sCRM_Customer_Company nvarchar(50),
	@sCRM_Customer_DirectLine varchar(20),
	@iCRM_Customer_CustomerSourceType_ID int,
	@sCRM_Customer_Phone_One varchar(20),
	@sCRM_Customer_Phone_Two varchar(20),
	@sCRM_Customer_DirectLine_One varchar(20),
	@sCRM_Customer_BuildingName nvarchar(50),
	@sCRM_Customer_StateDetail nvarchar(50),
		@sCRM_Customer_RequirementRemark nvarchar(1000),
	@sCRM_Customer_SourceRemark nvarchar(1000),
	@iCRM_CustomerActiveStatus_ID int,
	@iCRM_Customer_FollowUpClass_ID int,
	@dcCRM_Customer_ExpectPrice numeric(18, 2),
	@iCRM_Customer_RowID bigint
	--@iCRM_Customer_TotalTime bigint,
	--@sCRM_Customer_Sells nvarchar(50),
	--@sCRM_Customer_Supervisor nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Customer]
SET 
	[CRM_Customer_Name] = @sCRM_Customer_Name,
	[CRM_Customer_Phone] = @sCRM_Customer_Phone,
	[CRM_Customer_Sex] = @bCRM_Customer_Sex,
	[CRM_Customer_Age] = @byCRM_Customer_Age,
	[CRM_Customer_SourceClass_ID] = @iCRM_Customer_SourceClass_ID,
	[CRM_Customer_CarType] = @sCRM_Customer_CarType,
	[CRM_Customer_CarEngineType] = @sCRM_Customer_CarEngineType,
	[CRM_Customer_CarNumber] = @sCRM_Customer_CarNumber,
	[CRM_Customer_Region] = @sCRM_Customer_Region,
	[CRM_Customer_BuildingAddress] = @sCRM_Customer_BuildingAddress,
	[CRM_Customer_BuildingArea] = @dcCRM_Customer_BuildingArea,
	[CRM_Customer_CustomerState_ID] = @iCRM_Customer_CustomerState_ID,
	[CRM_Customer_Remark] = @sCRM_Customer_Remark,
	[CRM_Customer_Email] = @sCRM_Customer_Email,
	[CRM_Customer_CreateTime] = @daCRM_Customer_CreateTime,
	[CRM_Customer_IsPrivate] = @bCRM_Customer_IsPrivate,
	[CRM_Customer_City] = @sCRM_Customer_City,
	[CRM_Customer_Company] = @sCRM_Customer_Company,
	[CRM_Customer_DirectLine] = @sCRM_Customer_DirectLine,
	[CRM_Customer_CustomerSourceType_ID] = @iCRM_Customer_CustomerSourceType_ID,
	[CRM_Customer_Phone_One] = @sCRM_Customer_Phone_One,
	[CRM_Customer_Phone_Two] = @sCRM_Customer_Phone_Two,
	[CRM_Customer_DirectLine_One] = @sCRM_Customer_DirectLine_One,
	[CRM_Customer_BuildingName] = @sCRM_Customer_BuildingName,
	[CRM_Customer_StateDetail] = @sCRM_Customer_StateDetail,
	[CRM_Customer_RequirementRemark] = @sCRM_Customer_RequirementRemark,
	[CRM_Customer_SourceRemark] = @sCRM_Customer_SourceRemark,
	[CRM_CustomerActiveStatus_ID] = @iCRM_CustomerActiveStatus_ID,
	[CRM_Customer_FollowUpClass_ID] = @iCRM_Customer_FollowUpClass_ID,
		[CRM_Customer_ExpectPrice] = @dcCRM_Customer_ExpectPrice,
		[CRM_Customer_RowID] = @iCRM_Customer_RowID
	--[CRM_Customer_TotalTime] = @iCRM_Customer_TotalTime,
	--[CRM_Customer_Sells] = @sCRM_Customer_Sells,
	--[CRM_Customer_Supervisor] = @sCRM_Customer_Supervisor
WHERE
	[CRM_Customer_ID] = @guidCRM_Customer_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Customer'
-- based on the Primary Key.
-- Gets: @guidCRM_Customer_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_SelectOne]
	@guidCRM_Customer_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_Customer_ID],
	[CRM_Customer_Name],
	[CRM_Customer_Phone],
	[CRM_Customer_Sex],
	[CRM_Customer_Age],
	[CRM_Customer_SourceClass_ID],
	[CRM_Customer_CarType],
	[CRM_Customer_CarEngineType],
	[CRM_Customer_CarNumber],
	[CRM_Customer_Region],
	[CRM_Customer_BuildingAddress],
	[CRM_Customer_BuildingArea],
	[CRM_Customer_CustomerState_ID],
	[CRM_Customer_Remark],
	[CRM_Customer_Email],
	[CRM_Customer_CreateTime],
	[CRM_Customer_IsPrivate],
	[CRM_Customer_City],
	[CRM_Customer_Company],
	[CRM_Customer_DirectLine],
	[CRM_Customer_CustomerSourceType_ID],
	[CRM_Customer_Phone_One],
	[CRM_Customer_Phone_Two],
	[CRM_Customer_DirectLine_One],
	[CRM_Customer_BuildingName],
	[CRM_Customer_StateDetail],
	[CRM_Customer_RequirementRemark],
	[CRM_Customer_SourceRemark],
	[CRM_CustomerActiveStatus_ID],
	[CRM_Customer_FollowUpClass_ID],
	[CRM_Customer_ExpectPrice],
	[CRM_Customer_RowID]
	--[CRM_Customer_TotalTime],
	--[CRM_Customer_Sells],
	--[CRM_Customer_Supervisor]
FROM [dbo].[t_CRM_Customer]
WHERE
	[CRM_Customer_ID] = @guidCRM_Customer_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Customer'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_Customer_ID],
	[CRM_Customer_Name],
	[CRM_Customer_Phone],
	[CRM_Customer_Sex],
	[CRM_Customer_Age],
	[CRM_Customer_SourceClass_ID],
	[CRM_Customer_CarType],
	[CRM_Customer_CarEngineType],
	[CRM_Customer_CarNumber],
	[CRM_Customer_Region],
	[CRM_Customer_BuildingAddress],
	[CRM_Customer_BuildingArea],
	[CRM_Customer_CustomerState_ID],
	[CRM_Customer_Remark],
	[CRM_Customer_Email],
	[CRM_Customer_CreateTime],
	[CRM_Customer_IsPrivate],
	[CRM_Customer_City],
	[CRM_Customer_Company],
	[CRM_Customer_DirectLine],
	[CRM_Customer_CustomerSourceType_ID],
	[CRM_Customer_Phone_One],
	[CRM_Customer_Phone_Two],
	[CRM_Customer_DirectLine_One],
	[CRM_Customer_BuildingName],
	[CRM_Customer_StateDetail],
	[CRM_Customer_RequirementRemark],
	[CRM_Customer_SourceRemark],
	[CRM_CustomerActiveStatus_ID],
	[CRM_Customer_FollowUpClass_ID],
	[CRM_Customer_ExpectPrice],
	[CRM_Customer_RowID]
	--[CRM_Customer_TotalTime],
	--[CRM_Customer_Sells],
	--[CRM_Customer_Supervisor]
FROM [dbo].[t_CRM_Customer]
ORDER BY 
	[CRM_Customer_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Customer'
-- Gets: @guidCRM_Customer_ID uniqueidentifier
-- Gets: @sCRM_Customer_Name nvarchar(50)
-- Gets: @sCRM_Customer_Phone varchar(20)
-- Gets: @bCRM_Customer_Sex bit
-- Gets: @byCRM_Customer_Age tinyint
-- Gets: @iCRM_Customer_SourceClass_ID int
-- Gets: @sCRM_Customer_CarType nvarchar(50)
-- Gets: @sCRM_Customer_CarEngineType nvarchar(50)
-- Gets: @sCRM_Customer_CarNumber varchar(20)
-- Gets: @sCRM_Customer_Region nvarchar(50)
-- Gets: @sCRM_Customer_BuildingAddress nvarchar(200)
-- Gets: @dcCRM_Customer_BuildingArea numeric(18, 2)
-- Gets: @iCRM_Customer_CustomerState_ID int
-- Gets: @sCRM_Customer_Remark nvarchar(200)
-- Gets: @sCRM_Customer_Email varchar(200)
-- Gets: @daCRM_Customer_CreateTime datetime
-- Gets: @bCRM_Customer_IsPrivate bit
-- Gets: @sCRM_Customer_City nvarchar(50)
-- Gets: @sCRM_Customer_Company nvarchar(50)
-- Gets: @sCRM_Customer_DirectLine varchar(20)
-- Gets: @iCRM_Customer_CustomerSourceType_ID int
-- Gets: @sCRM_Customer_Phone_One varchar(20)
-- Gets: @sCRM_Customer_Phone_Two varchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_Insert]
	@guidCRM_Customer_ID uniqueidentifier,
	@sCRM_Customer_Name nvarchar(50),
	@sCRM_Customer_Phone varchar(100),
	@bCRM_Customer_Sex bit,
	@byCRM_Customer_Age tinyint,
	@iCRM_Customer_SourceClass_ID int,
	@sCRM_Customer_CarType nvarchar(50),
	@sCRM_Customer_CarEngineType nvarchar(50),
	@sCRM_Customer_CarNumber varchar(20),
	@sCRM_Customer_Region nvarchar(50),
	@sCRM_Customer_BuildingAddress nvarchar(200),
	@dcCRM_Customer_BuildingArea numeric(18, 2),
	@iCRM_Customer_CustomerState_ID int,
	@sCRM_Customer_Remark nvarchar(1000),
	@sCRM_Customer_Email varchar(200),
	@daCRM_Customer_CreateTime datetime,
	@bCRM_Customer_IsPrivate int,
	@sCRM_Customer_City nvarchar(50),
	@sCRM_Customer_Company nvarchar(50),
	@sCRM_Customer_DirectLine varchar(20),
	@iCRM_Customer_CustomerSourceType_ID int,
	@sCRM_Customer_Phone_One varchar(20),
	@sCRM_Customer_Phone_Two varchar(20),
	@sCRM_Customer_DirectLine_One varchar(20),
	@sCRM_Customer_BuildingName nvarchar(50),
	@sCRM_Customer_StateDetail nvarchar(50),
	@sCRM_Customer_RequirementRemark nvarchar(1000),
	@sCRM_Customer_SourceRemark nvarchar(1000),
	@iCRM_CustomerActiveStatus_ID int,
	--@iCRM_Customer_TotalTime bigint,
	--@sCRM_Customer_Sells nvarchar(50),
	--@sCRM_Customer_Supervisor nvarchar(50)
	@iCRM_Customer_FollowUpClass_ID int,
	@dcCRM_Customer_ExpectPrice numeric(18, 2),
	@iCRM_Customer_RowID bigint
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Customer]
(
	[CRM_Customer_ID],
	[CRM_Customer_Name],
	[CRM_Customer_Phone],
	[CRM_Customer_Sex],
	[CRM_Customer_Age],
	[CRM_Customer_SourceClass_ID],
	[CRM_Customer_CarType],
	[CRM_Customer_CarEngineType],
	[CRM_Customer_CarNumber],
	[CRM_Customer_Region],
	[CRM_Customer_BuildingAddress],
	[CRM_Customer_BuildingArea],
	[CRM_Customer_CustomerState_ID],
	[CRM_Customer_Remark],
	[CRM_Customer_Email],
	[CRM_Customer_CreateTime],
	[CRM_Customer_IsPrivate],
	[CRM_Customer_City],
	[CRM_Customer_Company],
	[CRM_Customer_DirectLine],
	[CRM_Customer_CustomerSourceType_ID],
	[CRM_Customer_Phone_One],
	[CRM_Customer_Phone_Two],
	[CRM_Customer_DirectLine_One],
	[CRM_Customer_BuildingName],
	[CRM_Customer_StateDetail],
	[CRM_Customer_RequirementRemark],
	[CRM_Customer_SourceRemark],
	[CRM_CustomerActiveStatus_ID],
	[CRM_Customer_FollowUpClass_ID],
	[CRM_Customer_ExpectPrice],
	[CRM_Customer_RowID]
	--[CRM_Customer_TotalTime],
	--[CRM_Customer_Sells],
	--[CRM_Customer_Supervisor]
)
VALUES
(
	@guidCRM_Customer_ID,
	@sCRM_Customer_Name,
	@sCRM_Customer_Phone,
	@bCRM_Customer_Sex,
	@byCRM_Customer_Age,
	@iCRM_Customer_SourceClass_ID,
	@sCRM_Customer_CarType,
	@sCRM_Customer_CarEngineType,
	@sCRM_Customer_CarNumber,
	@sCRM_Customer_Region,
	@sCRM_Customer_BuildingAddress,
	@dcCRM_Customer_BuildingArea,
	@iCRM_Customer_CustomerState_ID,
	@sCRM_Customer_Remark,
	@sCRM_Customer_Email,
	@daCRM_Customer_CreateTime,
	@bCRM_Customer_IsPrivate,
	@sCRM_Customer_City,
	@sCRM_Customer_Company,
	@sCRM_Customer_DirectLine,
	@iCRM_Customer_CustomerSourceType_ID,
	@sCRM_Customer_Phone_One,
	@sCRM_Customer_Phone_Two,
	@sCRM_Customer_DirectLine_One,
	@sCRM_Customer_BuildingName,
	@sCRM_Customer_StateDetail,
	@sCRM_Customer_RequirementRemark,
	@sCRM_Customer_SourceRemark,
	@iCRM_CustomerActiveStatus_ID,
	@iCRM_Customer_FollowUpClass_ID,
	@dcCRM_Customer_ExpectPrice,
	@iCRM_Customer_RowID
	--@iCRM_Customer_TotalTime,
	--@sCRM_Customer_Sells,
	--@sCRM_Customer_Supervisor
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_History_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Customer_History'
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
-- Gets: @guidCRM_Customer_History_AlterUser_EM_ID uniqueidentifier
-- Gets: @sCRM_Customer_History_AlterUser_Name nvarchar(50)
-- Gets: @daCRM_Customer_History_CreateTime datetime
-- Gets: @guidCRM_History_Customer_ID uniqueidentifier
-- Gets: @sCRM_History_Customer_Name nvarchar(50)
-- Gets: @sCRM_History_Customer_Phone varchar(20)
-- Gets: @bCRM_History_Customer_Sex bit
-- Gets: @byCRM_History_Customer_Age tinyint
-- Gets: @iCRM_History_Customer_SourceClass_ID int
-- Gets: @sCRM_History_Customer_CarType nvarchar(50)
-- Gets: @sCRM_History_Customer_CarEngineType nvarchar(50)
-- Gets: @sCRM_History_Customer_CarNumber varchar(20)
-- Gets: @sCRM_History_Customer_Region nvarchar(50)
-- Gets: @sCRM_History_Customer_BuildingAddress nvarchar(200)
-- Gets: @dcCRM_History_Customer_BuildingArea numeric(18, 2)
-- Gets: @iCRM_History_Customer_CustomerState_ID int
-- Gets: @sCRM_History_Customer_Remark nvarchar(1000)
-- Gets: @sCRM_History_Customer_Email varchar(200)
-- Gets: @daCRM_History_Customer_CreateTime datetime
-- Gets: @bCRM_History_Customer_IsPrivate bit
-- Gets: @sCRM_History_Customer_City nvarchar(50)
-- Gets: @sCRM_History_Customer_Company nvarchar(50)
-- Gets: @sCRM_History_Customer_DirectLine varchar(20)
-- Gets: @iCRM_History_Customer_CustomerSourceType_ID int
-- Gets: @sCRM_History_Customer_Phone_One varchar(20)
-- Gets: @sCRM_History_Customer_Phone_Two varchar(20)
-- Gets: @sCRM_History_Customer_DirectLine_One varchar(20)
-- Gets: @sCRM_History_Customer_BuildingName nvarchar(50)
-- Gets: @sCRM_History_Customer_StateDetail nvarchar(50)
-- Gets: @sCRM_History_Customer_RequirementRemark nvarchar(1000)
-- Gets: @sCRM_History_Customer_SourceRemark nvarchar(1000)
-- Gets: @iCRM_History_Customer_CustomerActiveStatus_ID int
-- Gets: @iCRM_History_Customer_FollowUpClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_History_Update]
	@guidCRM_Customer_History_ID uniqueidentifier,
	@guidCRM_Customer_History_AlterUser_EM_ID uniqueidentifier,
	@sCRM_Customer_History_AlterUser_Name nvarchar(50),
	@daCRM_Customer_History_CreateTime datetime,
	@guidCRM_History_Customer_ID uniqueidentifier,
	@sCRM_History_Customer_Name nvarchar(50),
	@sCRM_History_Customer_Phone varchar(100),
	@bCRM_History_Customer_Sex bit,
	@byCRM_History_Customer_Age tinyint,
	@iCRM_History_Customer_SourceClass_ID int,
	@sCRM_History_Customer_CarType nvarchar(50),
	@sCRM_History_Customer_CarEngineType nvarchar(50),
	@sCRM_History_Customer_CarNumber varchar(20),
	@sCRM_History_Customer_Region nvarchar(50),
	@sCRM_History_Customer_BuildingAddress nvarchar(200),
	@dcCRM_History_Customer_BuildingArea numeric(18, 2),
	@iCRM_History_Customer_CustomerState_ID int,
	@sCRM_History_Customer_Remark nvarchar(1000),
	@sCRM_History_Customer_Email varchar(200),
	@daCRM_History_Customer_CreateTime datetime,
	@bCRM_History_Customer_IsPrivate int,
	@sCRM_History_Customer_City nvarchar(50),
	@sCRM_History_Customer_Company nvarchar(50),
	@sCRM_History_Customer_DirectLine varchar(20),
	@iCRM_History_Customer_CustomerSourceType_ID int,
	@sCRM_History_Customer_Phone_One varchar(20),
	@sCRM_History_Customer_Phone_Two varchar(20),
	@sCRM_History_Customer_DirectLine_One varchar(20),
	@sCRM_History_Customer_BuildingName nvarchar(50),
	@sCRM_History_Customer_StateDetail nvarchar(50),
	@sCRM_History_Customer_RequirementRemark nvarchar(1000),
	@sCRM_History_Customer_SourceRemark nvarchar(1000),
	@iCRM_History_Customer_CustomerActiveStatus_ID int,
	@iCRM_History_Customer_FollowUpClass_ID int,
	@dcCRM_History_Customer_ExpectPrice numeric(18, 2)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Customer_History]
SET 
	[CRM_Customer_History_AlterUser_EM_ID] = @guidCRM_Customer_History_AlterUser_EM_ID,
	[CRM_Customer_History_AlterUser_Name] = @sCRM_Customer_History_AlterUser_Name,
	[CRM_Customer_History_CreateTime] = @daCRM_Customer_History_CreateTime,
	[CRM_History_Customer_ID] = @guidCRM_History_Customer_ID,
	[CRM_History_Customer_Name] = @sCRM_History_Customer_Name,
	[CRM_History_Customer_Phone] = @sCRM_History_Customer_Phone,
	[CRM_History_Customer_Sex] = @bCRM_History_Customer_Sex,
	[CRM_History_Customer_Age] = @byCRM_History_Customer_Age,
	[CRM_History_Customer_SourceClass_ID] = @iCRM_History_Customer_SourceClass_ID,
	[CRM_History_Customer_CarType] = @sCRM_History_Customer_CarType,
	[CRM_History_Customer_CarEngineType] = @sCRM_History_Customer_CarEngineType,
	[CRM_History_Customer_CarNumber] = @sCRM_History_Customer_CarNumber,
	[CRM_History_Customer_Region] = @sCRM_History_Customer_Region,
	[CRM_History_Customer_BuildingAddress] = @sCRM_History_Customer_BuildingAddress,
	[CRM_History_Customer_BuildingArea] = @dcCRM_History_Customer_BuildingArea,
	[CRM_History_Customer_CustomerState_ID] = @iCRM_History_Customer_CustomerState_ID,
	[CRM_History_Customer_Remark] = @sCRM_History_Customer_Remark,
	[CRM_History_Customer_Email] = @sCRM_History_Customer_Email,
	[CRM_History_Customer_CreateTime] = @daCRM_History_Customer_CreateTime,
	[CRM_History_Customer_IsPrivate] = @bCRM_History_Customer_IsPrivate,
	[CRM_History_Customer_City] = @sCRM_History_Customer_City,
	[CRM_History_Customer_Company] = @sCRM_History_Customer_Company,
	[CRM_History_Customer_DirectLine] = @sCRM_History_Customer_DirectLine,
	[CRM_History_Customer_CustomerSourceType_ID] = @iCRM_History_Customer_CustomerSourceType_ID,
	[CRM_History_Customer_Phone_One] = @sCRM_History_Customer_Phone_One,
	[CRM_History_Customer_Phone_Two] = @sCRM_History_Customer_Phone_Two,
	[CRM_History_Customer_DirectLine_One] = @sCRM_History_Customer_DirectLine_One,
	[CRM_History_Customer_BuildingName] = @sCRM_History_Customer_BuildingName,
	[CRM_History_Customer_StateDetail] = @sCRM_History_Customer_StateDetail,
	[CRM_History_Customer_RequirementRemark] = @sCRM_History_Customer_RequirementRemark,
	[CRM_History_Customer_SourceRemark] = @sCRM_History_Customer_SourceRemark,
	[CRM_History_Customer_CustomerActiveStatus_ID] = @iCRM_History_Customer_CustomerActiveStatus_ID,
	[CRM_History_Customer_FollowUpClass_ID] = @iCRM_History_Customer_FollowUpClass_ID,
	[CRM_History_Customer_ExpectPrice] = @dcCRM_History_Customer_ExpectPrice
WHERE
	[CRM_Customer_History_ID] = @guidCRM_Customer_History_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_History_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Customer_History'
-- based on the Primary Key.
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_History_SelectOne]
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_Customer_History_ID],
	[CRM_Customer_History_AlterUser_EM_ID],
	[CRM_Customer_History_AlterUser_Name],
	[CRM_Customer_History_CreateTime],
	[CRM_History_Customer_ID],
	[CRM_History_Customer_Name],
	[CRM_History_Customer_Phone],
	[CRM_History_Customer_Sex],
	[CRM_History_Customer_Age],
	[CRM_History_Customer_SourceClass_ID],
	[CRM_History_Customer_CarType],
	[CRM_History_Customer_CarEngineType],
	[CRM_History_Customer_CarNumber],
	[CRM_History_Customer_Region],
	[CRM_History_Customer_BuildingAddress],
	[CRM_History_Customer_BuildingArea],
	[CRM_History_Customer_CustomerState_ID],
	[CRM_History_Customer_Remark],
	[CRM_History_Customer_Email],
	[CRM_History_Customer_CreateTime],
	[CRM_History_Customer_IsPrivate],
	[CRM_History_Customer_City],
	[CRM_History_Customer_Company],
	[CRM_History_Customer_DirectLine],
	[CRM_History_Customer_CustomerSourceType_ID],
	[CRM_History_Customer_Phone_One],
	[CRM_History_Customer_Phone_Two],
	[CRM_History_Customer_DirectLine_One],
	[CRM_History_Customer_BuildingName],
	[CRM_History_Customer_StateDetail],
	[CRM_History_Customer_RequirementRemark],
	[CRM_History_Customer_SourceRemark],
	[CRM_History_Customer_CustomerActiveStatus_ID],
	[CRM_History_Customer_FollowUpClass_ID],
	[CRM_History_Customer_ExpectPrice]
FROM [dbo].[t_CRM_Customer_History]
WHERE
	[CRM_Customer_History_ID] = @guidCRM_Customer_History_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_History_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Customer_History'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_History_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_Customer_History_ID],
	[CRM_Customer_History_AlterUser_EM_ID],
	[CRM_Customer_History_AlterUser_Name],
	[CRM_Customer_History_CreateTime],
	[CRM_History_Customer_ID],
	[CRM_History_Customer_Name],
	[CRM_History_Customer_Phone],
	[CRM_History_Customer_Sex],
	[CRM_History_Customer_Age],
	[CRM_History_Customer_SourceClass_ID],
	[CRM_History_Customer_CarType],
	[CRM_History_Customer_CarEngineType],
	[CRM_History_Customer_CarNumber],
	[CRM_History_Customer_Region],
	[CRM_History_Customer_BuildingAddress],
	[CRM_History_Customer_BuildingArea],
	[CRM_History_Customer_CustomerState_ID],
	[CRM_History_Customer_Remark],
	[CRM_History_Customer_Email],
	[CRM_History_Customer_CreateTime],
	[CRM_History_Customer_IsPrivate],
	[CRM_History_Customer_City],
	[CRM_History_Customer_Company],
	[CRM_History_Customer_DirectLine],
	[CRM_History_Customer_CustomerSourceType_ID],
	[CRM_History_Customer_Phone_One],
	[CRM_History_Customer_Phone_Two],
	[CRM_History_Customer_DirectLine_One],
	[CRM_History_Customer_BuildingName],
	[CRM_History_Customer_StateDetail],
	[CRM_History_Customer_RequirementRemark],
	[CRM_History_Customer_SourceRemark],
	[CRM_History_Customer_CustomerActiveStatus_ID],
	[CRM_History_Customer_FollowUpClass_ID],
	[CRM_History_Customer_ExpectPrice]
FROM [dbo].[t_CRM_Customer_History]
ORDER BY 
	[CRM_Customer_History_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_History_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Customer_History'
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
-- Gets: @guidCRM_Customer_History_AlterUser_EM_ID uniqueidentifier
-- Gets: @sCRM_Customer_History_AlterUser_Name nvarchar(50)
-- Gets: @daCRM_Customer_History_CreateTime datetime
-- Gets: @guidCRM_History_Customer_ID uniqueidentifier
-- Gets: @sCRM_History_Customer_Name nvarchar(50)
-- Gets: @sCRM_History_Customer_Phone varchar(20)
-- Gets: @bCRM_History_Customer_Sex bit
-- Gets: @byCRM_History_Customer_Age tinyint
-- Gets: @iCRM_History_Customer_SourceClass_ID int
-- Gets: @sCRM_History_Customer_CarType nvarchar(50)
-- Gets: @sCRM_History_Customer_CarEngineType nvarchar(50)
-- Gets: @sCRM_History_Customer_CarNumber varchar(20)
-- Gets: @sCRM_History_Customer_Region nvarchar(50)
-- Gets: @sCRM_History_Customer_BuildingAddress nvarchar(200)
-- Gets: @dcCRM_History_Customer_BuildingArea numeric(18, 2)
-- Gets: @iCRM_History_Customer_CustomerState_ID int
-- Gets: @sCRM_History_Customer_Remark nvarchar(1000)
-- Gets: @sCRM_History_Customer_Email varchar(200)
-- Gets: @daCRM_History_Customer_CreateTime datetime
-- Gets: @bCRM_History_Customer_IsPrivate bit
-- Gets: @sCRM_History_Customer_City nvarchar(50)
-- Gets: @sCRM_History_Customer_Company nvarchar(50)
-- Gets: @sCRM_History_Customer_DirectLine varchar(20)
-- Gets: @iCRM_History_Customer_CustomerSourceType_ID int
-- Gets: @sCRM_History_Customer_Phone_One varchar(20)
-- Gets: @sCRM_History_Customer_Phone_Two varchar(20)
-- Gets: @sCRM_History_Customer_DirectLine_One varchar(20)
-- Gets: @sCRM_History_Customer_BuildingName nvarchar(50)
-- Gets: @sCRM_History_Customer_StateDetail nvarchar(50)
-- Gets: @sCRM_History_Customer_RequirementRemark nvarchar(1000)
-- Gets: @sCRM_History_Customer_SourceRemark nvarchar(1000)
-- Gets: @iCRM_History_Customer_CustomerActiveStatus_ID int
-- Gets: @iCRM_History_Customer_FollowUpClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_History_Insert]
	@guidCRM_Customer_History_ID uniqueidentifier,
	@guidCRM_Customer_History_AlterUser_EM_ID uniqueidentifier,
	@sCRM_Customer_History_AlterUser_Name nvarchar(50),
	@daCRM_Customer_History_CreateTime datetime,
	@guidCRM_History_Customer_ID uniqueidentifier,
	@sCRM_History_Customer_Name nvarchar(50),
	@sCRM_History_Customer_Phone varchar(100),
	@bCRM_History_Customer_Sex bit,
	@byCRM_History_Customer_Age tinyint,
	@iCRM_History_Customer_SourceClass_ID int,
	@sCRM_History_Customer_CarType nvarchar(50),
	@sCRM_History_Customer_CarEngineType nvarchar(50),
	@sCRM_History_Customer_CarNumber varchar(20),
	@sCRM_History_Customer_Region nvarchar(50),
	@sCRM_History_Customer_BuildingAddress nvarchar(200),
	@dcCRM_History_Customer_BuildingArea numeric(18, 2),
	@iCRM_History_Customer_CustomerState_ID int,
	@sCRM_History_Customer_Remark nvarchar(1000),
	@sCRM_History_Customer_Email varchar(200),
	@daCRM_History_Customer_CreateTime datetime,
	@bCRM_History_Customer_IsPrivate int,
	@sCRM_History_Customer_City nvarchar(50),
	@sCRM_History_Customer_Company nvarchar(50),
	@sCRM_History_Customer_DirectLine varchar(20),
	@iCRM_History_Customer_CustomerSourceType_ID int,
	@sCRM_History_Customer_Phone_One varchar(20),
	@sCRM_History_Customer_Phone_Two varchar(20),
	@sCRM_History_Customer_DirectLine_One varchar(20),
	@sCRM_History_Customer_BuildingName nvarchar(50),
	@sCRM_History_Customer_StateDetail nvarchar(50),
	@sCRM_History_Customer_RequirementRemark nvarchar(1000),
	@sCRM_History_Customer_SourceRemark nvarchar(1000),
	@iCRM_History_Customer_CustomerActiveStatus_ID int,
	@iCRM_History_Customer_FollowUpClass_ID int,
	@dcCRM_History_Customer_ExpectPrice numeric(18, 2)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Customer_History]
(
	[CRM_Customer_History_ID],
	[CRM_Customer_History_AlterUser_EM_ID],
	[CRM_Customer_History_AlterUser_Name],
	[CRM_Customer_History_CreateTime],
	[CRM_History_Customer_ID],
	[CRM_History_Customer_Name],
	[CRM_History_Customer_Phone],
	[CRM_History_Customer_Sex],
	[CRM_History_Customer_Age],
	[CRM_History_Customer_SourceClass_ID],
	[CRM_History_Customer_CarType],
	[CRM_History_Customer_CarEngineType],
	[CRM_History_Customer_CarNumber],
	[CRM_History_Customer_Region],
	[CRM_History_Customer_BuildingAddress],
	[CRM_History_Customer_BuildingArea],
	[CRM_History_Customer_CustomerState_ID],
	[CRM_History_Customer_Remark],
	[CRM_History_Customer_Email],
	[CRM_History_Customer_CreateTime],
	[CRM_History_Customer_IsPrivate],
	[CRM_History_Customer_City],
	[CRM_History_Customer_Company],
	[CRM_History_Customer_DirectLine],
	[CRM_History_Customer_CustomerSourceType_ID],
	[CRM_History_Customer_Phone_One],
	[CRM_History_Customer_Phone_Two],
	[CRM_History_Customer_DirectLine_One],
	[CRM_History_Customer_BuildingName],
	[CRM_History_Customer_StateDetail],
	[CRM_History_Customer_RequirementRemark],
	[CRM_History_Customer_SourceRemark],
	[CRM_History_Customer_CustomerActiveStatus_ID],
	[CRM_History_Customer_FollowUpClass_ID],
	[CRM_History_Customer_ExpectPrice]
)
VALUES
(
	@guidCRM_Customer_History_ID,
	@guidCRM_Customer_History_AlterUser_EM_ID,
	@sCRM_Customer_History_AlterUser_Name,
	@daCRM_Customer_History_CreateTime,
	@guidCRM_History_Customer_ID,
	@sCRM_History_Customer_Name,
	@sCRM_History_Customer_Phone,
	@bCRM_History_Customer_Sex,
	@byCRM_History_Customer_Age,
	@iCRM_History_Customer_SourceClass_ID,
	@sCRM_History_Customer_CarType,
	@sCRM_History_Customer_CarEngineType,
	@sCRM_History_Customer_CarNumber,
	@sCRM_History_Customer_Region,
	@sCRM_History_Customer_BuildingAddress,
	@dcCRM_History_Customer_BuildingArea,
	@iCRM_History_Customer_CustomerState_ID,
	@sCRM_History_Customer_Remark,
	@sCRM_History_Customer_Email,
	@daCRM_History_Customer_CreateTime,
	@bCRM_History_Customer_IsPrivate,
	@sCRM_History_Customer_City,
	@sCRM_History_Customer_Company,
	@sCRM_History_Customer_DirectLine,
	@iCRM_History_Customer_CustomerSourceType_ID,
	@sCRM_History_Customer_Phone_One,
	@sCRM_History_Customer_Phone_Two,
	@sCRM_History_Customer_DirectLine_One,
	@sCRM_History_Customer_BuildingName,
	@sCRM_History_Customer_StateDetail,
	@sCRM_History_Customer_RequirementRemark,
	@sCRM_History_Customer_SourceRemark,
	@iCRM_History_Customer_CustomerActiveStatus_ID,
	@iCRM_History_Customer_FollowUpClass_ID,
	@dcCRM_History_Customer_ExpectPrice
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_History_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Customer_History'
-- using the Primary Key. 
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_History_Delete]
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Customer_History]
WHERE
	[CRM_Customer_History_ID] = @guidCRM_Customer_History_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Customer_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Customer'
-- using the Primary Key. 
-- Gets: @guidCRM_Customer_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Customer_Delete]
	@guidCRM_Customer_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Customer]
WHERE
	[CRM_Customer_ID] = @guidCRM_Customer_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CallRecord_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_CallRecord'
-- Gets: @guidCRM_CallRecord_ID uniqueidentifier
-- Gets: @sCRM_CallRecord_EnterpriseID nvarchar(50)
-- Gets: @sCRM_CallRecord_UserName nvarchar(50)
-- Gets: @sCRM_CallRecord_SessionId nvarchar(200)
-- Gets: @sCRM_CallRecord_ANI nvarchar(50)
-- Gets: @sCRM_CallRecord_DNIS nvarchar(50)
-- Gets: @sCRM_CallRecord_Context nvarchar(1000)
-- Gets: @daCRM_CallRecord_CreateTime datetime
-- Gets: @sCRM_CallRecord_RecordURL nvarchar(1000)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CallRecord_Update]
	@guidCRM_CallRecord_ID uniqueidentifier,
	@sCRM_CallRecord_EnterpriseID nvarchar(50),
	@sCRM_CallRecord_UserName nvarchar(50),
	@sCRM_CallRecord_SessionId nvarchar(200),
	@sCRM_CallRecord_ANI nvarchar(50),
	@sCRM_CallRecord_DNIS nvarchar(50),
	@sCRM_CallRecord_Context nvarchar(1000),
	@daCRM_CallRecord_CreateTime datetime,
	@sCRM_CallRecord_RecordURL nvarchar(1000)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_CallRecord]
SET 
	[CRM_CallRecord_EnterpriseID] = @sCRM_CallRecord_EnterpriseID,
	[CRM_CallRecord_UserName] = @sCRM_CallRecord_UserName,
	[CRM_CallRecord_SessionId] = @sCRM_CallRecord_SessionId,
	[CRM_CallRecord_ANI] = @sCRM_CallRecord_ANI,
	[CRM_CallRecord_DNIS] = @sCRM_CallRecord_DNIS,
	[CRM_CallRecord_Context] = @sCRM_CallRecord_Context,
	[CRM_CallRecord_CreateTime] = @daCRM_CallRecord_CreateTime,
	[CRM_CallRecord_RecordURL] = @sCRM_CallRecord_RecordURL
WHERE
	[CRM_CallRecord_ID] = @guidCRM_CallRecord_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CallRecord_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_CallRecord'
-- based on the Primary Key.
-- Gets: @guidCRM_CallRecord_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CallRecord_SelectOne]
	@guidCRM_CallRecord_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CallRecord_ID],
	[CRM_CallRecord_EnterpriseID],
	[CRM_CallRecord_UserName],
	[CRM_CallRecord_SessionId],
	[CRM_CallRecord_ANI],
	[CRM_CallRecord_DNIS],
	[CRM_CallRecord_Context],
	[CRM_CallRecord_CreateTime],
	[CRM_CallRecord_RecordURL]
FROM [dbo].[t_CRM_CallRecord]
WHERE
	[CRM_CallRecord_ID] = @guidCRM_CallRecord_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CallRecord_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_CallRecord'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CallRecord_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CallRecord_ID],
	[CRM_CallRecord_EnterpriseID],
	[CRM_CallRecord_UserName],
	[CRM_CallRecord_SessionId],
	[CRM_CallRecord_ANI],
	[CRM_CallRecord_DNIS],
	[CRM_CallRecord_Context],
	[CRM_CallRecord_CreateTime],
	[CRM_CallRecord_RecordURL]
FROM [dbo].[t_CRM_CallRecord]
ORDER BY 
	[CRM_CallRecord_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CallRecord_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_CallRecord'
-- Gets: @guidCRM_CallRecord_ID uniqueidentifier
-- Gets: @sCRM_CallRecord_EnterpriseID nvarchar(50)
-- Gets: @sCRM_CallRecord_UserName nvarchar(50)
-- Gets: @sCRM_CallRecord_SessionId nvarchar(200)
-- Gets: @sCRM_CallRecord_ANI nvarchar(50)
-- Gets: @sCRM_CallRecord_DNIS nvarchar(50)
-- Gets: @sCRM_CallRecord_Context nvarchar(1000)
-- Gets: @daCRM_CallRecord_CreateTime datetime
-- Gets: @sCRM_CallRecord_RecordURL nvarchar(1000)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CallRecord_Insert]
	@guidCRM_CallRecord_ID uniqueidentifier,
	@sCRM_CallRecord_EnterpriseID nvarchar(50),
	@sCRM_CallRecord_UserName nvarchar(50),
	@sCRM_CallRecord_SessionId nvarchar(200),
	@sCRM_CallRecord_ANI nvarchar(50),
	@sCRM_CallRecord_DNIS nvarchar(50),
	@sCRM_CallRecord_Context nvarchar(1000),
	@daCRM_CallRecord_CreateTime datetime,
	@sCRM_CallRecord_RecordURL nvarchar(1000)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_CallRecord]
(
	[CRM_CallRecord_ID],
	[CRM_CallRecord_EnterpriseID],
	[CRM_CallRecord_UserName],
	[CRM_CallRecord_SessionId],
	[CRM_CallRecord_ANI],
	[CRM_CallRecord_DNIS],
	[CRM_CallRecord_Context],
	[CRM_CallRecord_CreateTime],
	[CRM_CallRecord_RecordURL]
)
VALUES
(
	@guidCRM_CallRecord_ID,
	@sCRM_CallRecord_EnterpriseID,
	@sCRM_CallRecord_UserName,
	@sCRM_CallRecord_SessionId,
	@sCRM_CallRecord_ANI,
	@sCRM_CallRecord_DNIS,
	@sCRM_CallRecord_Context,
	@daCRM_CallRecord_CreateTime,
	@sCRM_CallRecord_RecordURL
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_CallRecord_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_CallRecord'
-- using the Primary Key. 
-- Gets: @guidCRM_CallRecord_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_CallRecord_Delete]
	@guidCRM_CallRecord_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_CallRecord]
WHERE
	[CRM_CallRecord_ID] = @guidCRM_CallRecord_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Attendance_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Attendance'
-- Gets: @guidCRM_Attendance_ID uniqueidentifier
-- Gets: @sCRM_Attendance_Code nvarchar(20)
-- Gets: @daCRM_Attendance_LoginTime datetime
-- Gets: @daCRM_Attendance_LogoutTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Attendance_Update]
	@guidCRM_Attendance_ID uniqueidentifier,
	@sCRM_Attendance_Code nvarchar(20),
	@daCRM_Attendance_LoginTime datetime,
	@daCRM_Attendance_LogoutTime datetime
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Attendance]
SET 
	[CRM_Attendance_Code] = @sCRM_Attendance_Code,
	[CRM_Attendance_LoginTime] = @daCRM_Attendance_LoginTime,
	[CRM_Attendance_LogoutTime] = @daCRM_Attendance_LogoutTime
WHERE
	[CRM_Attendance_ID] = @guidCRM_Attendance_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Attendance_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Attendance'
-- based on the Primary Key.
-- Gets: @guidCRM_Attendance_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Attendance_SelectOne]
	@guidCRM_Attendance_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_Attendance_ID],
	[CRM_Attendance_Code],
	[CRM_Attendance_LoginTime],
	[CRM_Attendance_LogoutTime]
FROM [dbo].[t_CRM_Attendance]
WHERE
	[CRM_Attendance_ID] = @guidCRM_Attendance_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Attendance_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Attendance'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Attendance_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_Attendance_ID],
	[CRM_Attendance_Code],
	[CRM_Attendance_LoginTime],
	[CRM_Attendance_LogoutTime]
FROM [dbo].[t_CRM_Attendance]
ORDER BY 
	[CRM_Attendance_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Attendance_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Attendance'
-- Gets: @guidCRM_Attendance_ID uniqueidentifier
-- Gets: @sCRM_Attendance_Code nvarchar(20)
-- Gets: @daCRM_Attendance_LoginTime datetime
-- Gets: @daCRM_Attendance_LogoutTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Attendance_Insert]
	@guidCRM_Attendance_ID uniqueidentifier,
	@sCRM_Attendance_Code nvarchar(20),
	@daCRM_Attendance_LoginTime datetime,
	@daCRM_Attendance_LogoutTime datetime
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Attendance]
(
	[CRM_Attendance_ID],
	[CRM_Attendance_Code],
	[CRM_Attendance_LoginTime],
	[CRM_Attendance_LogoutTime]
)
VALUES
(
	@guidCRM_Attendance_ID,
	@sCRM_Attendance_Code,
	@daCRM_Attendance_LoginTime,
	@daCRM_Attendance_LogoutTime
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Attendance_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Attendance'
-- using the Primary Key. 
-- Gets: @guidCRM_Attendance_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Attendance_Delete]
	@guidCRM_Attendance_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Attendance]
WHERE
	[CRM_Attendance_ID] = @guidCRM_Attendance_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentWithCode_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_AgentWithCode'
-- Gets: @guidCRM_AgentWithCode_ID uniqueidentifier
-- Gets: @guidCRM_AgentWithCode_AgentManage_ID uniqueidentifier
-- Gets: @sCRM_AgentWithCode_Code nvarchar(50)
-- Gets: @sCRM_AgentWithCode_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentWithCode_Update]
	@guidCRM_AgentWithCode_ID uniqueidentifier,
	@guidCRM_AgentWithCode_AgentManage_ID uniqueidentifier,
	@sCRM_AgentWithCode_Code nvarchar(50),
	@sCRM_AgentWithCode_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_AgentWithCode]
SET 
	[CRM_AgentWithCode_AgentManage_ID] = @guidCRM_AgentWithCode_AgentManage_ID,
	[CRM_AgentWithCode_Code] = @sCRM_AgentWithCode_Code,
	[CRM_AgentWithCode_Name] = @sCRM_AgentWithCode_Name
WHERE
	[CRM_AgentWithCode_ID] = @guidCRM_AgentWithCode_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentWithCode_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_AgentWithCode'
-- based on the Primary Key.
-- Gets: @guidCRM_AgentWithCode_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentWithCode_SelectOne]
	@guidCRM_AgentWithCode_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_AgentWithCode_ID],
	[CRM_AgentWithCode_AgentManage_ID],
	[CRM_AgentWithCode_Code],
	[CRM_AgentWithCode_Name]
FROM [dbo].[t_CRM_AgentWithCode]
WHERE
	[CRM_AgentWithCode_ID] = @guidCRM_AgentWithCode_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentWithCode_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_AgentWithCode'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentWithCode_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_AgentWithCode_ID],
	[CRM_AgentWithCode_AgentManage_ID],
	[CRM_AgentWithCode_Code],
	[CRM_AgentWithCode_Name]
FROM [dbo].[t_CRM_AgentWithCode]
ORDER BY 
	[CRM_AgentWithCode_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentWithCode_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_AgentWithCode'
-- Gets: @guidCRM_AgentWithCode_ID uniqueidentifier
-- Gets: @guidCRM_AgentWithCode_AgentManage_ID uniqueidentifier
-- Gets: @sCRM_AgentWithCode_Code nvarchar(50)
-- Gets: @sCRM_AgentWithCode_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentWithCode_Insert]
	@guidCRM_AgentWithCode_ID uniqueidentifier,
	@guidCRM_AgentWithCode_AgentManage_ID uniqueidentifier,
	@sCRM_AgentWithCode_Code nvarchar(50),
	@sCRM_AgentWithCode_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_AgentWithCode]
(
	[CRM_AgentWithCode_ID],
	[CRM_AgentWithCode_AgentManage_ID],
	[CRM_AgentWithCode_Code],
	[CRM_AgentWithCode_Name]
)
VALUES
(
	@guidCRM_AgentWithCode_ID,
	@guidCRM_AgentWithCode_AgentManage_ID,
	@sCRM_AgentWithCode_Code,
	@sCRM_AgentWithCode_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentWithCode_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_AgentWithCode'
-- using the Primary Key. 
-- Gets: @guidCRM_AgentWithCode_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentWithCode_Delete]
	@guidCRM_AgentWithCode_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_AgentWithCode]
WHERE
	[CRM_AgentWithCode_ID] = @guidCRM_AgentWithCode_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentManage_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_AgentManage'
-- Gets: @guidCRM_AgentManage_ID uniqueidentifier
-- Gets: @sCRM_AgentManage_Number nvarchar(50)
-- Gets: @sCRM_AgentManage_AgentID nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentManage_Update]
	@guidCRM_AgentManage_ID uniqueidentifier,
	@sCRM_AgentManage_Number nvarchar(50),
	@sCRM_AgentManage_AgentID nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_AgentManage]
SET 
	[CRM_AgentManage_Number] = @sCRM_AgentManage_Number,
	[CRM_AgentManage_AgentID] = @sCRM_AgentManage_AgentID
WHERE
	[CRM_AgentManage_ID] = @guidCRM_AgentManage_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentManage_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_AgentManage'
-- based on the Primary Key.
-- Gets: @guidCRM_AgentManage_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentManage_SelectOne]
	@guidCRM_AgentManage_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_AgentManage_ID],
	[CRM_AgentManage_Number],
	[CRM_AgentManage_AgentID]
FROM [dbo].[t_CRM_AgentManage]
WHERE
	[CRM_AgentManage_ID] = @guidCRM_AgentManage_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentManage_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_AgentManage'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentManage_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_AgentManage_ID],
	[CRM_AgentManage_Number],
	[CRM_AgentManage_AgentID]
FROM [dbo].[t_CRM_AgentManage]
ORDER BY 
	[CRM_AgentManage_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentManage_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_AgentManage'
-- Gets: @guidCRM_AgentManage_ID uniqueidentifier
-- Gets: @sCRM_AgentManage_Number nvarchar(50)
-- Gets: @sCRM_AgentManage_AgentID nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentManage_Insert]
	@guidCRM_AgentManage_ID uniqueidentifier,
	@sCRM_AgentManage_Number nvarchar(50),
	@sCRM_AgentManage_AgentID nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_AgentManage]
(
	[CRM_AgentManage_ID],
	[CRM_AgentManage_Number],
	[CRM_AgentManage_AgentID]
)
VALUES
(
	@guidCRM_AgentManage_ID,
	@sCRM_AgentManage_Number,
	@sCRM_AgentManage_AgentID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_AgentManage_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_AgentManage'
-- using the Primary Key. 
-- Gets: @guidCRM_AgentManage_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_AgentManage_Delete]
	@guidCRM_AgentManage_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_AgentManage]
WHERE
	[CRM_AgentManage_ID] = @guidCRM_AgentManage_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_A_ReduceSMSBalance]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		guojb
-- Create date: 2013-9-23
-- Description:	减少短息条数
-- =============================================
CREATE PROCEDURE [dbo].[sp_A_ReduceSMSBalance]
	@EMID uniqueidentifier,
	@Date datetime,
	@ReduceCount bigint
AS
BEGIN
	declare @BalanceValue bigint
	SET NOCOUNT ON;
	select @BalanceValue = CRM_SMS_LimitAmount_Balance from [DB_ECCRM].[dbo].[t_CRM_SMS_LimitAmount] where
	  [CRM_SMS_LimitAmount_EM_ID] = @EMID
  and [CRM_SMS_LimitAmount_Month] = @Date
	set @BalanceValue = @BalanceValue - @ReduceCount
      update  [DB_ECCRM].[dbo].[t_CRM_SMS_LimitAmount]
	  set CRM_SMS_LimitAmount_Balance =@BalanceValue where
	  [CRM_SMS_LimitAmount_EM_ID] = @EMID
	  and [CRM_SMS_LimitAmount_Month] = @Date 
END
GO
/****** Object:  Table [dbo].[t_CRM_Login]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_CRM_Login](
	[Login_ID] [uniqueidentifier] NOT NULL,
	[Login_Name] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NULL,
	[Emp_Code] [nvarchar](20) NULL,
	[Last_Login] [datetime] NULL,
	[Is_Stop] [bit] NULL,
	[Create_Date] [datetime] NULL,
	[App_DeviceID] [nvarchar](60) NULL,
	[App_Is_Auto_Login] [bit] NULL,
	[App_Is_Push_Message] [bit] NULL,
 CONSTRAINT [BS_Login_PK] PRIMARY KEY CLUSTERED 
(
	[Login_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Log_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Log'
-- Gets: @guidLog_ID uniqueidentifier
-- Gets: @sLog_EmployeeID nvarchar(10)
-- Gets: @sLog_EmployeeName nvarchar(50)
-- Gets: @daLog_OperateTime datetime
-- Gets: @iLog_OperateModuleID int
-- Gets: @guidLog_OperateModuleMainID uniqueidentifier
-- Gets: @iLog_OperateID int
-- Gets: @sLog_OperateDesc nvarchar(1000)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Log_Update]
	@guidLog_ID uniqueidentifier,
	@sLog_EmployeeID nvarchar(10),
	@sLog_EmployeeName nvarchar(50),
	@daLog_OperateTime datetime,
	@iLog_OperateModuleID int,
	--@guidLog_OperateModuleMainID uniqueidentifier,
	@guidLog_OperateModuleMainID uniqueidentifier,
	@iLog_OperateID int,
	@sLog_OperateDesc nvarchar(1000),
	@sLog_ComputerName nvarchar(1000)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Log]
SET 
	[Log_EmployeeID] = @sLog_EmployeeID,
	[Log_EmployeeName] = @sLog_EmployeeName,
	[Log_OperateTime] = @daLog_OperateTime,
	[Log_OperateModuleID] = @iLog_OperateModuleID,
	[Log_OperateModuleMainID] = @guidLog_OperateModuleMainID,
	[Log_OperateID] = @iLog_OperateID,
	[Log_OperateDesc] = @sLog_OperateDesc,
	[Log_ComputerName] = @sLog_ComputerName
WHERE
	[Log_ID] = @guidLog_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Log_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Log'
-- based on the Primary Key.
-- Gets: @guidLog_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Log_SelectOne]
	@guidLog_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[Log_ID],
	[Log_EmployeeID],
	[Log_EmployeeName],
	[Log_OperateTime],
	[Log_OperateModuleID],
	[Log_OperateModuleMainID],
	[Log_OperateID],
	[Log_OperateDesc],
	[Log_ComputerName]
FROM [dbo].[t_Log]
WHERE
	[Log_ID] = @guidLog_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Log_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Log'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Log_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Log_ID],
	[Log_EmployeeID],
	[Log_EmployeeName],
	[Log_OperateTime],
	[Log_OperateModuleID],
	[Log_OperateModuleMainID],
	[Log_OperateID],
	[Log_OperateDesc],
	[Log_ComputerName]
FROM [dbo].[t_Log]
ORDER BY 
	[Log_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Log_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Log'
-- Gets: @guidLog_ID uniqueidentifier
-- Gets: @sLog_EmployeeID nvarchar(10)
-- Gets: @sLog_EmployeeName nvarchar(50)
-- Gets: @daLog_OperateTime datetime
-- Gets: @iLog_OperateModuleID int
-- Gets: @guidLog_OperateModuleMainID uniqueidentifier
-- Gets: @iLog_OperateID int
-- Gets: @sLog_OperateDesc nvarchar(1000)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Log_Insert]
	@guidLog_ID uniqueidentifier,
	@sLog_EmployeeID nvarchar(10),
	@sLog_EmployeeName nvarchar(50),
	@daLog_OperateTime datetime,
	@iLog_OperateModuleID int,
	--@guidLog_OperateModuleMainID uniqueidentifier,
	@guidLog_OperateModuleMainID uniqueidentifier,
	@iLog_OperateID int,
	@sLog_OperateDesc nvarchar(1000),
	@sLog_ComputerName nvarchar(1000)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Log]
(
	[Log_ID],
	[Log_EmployeeID],
	[Log_EmployeeName],
	[Log_OperateTime],
	[Log_OperateModuleID],
	[Log_OperateModuleMainID],
	[Log_OperateID],
	[Log_OperateDesc],
	[Log_ComputerName]
)
VALUES
(
	@guidLog_ID,
	@sLog_EmployeeID,
	@sLog_EmployeeName,
	@daLog_OperateTime,
	@iLog_OperateModuleID,
	@guidLog_OperateModuleMainID,
	@iLog_OperateID,
	@sLog_OperateDesc,
	@sLog_ComputerName
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Log_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Log'
-- using the Primary Key. 
-- Gets: @guidLog_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Log_Delete]
	@guidLog_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Log]
WHERE
	[Log_ID] = @guidLog_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_OperateModule_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_Log_OperateModule'
-- Gets: @iOperateModule_ID int
-- Gets: @sOperateModule_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_OperateModule_Update]
	@iOperateModule_ID int,
	@sOperateModule_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_Log_OperateModule]
SET 
	[OperateModule_Name] = @sOperateModule_Name
WHERE
	[OperateModule_ID] = @iOperateModule_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_OperateModule_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_Log_OperateModule'
-- based on the Primary Key.
-- Gets: @iOperateModule_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_OperateModule_SelectOne]
	@iOperateModule_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[OperateModule_ID],
	[OperateModule_Name]
FROM [dbo].[t_Dic_Log_OperateModule]
WHERE
	[OperateModule_ID] = @iOperateModule_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_OperateModule_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_Log_OperateModule'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_OperateModule_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[OperateModule_ID],
	[OperateModule_Name]
FROM [dbo].[t_Dic_Log_OperateModule]
ORDER BY 
	[OperateModule_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_OperateModule_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_Log_OperateModule'
-- Gets: @iOperateModule_ID int
-- Gets: @sOperateModule_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_OperateModule_Insert]
	@iOperateModule_ID int,
	@sOperateModule_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_Log_OperateModule]
(
	[OperateModule_ID],
	[OperateModule_Name]
)
VALUES
(
	@iOperateModule_ID,
	@sOperateModule_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_OperateModule_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_Log_OperateModule'
-- using the Primary Key. 
-- Gets: @iOperateModule_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_OperateModule_Delete]
	@iOperateModule_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_Log_OperateModule]
WHERE
	[OperateModule_ID] = @iOperateModule_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_Operate_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_Log_Operate'
-- Gets: @iOperate_ID int
-- Gets: @sOperate_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_Operate_Update]
	@iOperate_ID int,
	@sOperate_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_Log_Operate]
SET 
	[Operate_Name] = @sOperate_Name
WHERE
	[Operate_ID] = @iOperate_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_Operate_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_Log_Operate'
-- based on the Primary Key.
-- Gets: @iOperate_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_Operate_SelectOne]
	@iOperate_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[Operate_ID],
	[Operate_Name]
FROM [dbo].[t_Dic_Log_Operate]
WHERE
	[Operate_ID] = @iOperate_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_Operate_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_Log_Operate'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_Operate_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Operate_ID],
	[Operate_Name]
FROM [dbo].[t_Dic_Log_Operate]
ORDER BY 
	[Operate_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_Operate_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_Log_Operate'
-- Gets: @iOperate_ID int
-- Gets: @sOperate_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_Operate_Insert]
	@iOperate_ID int,
	@sOperate_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_Log_Operate]
(
	[Operate_ID],
	[Operate_Name]
)
VALUES
(
	@iOperate_ID,
	@sOperate_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_Log_Operate_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_Log_Operate'
-- using the Primary Key. 
-- Gets: @iOperate_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_Log_Operate_Delete]
	@iOperate_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_Log_Operate]
WHERE
	[Operate_ID] = @iOperate_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_TypeClass_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_TypeClass'
-- Gets: @iCRM_TypeClass_ID int
-- Gets: @sCRM_TypeClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_TypeClass_Update]
	@iCRM_TypeClass_ID int,
	@sCRM_TypeClass_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_TypeClass]
SET 
	[CRM_TypeClass_Name] = @sCRM_TypeClass_Name
WHERE
	[CRM_TypeClass_ID] = @iCRM_TypeClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_TypeClass_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_TypeClass'
-- based on the Primary Key.
-- Gets: @iCRM_TypeClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_TypeClass_SelectOne]
	@iCRM_TypeClass_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_TypeClass_ID],
	[CRM_TypeClass_Name]
FROM [dbo].[t_Dic_CRM_TypeClass]
WHERE
	[CRM_TypeClass_ID] = @iCRM_TypeClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_TypeClass_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_TypeClass'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_TypeClass_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_TypeClass_ID],
	[CRM_TypeClass_Name]
FROM [dbo].[t_Dic_CRM_TypeClass]
ORDER BY 
	[CRM_TypeClass_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_TypeClass_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_TypeClass'
-- Gets: @iCRM_TypeClass_ID int
-- Gets: @sCRM_TypeClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_TypeClass_Insert]
	@iCRM_TypeClass_ID int,
	@sCRM_TypeClass_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_TypeClass]
(
	[CRM_TypeClass_ID],
	[CRM_TypeClass_Name]
)
VALUES
(
	@iCRM_TypeClass_ID,
	@sCRM_TypeClass_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_TypeClass_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_TypeClass'
-- using the Primary Key. 
-- Gets: @iCRM_TypeClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_TypeClass_Delete]
	@iCRM_TypeClass_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_TypeClass]
WHERE
	[CRM_TypeClass_ID] = @iCRM_TypeClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_SourceClass_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_SourceClass'
-- Gets: @iCRM_SourceClass_ID int
-- Gets: @sCRM_SourceClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_SourceClass_Update]
	@iCRM_SourceClass_ID int,
	@sCRM_SourceClass_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_SourceClass]
SET 
	[CRM_SourceClass_Name] = @sCRM_SourceClass_Name
WHERE
	[CRM_SourceClass_ID] = @iCRM_SourceClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_SourceClass_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_SourceClass'
-- based on the Primary Key.
-- Gets: @iCRM_SourceClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_SourceClass_SelectOne]
	@iCRM_SourceClass_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_SourceClass_ID],
	[CRM_SourceClass_Name]
FROM [dbo].[t_Dic_CRM_SourceClass]
WHERE
	[CRM_SourceClass_ID] = @iCRM_SourceClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_SourceClass_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_SourceClass'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_SourceClass_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_SourceClass_ID],
	[CRM_SourceClass_Name]
FROM [dbo].[t_Dic_CRM_SourceClass]
ORDER BY 
	[CRM_SourceClass_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_SourceClass_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_SourceClass'
-- Gets: @iCRM_SourceClass_ID int
-- Gets: @sCRM_SourceClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_SourceClass_Insert]
	@iCRM_SourceClass_ID int,
	@sCRM_SourceClass_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_SourceClass]
(
	[CRM_SourceClass_ID],
	[CRM_SourceClass_Name]
)
VALUES
(
	@iCRM_SourceClass_ID,
	@sCRM_SourceClass_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_SourceClass_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_SourceClass'
-- using the Primary Key. 
-- Gets: @iCRM_SourceClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_SourceClass_Delete]
	@iCRM_SourceClass_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_SourceClass]
WHERE
	[CRM_SourceClass_ID] = @iCRM_SourceClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_RequirementClass_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_RequirementClass'
-- Gets: @iCRM_RequirementClass_ID int
-- Gets: @sCRM_RequirementClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_RequirementClass_Update]
	@iCRM_RequirementClass_ID int,
	@sCRM_RequirementClass_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_RequirementClass]
SET 
	[CRM_RequirementClass_Name] = @sCRM_RequirementClass_Name
WHERE
	[CRM_RequirementClass_ID] = @iCRM_RequirementClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_RequirementClass_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_RequirementClass'
-- based on the Primary Key.
-- Gets: @iCRM_RequirementClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_RequirementClass_SelectOne]
	@iCRM_RequirementClass_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_RequirementClass_ID],
	[CRM_RequirementClass_Name]
FROM [dbo].[t_Dic_CRM_RequirementClass]
WHERE
	[CRM_RequirementClass_ID] = @iCRM_RequirementClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_RequirementClass_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_RequirementClass'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_RequirementClass_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_RequirementClass_ID],
	[CRM_RequirementClass_Name]
FROM [dbo].[t_Dic_CRM_RequirementClass]
ORDER BY 
	[CRM_RequirementClass_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_RequirementClass_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_RequirementClass'
-- Gets: @iCRM_RequirementClass_ID int
-- Gets: @sCRM_RequirementClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_RequirementClass_Insert]
	@iCRM_RequirementClass_ID int,
	@sCRM_RequirementClass_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_RequirementClass]
(
	[CRM_RequirementClass_ID],
	[CRM_RequirementClass_Name]
)
VALUES
(
	@iCRM_RequirementClass_ID,
	@sCRM_RequirementClass_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_RequirementClass_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_RequirementClass'
-- using the Primary Key. 
-- Gets: @iCRM_RequirementClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_RequirementClass_Delete]
	@iCRM_RequirementClass_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_RequirementClass]
WHERE
	[CRM_RequirementClass_ID] = @iCRM_RequirementClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_FollowUpClass_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_FollowUpClass'
-- Gets: @iCRM_FollowUpClass_ID int
-- Gets: @sCRM_FollowUpClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_FollowUpClass_Update]
	@iCRM_FollowUpClass_ID int,
	@sCRM_FollowUpClass_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_FollowUpClass]
SET 
	[CRM_FollowUpClass_Name] = @sCRM_FollowUpClass_Name
WHERE
	[CRM_FollowUpClass_ID] = @iCRM_FollowUpClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_FollowUpClass_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_FollowUpClass'
-- based on the Primary Key.
-- Gets: @iCRM_FollowUpClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_FollowUpClass_SelectOne]
	@iCRM_FollowUpClass_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_FollowUpClass_ID],
	[CRM_FollowUpClass_Name]
FROM [dbo].[t_Dic_CRM_FollowUpClass]
WHERE
	[CRM_FollowUpClass_ID] = @iCRM_FollowUpClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_FollowUpClass_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_FollowUpClass'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_FollowUpClass_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_FollowUpClass_ID],
	[CRM_FollowUpClass_Name]
FROM [dbo].[t_Dic_CRM_FollowUpClass]
ORDER BY 
	[CRM_FollowUpClass_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_FollowUpClass_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_FollowUpClass'
-- Gets: @iCRM_FollowUpClass_ID int
-- Gets: @sCRM_FollowUpClass_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_FollowUpClass_Insert]
	@iCRM_FollowUpClass_ID int,
	@sCRM_FollowUpClass_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_FollowUpClass]
(
	[CRM_FollowUpClass_ID],
	[CRM_FollowUpClass_Name]
)
VALUES
(
	@iCRM_FollowUpClass_ID,
	@sCRM_FollowUpClass_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_FollowUpClass_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_FollowUpClass'
-- using the Primary Key. 
-- Gets: @iCRM_FollowUpClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_FollowUpClass_Delete]
	@iCRM_FollowUpClass_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_FollowUpClass]
WHERE
	[CRM_FollowUpClass_ID] = @iCRM_FollowUpClass_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerState_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_CustomerState'
-- Gets: @iCRM_CustomerState_ID int
-- Gets: @sCRM_CustomerState_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerState_Update]
	@iCRM_CustomerState_ID int,
	@sCRM_CustomerState_Name nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_CustomerState]
SET 
	[CRM_CustomerState_Name] = @sCRM_CustomerState_Name
WHERE
	[CRM_CustomerState_ID] = @iCRM_CustomerState_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerState_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_CustomerState'
-- based on the Primary Key.
-- Gets: @iCRM_CustomerState_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerState_SelectOne]
	@iCRM_CustomerState_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CustomerState_ID],
	[CRM_CustomerState_Name]
FROM [dbo].[t_Dic_CRM_CustomerState]
WHERE
	[CRM_CustomerState_ID] = @iCRM_CustomerState_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerState_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_CustomerState'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerState_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CustomerState_ID],
	[CRM_CustomerState_Name]
FROM [dbo].[t_Dic_CRM_CustomerState]
ORDER BY 
	[CRM_CustomerState_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerState_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_CustomerState'
-- Gets: @iCRM_CustomerState_ID int
-- Gets: @sCRM_CustomerState_Name nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerState_Insert]
	@iCRM_CustomerState_ID int,
	@sCRM_CustomerState_Name nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_CustomerState]
(
	[CRM_CustomerState_ID],
	[CRM_CustomerState_Name]
)
VALUES
(
	@iCRM_CustomerState_ID,
	@sCRM_CustomerState_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerState_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_CustomerState'
-- using the Primary Key. 
-- Gets: @iCRM_CustomerState_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerState_Delete]
	@iCRM_CustomerState_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_CustomerState]
WHERE
	[CRM_CustomerState_ID] = @iCRM_CustomerState_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerSourceType_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_CustomerSourceType'
-- Gets: @iCRM_CustomerSourceType_ID int
-- Gets: @sCRM_CustomerSourceType_Name nvarchar(100)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerSourceType_Update]
	@iCRM_CustomerSourceType_ID int,
	@sCRM_CustomerSourceType_Name nvarchar(100)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_CustomerSourceType]
SET 
	[CRM_CustomerSourceType_Name] = @sCRM_CustomerSourceType_Name
WHERE
	[CRM_CustomerSourceType_ID] = @iCRM_CustomerSourceType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerSourceType_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_CustomerSourceType'
-- based on the Primary Key.
-- Gets: @iCRM_CustomerSourceType_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerSourceType_SelectOne]
	@iCRM_CustomerSourceType_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CustomerSourceType_ID],
	[CRM_CustomerSourceType_Name]
FROM [dbo].[t_Dic_CRM_CustomerSourceType]
WHERE
	[CRM_CustomerSourceType_ID] = @iCRM_CustomerSourceType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerSourceType_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_CustomerSourceType'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerSourceType_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CustomerSourceType_ID],
	[CRM_CustomerSourceType_Name]
FROM [dbo].[t_Dic_CRM_CustomerSourceType]
ORDER BY 
	[CRM_CustomerSourceType_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerSourceType_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_CustomerSourceType'
-- Gets: @iCRM_CustomerSourceType_ID int
-- Gets: @sCRM_CustomerSourceType_Name nvarchar(100)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerSourceType_Insert]
	@iCRM_CustomerSourceType_ID int,
	@sCRM_CustomerSourceType_Name nvarchar(100)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_CustomerSourceType]
(
	[CRM_CustomerSourceType_ID],
	[CRM_CustomerSourceType_Name]
)
VALUES
(
	@iCRM_CustomerSourceType_ID,
	@sCRM_CustomerSourceType_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerSourceType_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_CustomerSourceType'
-- using the Primary Key. 
-- Gets: @iCRM_CustomerSourceType_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerSourceType_Delete]
	@iCRM_CustomerSourceType_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_CustomerSourceType]
WHERE
	[CRM_CustomerSourceType_ID] = @iCRM_CustomerSourceType_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_Dic_CRM_CustomerActiveStatus'
-- Gets: @iCRM_CustomerActiveStatus_ID int
-- Gets: @sCRM_CustomerActiveStatus_Name nvarchar(100)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Update]
	@iCRM_CustomerActiveStatus_ID int,
	@sCRM_CustomerActiveStatus_Name nvarchar(100)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_Dic_CRM_CustomerActiveStatus]
SET 
	[CRM_CustomerActiveStatus_Name] = @sCRM_CustomerActiveStatus_Name
WHERE
	[CRM_CustomerActiveStatus_ID] = @iCRM_CustomerActiveStatus_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_Dic_CRM_CustomerActiveStatus'
-- based on the Primary Key.
-- Gets: @iCRM_CustomerActiveStatus_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_SelectOne]
	@iCRM_CustomerActiveStatus_ID int
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_CustomerActiveStatus_ID],
	[CRM_CustomerActiveStatus_Name]
FROM [dbo].[t_Dic_CRM_CustomerActiveStatus]
WHERE
	[CRM_CustomerActiveStatus_ID] = @iCRM_CustomerActiveStatus_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_Dic_CRM_CustomerActiveStatus'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_CustomerActiveStatus_ID],
	[CRM_CustomerActiveStatus_Name]
FROM [dbo].[t_Dic_CRM_CustomerActiveStatus]
ORDER BY 
	[CRM_CustomerActiveStatus_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_Dic_CRM_CustomerActiveStatus'
-- Gets: @iCRM_CustomerActiveStatus_ID int
-- Gets: @sCRM_CustomerActiveStatus_Name nvarchar(100)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Insert]
	@iCRM_CustomerActiveStatus_ID int,
	@sCRM_CustomerActiveStatus_Name nvarchar(100)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_Dic_CRM_CustomerActiveStatus]
(
	[CRM_CustomerActiveStatus_ID],
	[CRM_CustomerActiveStatus_Name]
)
VALUES
(
	@iCRM_CustomerActiveStatus_ID,
	@sCRM_CustomerActiveStatus_Name
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_Dic_CRM_CustomerActiveStatus'
-- using the Primary Key. 
-- Gets: @iCRM_CustomerActiveStatus_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Dic_CRM_CustomerActiveStatus_Delete]
	@iCRM_CustomerActiveStatus_ID int
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_Dic_CRM_CustomerActiveStatus]
WHERE
	[CRM_CustomerActiveStatus_ID] = @iCRM_CustomerActiveStatus_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_TalkTime_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_TalkTime'
-- Gets: @guidCRM_TalkTime_ID uniqueidentifier
-- Gets: @guidCRM_TalkTime_Customer_ID uniqueidentifier
-- Gets: @guidCRM_TalkTime_EM_ID uniqueidentifier
-- Gets: @daCRM_TalkTime_BeginTime datetime
-- Gets: @daCRM_TalkTime_EndTime datetime
-- Gets: @dcCRM_TalkTime_TotalSecTime numeric(18, 2)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_TalkTime_Update]
	@guidCRM_TalkTime_ID uniqueidentifier,
	@guidCRM_TalkTime_Customer_ID uniqueidentifier,
	@guidCRM_TalkTime_EM_ID uniqueidentifier,
	@daCRM_TalkTime_BeginTime datetime,
	@daCRM_TalkTime_EndTime datetime,
	@dcCRM_TalkTime_TotalSecTime numeric(18, 2)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_TalkTime]
SET 
	[CRM_TalkTime_Customer_ID] = @guidCRM_TalkTime_Customer_ID,
	[CRM_TalkTime_EM_ID] = @guidCRM_TalkTime_EM_ID,
	[CRM_TalkTime_BeginTime] = @daCRM_TalkTime_BeginTime,
	[CRM_TalkTime_EndTime] = @daCRM_TalkTime_EndTime,
	[CRM_TalkTime_TotalSecTime] = @dcCRM_TalkTime_TotalSecTime
WHERE
	[CRM_TalkTime_ID] = @guidCRM_TalkTime_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_TalkTime_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_TalkTime'
-- based on the Primary Key.
-- Gets: @guidCRM_TalkTime_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_TalkTime_SelectOne]
	@guidCRM_TalkTime_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_TalkTime_ID],
	[CRM_TalkTime_Customer_ID],
	[CRM_TalkTime_EM_ID],
	[CRM_TalkTime_BeginTime],
	[CRM_TalkTime_EndTime],
	[CRM_TalkTime_TotalSecTime]
FROM [dbo].[t_CRM_TalkTime]
WHERE
	[CRM_TalkTime_ID] = @guidCRM_TalkTime_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_TalkTime_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_TalkTime'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_TalkTime_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_TalkTime_ID],
	[CRM_TalkTime_Customer_ID],
	[CRM_TalkTime_EM_ID],
	[CRM_TalkTime_BeginTime],
	[CRM_TalkTime_EndTime],
	[CRM_TalkTime_TotalSecTime]
FROM [dbo].[t_CRM_TalkTime]
ORDER BY 
	[CRM_TalkTime_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_TalkTime_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_TalkTime'
-- Gets: @guidCRM_TalkTime_ID uniqueidentifier
-- Gets: @guidCRM_TalkTime_Customer_ID uniqueidentifier
-- Gets: @guidCRM_TalkTime_EM_ID uniqueidentifier
-- Gets: @daCRM_TalkTime_BeginTime datetime
-- Gets: @daCRM_TalkTime_EndTime datetime
-- Gets: @dcCRM_TalkTime_TotalSecTime numeric(18, 2)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_TalkTime_Insert]
	@guidCRM_TalkTime_ID uniqueidentifier,
	@guidCRM_TalkTime_Customer_ID uniqueidentifier,
	@guidCRM_TalkTime_EM_ID uniqueidentifier,
	@daCRM_TalkTime_BeginTime datetime,
	@daCRM_TalkTime_EndTime datetime,
	@dcCRM_TalkTime_TotalSecTime numeric(18, 2)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_TalkTime]
(
	[CRM_TalkTime_ID],
	[CRM_TalkTime_Customer_ID],
	[CRM_TalkTime_EM_ID],
	[CRM_TalkTime_BeginTime],
	[CRM_TalkTime_EndTime],
	[CRM_TalkTime_TotalSecTime]
)
VALUES
(
	@guidCRM_TalkTime_ID,
	@guidCRM_TalkTime_Customer_ID,
	@guidCRM_TalkTime_EM_ID,
	@daCRM_TalkTime_BeginTime,
	@daCRM_TalkTime_EndTime,
	@dcCRM_TalkTime_TotalSecTime
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_TalkTime_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_TalkTime'
-- using the Primary Key. 
-- Gets: @guidCRM_TalkTime_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_TalkTime_Delete]
	@guidCRM_TalkTime_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_TalkTime]
WHERE
	[CRM_TalkTime_ID] = @guidCRM_TalkTime_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_SMS'
-- Gets: @guidCRM_SMS_ID uniqueidentifier
-- Gets: @sCRM_SMS_Operator_EM_Code nvarchar(50)
-- Gets: @sCRM_SMS_Operator_EM_Name nvarchar(50)
-- Gets: @guidCRM_SMS_Customer_ID uniqueidentifier
-- Gets: @sCRM_SMS_Customer_Phone varchar(100)
-- Gets: @daCRM_SMS_SendTime datetime
-- Gets: @sCRM_SMS_Content nvarchar(1000)
-- Gets: @iCRM_SMS_SendCount int
-- Gets: @sCRM_SMS_ReturnStatus nvarchar(50)
-- Gets: @sCRM_SMS_Message nvarchar(50)
-- Gets: @sCRM_SMS_TaskID nvarchar(50)
-- Gets: @sCRM_SMS_TaskID_SuccessCounts nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Update]
	@guidCRM_SMS_ID uniqueidentifier,
	@sCRM_SMS_Operator_EM_Code nvarchar(50),
	@sCRM_SMS_Operator_EM_Name nvarchar(50),
	@guidCRM_SMS_Customer_ID uniqueidentifier,
	@sCRM_SMS_Customer_Phone varchar(100),
	@daCRM_SMS_SendTime datetime,
	@sCRM_SMS_Content nvarchar(1000),
	@iCRM_SMS_SendCount int,
	@sCRM_SMS_ReturnStatus nvarchar(50),
	@sCRM_SMS_Message nvarchar(50),
	@sCRM_SMS_TaskID nvarchar(50),
	@sCRM_SMS_TaskID_SuccessCounts nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_SMS]
SET 
	[CRM_SMS_Operator_EM_Code] = @sCRM_SMS_Operator_EM_Code,
	[CRM_SMS_Operator_EM_Name] = @sCRM_SMS_Operator_EM_Name,
	[CRM_SMS_Customer_ID] = @guidCRM_SMS_Customer_ID,
	[CRM_SMS_Customer_Phone] = @sCRM_SMS_Customer_Phone,
	[CRM_SMS_SendTime] = @daCRM_SMS_SendTime,
	[CRM_SMS_Content] = @sCRM_SMS_Content,
	[CRM_SMS_SendCount] = @iCRM_SMS_SendCount,
	[CRM_SMS_ReturnStatus] = @sCRM_SMS_ReturnStatus,
	[CRM_SMS_Message] = @sCRM_SMS_Message,
	[CRM_SMS_TaskID] = @sCRM_SMS_TaskID,
	[CRM_SMS_TaskID_SuccessCounts] = @sCRM_SMS_TaskID_SuccessCounts
WHERE
	[CRM_SMS_ID] = @guidCRM_SMS_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_SMS'
-- based on the Primary Key.
-- Gets: @guidCRM_SMS_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_SelectOne]
	@guidCRM_SMS_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_SMS_ID],
	[CRM_SMS_Operator_EM_Code],
	[CRM_SMS_Operator_EM_Name],
	[CRM_SMS_Customer_ID],
	[CRM_SMS_Customer_Phone],
	[CRM_SMS_SendTime],
	[CRM_SMS_Content],
	[CRM_SMS_SendCount],
	[CRM_SMS_ReturnStatus],
	[CRM_SMS_Message],
	[CRM_SMS_TaskID],
	[CRM_SMS_TaskID_SuccessCounts]
FROM [dbo].[t_CRM_SMS]
WHERE
	[CRM_SMS_ID] = @guidCRM_SMS_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_SMS'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_SMS_ID],
	[CRM_SMS_Operator_EM_Code],
	[CRM_SMS_Operator_EM_Name],
	[CRM_SMS_Customer_ID],
	[CRM_SMS_Customer_Phone],
	[CRM_SMS_SendTime],
	[CRM_SMS_Content],
	[CRM_SMS_SendCount],
	[CRM_SMS_ReturnStatus],
	[CRM_SMS_Message],
	[CRM_SMS_TaskID],
	[CRM_SMS_TaskID_SuccessCounts]
FROM [dbo].[t_CRM_SMS]
ORDER BY 
	[CRM_SMS_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Recharge_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_SMS_Recharge'
-- Gets: @guidCRM_SMS_Recharge_ID uniqueidentifier
-- Gets: @guidCRM_SMS_Recharge_LimitAmount_ID uniqueidentifier
-- Gets: @lCRM_SMS_Recharge_Recharge bigint
-- Gets: @daCRM_SMS_Recharge_Time datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Recharge_Update]
	@guidCRM_SMS_Recharge_ID uniqueidentifier,
	@guidCRM_SMS_Recharge_LimitAmount_ID uniqueidentifier,
	@lCRM_SMS_Recharge_Recharge bigint,
	@daCRM_SMS_Recharge_Time datetime
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_SMS_Recharge]
SET 
	[CRM_SMS_Recharge_LimitAmount_ID] = @guidCRM_SMS_Recharge_LimitAmount_ID,
	[CRM_SMS_Recharge_Recharge] = @lCRM_SMS_Recharge_Recharge,
	[CRM_SMS_Recharge_Time] = @daCRM_SMS_Recharge_Time
WHERE
	[CRM_SMS_Recharge_ID] = @guidCRM_SMS_Recharge_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Recharge_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_SMS_Recharge'
-- based on the Primary Key.
-- Gets: @guidCRM_SMS_Recharge_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Recharge_SelectOne]
	@guidCRM_SMS_Recharge_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_SMS_Recharge_ID],
	[CRM_SMS_Recharge_LimitAmount_ID],
	[CRM_SMS_Recharge_Recharge],
	[CRM_SMS_Recharge_Time]
FROM [dbo].[t_CRM_SMS_Recharge]
WHERE
	[CRM_SMS_Recharge_ID] = @guidCRM_SMS_Recharge_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Recharge_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_SMS_Recharge'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Recharge_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_SMS_Recharge_ID],
	[CRM_SMS_Recharge_LimitAmount_ID],
	[CRM_SMS_Recharge_Recharge],
	[CRM_SMS_Recharge_Time]
FROM [dbo].[t_CRM_SMS_Recharge]
ORDER BY 
	[CRM_SMS_Recharge_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Recharge_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_SMS_Recharge'
-- Gets: @guidCRM_SMS_Recharge_ID uniqueidentifier
-- Gets: @guidCRM_SMS_Recharge_LimitAmount_ID uniqueidentifier
-- Gets: @lCRM_SMS_Recharge_Recharge bigint
-- Gets: @daCRM_SMS_Recharge_Time datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Recharge_Insert]
	@guidCRM_SMS_Recharge_ID uniqueidentifier,
	@guidCRM_SMS_Recharge_LimitAmount_ID uniqueidentifier,
	@lCRM_SMS_Recharge_Recharge bigint,
	@daCRM_SMS_Recharge_Time datetime
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_SMS_Recharge]
(
	[CRM_SMS_Recharge_ID],
	[CRM_SMS_Recharge_LimitAmount_ID],
	[CRM_SMS_Recharge_Recharge],
	[CRM_SMS_Recharge_Time]
)
VALUES
(
	@guidCRM_SMS_Recharge_ID,
	@guidCRM_SMS_Recharge_LimitAmount_ID,
	@lCRM_SMS_Recharge_Recharge,
	@daCRM_SMS_Recharge_Time
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Recharge_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_SMS_Recharge'
-- using the Primary Key. 
-- Gets: @guidCRM_SMS_Recharge_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Recharge_Delete]
	@guidCRM_SMS_Recharge_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_SMS_Recharge]
WHERE
	[CRM_SMS_Recharge_ID] = @guidCRM_SMS_Recharge_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_LimitAmount_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_SMS_LimitAmount'
-- Gets: @guidCRM_SMS_LimitAmount_ID uniqueidentifier
-- Gets: @guidCRM_SMS_LimitAmount_EM_ID uniqueidentifier
-- Gets: @sCRM_SMS_LimitAmount_EM_Name nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Code nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Level nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Dept nvarchar(50)
-- Gets: @lCRM_SMS_LimitAmount_Amount bigint
-- Gets: @sCRM_SMS_LimitAmount_Type nvarchar(50)
-- Gets: @lCRM_SMS_LimitAmount_Balance bigint
-- Gets: @daCRM_SMS_LimitAmount_Month datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_LimitAmount_Update]
	@guidCRM_SMS_LimitAmount_ID uniqueidentifier,
	@guidCRM_SMS_LimitAmount_EM_ID uniqueidentifier,
	@sCRM_SMS_LimitAmount_EM_Name nvarchar(50),
	@sCRM_SMS_LimitAmount_Code nvarchar(50),
	@sCRM_SMS_LimitAmount_Level nvarchar(50),
	@sCRM_SMS_LimitAmount_Dept nvarchar(50),
	@lCRM_SMS_LimitAmount_Amount bigint,
	@sCRM_SMS_LimitAmount_Type nvarchar(50),
	@lCRM_SMS_LimitAmount_Balance bigint,
	@daCRM_SMS_LimitAmount_Month datetime
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_SMS_LimitAmount]
SET 
	[CRM_SMS_LimitAmount_EM_ID] = @guidCRM_SMS_LimitAmount_EM_ID,
	[CRM_SMS_LimitAmount_EM_Name] = @sCRM_SMS_LimitAmount_EM_Name,
	[CRM_SMS_LimitAmount_Code] = @sCRM_SMS_LimitAmount_Code,
	[CRM_SMS_LimitAmount_Level] = @sCRM_SMS_LimitAmount_Level,
	[CRM_SMS_LimitAmount_Dept] = @sCRM_SMS_LimitAmount_Dept,
	[CRM_SMS_LimitAmount_Amount] = @lCRM_SMS_LimitAmount_Amount,
	[CRM_SMS_LimitAmount_Type] = @sCRM_SMS_LimitAmount_Type,
	[CRM_SMS_LimitAmount_Balance] = @lCRM_SMS_LimitAmount_Balance,
	[CRM_SMS_LimitAmount_Month] = @daCRM_SMS_LimitAmount_Month
WHERE
	[CRM_SMS_LimitAmount_ID] = @guidCRM_SMS_LimitAmount_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_LimitAmount_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_SMS_LimitAmount'
-- based on the Primary Key.
-- Gets: @guidCRM_SMS_LimitAmount_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_LimitAmount_SelectOne]
	@guidCRM_SMS_LimitAmount_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_SMS_LimitAmount_ID],
	[CRM_SMS_LimitAmount_EM_ID],
	[CRM_SMS_LimitAmount_EM_Name],
	[CRM_SMS_LimitAmount_Code],
	[CRM_SMS_LimitAmount_Level],
	[CRM_SMS_LimitAmount_Dept],
	[CRM_SMS_LimitAmount_Amount],
	[CRM_SMS_LimitAmount_Type],
	[CRM_SMS_LimitAmount_Balance],
	[CRM_SMS_LimitAmount_Month]
FROM [dbo].[t_CRM_SMS_LimitAmount]
WHERE
	[CRM_SMS_LimitAmount_ID] = @guidCRM_SMS_LimitAmount_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_LimitAmount_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_SMS_LimitAmount'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_LimitAmount_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_SMS_LimitAmount_ID],
	[CRM_SMS_LimitAmount_EM_ID],
	[CRM_SMS_LimitAmount_EM_Name],
	[CRM_SMS_LimitAmount_Code],
	[CRM_SMS_LimitAmount_Level],
	[CRM_SMS_LimitAmount_Dept],
	[CRM_SMS_LimitAmount_Amount],
	[CRM_SMS_LimitAmount_Type],
	[CRM_SMS_LimitAmount_Balance],
	[CRM_SMS_LimitAmount_Month]
FROM [dbo].[t_CRM_SMS_LimitAmount]
ORDER BY 
	[CRM_SMS_LimitAmount_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_LimitAmount_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_SMS_LimitAmount'
-- Gets: @guidCRM_SMS_LimitAmount_ID uniqueidentifier
-- Gets: @guidCRM_SMS_LimitAmount_EM_ID uniqueidentifier
-- Gets: @sCRM_SMS_LimitAmount_EM_Name nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Code nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Level nvarchar(50)
-- Gets: @sCRM_SMS_LimitAmount_Dept nvarchar(50)
-- Gets: @lCRM_SMS_LimitAmount_Amount bigint
-- Gets: @sCRM_SMS_LimitAmount_Type nvarchar(50)
-- Gets: @lCRM_SMS_LimitAmount_Balance bigint
-- Gets: @daCRM_SMS_LimitAmount_Month datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_LimitAmount_Insert]
	@guidCRM_SMS_LimitAmount_ID uniqueidentifier,
	@guidCRM_SMS_LimitAmount_EM_ID uniqueidentifier,
	@sCRM_SMS_LimitAmount_EM_Name nvarchar(50),
	@sCRM_SMS_LimitAmount_Code nvarchar(50),
	@sCRM_SMS_LimitAmount_Level nvarchar(50),
	@sCRM_SMS_LimitAmount_Dept nvarchar(50),
	@lCRM_SMS_LimitAmount_Amount bigint,
	@sCRM_SMS_LimitAmount_Type nvarchar(50),
	@lCRM_SMS_LimitAmount_Balance bigint,
	@daCRM_SMS_LimitAmount_Month datetime
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_SMS_LimitAmount]
(
	[CRM_SMS_LimitAmount_ID],
	[CRM_SMS_LimitAmount_EM_ID],
	[CRM_SMS_LimitAmount_EM_Name],
	[CRM_SMS_LimitAmount_Code],
	[CRM_SMS_LimitAmount_Level],
	[CRM_SMS_LimitAmount_Dept],
	[CRM_SMS_LimitAmount_Amount],
	[CRM_SMS_LimitAmount_Type],
	[CRM_SMS_LimitAmount_Balance],
	[CRM_SMS_LimitAmount_Month]
)
VALUES
(
	@guidCRM_SMS_LimitAmount_ID,
	@guidCRM_SMS_LimitAmount_EM_ID,
	@sCRM_SMS_LimitAmount_EM_Name,
	@sCRM_SMS_LimitAmount_Code,
	@sCRM_SMS_LimitAmount_Level,
	@sCRM_SMS_LimitAmount_Dept,
	@lCRM_SMS_LimitAmount_Amount,
	@sCRM_SMS_LimitAmount_Type,
	@lCRM_SMS_LimitAmount_Balance,
	@daCRM_SMS_LimitAmount_Month
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_LimitAmount_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_SMS_LimitAmount'
-- using the Primary Key. 
-- Gets: @guidCRM_SMS_LimitAmount_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_LimitAmount_Delete]
	@guidCRM_SMS_LimitAmount_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_SMS_LimitAmount]
WHERE
	[CRM_SMS_LimitAmount_ID] = @guidCRM_SMS_LimitAmount_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_SMS'
-- Gets: @guidCRM_SMS_ID uniqueidentifier
-- Gets: @sCRM_SMS_Operator_EM_Code nvarchar(50)
-- Gets: @sCRM_SMS_Operator_EM_Name nvarchar(50)
-- Gets: @guidCRM_SMS_Customer_ID uniqueidentifier
-- Gets: @sCRM_SMS_Customer_Phone varchar(100)
-- Gets: @daCRM_SMS_SendTime datetime
-- Gets: @sCRM_SMS_Content nvarchar(1000)
-- Gets: @iCRM_SMS_SendCount int
-- Gets: @sCRM_SMS_ReturnStatus nvarchar(50)
-- Gets: @sCRM_SMS_Message nvarchar(50)
-- Gets: @sCRM_SMS_TaskID nvarchar(50)
-- Gets: @sCRM_SMS_TaskID_SuccessCounts nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Insert]
	@guidCRM_SMS_ID uniqueidentifier,
	@sCRM_SMS_Operator_EM_Code nvarchar(50),
	@sCRM_SMS_Operator_EM_Name nvarchar(50),
	@guidCRM_SMS_Customer_ID uniqueidentifier,
	@sCRM_SMS_Customer_Phone varchar(100),
	@daCRM_SMS_SendTime datetime,
	@sCRM_SMS_Content nvarchar(1000),
	@iCRM_SMS_SendCount int,
	@sCRM_SMS_ReturnStatus nvarchar(50),
	@sCRM_SMS_Message nvarchar(50),
	@sCRM_SMS_TaskID nvarchar(50),
	@sCRM_SMS_TaskID_SuccessCounts nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_SMS]
(
	[CRM_SMS_ID],
	[CRM_SMS_Operator_EM_Code],
	[CRM_SMS_Operator_EM_Name],
	[CRM_SMS_Customer_ID],
	[CRM_SMS_Customer_Phone],
	[CRM_SMS_SendTime],
	[CRM_SMS_Content],
	[CRM_SMS_SendCount],
	[CRM_SMS_ReturnStatus],
	[CRM_SMS_Message],
	[CRM_SMS_TaskID],
	[CRM_SMS_TaskID_SuccessCounts]
)
VALUES
(
	@guidCRM_SMS_ID,
	@sCRM_SMS_Operator_EM_Code,
	@sCRM_SMS_Operator_EM_Name,
	@guidCRM_SMS_Customer_ID,
	@sCRM_SMS_Customer_Phone,
	@daCRM_SMS_SendTime,
	@sCRM_SMS_Content,
	@iCRM_SMS_SendCount,
	@sCRM_SMS_ReturnStatus,
	@sCRM_SMS_Message,
	@sCRM_SMS_TaskID,
	@sCRM_SMS_TaskID_SuccessCounts
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_SMS_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_SMS'
-- using the Primary Key. 
-- Gets: @guidCRM_SMS_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_SMS_Delete]
	@guidCRM_SMS_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_SMS]
WHERE
	[CRM_SMS_ID] = @guidCRM_SMS_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_RoleAssign_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_RoleAssign'
-- Gets: @guidCRM_RoleAssign_ID uniqueidentifier
-- Gets: @sCRM_RoleAssign_Code nvarchar(50)
-- Gets: @sCRM_RoleAssign_RoleName nvarchar(20)
-- Gets: @daCRM_RoleAssign_CreateTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_RoleAssign_Update]
	@guidCRM_RoleAssign_ID uniqueidentifier,
	@sCRM_RoleAssign_Code nvarchar(50),
	@sCRM_RoleAssign_RoleName nvarchar(20),
	@daCRM_RoleAssign_CreateTime datetime
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_RoleAssign]
SET 
	[CRM_RoleAssign_Code] = @sCRM_RoleAssign_Code,
	[CRM_RoleAssign_RoleName] = @sCRM_RoleAssign_RoleName,
	[CRM_RoleAssign_CreateTime] = @daCRM_RoleAssign_CreateTime
WHERE
	[CRM_RoleAssign_ID] = @guidCRM_RoleAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_RoleAssign_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_RoleAssign'
-- based on the Primary Key.
-- Gets: @guidCRM_RoleAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_RoleAssign_SelectOne]
	@guidCRM_RoleAssign_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_RoleAssign_ID],
	[CRM_RoleAssign_Code],
	[CRM_RoleAssign_RoleName],
	[CRM_RoleAssign_CreateTime]
FROM [dbo].[t_CRM_RoleAssign]
WHERE
	[CRM_RoleAssign_ID] = @guidCRM_RoleAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_RoleAssign_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_RoleAssign'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_RoleAssign_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_RoleAssign_ID],
	[CRM_RoleAssign_Code],
	[CRM_RoleAssign_RoleName],
	[CRM_RoleAssign_CreateTime]
FROM [dbo].[t_CRM_RoleAssign]
ORDER BY 
	[CRM_RoleAssign_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_RoleAssign_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_RoleAssign'
-- Gets: @guidCRM_RoleAssign_ID uniqueidentifier
-- Gets: @sCRM_RoleAssign_Code nvarchar(50)
-- Gets: @sCRM_RoleAssign_RoleName nvarchar(20)
-- Gets: @daCRM_RoleAssign_CreateTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_RoleAssign_Insert]
	@guidCRM_RoleAssign_ID uniqueidentifier,
	@sCRM_RoleAssign_Code nvarchar(50),
	@sCRM_RoleAssign_RoleName nvarchar(20),
	@daCRM_RoleAssign_CreateTime datetime
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_RoleAssign]
(
	[CRM_RoleAssign_ID],
	[CRM_RoleAssign_Code],
	[CRM_RoleAssign_RoleName],
	[CRM_RoleAssign_CreateTime]
)
VALUES
(
	@guidCRM_RoleAssign_ID,
	@sCRM_RoleAssign_Code,
	@sCRM_RoleAssign_RoleName,
	@daCRM_RoleAssign_CreateTime
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_RoleAssign_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_RoleAssign'
-- using the Primary Key. 
-- Gets: @guidCRM_RoleAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_RoleAssign_Delete]
	@guidCRM_RoleAssign_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_RoleAssign]
WHERE
	[CRM_RoleAssign_ID] = @guidCRM_RoleAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Role_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Role'
-- Gets: @guidRole_ID uniqueidentifier
-- Gets: @sRole_Name nvarchar(20)
-- Gets: @sDescr nvarchar(100)
-- Gets: @sData_Extend nvarchar(20)
-- Gets: @sExtend_Dept text
-- Gets: @sPermission nvarchar(4000)
-- Gets: @daCreate_Date datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Role_Update]
	@guidRole_ID uniqueidentifier,
	@sRole_Name nvarchar(20),
	@sDescr nvarchar(100),
	@sData_Extend nvarchar(20),
	@sExtend_Dept text,
	@sPermission nvarchar(4000),
	@daCreate_Date datetime
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Role]
SET 
	[Role_ID] = @guidRole_ID,
	[Descr] = @sDescr,
	[Data_Extend] = @sData_Extend,
	[Extend_Dept] = @sExtend_Dept,
	[Permission] = @sPermission,
	[Create_Date] = @daCreate_Date
WHERE
	[Role_Name] = @sRole_Name
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Role_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Role'
-- based on the Primary Key.
-- Gets: @sRole_Name nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Role_SelectOne]
	@sRole_Name nvarchar(20)
AS
-- SELECT an existing row from the table.
SELECT
	[Role_ID],
	[Role_Name],
	[Descr],
	[Data_Extend],
	[Extend_Dept],
	[Permission],
	[Create_Date]
FROM [dbo].[t_CRM_Role]
WHERE
	[Role_Name] = @sRole_Name
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Role_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Role'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Role_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Role_ID],
	[Role_Name],
	[Descr],
	[Data_Extend],
	[Extend_Dept],
	[Permission],
	[Create_Date]
FROM [dbo].[t_CRM_Role]
ORDER BY 
	[Role_Name] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Role_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Role'
-- Gets: @guidRole_ID uniqueidentifier
-- Gets: @sRole_Name nvarchar(20)
-- Gets: @sDescr nvarchar(100)
-- Gets: @sData_Extend nvarchar(20)
-- Gets: @sExtend_Dept text
-- Gets: @sPermission nvarchar(4000)
-- Gets: @daCreate_Date datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Role_Insert]
	@guidRole_ID uniqueidentifier,
	@sRole_Name nvarchar(20),
	@sDescr nvarchar(100),
	@sData_Extend nvarchar(20),
	@sExtend_Dept text,
	@sPermission nvarchar(4000),
	@daCreate_Date datetime
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Role]
(
	[Role_ID],
	[Role_Name],
	[Descr],
	[Data_Extend],
	[Extend_Dept],
	[Permission],
	[Create_Date]
)
VALUES
(
	ISNULL(@guidRole_ID, (newid())),
	@sRole_Name,
	ISNULL(@sDescr, (N'')),
	ISNULL(@sData_Extend, (N'')),
	ISNULL(@sExtend_Dept, ('')),
	ISNULL(@sPermission, (N'')),
	ISNULL(@daCreate_Date, (getdate()))
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Role_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Role'
-- using the Primary Key. 
-- Gets: @sRole_Name nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Role_Delete]
	@sRole_Name nvarchar(20)
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Role]
WHERE
	[Role_Name] = @sRole_Name
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Requirement'
-- Gets: @guidCRM_Requirement_ID uniqueidentifier
-- Gets: @iCRM_Requirement_Customer_ID int
-- Gets: @iCRM_Requirement_RequirementClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_Update]
	@guidCRM_Requirement_ID uniqueidentifier,
	@iCRM_Requirement_Customer_ID uniqueidentifier,
	@iCRM_Requirement_RequirementClass_ID int
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Requirement]
SET 
	[CRM_Requirement_Customer_ID] = @iCRM_Requirement_Customer_ID,
	[CRM_Requirement_RequirementClass_ID] = @iCRM_Requirement_RequirementClass_ID
WHERE
	[CRM_Requirement_ID] = @guidCRM_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Requirement'
-- based on the Primary Key.
-- Gets: @guidCRM_Requirement_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_SelectOne]
	@guidCRM_Requirement_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_Requirement_ID],
	[CRM_Requirement_Customer_ID],
	[CRM_Requirement_RequirementClass_ID]
FROM [dbo].[t_CRM_Requirement]
WHERE
	[CRM_Requirement_ID] = @guidCRM_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Requirement'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_Requirement_ID],
	[CRM_Requirement_Customer_ID],
	[CRM_Requirement_RequirementClass_ID]
FROM [dbo].[t_CRM_Requirement]
ORDER BY 
	[CRM_Requirement_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Requirement'
-- Gets: @guidCRM_Requirement_ID uniqueidentifier
-- Gets: @iCRM_Requirement_Customer_ID int
-- Gets: @iCRM_Requirement_RequirementClass_ID int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_Insert]
	@guidCRM_Requirement_ID uniqueidentifier,
	@iCRM_Requirement_Customer_ID uniqueidentifier,
	@iCRM_Requirement_RequirementClass_ID int
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Requirement]
(
	[CRM_Requirement_ID],
	[CRM_Requirement_Customer_ID],
	[CRM_Requirement_RequirementClass_ID]
)
VALUES
(
	@guidCRM_Requirement_ID,
	@iCRM_Requirement_Customer_ID,
	@iCRM_Requirement_RequirementClass_ID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_History_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Requirement_History'
-- Gets: @guidCRM_History_Requirement_ID uniqueidentifier
-- Gets: @iCRM_History_Requirement_RequirementClass_ID int
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_History_Update]
	@guidCRM_History_Requirement_ID uniqueidentifier,
	@iCRM_History_Requirement_RequirementClass_ID int,
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Requirement_History]
SET 
	[CRM_History_Requirement_RequirementClass_ID] = @iCRM_History_Requirement_RequirementClass_ID,
	[CRM_Customer_History_ID] = @guidCRM_Customer_History_ID
WHERE
	[CRM_History_Requirement_ID] = @guidCRM_History_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_History_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Requirement_History'
-- based on the Primary Key.
-- Gets: @guidCRM_History_Requirement_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_History_SelectOne]
	@guidCRM_History_Requirement_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_History_Requirement_ID],
	[CRM_History_Requirement_RequirementClass_ID],
	[CRM_Customer_History_ID]
FROM [dbo].[t_CRM_Requirement_History]
WHERE
	[CRM_History_Requirement_ID] = @guidCRM_History_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_History_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Requirement_History'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_History_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_History_Requirement_ID],
	[CRM_History_Requirement_RequirementClass_ID],
	[CRM_Customer_History_ID]
FROM [dbo].[t_CRM_Requirement_History]
ORDER BY 
	[CRM_History_Requirement_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_History_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Requirement_History'
-- Gets: @guidCRM_History_Requirement_ID uniqueidentifier
-- Gets: @iCRM_History_Requirement_RequirementClass_ID int
-- Gets: @guidCRM_Customer_History_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_History_Insert]
	@guidCRM_History_Requirement_ID uniqueidentifier,
	@iCRM_History_Requirement_RequirementClass_ID int,
	@guidCRM_Customer_History_ID uniqueidentifier
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Requirement_History]
(
	[CRM_History_Requirement_ID],
	[CRM_History_Requirement_RequirementClass_ID],
	[CRM_Customer_History_ID]
)
VALUES
(
	@guidCRM_History_Requirement_ID,
	@iCRM_History_Requirement_RequirementClass_ID,
	@guidCRM_Customer_History_ID
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_History_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Requirement_History'
-- using the Primary Key. 
-- Gets: @guidCRM_History_Requirement_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_History_Delete]
	@guidCRM_History_Requirement_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Requirement_History]
WHERE
	[CRM_History_Requirement_ID] = @guidCRM_History_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Requirement_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Requirement'
-- using the Primary Key. 
-- Gets: @guidCRM_Requirement_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Requirement_Delete]
	@guidCRM_Requirement_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Requirement]
WHERE
	[CRM_Requirement_ID] = @guidCRM_Requirement_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectInfo_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_ProjectInfo'
-- Gets: @guidCRM_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_ProjectInfo_Name nvarchar(100)
-- Gets: @sCRM_ProjectInfo_Remark nvarchar(1000)
-- Gets: @sCRM_ProjectInfo_ContactMan nvarchar(50)
-- Gets: @sCRM_ProjectInfo_ContactWay nvarchar(50)
-- Gets: @daCRM_ProjectInfo_BeginTime datetime
-- Gets: @daCRM_ProjectInfo_EndTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectInfo_Update]
	@guidCRM_ProjectInfo_ID uniqueidentifier,
	@sCRM_ProjectInfo_Name nvarchar(100),
	@sCRM_ProjectInfo_Remark nvarchar(1000),
	@sCRM_ProjectInfo_ContactMan nvarchar(50),
	@sCRM_ProjectInfo_ContactWay nvarchar(50),
	@daCRM_ProjectInfo_BeginTime datetime,
	@daCRM_ProjectInfo_EndTime datetime,
	@sCRM_ProjectInfo_PY nvarchar(100)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_ProjectInfo]
SET 
	[CRM_ProjectInfo_Name] = @sCRM_ProjectInfo_Name,
	[CRM_ProjectInfo_Remark] = @sCRM_ProjectInfo_Remark,
	[CRM_ProjectInfo_ContactMan] = @sCRM_ProjectInfo_ContactMan,
	[CRM_ProjectInfo_ContactWay] = @sCRM_ProjectInfo_ContactWay,
	[CRM_ProjectInfo_BeginTime] = @daCRM_ProjectInfo_BeginTime,
	[CRM_ProjectInfo_EndTime] = @daCRM_ProjectInfo_EndTime,
	[CRM_ProjectInfo_PY] = @sCRM_ProjectInfo_PY
WHERE
	[CRM_ProjectInfo_ID] = @guidCRM_ProjectInfo_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectInfo_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_ProjectInfo'
-- based on the Primary Key.
-- Gets: @guidCRM_ProjectInfo_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectInfo_SelectOne]
	@guidCRM_ProjectInfo_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_ProjectInfo_ID],
	[CRM_ProjectInfo_Name],
	[CRM_ProjectInfo_Remark],
	[CRM_ProjectInfo_ContactMan],
	[CRM_ProjectInfo_ContactWay],
	[CRM_ProjectInfo_BeginTime],
	[CRM_ProjectInfo_EndTime],
	[CRM_ProjectInfo_PY]
FROM [dbo].[t_CRM_ProjectInfo]
WHERE
	[CRM_ProjectInfo_ID] = @guidCRM_ProjectInfo_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectInfo_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_ProjectInfo'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectInfo_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_ProjectInfo_ID],
	[CRM_ProjectInfo_Name],
	[CRM_ProjectInfo_Remark],
	[CRM_ProjectInfo_ContactMan],
	[CRM_ProjectInfo_ContactWay],
	[CRM_ProjectInfo_BeginTime],
	[CRM_ProjectInfo_EndTime],
	[CRM_ProjectInfo_PY]
FROM [dbo].[t_CRM_ProjectInfo]
ORDER BY 
	[CRM_ProjectInfo_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectInfo_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_ProjectInfo'
-- Gets: @guidCRM_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_ProjectInfo_Name nvarchar(100)
-- Gets: @sCRM_ProjectInfo_Remark nvarchar(1000)
-- Gets: @sCRM_ProjectInfo_ContactMan nvarchar(50)
-- Gets: @sCRM_ProjectInfo_ContactWay nvarchar(50)
-- Gets: @daCRM_ProjectInfo_BeginTime datetime
-- Gets: @daCRM_ProjectInfo_EndTime datetime
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectInfo_Insert]
	@guidCRM_ProjectInfo_ID uniqueidentifier,
	@sCRM_ProjectInfo_Name nvarchar(100),
	@sCRM_ProjectInfo_Remark nvarchar(1000),
	@sCRM_ProjectInfo_ContactMan nvarchar(50),
	@sCRM_ProjectInfo_ContactWay nvarchar(50),
	@daCRM_ProjectInfo_BeginTime datetime,
	@daCRM_ProjectInfo_EndTime datetime,
	@sCRM_ProjectInfo_PY nvarchar(100)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_ProjectInfo]
(
	[CRM_ProjectInfo_ID],
	[CRM_ProjectInfo_Name],
	[CRM_ProjectInfo_Remark],
	[CRM_ProjectInfo_ContactMan],
	[CRM_ProjectInfo_ContactWay],
	[CRM_ProjectInfo_BeginTime],
	[CRM_ProjectInfo_EndTime],
	[CRM_ProjectInfo_PY]
)
VALUES
(
	@guidCRM_ProjectInfo_ID,
	@sCRM_ProjectInfo_Name,
	@sCRM_ProjectInfo_Remark,
	@sCRM_ProjectInfo_ContactMan,
	@sCRM_ProjectInfo_ContactWay,
	@daCRM_ProjectInfo_BeginTime,
	@daCRM_ProjectInfo_EndTime,
	@sCRM_ProjectInfo_PY
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectInfo_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_ProjectInfo'
-- using the Primary Key. 
-- Gets: @guidCRM_ProjectInfo_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectInfo_Delete]
	@guidCRM_ProjectInfo_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_ProjectInfo]
WHERE
	[CRM_ProjectInfo_ID] = @guidCRM_ProjectInfo_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectFile_Update]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_ProjectFile'
-- Gets: @guidCRM_ProjectFile_ID uniqueidentifier
-- Gets: @sCRM_ProjectFile_Name nvarchar(200)
-- Gets: @sCRM_ProjectFile_Extensions nvarchar(200)
-- Gets: @sCRM_ProjectFile_Path nvarchar(1000)
-- Gets: @daCRM_ProjectFile_CreateTime datetime
-- Gets: @guidCRM_ProjectFile_ProjectInfo_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectFile_Update]
	@guidCRM_ProjectFile_ID uniqueidentifier,
	@sCRM_ProjectFile_Name nvarchar(200),
	@sCRM_ProjectFile_Extensions nvarchar(200),
	@sCRM_ProjectFile_Path nvarchar(1000),
	@daCRM_ProjectFile_CreateTime datetime,
	@guidCRM_ProjectFile_ProjectInfo_ID uniqueidentifier,
	@sCRM_ProjectFile_Remark nvarchar(1000)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_ProjectFile]
SET 
	[CRM_ProjectFile_Name] = @sCRM_ProjectFile_Name,
	[CRM_ProjectFile_Extensions] = @sCRM_ProjectFile_Extensions,
	[CRM_ProjectFile_Path] = @sCRM_ProjectFile_Path,
	[CRM_ProjectFile_CreateTime] = @daCRM_ProjectFile_CreateTime,
	[CRM_ProjectFile_ProjectInfo_ID] = @guidCRM_ProjectFile_ProjectInfo_ID,
	[CRM_ProjectFile_Remark] = @sCRM_ProjectFile_Remark
WHERE
	[CRM_ProjectFile_ID] = @guidCRM_ProjectFile_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectFile_SelectOne]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_ProjectFile'
-- based on the Primary Key.
-- Gets: @guidCRM_ProjectFile_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectFile_SelectOne]
	@guidCRM_ProjectFile_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_ProjectFile_ID],
	[CRM_ProjectFile_Name],
	[CRM_ProjectFile_Extensions],
	[CRM_ProjectFile_Path],
	[CRM_ProjectFile_CreateTime],
	[CRM_ProjectFile_ProjectInfo_ID],
	[CRM_ProjectFile_Remark]
FROM [dbo].[t_CRM_ProjectFile]
WHERE
	[CRM_ProjectFile_ID] = @guidCRM_ProjectFile_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectFile_SelectAll]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_ProjectFile'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectFile_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_ProjectFile_ID],
	[CRM_ProjectFile_Name],
	[CRM_ProjectFile_Extensions],
	[CRM_ProjectFile_Path],
	[CRM_ProjectFile_CreateTime],
	[CRM_ProjectFile_ProjectInfo_ID],
	[CRM_ProjectFile_Remark]
FROM [dbo].[t_CRM_ProjectFile]
ORDER BY 
	[CRM_ProjectFile_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectFile_Insert]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_ProjectFile'
-- Gets: @guidCRM_ProjectFile_ID uniqueidentifier
-- Gets: @sCRM_ProjectFile_Name nvarchar(200)
-- Gets: @sCRM_ProjectFile_Extensions nvarchar(200)
-- Gets: @sCRM_ProjectFile_Path nvarchar(1000)
-- Gets: @daCRM_ProjectFile_CreateTime datetime
-- Gets: @guidCRM_ProjectFile_ProjectInfo_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectFile_Insert]
	@guidCRM_ProjectFile_ID uniqueidentifier,
	@sCRM_ProjectFile_Name nvarchar(200),
	@sCRM_ProjectFile_Extensions nvarchar(200),
	@sCRM_ProjectFile_Path nvarchar(1000),
	@daCRM_ProjectFile_CreateTime datetime,
	@guidCRM_ProjectFile_ProjectInfo_ID uniqueidentifier,
	@sCRM_ProjectFile_Remark nvarchar(1000)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_ProjectFile]
(
	[CRM_ProjectFile_ID],
	[CRM_ProjectFile_Name],
	[CRM_ProjectFile_Extensions],
	[CRM_ProjectFile_Path],
	[CRM_ProjectFile_CreateTime],
	[CRM_ProjectFile_ProjectInfo_ID],
	[CRM_ProjectFile_Remark]
)
VALUES
(
	@guidCRM_ProjectFile_ID,
	@sCRM_ProjectFile_Name,
	@sCRM_ProjectFile_Extensions,
	@sCRM_ProjectFile_Path,
	@daCRM_ProjectFile_CreateTime,
	@guidCRM_ProjectFile_ProjectInfo_ID,
	@sCRM_ProjectFile_Remark
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_ProjectFile_Delete]    Script Date: 11/13/2013 13:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_ProjectFile'
-- using the Primary Key. 
-- Gets: @guidCRM_ProjectFile_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_ProjectFile_Delete]
	@guidCRM_ProjectFile_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_ProjectFile]
WHERE
	[CRM_ProjectFile_ID] = @guidCRM_ProjectFile_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobToDept_Update]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_PartTimeJobToDept'
-- Gets: @guidCRM_PartTimeJobToDept_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobToDept_DeptName nvarchar(50)
-- Gets: @sCRM_PartTimeJobToDept_EmpCode nvarchar(20)
-- Gets: @guidCRM_PartTimeJobToDept_EmpID uniqueidentifier
-- Gets: @guidCRM_PartTimeJobToDept_SuperVisorID uniqueidentifier
-- Gets: @sCRM_PartTimeJobToDept_SuperVisorCode nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobToDept_Update]
	@guidCRM_PartTimeJobToDept_ID uniqueidentifier,
	@sCRM_PartTimeJobToDept_DeptName nvarchar(50),
	@sCRM_PartTimeJobToDept_EmpCode nvarchar(20),
	@guidCRM_PartTimeJobToDept_EmpID uniqueidentifier,
	@guidCRM_PartTimeJobToDept_SuperVisorID uniqueidentifier,
	@sCRM_PartTimeJobToDept_SuperVisorCode nvarchar(20)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_PartTimeJobToDept]
SET 
	[CRM_PartTimeJobToDept_DeptName] = @sCRM_PartTimeJobToDept_DeptName,
	[CRM_PartTimeJobToDept_EmpCode] = @sCRM_PartTimeJobToDept_EmpCode,
	[CRM_PartTimeJobToDept_EmpID] = @guidCRM_PartTimeJobToDept_EmpID,
	[CRM_PartTimeJobToDept_SuperVisorID] = @guidCRM_PartTimeJobToDept_SuperVisorID,
	[CRM_PartTimeJobToDept_SuperVisorCode] = @sCRM_PartTimeJobToDept_SuperVisorCode
WHERE
	[CRM_PartTimeJobToDept_ID] = @guidCRM_PartTimeJobToDept_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobToDept_SelectOne]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_PartTimeJobToDept'
-- based on the Primary Key.
-- Gets: @guidCRM_PartTimeJobToDept_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobToDept_SelectOne]
	@guidCRM_PartTimeJobToDept_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_PartTimeJobToDept_ID],
	[CRM_PartTimeJobToDept_DeptName],
	[CRM_PartTimeJobToDept_EmpCode],
	[CRM_PartTimeJobToDept_EmpID],
	[CRM_PartTimeJobToDept_SuperVisorID],
	[CRM_PartTimeJobToDept_SuperVisorCode]
FROM [dbo].[t_CRM_PartTimeJobToDept]
WHERE
	[CRM_PartTimeJobToDept_ID] = @guidCRM_PartTimeJobToDept_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobToDept_SelectAll]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_PartTimeJobToDept'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobToDept_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_PartTimeJobToDept_ID],
	[CRM_PartTimeJobToDept_DeptName],
	[CRM_PartTimeJobToDept_EmpCode],
	[CRM_PartTimeJobToDept_EmpID],
	[CRM_PartTimeJobToDept_SuperVisorID],
	[CRM_PartTimeJobToDept_SuperVisorCode]
FROM [dbo].[t_CRM_PartTimeJobToDept]
ORDER BY 
	[CRM_PartTimeJobToDept_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobToDept_Insert]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_PartTimeJobToDept'
-- Gets: @guidCRM_PartTimeJobToDept_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobToDept_DeptName nvarchar(50)
-- Gets: @sCRM_PartTimeJobToDept_EmpCode nvarchar(20)
-- Gets: @guidCRM_PartTimeJobToDept_EmpID uniqueidentifier
-- Gets: @guidCRM_PartTimeJobToDept_SuperVisorID uniqueidentifier
-- Gets: @sCRM_PartTimeJobToDept_SuperVisorCode nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobToDept_Insert]
	@guidCRM_PartTimeJobToDept_ID uniqueidentifier,
	@sCRM_PartTimeJobToDept_DeptName nvarchar(50),
	@sCRM_PartTimeJobToDept_EmpCode nvarchar(20),
	@guidCRM_PartTimeJobToDept_EmpID uniqueidentifier,
	@guidCRM_PartTimeJobToDept_SuperVisorID uniqueidentifier,
	@sCRM_PartTimeJobToDept_SuperVisorCode nvarchar(20)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_PartTimeJobToDept]
(
	[CRM_PartTimeJobToDept_ID],
	[CRM_PartTimeJobToDept_DeptName],
	[CRM_PartTimeJobToDept_EmpCode],
	[CRM_PartTimeJobToDept_EmpID],
	[CRM_PartTimeJobToDept_SuperVisorID],
	[CRM_PartTimeJobToDept_SuperVisorCode]
)
VALUES
(
	@guidCRM_PartTimeJobToDept_ID,
	@sCRM_PartTimeJobToDept_DeptName,
	@sCRM_PartTimeJobToDept_EmpCode,
	@guidCRM_PartTimeJobToDept_EmpID,
	@guidCRM_PartTimeJobToDept_SuperVisorID,
	@sCRM_PartTimeJobToDept_SuperVisorCode
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobToDept_Delete]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_PartTimeJobToDept'
-- using the Primary Key. 
-- Gets: @guidCRM_PartTimeJobToDept_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobToDept_Delete]
	@guidCRM_PartTimeJobToDept_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_PartTimeJobToDept]
WHERE
	[CRM_PartTimeJobToDept_ID] = @guidCRM_PartTimeJobToDept_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobEAssign_Update]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_PartTimeJobEAssign'
-- Gets: @guidCRM_PartTimeJobEAssign_ID uniqueidentifier
-- Gets: @guidCRM_PartTimeJobEAssign_Customer_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobEAssign_Code nvarchar(20)
-- Gets: @daCRM_PartTimeJobEAssign_CreateTime datetime
-- Gets: @sCRM_PartTimeJobEAssign_Remark nvarchar(1000)
-- Gets: @guidCRM_PartTimeJobEAssign_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobEAssign_SalesName nvarchar(50)
-- Gets: @sCRM_PartTimeJobEAssign_SuperName nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobEAssign_Update]
	@guidCRM_PartTimeJobEAssign_ID uniqueidentifier,
	@guidCRM_PartTimeJobEAssign_Customer_ID uniqueidentifier,
	@sCRM_PartTimeJobEAssign_Code nvarchar(20),
	@daCRM_PartTimeJobEAssign_CreateTime datetime,
	@sCRM_PartTimeJobEAssign_Remark nvarchar(1000),
	@guidCRM_PartTimeJobEAssign_ProjectInfo_ID uniqueidentifier,
	@sCRM_PartTimeJobEAssign_SalesName nvarchar(50),
	@sCRM_PartTimeJobEAssign_SuperName nvarchar(50)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_PartTimeJobEAssign]
SET 
	[CRM_PartTimeJobEAssign_Customer_ID] = @guidCRM_PartTimeJobEAssign_Customer_ID,
	[CRM_PartTimeJobEAssign_Code] = @sCRM_PartTimeJobEAssign_Code,
	[CRM_PartTimeJobEAssign_CreateTime] = @daCRM_PartTimeJobEAssign_CreateTime,
	[CRM_PartTimeJobEAssign_Remark] = @sCRM_PartTimeJobEAssign_Remark,
	[CRM_PartTimeJobEAssign_ProjectInfo_ID] = @guidCRM_PartTimeJobEAssign_ProjectInfo_ID,
	[CRM_PartTimeJobEAssign_SalesName] = @sCRM_PartTimeJobEAssign_SalesName,
	[CRM_PartTimeJobEAssign_SuperName] = @sCRM_PartTimeJobEAssign_SuperName
WHERE
	[CRM_PartTimeJobEAssign_ID] = @guidCRM_PartTimeJobEAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobEAssign_SelectOne]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_PartTimeJobEAssign'
-- based on the Primary Key.
-- Gets: @guidCRM_PartTimeJobEAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobEAssign_SelectOne]
	@guidCRM_PartTimeJobEAssign_ID uniqueidentifier
AS
-- SELECT an existing row from the table.
SELECT
	[CRM_PartTimeJobEAssign_ID],
	[CRM_PartTimeJobEAssign_Customer_ID],
	[CRM_PartTimeJobEAssign_Code],
	[CRM_PartTimeJobEAssign_CreateTime],
	[CRM_PartTimeJobEAssign_Remark],
	[CRM_PartTimeJobEAssign_ProjectInfo_ID],
	[CRM_PartTimeJobEAssign_SalesName],
	[CRM_PartTimeJobEAssign_SuperName]
FROM [dbo].[t_CRM_PartTimeJobEAssign]
WHERE
	[CRM_PartTimeJobEAssign_ID] = @guidCRM_PartTimeJobEAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobEAssign_SelectAll]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_PartTimeJobEAssign'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobEAssign_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[CRM_PartTimeJobEAssign_ID],
	[CRM_PartTimeJobEAssign_Customer_ID],
	[CRM_PartTimeJobEAssign_Code],
	[CRM_PartTimeJobEAssign_CreateTime],
	[CRM_PartTimeJobEAssign_Remark],
	[CRM_PartTimeJobEAssign_ProjectInfo_ID],
	[CRM_PartTimeJobEAssign_SalesName],
	[CRM_PartTimeJobEAssign_SuperName]
FROM [dbo].[t_CRM_PartTimeJobEAssign]
ORDER BY 
	[CRM_PartTimeJobEAssign_ID] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobEAssign_Insert]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_PartTimeJobEAssign'
-- Gets: @guidCRM_PartTimeJobEAssign_ID uniqueidentifier
-- Gets: @guidCRM_PartTimeJobEAssign_Customer_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobEAssign_Code nvarchar(20)
-- Gets: @daCRM_PartTimeJobEAssign_CreateTime datetime
-- Gets: @sCRM_PartTimeJobEAssign_Remark nvarchar(1000)
-- Gets: @guidCRM_PartTimeJobEAssign_ProjectInfo_ID uniqueidentifier
-- Gets: @sCRM_PartTimeJobEAssign_SalesName nvarchar(50)
-- Gets: @sCRM_PartTimeJobEAssign_SuperName nvarchar(50)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobEAssign_Insert]
	@guidCRM_PartTimeJobEAssign_ID uniqueidentifier,
	@guidCRM_PartTimeJobEAssign_Customer_ID uniqueidentifier,
	@sCRM_PartTimeJobEAssign_Code nvarchar(20),
	@daCRM_PartTimeJobEAssign_CreateTime datetime,
	@sCRM_PartTimeJobEAssign_Remark nvarchar(1000),
	@guidCRM_PartTimeJobEAssign_ProjectInfo_ID uniqueidentifier,
	@sCRM_PartTimeJobEAssign_SalesName nvarchar(50),
	@sCRM_PartTimeJobEAssign_SuperName nvarchar(50)
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_PartTimeJobEAssign]
(
	[CRM_PartTimeJobEAssign_ID],
	[CRM_PartTimeJobEAssign_Customer_ID],
	[CRM_PartTimeJobEAssign_Code],
	[CRM_PartTimeJobEAssign_CreateTime],
	[CRM_PartTimeJobEAssign_Remark],
	[CRM_PartTimeJobEAssign_ProjectInfo_ID],
	[CRM_PartTimeJobEAssign_SalesName],
	[CRM_PartTimeJobEAssign_SuperName]
)
VALUES
(
	@guidCRM_PartTimeJobEAssign_ID,
	@guidCRM_PartTimeJobEAssign_Customer_ID,
	@sCRM_PartTimeJobEAssign_Code,
	@daCRM_PartTimeJobEAssign_CreateTime,
	@sCRM_PartTimeJobEAssign_Remark,
	@guidCRM_PartTimeJobEAssign_ProjectInfo_ID,
	@sCRM_PartTimeJobEAssign_SalesName,
	@sCRM_PartTimeJobEAssign_SuperName
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_PartTimeJobEAssign_Delete]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_PartTimeJobEAssign'
-- using the Primary Key. 
-- Gets: @guidCRM_PartTimeJobEAssign_ID uniqueidentifier
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_PartTimeJobEAssign_Delete]
	@guidCRM_PartTimeJobEAssign_ID uniqueidentifier
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_PartTimeJobEAssign]
WHERE
	[CRM_PartTimeJobEAssign_ID] = @guidCRM_PartTimeJobEAssign_ID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_UpdateAllWEmp_CodeLogic]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update one or more existing rows in the table 't_CRM_Login'.
-- Will reset field [Emp_Code] with value @sEmp_CodeOld  to value @sEmp_Code
-- Gets: @sEmp_Code nvarchar(20)
-- Gets: @sEmp_CodeOld nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_UpdateAllWEmp_CodeLogic]
	@sEmp_Code nvarchar(20),
	@sEmp_CodeOld nvarchar(20)
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Login]
SET
	[Emp_Code] = @sEmp_Code
WHERE
	[Emp_Code] = @sEmp_CodeOld
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_Update]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will update an existing row in the table 't_CRM_Login'
-- Gets: @guidLogin_ID uniqueidentifier
-- Gets: @sLogin_Name nvarchar(20)
-- Gets: @sPassword nvarchar(20)
-- Gets: @sEmp_Code nvarchar(20)
-- Gets: @daLast_Login datetime
-- Gets: @bIs_Stop bit
-- Gets: @daCreate_Date datetime
-- Gets: @sApp_DeviceID nvarchar(60)
-- Gets: @bApp_Is_Auto_Login bit
-- Gets: @bApp_Is_Push_Message bit
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_Update]
	@guidLogin_ID uniqueidentifier,
	@sLogin_Name nvarchar(20),
	@sPassword nvarchar(20),
	@sEmp_Code nvarchar(20),
	@daLast_Login datetime,
	@bIs_Stop bit,
	@daCreate_Date datetime,
	@sApp_DeviceID nvarchar(60),
	@bApp_Is_Auto_Login bit,
	@bApp_Is_Push_Message bit
AS
-- UPDATE an existing row in the table.
UPDATE [dbo].[t_CRM_Login]
SET 
	[Login_ID] = @guidLogin_ID,
	[Password] = @sPassword,
	[Emp_Code] = @sEmp_Code,
	[Last_Login] = @daLast_Login,
	[Is_Stop] = @bIs_Stop,
	[Create_Date] = @daCreate_Date,
	[App_DeviceID] = @sApp_DeviceID,
	[App_Is_Auto_Login] = @bApp_Is_Auto_Login,
	[App_Is_Push_Message] = @bApp_Is_Push_Message
WHERE
	[Login_Name] = @sLogin_Name
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_SelectOne]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select an existing row from the table 't_CRM_Login'
-- based on the Primary Key.
-- Gets: @sLogin_Name nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_SelectOne]
	@sLogin_Name nvarchar(20)
AS
-- SELECT an existing row from the table.
SELECT
	[Login_ID],
	[Login_Name],
	[Password],
	[Emp_Code],
	[Last_Login],
	[Is_Stop],
	[Create_Date],
	[App_DeviceID],
	[App_Is_Auto_Login],
	[App_Is_Push_Message]
FROM [dbo].[t_CRM_Login]
WHERE
	[Login_Name] = @sLogin_Name
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_SelectAllWEmp_CodeLogic]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select one or more existing rows from the table 't_CRM_Login'
-- based on a foreign key field.
-- Gets: @sEmp_Code nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_SelectAllWEmp_CodeLogic]
	@sEmp_Code nvarchar(20)
AS
-- SELECT one or more existing rows from the table.
SELECT
	[Login_ID],
	[Login_Name],
	[Password],
	[Emp_Code],
	[Last_Login],
	[Is_Stop],
	[Create_Date],
	[App_DeviceID],
	[App_Is_Auto_Login],
	[App_Is_Push_Message]
FROM [dbo].[t_CRM_Login]
WHERE
	[Emp_Code] = @sEmp_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_SelectAll]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will select all rows from the table 't_CRM_Login'
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_SelectAll]
AS
-- SELECT all rows from the table.
SELECT
	[Login_ID],
	[Login_Name],
	[Password],
	[Emp_Code],
	[Last_Login],
	[Is_Stop],
	[Create_Date],
	[App_DeviceID],
	[App_Is_Auto_Login],
	[App_Is_Push_Message]
FROM [dbo].[t_CRM_Login]
ORDER BY 
	[Login_Name] ASC
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_Insert]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will insert 1 row in the table 't_CRM_Login'
-- Gets: @guidLogin_ID uniqueidentifier
-- Gets: @sLogin_Name nvarchar(20)
-- Gets: @sPassword nvarchar(20)
-- Gets: @sEmp_Code nvarchar(20)
-- Gets: @daLast_Login datetime
-- Gets: @bIs_Stop bit
-- Gets: @daCreate_Date datetime
-- Gets: @sApp_DeviceID nvarchar(60)
-- Gets: @bApp_Is_Auto_Login bit
-- Gets: @bApp_Is_Push_Message bit
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_Insert]
	@guidLogin_ID uniqueidentifier,
	@sLogin_Name nvarchar(20),
	@sPassword nvarchar(20),
	@sEmp_Code nvarchar(20),
	@daLast_Login datetime,
	@bIs_Stop bit,
	@daCreate_Date datetime,
	@sApp_DeviceID nvarchar(60),
	@bApp_Is_Auto_Login bit,
	@bApp_Is_Push_Message bit
AS
-- INSERT a new row in the table.
INSERT [dbo].[t_CRM_Login]
(
	[Login_ID],
	[Login_Name],
	[Password],
	[Emp_Code],
	[Last_Login],
	[Is_Stop],
	[Create_Date],
	[App_DeviceID],
	[App_Is_Auto_Login],
	[App_Is_Push_Message]
)
VALUES
(
	ISNULL(@guidLogin_ID, (newid())),
	@sLogin_Name,
	@sPassword,
	@sEmp_Code,
	@daLast_Login,
	ISNULL(@bIs_Stop, ((0))),
	ISNULL(@daCreate_Date, (getdate())),
	ISNULL(@sApp_DeviceID, ('')),
	ISNULL(@bApp_Is_Auto_Login, ((0))),
	ISNULL(@bApp_Is_Push_Message, ((0)))
)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_DeleteAllWEmp_CodeLogic]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete one or more existing rows from the table 't_CRM_Login'
-- based on a foreign key field.
-- Gets: @sEmp_Code nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_DeleteAllWEmp_CodeLogic]
	@sEmp_Code nvarchar(20)
AS
-- DELETE one or more existing rows from the table.
DELETE
FROM [dbo].[t_CRM_Login]
WHERE
	[Emp_Code] = @sEmp_Code
GO
/****** Object:  StoredProcedure [dbo].[sp_t_CRM_Login_Delete]    Script Date: 11/13/2013 13:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------
-- Stored procedure that will delete an existing row from the table 't_CRM_Login'
-- using the Primary Key. 
-- Gets: @sLogin_Name nvarchar(20)
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[sp_t_CRM_Login_Delete]
	@sLogin_Name nvarchar(20)
AS
-- DELETE an existing row from the table.
DELETE FROM [dbo].[t_CRM_Login]
WHERE
	[Login_Name] = @sLogin_Name
GO
/****** Object:  Default [DF_BS_Employee_Guid]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF_BS_Employee_Guid]  DEFAULT (newid()) FOR [Emp_ID]
GO
/****** Object:  Default [DF__BS_Employ__Level__2BFE89A6]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF__BS_Employ__Level__2BFE89A6]  DEFAULT ((0)) FOR [Level]
GO
/****** Object:  Default [DF__BS_Employee__Sex__2CF2ADDF]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF__BS_Employee__Sex__2CF2ADDF]  DEFAULT ((0)) FOR [Sex]
GO
/****** Object:  Default [DF__BS_Employ__Marry__2DE6D218]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF__BS_Employ__Marry__2DE6D218]  DEFAULT ((0)) FOR [Marry]
GO
/****** Object:  Default [DF_BS_Employee_Status]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF_BS_Employee_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__BS_Employ__Is_St__2EDAF651]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF__BS_Employ__Is_St__2EDAF651]  DEFAULT ((0)) FOR [Is_Receive]
GO
/****** Object:  Default [DF_BS_Employee_Create_Date]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF_BS_Employee_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
/****** Object:  Default [DF_BS_Employee_Is_Sale]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Employee] ADD  CONSTRAINT [DF_BS_Employee_Is_Sale]  DEFAULT ((0)) FOR [Is_Sale]
GO
/****** Object:  Default [DF_BS_Department_Guid]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Department] ADD  CONSTRAINT [DF_BS_Department_Guid]  DEFAULT (newid()) FOR [Dept_ID]
GO
/****** Object:  Default [DF_BS_Department_Serial_Code]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Department] ADD  CONSTRAINT [DF_BS_Department_Serial_Code]  DEFAULT ('') FOR [Serial_Code]
GO
/****** Object:  Default [DF_BS_Department_Is_Business]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Department] ADD  CONSTRAINT [DF_BS_Department_Is_Business]  DEFAULT ((0)) FOR [Is_Business]
GO
/****** Object:  Default [DF_BS_Department_Is_Enabled]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Department] ADD  CONSTRAINT [DF_BS_Department_Is_Enabled]  DEFAULT ((1)) FOR [Is_Enabled]
GO
/****** Object:  Default [DF_BS_Department_Create_Date]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Department] ADD  CONSTRAINT [DF_BS_Department_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
/****** Object:  Default [DF_BS_Role_Role_ID]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Role_ID]  DEFAULT (newid()) FOR [Role_ID]
GO
/****** Object:  Default [DF_BS_Role_Descr]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Descr]  DEFAULT (N'') FOR [Descr]
GO
/****** Object:  Default [DF_BS_Role_Data_Extend]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Data_Extend]  DEFAULT (N'') FOR [Data_Extend]
GO
/****** Object:  Default [DF_BS_Role_Extend_Dept]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Extend_Dept]  DEFAULT ('') FOR [Extend_Dept]
GO
/****** Object:  Default [DF_BS_Role_Permission]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Permission]  DEFAULT (N'') FOR [Permission]
GO
/****** Object:  Default [DF_BS_Role_Create_Date]    Script Date: 11/13/2013 13:53:34 ******/
ALTER TABLE [dbo].[t_CRM_Role] ADD  CONSTRAINT [DF_BS_Role_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
/****** Object:  Default [DF_BS_Login_Login_ID]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_Login_ID]  DEFAULT (newid()) FOR [Login_ID]
GO
/****** Object:  Default [DF_BS_Login_Is_Stop]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_Is_Stop]  DEFAULT ((0)) FOR [Is_Stop]
GO
/****** Object:  Default [DF_BS_Login_Create_Date]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_Create_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
/****** Object:  Default [DF_BS_Login_App_DeviceID]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_App_DeviceID]  DEFAULT ('') FOR [App_DeviceID]
GO
/****** Object:  Default [DF_BS_Login_App_Is_Auto_Login]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_App_Is_Auto_Login]  DEFAULT ((0)) FOR [App_Is_Auto_Login]
GO
/****** Object:  Default [DF_BS_Login_App_Is_Push_Message]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login] ADD  CONSTRAINT [DF_BS_Login_App_Is_Push_Message]  DEFAULT ((0)) FOR [App_Is_Push_Message]
GO
/****** Object:  ForeignKey [FK_BS_Login_BS_Employee]    Script Date: 11/13/2013 13:53:38 ******/
ALTER TABLE [dbo].[t_CRM_Login]  WITH CHECK ADD  CONSTRAINT [FK_BS_Login_BS_Employee] FOREIGN KEY([Emp_Code])
REFERENCES [dbo].[t_CRM_Employee] ([Emp_Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[t_CRM_Login] CHECK CONSTRAINT [FK_BS_Login_BS_Employee]
GO
