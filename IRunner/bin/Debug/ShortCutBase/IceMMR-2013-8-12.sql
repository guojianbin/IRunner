USE [master]
GO
/****** Object:  Database [IceMMR]    Script Date: 08/12/2013 18:38:03 ******/
CREATE DATABASE [IceMMR] ON  PRIMARY 
( NAME = N'IceMMR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\IceMMR.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IceMMR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\IceMMR_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IceMMR] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IceMMR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IceMMR] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [IceMMR] SET ANSI_NULLS OFF
GO
ALTER DATABASE [IceMMR] SET ANSI_PADDING OFF
GO
ALTER DATABASE [IceMMR] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [IceMMR] SET ARITHABORT OFF
GO
ALTER DATABASE [IceMMR] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [IceMMR] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [IceMMR] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [IceMMR] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [IceMMR] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [IceMMR] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [IceMMR] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [IceMMR] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [IceMMR] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [IceMMR] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [IceMMR] SET  DISABLE_BROKER
GO
ALTER DATABASE [IceMMR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [IceMMR] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [IceMMR] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [IceMMR] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [IceMMR] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [IceMMR] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [IceMMR] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [IceMMR] SET  READ_WRITE
GO
ALTER DATABASE [IceMMR] SET RECOVERY FULL
GO
ALTER DATABASE [IceMMR] SET  MULTI_USER
GO
ALTER DATABASE [IceMMR] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [IceMMR] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'IceMMR', N'ON'
GO
USE [IceMMR]
GO
/****** Object:  Table [dbo].[Sys_Config]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Config](
	[ConfigID] [nchar](10) NOT NULL,
	[SettingKey] [nchar](10) NULL,
	[SettingValue] [nchar](10) NULL,
	[ConfigCreateTime] [nchar](10) NULL,
	[ConfigModifyTime] [nchar](10) NULL,
	[UserID] [nchar](10) NULL,
	[IsDeleted] [nchar](10) NULL,
	[IsActive] [nchar](10) NULL,
 CONSTRAINT [PK_Sys_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BC_ADType]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BC_ADType](
	[ADTypeID] [int] NOT NULL,
	[ADTypeName] [varchar](50) NULL,
	[ADTypeDesc] [varchar](500) NULL,
	[ADTypePY] [varchar](50) NULL,
 CONSTRAINT [PK_BC_ADType] PRIMARY KEY CLUSTERED 
(
	[ADTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BC_Advertisement]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BC_Advertisement](
	[ADID] [int] NOT NULL,
	[ADTypeID] [int] NULL,
	[ADName] [varchar](500) NULL,
	[ADDesc] [varchar](500) NULL,
	[ImgUrl] [varchar](500) NULL,
	[ImgWidth] [int] NULL,
	[ImgHeight] [int] NULL,
	[LinkUrl] [varchar](500) NULL,
	[Priority] [int] NULL,
	[Clicks] [int] NULL,
	[CreateTime] [datetime] NULL,
	[PassedTime] [datetime] NULL,
	[OverdueTime] [datetime] NULL,
	[ADCompanyID] [int] NULL,
 CONSTRAINT [PK_BC_Advertisement] PRIMARY KEY CLUSTERED 
(
	[ADID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Privilege]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Privilege](
	[PrivilegeID] [int] NOT NULL,
	[ParentPrivilegeID] [int] NULL,
	[PrivilegeName] [varchar](50) NULL,
	[PrivilegeDesc] [varchar](200) NULL,
	[PrivilegePY] [varchar](50) NULL,
 CONSTRAINT [PK_PM_Privilege] PRIMARY KEY CLUSTERED 
(
	[PrivilegeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Role]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PM_Role](
	[RoleID] [int] NOT NULL,
	[ParentRoleID] [int] NULL,
	[RoleName] [varchar](50) NULL,
	[RoleDesc] [varchar](200) NULL,
	[RoleCreateTime] [datetime] NULL,
	[RolePY] [varchar](50) NULL,
 CONSTRAINT [PK_PM_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_RolePrivilege]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_RolePrivilege](
	[RPID] [bigint] NOT NULL,
	[RoleID] [int] NULL,
	[PrivilegeID] [int] NULL,
	[PEanble] [bit] NULL,
 CONSTRAINT [PK_PM_RolePrivilege] PRIMARY KEY CLUSTERED 
(
	[RPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_UserPrivilege]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_UserPrivilege](
	[UPID] [bigint] NOT NULL,
	[UserID] [int] NULL,
	[PrivilegeID] [int] NULL,
	[PEanble] [bit] NULL,
 CONSTRAINT [PK_PM_UserPrivilege] PRIMARY KEY CLUSTERED 
(
	[UPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_UserRole]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_UserRole](
	[URID] [bigint] NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
	[PEanble] [bit] NULL,
 CONSTRAINT [PK_PM_UserRole] PRIMARY KEY CLUSTERED 
(
	[URID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Log]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Log](
	[LogID] [bigint] NOT NULL,
	[LogUserID] [int] NULL,
	[LogUserName] [varchar](20) NULL,
	[LogUserIP] [varchar](50) NULL,
	[OperateID] [int] NULL,
	[LogCreateTime] [datetime] NULL,
	[ModuleID] [int] NULL,
	[ModifyOldValue] [varchar](200) NULL,
	[ModifyNewValue] [varchar](200) NULL,
	[ModifyTableName] [varchar](200) NULL,
	[PrimaryField] [varchar](200) NULL,
	[SecondField] [varchar](200) NULL,
	[ModifiedField] [varchar](200) NULL,
 CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Module]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Module](
	[ModuleID] [int] NOT NULL,
	[ModuleName] [varchar](50) NULL,
	[ModuleDesc] [varchar](500) NULL,
	[ModulePY] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Operate]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Operate](
	[OperateID] [int] NOT NULL,
	[OperateName] [varchar](50) NULL,
	[OperateDesc] [varchar](500) NULL,
	[OperatePY] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_Operate] PRIMARY KEY CLUSTERED 
(
	[OperateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_ScriptInjection]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_ScriptInjection](
	[ScriptID] [bigint] NOT NULL,
	[ScriptContent] [varchar](500) NULL,
	[ScriptParameter] [varchar](200) NULL,
	[ScriptDescription] [varchar](500) NULL,
	[ModuleID] [int] NULL,
	[PortalFuncName] [varchar](200) NULL,
	[ScriptCreateTime] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Sys_ScriptInjection] PRIMARY KEY CLUSTERED 
(
	[ScriptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Billboard]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Billboard](
	[BillboardID] [bigint] NOT NULL,
	[MusicID] [bigint] NULL,
	[Hits] [int] NULL,
	[CollectTimes] [int] NULL,
	[Popularity] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_Billboard] PRIMARY KEY CLUSTERED 
(
	[BillboardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Extensions]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Extensions](
	[ExtensionsID] [int] NOT NULL,
	[ExtensionsName] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[ExtensionsPY] [varchar](50) NULL,
 CONSTRAINT [PK_t_Extensions] PRIMARY KEY CLUSTERED 
(
	[ExtensionsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Feedback]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Feedback](
	[FeedbackID] [bigint] NOT NULL,
	[UserID] [int] NULL,
	[FeedbackContent] [varchar](1000) NULL,
	[FeedbackTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[FeedBackEmail] [varchar](50) NULL,
 CONSTRAINT [PK_t_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_LastListen]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_LastListen](
	[LastListenID] [bigint] NOT NULL,
	[MusicID] [bigint] NULL,
	[UserID] [int] NULL,
	[LastTime] [datetime] NULL,
 CONSTRAINT [PK_t_LastListen] PRIMARY KEY CLUSTERED 
(
	[LastListenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Login]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Login](
	[LoginID] [bigint] NOT NULL,
	[UserID] [int] NULL,
	[LoginTime] [datetime] NULL,
	[LoginIP] [varchar](50) NULL,
	[Browser] [varchar](50) NULL,
	[Resolution] [varchar](100) NULL,
	[LoginStateID] [int] NULL,
 CONSTRAINT [PK_t_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_LoginState]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_LoginState](
	[LoginStateID] [int] NOT NULL,
	[LoginStateName] [varchar](50) NULL,
	[LoginStateDesc] [varchar](500) NULL,
	[LoginStatePY] [varchar](50) NULL,
 CONSTRAINT [PK_t_LoginState] PRIMARY KEY CLUSTERED 
(
	[LoginStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Music]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Music](
	[MusicID] [bigint] NOT NULL,
	[MusicName] [varchar](100) NULL,
	[MusicPY] [varchar](100) NULL,
	[SingerId] [int] NULL,
	[SingerGroupID] [int] NULL,
	[MusicURL] [varchar](1000) NULL,
	[MusicSearchURLEncoded] [varchar](1000) NULL,
	[MusicSearchURLDecoded] [varchar](1000) NULL,
	[ExtensionsID] [int] NULL,
	[PublishDate] [datetime] NULL,
	[MusicLyricID] [int] NULL,
	[MusicStyleID] [int] NULL,
	[MusicCreateTime] [datetime] NULL,
	[MusicDesc] [varchar](1000) NULL,
	[MusicLanguageID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[MusicPublisherID] [int] NULL,
	[MusicStateID] [int] NULL,
	[RecommendUserId] [int] NULL,
 CONSTRAINT [PK_t_Music] PRIMARY KEY CLUSTERED 
(
	[MusicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicAlbum]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicAlbum](
	[MusicAlbumID] [int] NOT NULL,
	[MusicAlbumName] [varchar](50) NULL,
	[MusicAlbumPY] [varchar](50) NULL,
	[PublishDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Musics] [varchar](500) NULL,
	[MusicPublisherID] [int] NULL,
 CONSTRAINT [PK_t_MusicAlbum] PRIMARY KEY CLUSTERED 
(
	[MusicAlbumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicCollection]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_MusicCollection](
	[MusicCollectionID] [bigint] NOT NULL,
	[MusicID] [bigint] NULL,
	[UserID] [int] NULL,
	[CollectTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_MusicCollection] PRIMARY KEY CLUSTERED 
(
	[MusicCollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_MusicGuestbook]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicGuestbook](
	[MusicGuestbookID] [bigint] NOT NULL,
	[MusicID] [bigint] NULL,
	[UserID] [int] NULL,
	[LeaveWords] [varchar](1000) NULL,
	[LeaveTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_MusicGuestbook] PRIMARY KEY CLUSTERED 
(
	[MusicGuestbookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicLanguage]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicLanguage](
	[MusicLanguageID] [int] NOT NULL,
	[MusicLanguageName] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[MusicLanguagePY] [varchar](50) NULL,
 CONSTRAINT [PK_t_MusicLanguage] PRIMARY KEY CLUSTERED 
(
	[MusicLanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicLyric]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicLyric](
	[MusicLyricID] [bigint] NOT NULL,
	[MusicID] [bigint] NULL,
	[MusicLyricURL] [varchar](1000) NULL,
	[MusicLyricCreateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_MusicLyric] PRIMARY KEY CLUSTERED 
(
	[MusicLyricID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicPublisher]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicPublisher](
	[MusicPublisherID] [int] NOT NULL,
	[MusicPublisherName] [varchar](200) NULL,
	[MusicPublisherDesc] [varchar](500) NULL,
	[MusicPublisherPY] [varchar](200) NULL,
 CONSTRAINT [PK_t_MusicPublisher] PRIMARY KEY CLUSTERED 
(
	[MusicPublisherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicState]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicState](
	[MusicStateID] [bigint] NOT NULL,
	[MusicStateName] [varchar](50) NULL,
	[MusicStateDesc] [varchar](500) NULL,
	[MusicStatePY] [varchar](50) NULL,
 CONSTRAINT [PK_t_MusicState] PRIMARY KEY CLUSTERED 
(
	[MusicStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicStyle]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicStyle](
	[MusicStyleID] [int] NOT NULL,
	[MusicStyleName] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[MusicStylePY] [varchar](50) NULL,
 CONSTRAINT [PK_t_MusicStyle] PRIMARY KEY CLUSTERED 
(
	[MusicStyleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_SearchKeywords]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_SearchKeywords](
	[SearchKeywordsID] [int] NOT NULL,
	[Keyword] [varchar](100) NULL,
	[SearchCount] [int] NULL,
 CONSTRAINT [PK_t_SearchKeywords] PRIMARY KEY CLUSTERED 
(
	[SearchKeywordsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Singer]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Singer](
	[SingerID] [int] NOT NULL,
	[SingerName] [varchar](50) NULL,
	[SingerPY] [varchar](50) NULL,
	[SingerSex] [smallint] NULL,
	[SingerIntro] [varchar](1000) NULL,
	[CountryID] [int] NULL,
	[SingerCreateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_Singer] PRIMARY KEY CLUSTERED 
(
	[SingerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_SingerCountry]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_SingerCountry](
	[CountryID] [int] NOT NULL,
	[CountryName] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CountryPY] [varchar](50) NULL,
 CONSTRAINT [PK_t_SingerCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_SingerGroup]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_SingerGroup](
	[SingerGroupID] [int] NOT NULL,
	[SingerGroupName] [varchar](50) NULL,
	[SingerGroupPY] [varchar](50) NULL,
	[SingerCount] [int] NULL,
	[SingerGroupCreateTime] [datetime] NULL,
	[SingerGroupIntro] [varchar](1000) NULL,
	[Singers] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_t_SingerGroup] PRIMARY KEY CLUSTERED 
(
	[SingerGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_User]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_User](
	[UserID] [int] NOT NULL,
	[UserName] [varchar](20) NULL,
	[Sex] [smallint] NULL,
	[Birthday] [datetime] NULL,
	[IDCardNum] [nchar](18) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[QQNum] [varchar](20) NULL,
	[UserCreateTime] [datetime] NULL,
	[UserModifyTime] [datetime] NULL,
	[Enable] [bit] NULL,
	[LoginName] [varchar](20) NULL,
	[LastLoginTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[UserPY] [varchar](20) NULL,
 CONSTRAINT [PK_t_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BC_ADCompany]    Script Date: 08/12/2013 18:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BC_ADCompany](
	[ADCompanyID] [int] NOT NULL,
	[ADCompanyName] [varchar](100) NULL,
	[ADCompanyDesc] [varchar](500) NULL,
	[ADCompanyPY] [varchar](100) NULL,
 CONSTRAINT [PK_BC_ADCompany] PRIMARY KEY CLUSTERED 
(
	[ADCompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[t_User_Update]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_Update]
@UserID int,
@UserName varchar(20),
@Sex smallint,
@Birthday datetime,
@IDCardNum nchar(18),
@Email varchar(50),
@Password varchar(50),
@Address varchar(200),
@QQNum varchar(20),
@UserCreateTime datetime,
@UserModifyTime datetime,
@Enable bit,
@LoginName varchar(20),
@LastLoginTime datetime,
@IsDeleted bit,
@UserPY varchar(20)
 AS 
	UPDATE [t_User] SET 
	[UserName] = @UserName,[Sex] = @Sex,[Birthday] = @Birthday,[IDCardNum] = @IDCardNum,[Email] = @Email,[Password] = @Password,[Address] = @Address,[QQNum] = @QQNum,[UserCreateTime] = @UserCreateTime,[UserModifyTime] = @UserModifyTime,[Enable] = @Enable,[LoginName] = @LoginName,[LastLoginTime] = @LastLoginTime,[IsDeleted] = @IsDeleted,[UserPY] = @UserPY
	WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[t_User_GetModel]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_GetModel]
@UserID int
 AS 
	SELECT 
	UserID,UserName,Sex,Birthday,IDCardNum,Email,Password,Address,QQNum,UserCreateTime,UserModifyTime,Enable,LoginName,LastLoginTime,IsDeleted,UserPY
	 FROM [t_User]
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[t_User_GetMaxId]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([UserID])+1 FROM [t_User]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_User_GetList]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_GetList]
 AS 
	SELECT 
	UserID,UserName,Sex,Birthday,IDCardNum,Email,Password,Address,QQNum,UserCreateTime,UserModifyTime,Enable,LoginName,LastLoginTime,IsDeleted,UserPY
	 FROM [t_User]
GO
/****** Object:  StoredProcedure [dbo].[t_User_Exists]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_Exists]
@UserID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_User] WHERE UserID=@UserID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_User_Delete]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_Delete]
@UserID int
 AS 
	DELETE [t_User]
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[t_User_ADD]    Script Date: 08/12/2013 18:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_User_ADD]
@UserID int,
@UserName varchar(20),
@Sex smallint,
@Birthday datetime,
@IDCardNum nchar(18),
@Email varchar(50),
@Password varchar(50),
@Address varchar(200),
@QQNum varchar(20),
@UserCreateTime datetime,
@UserModifyTime datetime,
@Enable bit,
@LoginName varchar(20),
@LastLoginTime datetime,
@IsDeleted bit,
@UserPY varchar(20)

 AS 
	INSERT INTO [t_User](
	[UserID],[UserName],[Sex],[Birthday],[IDCardNum],[Email],[Password],[Address],[QQNum],[UserCreateTime],[UserModifyTime],[Enable],[LoginName],[LastLoginTime],[IsDeleted],[UserPY]
	)VALUES(
	@UserID,@UserName,@Sex,@Birthday,@IDCardNum,@Email,@Password,@Address,@QQNum,@UserCreateTime,@UserModifyTime,@Enable,@LoginName,@LastLoginTime,@IsDeleted,@UserPY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_Update]
@SingerGroupID int,
@SingerGroupName varchar(50),
@SingerGroupPY varchar(50),
@SingerCount int,
@SingerGroupCreateTime datetime,
@SingerGroupIntro varchar(1000),
@Singers varchar(100),
@IsDeleted bit
 AS 
	UPDATE [t_SingerGroup] SET 
	[SingerGroupName] = @SingerGroupName,[SingerGroupPY] = @SingerGroupPY,[SingerCount] = @SingerCount,[SingerGroupCreateTime] = @SingerGroupCreateTime,[SingerGroupIntro] = @SingerGroupIntro,[Singers] = @Singers,[IsDeleted] = @IsDeleted
	WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_GetModel]
@SingerGroupID int
 AS 
	SELECT 
	SingerGroupID,SingerGroupName,SingerGroupPY,SingerCount,SingerGroupCreateTime,SingerGroupIntro,Singers,IsDeleted
	 FROM [t_SingerGroup]
	 WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SingerGroupID])+1 FROM [t_SingerGroup]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_GetList]
 AS 
	SELECT 
	SingerGroupID,SingerGroupName,SingerGroupPY,SingerCount,SingerGroupCreateTime,SingerGroupIntro,Singers,IsDeleted
	 FROM [t_SingerGroup]
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_Exists]
@SingerGroupID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SingerGroup] WHERE SingerGroupID=@SingerGroupID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_Delete]
@SingerGroupID int
 AS 
	DELETE [t_SingerGroup]
	 WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerGroup_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerGroup_ADD]
@SingerGroupID int,
@SingerGroupName varchar(50),
@SingerGroupPY varchar(50),
@SingerCount int,
@SingerGroupCreateTime datetime,
@SingerGroupIntro varchar(1000),
@Singers varchar(100),
@IsDeleted bit

 AS 
	INSERT INTO [t_SingerGroup](
	[SingerGroupID],[SingerGroupName],[SingerGroupPY],[SingerCount],[SingerGroupCreateTime],[SingerGroupIntro],[Singers],[IsDeleted]
	)VALUES(
	@SingerGroupID,@SingerGroupName,@SingerGroupPY,@SingerCount,@SingerGroupCreateTime,@SingerGroupIntro,@Singers,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_Update]
@CountryID int,
@CountryName varchar(50),
@IsDeleted bit,
@CountryPY varchar(50)
 AS 
	UPDATE [t_SingerCountry] SET 
	[CountryName] = @CountryName,[IsDeleted] = @IsDeleted,[CountryPY] = @CountryPY
	WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_GetModel]
@CountryID int
 AS 
	SELECT 
	CountryID,CountryName,IsDeleted,CountryPY
	 FROM [t_SingerCountry]
	 WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([CountryID])+1 FROM [t_SingerCountry]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_GetList]
 AS 
	SELECT 
	CountryID,CountryName,IsDeleted,CountryPY
	 FROM [t_SingerCountry]
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_Exists]
@CountryID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SingerCountry] WHERE CountryID=@CountryID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_Delete]
@CountryID int
 AS 
	DELETE [t_SingerCountry]
	 WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[t_SingerCountry_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SingerCountry_ADD]
@CountryID int,
@CountryName varchar(50),
@IsDeleted bit,
@CountryPY varchar(50)

 AS 
	INSERT INTO [t_SingerCountry](
	[CountryID],[CountryName],[IsDeleted],[CountryPY]
	)VALUES(
	@CountryID,@CountryName,@IsDeleted,@CountryPY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_Update]
@SingerID int,
@SingerName varchar(50),
@SingerPY varchar(50),
@SingerSex smallint,
@SingerIntro varchar(1000),
@CountryID int,
@SingerCreateTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_Singer] SET 
	[SingerName] = @SingerName,[SingerPY] = @SingerPY,[SingerSex] = @SingerSex,[SingerIntro] = @SingerIntro,[CountryID] = @CountryID,[SingerCreateTime] = @SingerCreateTime,[IsDeleted] = @IsDeleted
	WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_GetModel]
@SingerID int
 AS 
	SELECT 
	SingerID,SingerName,SingerPY,SingerSex,SingerIntro,CountryID,SingerCreateTime,IsDeleted
	 FROM [t_Singer]
	 WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SingerID])+1 FROM [t_Singer]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_GetList]
 AS 
	SELECT 
	SingerID,SingerName,SingerPY,SingerSex,SingerIntro,CountryID,SingerCreateTime,IsDeleted
	 FROM [t_Singer]
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_Exists]
@SingerID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Singer] WHERE SingerID=@SingerID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_Delete]
@SingerID int
 AS 
	DELETE [t_Singer]
	 WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[t_Singer_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Singer_ADD]
@SingerID int,
@SingerName varchar(50),
@SingerPY varchar(50),
@SingerSex smallint,
@SingerIntro varchar(1000),
@CountryID int,
@SingerCreateTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_Singer](
	[SingerID],[SingerName],[SingerPY],[SingerSex],[SingerIntro],[CountryID],[SingerCreateTime],[IsDeleted]
	)VALUES(
	@SingerID,@SingerName,@SingerPY,@SingerSex,@SingerIntro,@CountryID,@SingerCreateTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_Update]
@SearchKeywordsID int,
@Keyword varchar(100),
@SearchCount int
 AS 
	UPDATE [t_SearchKeywords] SET 
	[Keyword] = @Keyword,[SearchCount] = @SearchCount
	WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_GetModel]
@SearchKeywordsID int
 AS 
	SELECT 
	SearchKeywordsID,Keyword,SearchCount
	 FROM [t_SearchKeywords]
	 WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SearchKeywordsID])+1 FROM [t_SearchKeywords]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_GetList]
 AS 
	SELECT 
	SearchKeywordsID,Keyword,SearchCount
	 FROM [t_SearchKeywords]
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_Exists]
@SearchKeywordsID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SearchKeywords] WHERE SearchKeywordsID=@SearchKeywordsID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_Delete]
@SearchKeywordsID int
 AS 
	DELETE [t_SearchKeywords]
	 WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[t_SearchKeywords_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_SearchKeywords_ADD]
@SearchKeywordsID int,
@Keyword varchar(100),
@SearchCount int

 AS 
	INSERT INTO [t_SearchKeywords](
	[SearchKeywordsID],[Keyword],[SearchCount]
	)VALUES(
	@SearchKeywordsID,@Keyword,@SearchCount
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_Update]
@MusicStyleID int,
@MusicStyleName varchar(50),
@IsDeleted bit,
@MusicStylePY varchar(50)
 AS 
	UPDATE [t_MusicStyle] SET 
	[MusicStyleName] = @MusicStyleName,[IsDeleted] = @IsDeleted,[MusicStylePY] = @MusicStylePY
	WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_GetModel]
@MusicStyleID int
 AS 
	SELECT 
	MusicStyleID,MusicStyleName,IsDeleted,MusicStylePY
	 FROM [t_MusicStyle]
	 WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicStyleID])+1 FROM [t_MusicStyle]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_GetList]
 AS 
	SELECT 
	MusicStyleID,MusicStyleName,IsDeleted,MusicStylePY
	 FROM [t_MusicStyle]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_Exists]
@MusicStyleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicStyle] WHERE MusicStyleID=@MusicStyleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_Delete]
@MusicStyleID int
 AS 
	DELETE [t_MusicStyle]
	 WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicStyle_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicStyle_ADD]
@MusicStyleID int,
@MusicStyleName varchar(50),
@IsDeleted bit,
@MusicStylePY varchar(50)

 AS 
	INSERT INTO [t_MusicStyle](
	[MusicStyleID],[MusicStyleName],[IsDeleted],[MusicStylePY]
	)VALUES(
	@MusicStyleID,@MusicStyleName,@IsDeleted,@MusicStylePY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_Update]
@MusicStateID bigint,
@MusicStateName varchar(50),
@MusicStateDesc varchar(500),
@MusicStatePY varchar(50)
 AS 
	UPDATE [t_MusicState] SET 
	[MusicStateName] = @MusicStateName,[MusicStateDesc] = @MusicStateDesc,[MusicStatePY] = @MusicStatePY
	WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_GetModel]
@MusicStateID bigint
 AS 
	SELECT 
	MusicStateID,MusicStateName,MusicStateDesc,MusicStatePY
	 FROM [t_MusicState]
	 WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_GetList]
 AS 
	SELECT 
	MusicStateID,MusicStateName,MusicStateDesc,MusicStatePY
	 FROM [t_MusicState]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_Exists]
@MusicStateID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicState] WHERE MusicStateID=@MusicStateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_Delete]
@MusicStateID bigint
 AS 
	DELETE [t_MusicState]
	 WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicState_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicState_ADD]
@MusicStateID bigint,
@MusicStateName varchar(50),
@MusicStateDesc varchar(500),
@MusicStatePY varchar(50)

 AS 
	INSERT INTO [t_MusicState](
	[MusicStateID],[MusicStateName],[MusicStateDesc],[MusicStatePY]
	)VALUES(
	@MusicStateID,@MusicStateName,@MusicStateDesc,@MusicStatePY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_Update]
@MusicPublisherID int,
@MusicPublisherName varchar(200),
@MusicPublisherDesc varchar(500),
@MusicPublisherPY varchar(200)
 AS 
	UPDATE [t_MusicPublisher] SET 
	[MusicPublisherName] = @MusicPublisherName,[MusicPublisherDesc] = @MusicPublisherDesc,[MusicPublisherPY] = @MusicPublisherPY
	WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_GetModel]
@MusicPublisherID int
 AS 
	SELECT 
	MusicPublisherID,MusicPublisherName,MusicPublisherDesc,MusicPublisherPY
	 FROM [t_MusicPublisher]
	 WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicPublisherID])+1 FROM [t_MusicPublisher]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_GetList]
 AS 
	SELECT 
	MusicPublisherID,MusicPublisherName,MusicPublisherDesc,MusicPublisherPY
	 FROM [t_MusicPublisher]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_Exists]
@MusicPublisherID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicPublisher] WHERE MusicPublisherID=@MusicPublisherID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_Delete]
@MusicPublisherID int
 AS 
	DELETE [t_MusicPublisher]
	 WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicPublisher_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicPublisher_ADD]
@MusicPublisherID int,
@MusicPublisherName varchar(200),
@MusicPublisherDesc varchar(500),
@MusicPublisherPY varchar(200)

 AS 
	INSERT INTO [t_MusicPublisher](
	[MusicPublisherID],[MusicPublisherName],[MusicPublisherDesc],[MusicPublisherPY]
	)VALUES(
	@MusicPublisherID,@MusicPublisherName,@MusicPublisherDesc,@MusicPublisherPY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_Update]
@MusicLyricID bigint,
@MusicID bigint,
@MusicLyricURL varchar(1000),
@MusicLyricCreateTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicLyric] SET 
	[MusicID] = @MusicID,[MusicLyricURL] = @MusicLyricURL,[MusicLyricCreateTime] = @MusicLyricCreateTime,[IsDeleted] = @IsDeleted
	WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_GetModel]
@MusicLyricID bigint
 AS 
	SELECT 
	MusicLyricID,MusicID,MusicLyricURL,MusicLyricCreateTime,IsDeleted
	 FROM [t_MusicLyric]
	 WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_GetList]
 AS 
	SELECT 
	MusicLyricID,MusicID,MusicLyricURL,MusicLyricCreateTime,IsDeleted
	 FROM [t_MusicLyric]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_Exists]
@MusicLyricID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicLyric] WHERE MusicLyricID=@MusicLyricID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_Delete]
@MusicLyricID bigint
 AS 
	DELETE [t_MusicLyric]
	 WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLyric_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLyric_ADD]
@MusicLyricID bigint,
@MusicID bigint,
@MusicLyricURL varchar(1000),
@MusicLyricCreateTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicLyric](
	[MusicLyricID],[MusicID],[MusicLyricURL],[MusicLyricCreateTime],[IsDeleted]
	)VALUES(
	@MusicLyricID,@MusicID,@MusicLyricURL,@MusicLyricCreateTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_Update]
@MusicLanguageID int,
@MusicLanguageName varchar(50),
@IsDeleted bit,
@MusicLanguagePY varchar(50)
 AS 
	UPDATE [t_MusicLanguage] SET 
	[MusicLanguageName] = @MusicLanguageName,[IsDeleted] = @IsDeleted,[MusicLanguagePY] = @MusicLanguagePY
	WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_GetModel]
@MusicLanguageID int
 AS 
	SELECT 
	MusicLanguageID,MusicLanguageName,IsDeleted,MusicLanguagePY
	 FROM [t_MusicLanguage]
	 WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicLanguageID])+1 FROM [t_MusicLanguage]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_GetList]
 AS 
	SELECT 
	MusicLanguageID,MusicLanguageName,IsDeleted,MusicLanguagePY
	 FROM [t_MusicLanguage]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_Exists]
@MusicLanguageID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicLanguage] WHERE MusicLanguageID=@MusicLanguageID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_Delete]
@MusicLanguageID int
 AS 
	DELETE [t_MusicLanguage]
	 WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicLanguage_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicLanguage_ADD]
@MusicLanguageID int,
@MusicLanguageName varchar(50),
@IsDeleted bit,
@MusicLanguagePY varchar(50)

 AS 
	INSERT INTO [t_MusicLanguage](
	[MusicLanguageID],[MusicLanguageName],[IsDeleted],[MusicLanguagePY]
	)VALUES(
	@MusicLanguageID,@MusicLanguageName,@IsDeleted,@MusicLanguagePY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_Update]
@MusicGuestbookID bigint,
@MusicID bigint,
@UserID int,
@LeaveWords varchar(1000),
@LeaveTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicGuestbook] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[LeaveWords] = @LeaveWords,[LeaveTime] = @LeaveTime,[IsDeleted] = @IsDeleted
	WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_GetModel]
@MusicGuestbookID bigint
 AS 
	SELECT 
	MusicGuestbookID,MusicID,UserID,LeaveWords,LeaveTime,IsDeleted
	 FROM [t_MusicGuestbook]
	 WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_GetList]
 AS 
	SELECT 
	MusicGuestbookID,MusicID,UserID,LeaveWords,LeaveTime,IsDeleted
	 FROM [t_MusicGuestbook]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_Exists]
@MusicGuestbookID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicGuestbook] WHERE MusicGuestbookID=@MusicGuestbookID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_Delete]
@MusicGuestbookID bigint
 AS 
	DELETE [t_MusicGuestbook]
	 WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicGuestbook_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicGuestbook_ADD]
@MusicGuestbookID bigint,
@MusicID bigint,
@UserID int,
@LeaveWords varchar(1000),
@LeaveTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicGuestbook](
	[MusicGuestbookID],[MusicID],[UserID],[LeaveWords],[LeaveTime],[IsDeleted]
	)VALUES(
	@MusicGuestbookID,@MusicID,@UserID,@LeaveWords,@LeaveTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_Update]
@MusicCollectionID bigint,
@MusicID bigint,
@UserID int,
@CollectTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicCollection] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[CollectTime] = @CollectTime,[IsDeleted] = @IsDeleted
	WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_GetModel]
@MusicCollectionID bigint
 AS 
	SELECT 
	MusicCollectionID,MusicID,UserID,CollectTime,IsDeleted
	 FROM [t_MusicCollection]
	 WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_GetList]
 AS 
	SELECT 
	MusicCollectionID,MusicID,UserID,CollectTime,IsDeleted
	 FROM [t_MusicCollection]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_Exists]
@MusicCollectionID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicCollection] WHERE MusicCollectionID=@MusicCollectionID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_Delete]
@MusicCollectionID bigint
 AS 
	DELETE [t_MusicCollection]
	 WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicCollection_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicCollection_ADD]
@MusicCollectionID bigint,
@MusicID bigint,
@UserID int,
@CollectTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicCollection](
	[MusicCollectionID],[MusicID],[UserID],[CollectTime],[IsDeleted]
	)VALUES(
	@MusicCollectionID,@MusicID,@UserID,@CollectTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_Update]
@MusicAlbumID int,
@MusicAlbumName varchar(50),
@MusicAlbumPY varchar(50),
@PublishDate datetime,
@IsDeleted bit,
@Musics varchar(500),
@MusicPublisherID int
 AS 
	UPDATE [t_MusicAlbum] SET 
	[MusicAlbumName] = @MusicAlbumName,[MusicAlbumPY] = @MusicAlbumPY,[PublishDate] = @PublishDate,[IsDeleted] = @IsDeleted,[Musics] = @Musics,[MusicPublisherID] = @MusicPublisherID
	WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_GetModel]
@MusicAlbumID int
 AS 
	SELECT 
	MusicAlbumID,MusicAlbumName,MusicAlbumPY,PublishDate,IsDeleted,Musics,MusicPublisherID
	 FROM [t_MusicAlbum]
	 WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicAlbumID])+1 FROM [t_MusicAlbum]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_GetList]
 AS 
	SELECT 
	MusicAlbumID,MusicAlbumName,MusicAlbumPY,PublishDate,IsDeleted,Musics,MusicPublisherID
	 FROM [t_MusicAlbum]
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_Exists]
@MusicAlbumID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicAlbum] WHERE MusicAlbumID=@MusicAlbumID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_Delete]
@MusicAlbumID int
 AS 
	DELETE [t_MusicAlbum]
	 WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[t_MusicAlbum_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_MusicAlbum_ADD]
@MusicAlbumID int,
@MusicAlbumName varchar(50),
@MusicAlbumPY varchar(50),
@PublishDate datetime,
@IsDeleted bit,
@Musics varchar(500),
@MusicPublisherID int

 AS 
	INSERT INTO [t_MusicAlbum](
	[MusicAlbumID],[MusicAlbumName],[MusicAlbumPY],[PublishDate],[IsDeleted],[Musics],[MusicPublisherID]
	)VALUES(
	@MusicAlbumID,@MusicAlbumName,@MusicAlbumPY,@PublishDate,@IsDeleted,@Musics,@MusicPublisherID
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Music_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_Update]
@MusicID bigint,
@MusicName varchar(100),
@MusicPY varchar(100),
@SingerId int,
@SingerGroupID int,
@MusicURL varchar(1000),
@MusicSearchURLEncoded varchar(1000),
@MusicSearchURLDecoded varchar(1000),
@ExtensionsID int,
@PublishDate datetime,
@MusicLyricID int,
@MusicStyleID int,
@MusicCreateTime datetime,
@MusicDesc varchar(1000),
@MusicLanguageID int,
@IsDeleted bit,
@MusicPublisherID int,
@MusicStateID int,
@RecommendUserId int
 AS 
	UPDATE [t_Music] SET 
	[MusicName] = @MusicName,[MusicPY] = @MusicPY,[SingerId] = @SingerId,[SingerGroupID] = @SingerGroupID,[MusicURL] = @MusicURL,[MusicSearchURLEncoded] = @MusicSearchURLEncoded,[MusicSearchURLDecoded] = @MusicSearchURLDecoded,[ExtensionsID] = @ExtensionsID,[PublishDate] = @PublishDate,[MusicLyricID] = @MusicLyricID,[MusicStyleID] = @MusicStyleID,[MusicCreateTime] = @MusicCreateTime,[MusicDesc] = @MusicDesc,[MusicLanguageID] = @MusicLanguageID,[IsDeleted] = @IsDeleted,[MusicPublisherID] = @MusicPublisherID,[MusicStateID] = @MusicStateID,[RecommendUserId] = @RecommendUserId
	WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[t_Music_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_GetModel]
@MusicID bigint
 AS 
	SELECT 
	MusicID,MusicName,MusicPY,SingerId,SingerGroupID,MusicURL,MusicSearchURLEncoded,MusicSearchURLDecoded,ExtensionsID,PublishDate,MusicLyricID,MusicStyleID,MusicCreateTime,MusicDesc,MusicLanguageID,IsDeleted,MusicPublisherID,MusicStateID,RecommendUserId
	 FROM [t_Music]
	 WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[t_Music_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_GetList]
 AS 
	SELECT 
	MusicID,MusicName,MusicPY,SingerId,SingerGroupID,MusicURL,MusicSearchURLEncoded,MusicSearchURLDecoded,ExtensionsID,PublishDate,MusicLyricID,MusicStyleID,MusicCreateTime,MusicDesc,MusicLanguageID,IsDeleted,MusicPublisherID,MusicStateID,RecommendUserId
	 FROM [t_Music]
GO
/****** Object:  StoredProcedure [dbo].[t_Music_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_Exists]
@MusicID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Music] WHERE MusicID=@MusicID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Music_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_Delete]
@MusicID bigint
 AS 
	DELETE [t_Music]
	 WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[t_Music_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Music_ADD]
@MusicID bigint,
@MusicName varchar(100),
@MusicPY varchar(100),
@SingerId int,
@SingerGroupID int,
@MusicURL varchar(1000),
@MusicSearchURLEncoded varchar(1000),
@MusicSearchURLDecoded varchar(1000),
@ExtensionsID int,
@PublishDate datetime,
@MusicLyricID int,
@MusicStyleID int,
@MusicCreateTime datetime,
@MusicDesc varchar(1000),
@MusicLanguageID int,
@IsDeleted bit,
@MusicPublisherID int,
@MusicStateID int,
@RecommendUserId int

 AS 
	INSERT INTO [t_Music](
	[MusicID],[MusicName],[MusicPY],[SingerId],[SingerGroupID],[MusicURL],[MusicSearchURLEncoded],[MusicSearchURLDecoded],[ExtensionsID],[PublishDate],[MusicLyricID],[MusicStyleID],[MusicCreateTime],[MusicDesc],[MusicLanguageID],[IsDeleted],[MusicPublisherID],[MusicStateID],[RecommendUserId]
	)VALUES(
	@MusicID,@MusicName,@MusicPY,@SingerId,@SingerGroupID,@MusicURL,@MusicSearchURLEncoded,@MusicSearchURLDecoded,@ExtensionsID,@PublishDate,@MusicLyricID,@MusicStyleID,@MusicCreateTime,@MusicDesc,@MusicLanguageID,@IsDeleted,@MusicPublisherID,@MusicStateID,@RecommendUserId
	)
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_Update]
@LoginStateID int,
@LoginStateName varchar(50),
@LoginStateDesc varchar(500),
@LoginStatePY varchar(50)
 AS 
	UPDATE [t_LoginState] SET 
	[LoginStateName] = @LoginStateName,[LoginStateDesc] = @LoginStateDesc,[LoginStatePY] = @LoginStatePY
	WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_GetModel]
@LoginStateID int
 AS 
	SELECT 
	LoginStateID,LoginStateName,LoginStateDesc,LoginStatePY
	 FROM [t_LoginState]
	 WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([LoginStateID])+1 FROM [t_LoginState]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_GetList]
 AS 
	SELECT 
	LoginStateID,LoginStateName,LoginStateDesc,LoginStatePY
	 FROM [t_LoginState]
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_Exists]
@LoginStateID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_LoginState] WHERE LoginStateID=@LoginStateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_Delete]
@LoginStateID int
 AS 
	DELETE [t_LoginState]
	 WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[t_LoginState_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LoginState_ADD]
@LoginStateID int,
@LoginStateName varchar(50),
@LoginStateDesc varchar(500),
@LoginStatePY varchar(50)

 AS 
	INSERT INTO [t_LoginState](
	[LoginStateID],[LoginStateName],[LoginStateDesc],[LoginStatePY]
	)VALUES(
	@LoginStateID,@LoginStateName,@LoginStateDesc,@LoginStatePY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Login_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_Update]
@LoginID bigint,
@UserID int,
@LoginTime datetime,
@LoginIP varchar(50),
@Browser varchar(50),
@Resolution varchar(100),
@LoginStateID int
 AS 
	UPDATE [t_Login] SET 
	[UserID] = @UserID,[LoginTime] = @LoginTime,[LoginIP] = @LoginIP,[Browser] = @Browser,[Resolution] = @Resolution,[LoginStateID] = @LoginStateID
	WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[t_Login_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_GetModel]
@LoginID bigint
 AS 
	SELECT 
	LoginID,UserID,LoginTime,LoginIP,Browser,Resolution,LoginStateID
	 FROM [t_Login]
	 WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[t_Login_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_GetList]
 AS 
	SELECT 
	LoginID,UserID,LoginTime,LoginIP,Browser,Resolution,LoginStateID
	 FROM [t_Login]
GO
/****** Object:  StoredProcedure [dbo].[t_Login_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_Exists]
@LoginID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Login] WHERE LoginID=@LoginID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Login_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_Delete]
@LoginID bigint
 AS 
	DELETE [t_Login]
	 WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[t_Login_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Login_ADD]
@LoginID bigint,
@UserID int,
@LoginTime datetime,
@LoginIP varchar(50),
@Browser varchar(50),
@Resolution varchar(100),
@LoginStateID int

 AS 
	INSERT INTO [t_Login](
	[LoginID],[UserID],[LoginTime],[LoginIP],[Browser],[Resolution],[LoginStateID]
	)VALUES(
	@LoginID,@UserID,@LoginTime,@LoginIP,@Browser,@Resolution,@LoginStateID
	)
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_Update]
@LastListenID bigint,
@MusicID bigint,
@UserID int,
@LastTime datetime
 AS 
	UPDATE [t_LastListen] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[LastTime] = @LastTime
	WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_GetModel]
@LastListenID bigint
 AS 
	SELECT 
	LastListenID,MusicID,UserID,LastTime
	 FROM [t_LastListen]
	 WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_GetList]
 AS 
	SELECT 
	LastListenID,MusicID,UserID,LastTime
	 FROM [t_LastListen]
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_Exists]
@LastListenID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_LastListen] WHERE LastListenID=@LastListenID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_Delete]
@LastListenID bigint
 AS 
	DELETE [t_LastListen]
	 WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[t_LastListen_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_LastListen_ADD]
@LastListenID bigint,
@MusicID bigint,
@UserID int,
@LastTime datetime

 AS 
	INSERT INTO [t_LastListen](
	[LastListenID],[MusicID],[UserID],[LastTime]
	)VALUES(
	@LastListenID,@MusicID,@UserID,@LastTime
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_Update]
@FeedbackID bigint,
@UserID int,
@FeedbackContent varchar(1000),
@FeedbackTime datetime,
@IsDeleted bit,
@FeedBackEmail varchar(50)
 AS 
	UPDATE [t_Feedback] SET 
	[UserID] = @UserID,[FeedbackContent] = @FeedbackContent,[FeedbackTime] = @FeedbackTime,[IsDeleted] = @IsDeleted,[FeedBackEmail] = @FeedBackEmail
	WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_GetModel]
@FeedbackID bigint
 AS 
	SELECT 
	FeedbackID,UserID,FeedbackContent,FeedbackTime,IsDeleted,FeedBackEmail
	 FROM [t_Feedback]
	 WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_GetList]
 AS 
	SELECT 
	FeedbackID,UserID,FeedbackContent,FeedbackTime,IsDeleted,FeedBackEmail
	 FROM [t_Feedback]
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_Exists]
@FeedbackID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Feedback] WHERE FeedbackID=@FeedbackID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_Delete]
@FeedbackID bigint
 AS 
	DELETE [t_Feedback]
	 WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[t_Feedback_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Feedback_ADD]
@FeedbackID bigint,
@UserID int,
@FeedbackContent varchar(1000),
@FeedbackTime datetime,
@IsDeleted bit,
@FeedBackEmail varchar(50)

 AS 
	INSERT INTO [t_Feedback](
	[FeedbackID],[UserID],[FeedbackContent],[FeedbackTime],[IsDeleted],[FeedBackEmail]
	)VALUES(
	@FeedbackID,@UserID,@FeedbackContent,@FeedbackTime,@IsDeleted,@FeedBackEmail
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_Update]
@ExtensionsID int,
@ExtensionsName varchar(50),
@IsDeleted bit,
@ExtensionsPY varchar(50)
 AS 
	UPDATE [t_Extensions] SET 
	[ExtensionsName] = @ExtensionsName,[IsDeleted] = @IsDeleted,[ExtensionsPY] = @ExtensionsPY
	WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_GetModel]
@ExtensionsID int
 AS 
	SELECT 
	ExtensionsID,ExtensionsName,IsDeleted,ExtensionsPY
	 FROM [t_Extensions]
	 WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ExtensionsID])+1 FROM [t_Extensions]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_GetList]
 AS 
	SELECT 
	ExtensionsID,ExtensionsName,IsDeleted,ExtensionsPY
	 FROM [t_Extensions]
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_Exists]
@ExtensionsID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Extensions] WHERE ExtensionsID=@ExtensionsID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_Delete]
@ExtensionsID int
 AS 
	DELETE [t_Extensions]
	 WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[t_Extensions_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Extensions_ADD]
@ExtensionsID int,
@ExtensionsName varchar(50),
@IsDeleted bit,
@ExtensionsPY varchar(50)

 AS 
	INSERT INTO [t_Extensions](
	[ExtensionsID],[ExtensionsName],[IsDeleted],[ExtensionsPY]
	)VALUES(
	@ExtensionsID,@ExtensionsName,@IsDeleted,@ExtensionsPY
	)
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_Update]
@BillboardID bigint,
@MusicID bigint,
@Hits int,
@CollectTimes int,
@Popularity int,
@IsDeleted bit
 AS 
	UPDATE [t_Billboard] SET 
	[MusicID] = @MusicID,[Hits] = @Hits,[CollectTimes] = @CollectTimes,[Popularity] = @Popularity,[IsDeleted] = @IsDeleted
	WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_GetModel]
@BillboardID bigint
 AS 
	SELECT 
	BillboardID,MusicID,Hits,CollectTimes,Popularity,IsDeleted
	 FROM [t_Billboard]
	 WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_GetList]
 AS 
	SELECT 
	BillboardID,MusicID,Hits,CollectTimes,Popularity,IsDeleted
	 FROM [t_Billboard]
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_Exists]
@BillboardID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Billboard] WHERE BillboardID=@BillboardID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_Delete]
@BillboardID bigint
 AS 
	DELETE [t_Billboard]
	 WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[t_Billboard_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[t_Billboard_ADD]
@BillboardID bigint,
@MusicID bigint,
@Hits int,
@CollectTimes int,
@Popularity int,
@IsDeleted bit

 AS 
	INSERT INTO [t_Billboard](
	[BillboardID],[MusicID],[Hits],[CollectTimes],[Popularity],[IsDeleted]
	)VALUES(
	@BillboardID,@MusicID,@Hits,@CollectTimes,@Popularity,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_Update]
@ScriptID bigint,
@ScriptContent varchar(500),
@ScriptParameter varchar(200),
@ScriptDescription varchar(500),
@ModuleID int,
@PortalFuncName varchar(200),
@ScriptCreateTime datetime,
@UserID int
 AS 
	UPDATE [Sys_ScriptInjection] SET 
	[ScriptContent] = @ScriptContent,[ScriptParameter] = @ScriptParameter,[ScriptDescription] = @ScriptDescription,[ModuleID] = @ModuleID,[PortalFuncName] = @PortalFuncName,[ScriptCreateTime] = @ScriptCreateTime,[UserID] = @UserID
	WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_GetModel]
@ScriptID bigint
 AS 
	SELECT 
	ScriptID,ScriptContent,ScriptParameter,ScriptDescription,ModuleID,PortalFuncName,ScriptCreateTime,UserID
	 FROM [Sys_ScriptInjection]
	 WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_GetList]
 AS 
	SELECT 
	ScriptID,ScriptContent,ScriptParameter,ScriptDescription,ModuleID,PortalFuncName,ScriptCreateTime,UserID
	 FROM [Sys_ScriptInjection]
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_Exists]
@ScriptID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_ScriptInjection] WHERE ScriptID=@ScriptID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_Delete]
@ScriptID bigint
 AS 
	DELETE [Sys_ScriptInjection]
	 WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[Sys_ScriptInjection_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_ScriptInjection_ADD]
@ScriptID bigint,
@ScriptContent varchar(500),
@ScriptParameter varchar(200),
@ScriptDescription varchar(500),
@ModuleID int,
@PortalFuncName varchar(200),
@ScriptCreateTime datetime,
@UserID int

 AS 
	INSERT INTO [Sys_ScriptInjection](
	[ScriptID],[ScriptContent],[ScriptParameter],[ScriptDescription],[ModuleID],[PortalFuncName],[ScriptCreateTime],[UserID]
	)VALUES(
	@ScriptID,@ScriptContent,@ScriptParameter,@ScriptDescription,@ModuleID,@PortalFuncName,@ScriptCreateTime,@UserID
	)
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_Update]
@OperateID int,
@OperateName varchar(50),
@OperateDesc varchar(500),
@OperatePY varchar(50)
 AS 
	UPDATE [Sys_Operate] SET 
	[OperateName] = @OperateName,[OperateDesc] = @OperateDesc,[OperatePY] = @OperatePY
	WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_GetModel]
@OperateID int
 AS 
	SELECT 
	OperateID,OperateName,OperateDesc,OperatePY
	 FROM [Sys_Operate]
	 WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([OperateID])+1 FROM [Sys_Operate]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_GetList]
 AS 
	SELECT 
	OperateID,OperateName,OperateDesc,OperatePY
	 FROM [Sys_Operate]
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_Exists]
@OperateID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Operate] WHERE OperateID=@OperateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_Delete]
@OperateID int
 AS 
	DELETE [Sys_Operate]
	 WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Operate_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Operate_ADD]
@OperateID int,
@OperateName varchar(50),
@OperateDesc varchar(500),
@OperatePY varchar(50)

 AS 
	INSERT INTO [Sys_Operate](
	[OperateID],[OperateName],[OperateDesc],[OperatePY]
	)VALUES(
	@OperateID,@OperateName,@OperateDesc,@OperatePY
	)
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_Update]
@ModuleID int,
@ModuleName varchar(50),
@ModuleDesc varchar(500),
@ModulePY varchar(50)
 AS 
	UPDATE [Sys_Module] SET 
	[ModuleName] = @ModuleName,[ModuleDesc] = @ModuleDesc,[ModulePY] = @ModulePY
	WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_GetModel]
@ModuleID int
 AS 
	SELECT 
	ModuleID,ModuleName,ModuleDesc,ModulePY
	 FROM [Sys_Module]
	 WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ModuleID])+1 FROM [Sys_Module]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_GetList]
 AS 
	SELECT 
	ModuleID,ModuleName,ModuleDesc,ModulePY
	 FROM [Sys_Module]
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_Exists]
@ModuleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Module] WHERE ModuleID=@ModuleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_Delete]
@ModuleID int
 AS 
	DELETE [Sys_Module]
	 WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Module_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Module_ADD]
@ModuleID int,
@ModuleName varchar(50),
@ModuleDesc varchar(500),
@ModulePY varchar(50)

 AS 
	INSERT INTO [Sys_Module](
	[ModuleID],[ModuleName],[ModuleDesc],[ModulePY]
	)VALUES(
	@ModuleID,@ModuleName,@ModuleDesc,@ModulePY
	)
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_Update]
@LogID bigint,
@LogUserID int,
@LogUserName varchar(20),
@LogUserIP varchar(50),
@OperateID int,
@LogCreateTime datetime,
@ModuleID int,
@ModifyOldValue varchar(200),
@ModifyNewValue varchar(200),
@ModifyTableName varchar(200),
@PrimaryField varchar(200),
@SecondField varchar(200),
@ModifiedField varchar(200)
 AS 
	UPDATE [Sys_Log] SET 
	[LogUserID] = @LogUserID,[LogUserName] = @LogUserName,[LogUserIP] = @LogUserIP,[OperateID] = @OperateID,[LogCreateTime] = @LogCreateTime,[ModuleID] = @ModuleID,[ModifyOldValue] = @ModifyOldValue,[ModifyNewValue] = @ModifyNewValue,[ModifyTableName] = @ModifyTableName,[PrimaryField] = @PrimaryField,[SecondField] = @SecondField,[ModifiedField] = @ModifiedField
	WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_GetModel]
@LogID bigint
 AS 
	SELECT 
	LogID,LogUserID,LogUserName,LogUserIP,OperateID,LogCreateTime,ModuleID,ModifyOldValue,ModifyNewValue,ModifyTableName,PrimaryField,SecondField,ModifiedField
	 FROM [Sys_Log]
	 WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_GetList]
 AS 
	SELECT 
	LogID,LogUserID,LogUserName,LogUserIP,OperateID,LogCreateTime,ModuleID,ModifyOldValue,ModifyNewValue,ModifyTableName,PrimaryField,SecondField,ModifiedField
	 FROM [Sys_Log]
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_Exists]
@LogID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Log] WHERE LogID=@LogID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_Delete]
@LogID bigint
 AS 
	DELETE [Sys_Log]
	 WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Log_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Log_ADD]
@LogID bigint,
@LogUserID int,
@LogUserName varchar(20),
@LogUserIP varchar(50),
@OperateID int,
@LogCreateTime datetime,
@ModuleID int,
@ModifyOldValue varchar(200),
@ModifyNewValue varchar(200),
@ModifyTableName varchar(200),
@PrimaryField varchar(200),
@SecondField varchar(200),
@ModifiedField varchar(200)

 AS 
	INSERT INTO [Sys_Log](
	[LogID],[LogUserID],[LogUserName],[LogUserIP],[OperateID],[LogCreateTime],[ModuleID],[ModifyOldValue],[ModifyNewValue],[ModifyTableName],[PrimaryField],[SecondField],[ModifiedField]
	)VALUES(
	@LogID,@LogUserID,@LogUserName,@LogUserIP,@OperateID,@LogCreateTime,@ModuleID,@ModifyOldValue,@ModifyNewValue,@ModifyTableName,@PrimaryField,@SecondField,@ModifiedField
	)
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_Update]
@ConfigID nchar(10),
@SettingKey nchar(10),
@SettingValue nchar(10),
@ConfigCreateTime nchar(10),
@ConfigModifyTime nchar(10),
@UserID nchar(10),
@IsDeleted nchar(10),
@IsActive nchar(10)
 AS 
	UPDATE [Sys_Config] SET 
	[SettingKey] = @SettingKey,[SettingValue] = @SettingValue,[ConfigCreateTime] = @ConfigCreateTime,[ConfigModifyTime] = @ConfigModifyTime,[UserID] = @UserID,[IsDeleted] = @IsDeleted,[IsActive] = @IsActive
	WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_GetModel]
@ConfigID nchar(10)
 AS 
	SELECT 
	ConfigID,SettingKey,SettingValue,ConfigCreateTime,ConfigModifyTime,UserID,IsDeleted,IsActive
	 FROM [Sys_Config]
	 WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_GetList]
 AS 
	SELECT 
	ConfigID,SettingKey,SettingValue,ConfigCreateTime,ConfigModifyTime,UserID,IsDeleted,IsActive
	 FROM [Sys_Config]
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_Exists]
@ConfigID nchar(10)
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Config] WHERE ConfigID=@ConfigID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_Delete]
@ConfigID nchar(10)
 AS 
	DELETE [Sys_Config]
	 WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[Sys_Config_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[Sys_Config_ADD]
@ConfigID nchar(10),
@SettingKey nchar(10),
@SettingValue nchar(10),
@ConfigCreateTime nchar(10),
@ConfigModifyTime nchar(10),
@UserID nchar(10),
@IsDeleted nchar(10),
@IsActive nchar(10)

 AS 
	INSERT INTO [Sys_Config](
	[ConfigID],[SettingKey],[SettingValue],[ConfigCreateTime],[ConfigModifyTime],[UserID],[IsDeleted],[IsActive]
	)VALUES(
	@ConfigID,@SettingKey,@SettingValue,@ConfigCreateTime,@ConfigModifyTime,@UserID,@IsDeleted,@IsActive
	)
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_Update]
@UPID bigint,
@UserID int,
@PrivilegeID int,
@PEanble bit
 AS 
	UPDATE [PM_UserPrivilege] SET 
	[UserID] = @UserID,[PrivilegeID] = @PrivilegeID,[PEanble] = @PEanble
	WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_GetModel]
@UPID bigint
 AS 
	SELECT 
	UPID,UserID,PrivilegeID,PEanble
	 FROM [PM_UserPrivilege]
	 WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_GetList]
 AS 
	SELECT 
	UPID,UserID,PrivilegeID,PEanble
	 FROM [PM_UserPrivilege]
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_Exists]
@UPID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_UserPrivilege] WHERE UPID=@UPID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_Delete]
@UPID bigint
 AS 
	DELETE [PM_UserPrivilege]
	 WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserPrivilege_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserPrivilege_ADD]
@UPID bigint,
@UserID int,
@PrivilegeID int,
@PEanble bit

 AS 
	INSERT INTO [PM_UserPrivilege](
	[UPID],[UserID],[PrivilegeID],[PEanble]
	)VALUES(
	@UPID,@UserID,@PrivilegeID,@PEanble
	)
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_Update]
@RPID bigint,
@RoleID int,
@PrivilegeID int,
@PEanble bit
 AS 
	UPDATE [PM_RolePrivilege] SET 
	[RoleID] = @RoleID,[PrivilegeID] = @PrivilegeID,[PEanble] = @PEanble
	WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_GetModel]
@RPID bigint
 AS 
	SELECT 
	RPID,RoleID,PrivilegeID,PEanble
	 FROM [PM_RolePrivilege]
	 WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_GetList]
 AS 
	SELECT 
	RPID,RoleID,PrivilegeID,PEanble
	 FROM [PM_RolePrivilege]
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_Exists]
@RPID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_RolePrivilege] WHERE RPID=@RPID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_Delete]
@RPID bigint
 AS 
	DELETE [PM_RolePrivilege]
	 WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[PM_RolePrivilege_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_RolePrivilege_ADD]
@RPID bigint,
@RoleID int,
@PrivilegeID int,
@PEanble bit

 AS 
	INSERT INTO [PM_RolePrivilege](
	[RPID],[RoleID],[PrivilegeID],[PEanble]
	)VALUES(
	@RPID,@RoleID,@PrivilegeID,@PEanble
	)
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_Update]
@RoleID int,
@ParentRoleID int,
@RoleName varchar(50),
@RoleDesc varchar(200),
@RoleCreateTime datetime,
@RolePY varchar(50)
 AS 
	UPDATE [PM_Role] SET 
	[ParentRoleID] = @ParentRoleID,[RoleName] = @RoleName,[RoleDesc] = @RoleDesc,[RoleCreateTime] = @RoleCreateTime,[RolePY] = @RolePY
	WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_GetModel]
@RoleID int
 AS 
	SELECT 
	RoleID,ParentRoleID,RoleName,RoleDesc,RoleCreateTime,RolePY
	 FROM [PM_Role]
	 WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([RoleID])+1 FROM [PM_Role]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_GetList]
 AS 
	SELECT 
	RoleID,ParentRoleID,RoleName,RoleDesc,RoleCreateTime,RolePY
	 FROM [PM_Role]
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_Exists]
@RoleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_Role] WHERE RoleID=@RoleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_Delete]
@RoleID int
 AS 
	DELETE [PM_Role]
	 WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[PM_Role_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Role_ADD]
@RoleID int,
@ParentRoleID int,
@RoleName varchar(50),
@RoleDesc varchar(200),
@RoleCreateTime datetime,
@RolePY varchar(50)

 AS 
	INSERT INTO [PM_Role](
	[RoleID],[ParentRoleID],[RoleName],[RoleDesc],[RoleCreateTime],[RolePY]
	)VALUES(
	@RoleID,@ParentRoleID,@RoleName,@RoleDesc,@RoleCreateTime,@RolePY
	)
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_Update]
@PrivilegeID int,
@ParentPrivilegeID int,
@PrivilegeName varchar(50),
@PrivilegeDesc varchar(200),
@PrivilegePY varchar(50)
 AS 
	UPDATE [PM_Privilege] SET 
	[ParentPrivilegeID] = @ParentPrivilegeID,[PrivilegeName] = @PrivilegeName,[PrivilegeDesc] = @PrivilegeDesc,[PrivilegePY] = @PrivilegePY
	WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_GetModel]
@PrivilegeID int
 AS 
	SELECT 
	PrivilegeID,ParentPrivilegeID,PrivilegeName,PrivilegeDesc,PrivilegePY
	 FROM [PM_Privilege]
	 WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([PrivilegeID])+1 FROM [PM_Privilege]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_GetList]
 AS 
	SELECT 
	PrivilegeID,ParentPrivilegeID,PrivilegeName,PrivilegeDesc,PrivilegePY
	 FROM [PM_Privilege]
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_Exists]
@PrivilegeID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_Privilege] WHERE PrivilegeID=@PrivilegeID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_Delete]
@PrivilegeID int
 AS 
	DELETE [PM_Privilege]
	 WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[PM_Privilege_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_Privilege_ADD]
@PrivilegeID int,
@ParentPrivilegeID int,
@PrivilegeName varchar(50),
@PrivilegeDesc varchar(200),
@PrivilegePY varchar(50)

 AS 
	INSERT INTO [PM_Privilege](
	[PrivilegeID],[ParentPrivilegeID],[PrivilegeName],[PrivilegeDesc],[PrivilegePY]
	)VALUES(
	@PrivilegeID,@ParentPrivilegeID,@PrivilegeName,@PrivilegeDesc,@PrivilegePY
	)
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_Update]
@ADID int,
@ADTypeID int,
@ADName varchar(500),
@ADDesc varchar(500),
@ImgUrl varchar(500),
@ImgWidth int,
@ImgHeight int,
@LinkUrl varchar(500),
@Priority int,
@Clicks int,
@CreateTime datetime,
@PassedTime datetime,
@OverdueTime datetime,
@ADCompanyID int
 AS 
	UPDATE [BC_Advertisement] SET 
	[ADTypeID] = @ADTypeID,[ADName] = @ADName,[ADDesc] = @ADDesc,[ImgUrl] = @ImgUrl,[ImgWidth] = @ImgWidth,[ImgHeight] = @ImgHeight,[LinkUrl] = @LinkUrl,[Priority] = @Priority,[Clicks] = @Clicks,[CreateTime] = @CreateTime,[PassedTime] = @PassedTime,[OverdueTime] = @OverdueTime,[ADCompanyID] = @ADCompanyID
	WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_GetModel]
@ADID int
 AS 
	SELECT 
	ADID,ADTypeID,ADName,ADDesc,ImgUrl,ImgWidth,ImgHeight,LinkUrl,Priority,Clicks,CreateTime,PassedTime,OverdueTime,ADCompanyID
	 FROM [BC_Advertisement]
	 WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADID])+1 FROM [BC_Advertisement]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_GetList]
 AS 
	SELECT 
	ADID,ADTypeID,ADName,ADDesc,ImgUrl,ImgWidth,ImgHeight,LinkUrl,Priority,Clicks,CreateTime,PassedTime,OverdueTime,ADCompanyID
	 FROM [BC_Advertisement]
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_Exists]
@ADID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_Advertisement] WHERE ADID=@ADID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_Delete]
@ADID int
 AS 
	DELETE [BC_Advertisement]
	 WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[BC_Advertisement_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_Advertisement_ADD]
@ADID int,
@ADTypeID int,
@ADName varchar(500),
@ADDesc varchar(500),
@ImgUrl varchar(500),
@ImgWidth int,
@ImgHeight int,
@LinkUrl varchar(500),
@Priority int,
@Clicks int,
@CreateTime datetime,
@PassedTime datetime,
@OverdueTime datetime,
@ADCompanyID int

 AS 
	INSERT INTO [BC_Advertisement](
	[ADID],[ADTypeID],[ADName],[ADDesc],[ImgUrl],[ImgWidth],[ImgHeight],[LinkUrl],[Priority],[Clicks],[CreateTime],[PassedTime],[OverdueTime],[ADCompanyID]
	)VALUES(
	@ADID,@ADTypeID,@ADName,@ADDesc,@ImgUrl,@ImgWidth,@ImgHeight,@LinkUrl,@Priority,@Clicks,@CreateTime,@PassedTime,@OverdueTime,@ADCompanyID
	)
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_Update]
@ADTypeID int,
@ADTypeName varchar(50),
@ADTypeDesc varchar(500),
@ADTypePY varchar(50)
 AS 
	UPDATE [BC_ADType] SET 
	[ADTypeName] = @ADTypeName,[ADTypeDesc] = @ADTypeDesc,[ADTypePY] = @ADTypePY
	WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_GetModel]
@ADTypeID int
 AS 
	SELECT 
	ADTypeID,ADTypeName,ADTypeDesc,ADTypePY
	 FROM [BC_ADType]
	 WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADTypeID])+1 FROM [BC_ADType]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_GetList]
 AS 
	SELECT 
	ADTypeID,ADTypeName,ADTypeDesc,ADTypePY
	 FROM [BC_ADType]
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_Exists]
@ADTypeID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_ADType] WHERE ADTypeID=@ADTypeID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_Delete]
@ADTypeID int
 AS 
	DELETE [BC_ADType]
	 WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADType_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADType_ADD]
@ADTypeID int,
@ADTypeName varchar(50),
@ADTypeDesc varchar(500),
@ADTypePY varchar(50)

 AS 
	INSERT INTO [BC_ADType](
	[ADTypeID],[ADTypeName],[ADTypeDesc],[ADTypePY]
	)VALUES(
	@ADTypeID,@ADTypeName,@ADTypeDesc,@ADTypePY
	)
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_Update]
@ADCompanyID int,
@ADCompanyName varchar(100),
@ADCompanyDesc varchar(500),
@ADCompanyPY varchar(100)
 AS 
	UPDATE [BC_ADCompany] SET 
	[ADCompanyName] = @ADCompanyName,[ADCompanyDesc] = @ADCompanyDesc,[ADCompanyPY] = @ADCompanyPY
	WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_GetModel]
@ADCompanyID int
 AS 
	SELECT 
	ADCompanyID,ADCompanyName,ADCompanyDesc,ADCompanyPY
	 FROM [BC_ADCompany]
	 WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADCompanyID])+1 FROM [BC_ADCompany]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_GetList]
 AS 
	SELECT 
	ADCompanyID,ADCompanyName,ADCompanyDesc,ADCompanyPY
	 FROM [BC_ADCompany]
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_Exists]
@ADCompanyID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_ADCompany] WHERE ADCompanyID=@ADCompanyID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_Delete]
@ADCompanyID int
 AS 
	DELETE [BC_ADCompany]
	 WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[BC_ADCompany_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[BC_ADCompany_ADD]
@ADCompanyID int,
@ADCompanyName varchar(100),
@ADCompanyDesc varchar(500),
@ADCompanyPY varchar(100)

 AS 
	INSERT INTO [BC_ADCompany](
	[ADCompanyID],[ADCompanyName],[ADCompanyDesc],[ADCompanyPY]
	)VALUES(
	@ADCompanyID,@ADCompanyName,@ADCompanyDesc,@ADCompanyPY
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_Update]
@UserID int,
@UserName varchar(20),
@Sex smallint,
@Birthday datetime,
@IDCardNum nchar(18),
@Email varchar(50),
@Password varchar(50),
@Address varchar(200),
@QQNum varchar(20),
@UserCreateTime datetime,
@UserModifyTime datetime,
@Enable bit,
@LoginName varchar(20),
@LastLoginTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_User] SET 
	[UserName] = @UserName,[Sex] = @Sex,[Birthday] = @Birthday,[IDCardNum] = @IDCardNum,[Email] = @Email,[Password] = @Password,[Address] = @Address,[QQNum] = @QQNum,[UserCreateTime] = @UserCreateTime,[UserModifyTime] = @UserModifyTime,[Enable] = @Enable,[LoginName] = @LoginName,[LastLoginTime] = @LastLoginTime,[IsDeleted] = @IsDeleted
	WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_GetModel]
@UserID int
 AS 
	SELECT 
	UserID,UserName,Sex,Birthday,IDCardNum,Email,Password,Address,QQNum,UserCreateTime,UserModifyTime,Enable,LoginName,LastLoginTime,IsDeleted
	 FROM [t_User]
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([UserID])+1 FROM [t_User]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_GetList]
 AS 
	SELECT 
	UserID,UserName,Sex,Birthday,IDCardNum,Email,Password,Address,QQNum,UserCreateTime,UserModifyTime,Enable,LoginName,LastLoginTime,IsDeleted
	 FROM [t_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_Exists]
@UserID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_User] WHERE UserID=@UserID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_Delete]
@UserID int
 AS 
	DELETE [t_User]
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_User_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_User_ADD]
@UserID int,
@UserName varchar(20),
@Sex smallint,
@Birthday datetime,
@IDCardNum nchar(18),
@Email varchar(50),
@Password varchar(50),
@Address varchar(200),
@QQNum varchar(20),
@UserCreateTime datetime,
@UserModifyTime datetime,
@Enable bit,
@LoginName varchar(20),
@LastLoginTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_User](
	[UserID],[UserName],[Sex],[Birthday],[IDCardNum],[Email],[Password],[Address],[QQNum],[UserCreateTime],[UserModifyTime],[Enable],[LoginName],[LastLoginTime],[IsDeleted]
	)VALUES(
	@UserID,@UserName,@Sex,@Birthday,@IDCardNum,@Email,@Password,@Address,@QQNum,@UserCreateTime,@UserModifyTime,@Enable,@LoginName,@LastLoginTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_Update]
@SingerGroupID int,
@SingerGroupName varchar(50),
@SingerGroupPY varchar(50),
@SingerCount int,
@SingerGroupCreateTime datetime,
@SingerGroupIntro varchar(1000),
@Singers varchar(100),
@IsDeleted bit
 AS 
	UPDATE [t_SingerGroup] SET 
	[SingerGroupName] = @SingerGroupName,[SingerGroupPY] = @SingerGroupPY,[SingerCount] = @SingerCount,[SingerGroupCreateTime] = @SingerGroupCreateTime,[SingerGroupIntro] = @SingerGroupIntro,[Singers] = @Singers,[IsDeleted] = @IsDeleted
	WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_GetModel]
@SingerGroupID int
 AS 
	SELECT 
	SingerGroupID,SingerGroupName,SingerGroupPY,SingerCount,SingerGroupCreateTime,SingerGroupIntro,Singers,IsDeleted
	 FROM [t_SingerGroup]
	 WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SingerGroupID])+1 FROM [t_SingerGroup]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_GetList]
 AS 
	SELECT 
	SingerGroupID,SingerGroupName,SingerGroupPY,SingerCount,SingerGroupCreateTime,SingerGroupIntro,Singers,IsDeleted
	 FROM [t_SingerGroup]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_Exists]
@SingerGroupID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SingerGroup] WHERE SingerGroupID=@SingerGroupID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_Delete]
@SingerGroupID int
 AS 
	DELETE [t_SingerGroup]
	 WHERE SingerGroupID=@SingerGroupID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerGroup_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerGroup_ADD]
@SingerGroupID int,
@SingerGroupName varchar(50),
@SingerGroupPY varchar(50),
@SingerCount int,
@SingerGroupCreateTime datetime,
@SingerGroupIntro varchar(1000),
@Singers varchar(100),
@IsDeleted bit

 AS 
	INSERT INTO [t_SingerGroup](
	[SingerGroupID],[SingerGroupName],[SingerGroupPY],[SingerCount],[SingerGroupCreateTime],[SingerGroupIntro],[Singers],[IsDeleted]
	)VALUES(
	@SingerGroupID,@SingerGroupName,@SingerGroupPY,@SingerCount,@SingerGroupCreateTime,@SingerGroupIntro,@Singers,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_Update]
@CountryID int,
@CountryName varchar(50),
@IsDeleted bit
 AS 
	UPDATE [t_SingerCountry] SET 
	[CountryName] = @CountryName,[IsDeleted] = @IsDeleted
	WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_GetModel]
@CountryID int
 AS 
	SELECT 
	CountryID,CountryName,IsDeleted
	 FROM [t_SingerCountry]
	 WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([CountryID])+1 FROM [t_SingerCountry]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_GetList]
 AS 
	SELECT 
	CountryID,CountryName,IsDeleted
	 FROM [t_SingerCountry]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_Exists]
@CountryID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SingerCountry] WHERE CountryID=@CountryID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_Delete]
@CountryID int
 AS 
	DELETE [t_SingerCountry]
	 WHERE CountryID=@CountryID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SingerCountry_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SingerCountry_ADD]
@CountryID int,
@CountryName varchar(50),
@IsDeleted bit

 AS 
	INSERT INTO [t_SingerCountry](
	[CountryID],[CountryName],[IsDeleted]
	)VALUES(
	@CountryID,@CountryName,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_Update]
@SingerID int,
@SingerName varchar(50),
@SingerPY varchar(50),
@SingerSex smallint,
@SingerIntro varchar(1000),
@CountryID int,
@SingerCreateTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_Singer] SET 
	[SingerName] = @SingerName,[SingerPY] = @SingerPY,[SingerSex] = @SingerSex,[SingerIntro] = @SingerIntro,[CountryID] = @CountryID,[SingerCreateTime] = @SingerCreateTime,[IsDeleted] = @IsDeleted
	WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_GetModel]
@SingerID int
 AS 
	SELECT 
	SingerID,SingerName,SingerPY,SingerSex,SingerIntro,CountryID,SingerCreateTime,IsDeleted
	 FROM [t_Singer]
	 WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SingerID])+1 FROM [t_Singer]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_GetList]
 AS 
	SELECT 
	SingerID,SingerName,SingerPY,SingerSex,SingerIntro,CountryID,SingerCreateTime,IsDeleted
	 FROM [t_Singer]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_Exists]
@SingerID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Singer] WHERE SingerID=@SingerID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_Delete]
@SingerID int
 AS 
	DELETE [t_Singer]
	 WHERE SingerID=@SingerID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Singer_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Singer_ADD]
@SingerID int,
@SingerName varchar(50),
@SingerPY varchar(50),
@SingerSex smallint,
@SingerIntro varchar(1000),
@CountryID int,
@SingerCreateTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_Singer](
	[SingerID],[SingerName],[SingerPY],[SingerSex],[SingerIntro],[CountryID],[SingerCreateTime],[IsDeleted]
	)VALUES(
	@SingerID,@SingerName,@SingerPY,@SingerSex,@SingerIntro,@CountryID,@SingerCreateTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_Update]
@SearchKeywordsID int,
@Keyword varchar(100),
@SearchCount int
 AS 
	UPDATE [t_SearchKeywords] SET 
	[Keyword] = @Keyword,[SearchCount] = @SearchCount
	WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_GetModel]
@SearchKeywordsID int
 AS 
	SELECT 
	SearchKeywordsID,Keyword,SearchCount
	 FROM [t_SearchKeywords]
	 WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([SearchKeywordsID])+1 FROM [t_SearchKeywords]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_GetList]
 AS 
	SELECT 
	SearchKeywordsID,Keyword,SearchCount
	 FROM [t_SearchKeywords]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_Exists]
@SearchKeywordsID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_SearchKeywords] WHERE SearchKeywordsID=@SearchKeywordsID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_Delete]
@SearchKeywordsID int
 AS 
	DELETE [t_SearchKeywords]
	 WHERE SearchKeywordsID=@SearchKeywordsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_SearchKeywords_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_SearchKeywords_ADD]
@SearchKeywordsID int,
@Keyword varchar(100),
@SearchCount int

 AS 
	INSERT INTO [t_SearchKeywords](
	[SearchKeywordsID],[Keyword],[SearchCount]
	)VALUES(
	@SearchKeywordsID,@Keyword,@SearchCount
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_Update]
@MusicStyleID int,
@MusicStyleName varchar(50),
@IsDeleted bit
 AS 
	UPDATE [t_MusicStyle] SET 
	[MusicStyleName] = @MusicStyleName,[IsDeleted] = @IsDeleted
	WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_GetModel]
@MusicStyleID int
 AS 
	SELECT 
	MusicStyleID,MusicStyleName,IsDeleted
	 FROM [t_MusicStyle]
	 WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicStyleID])+1 FROM [t_MusicStyle]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_GetList]
 AS 
	SELECT 
	MusicStyleID,MusicStyleName,IsDeleted
	 FROM [t_MusicStyle]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_Exists]
@MusicStyleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicStyle] WHERE MusicStyleID=@MusicStyleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_Delete]
@MusicStyleID int
 AS 
	DELETE [t_MusicStyle]
	 WHERE MusicStyleID=@MusicStyleID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicStyle_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicStyle_ADD]
@MusicStyleID int,
@MusicStyleName varchar(50),
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicStyle](
	[MusicStyleID],[MusicStyleName],[IsDeleted]
	)VALUES(
	@MusicStyleID,@MusicStyleName,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_Update]
@MusicStateID bigint,
@MusicStateName varchar(50),
@MusicStateDesc varchar(500)
 AS 
	UPDATE [t_MusicState] SET 
	[MusicStateName] = @MusicStateName,[MusicStateDesc] = @MusicStateDesc
	WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_GetModel]
@MusicStateID bigint
 AS 
	SELECT 
	MusicStateID,MusicStateName,MusicStateDesc
	 FROM [t_MusicState]
	 WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_GetList]
 AS 
	SELECT 
	MusicStateID,MusicStateName,MusicStateDesc
	 FROM [t_MusicState]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_Exists]
@MusicStateID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicState] WHERE MusicStateID=@MusicStateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_Delete]
@MusicStateID bigint
 AS 
	DELETE [t_MusicState]
	 WHERE MusicStateID=@MusicStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicState_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicState_ADD]
@MusicStateID bigint,
@MusicStateName varchar(50),
@MusicStateDesc varchar(500)

 AS 
	INSERT INTO [t_MusicState](
	[MusicStateID],[MusicStateName],[MusicStateDesc]
	)VALUES(
	@MusicStateID,@MusicStateName,@MusicStateDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_Update]
@MusicPublisherID int,
@MusicPublisherName varchar(200),
@MusicPublisherDesc varchar(500)
 AS 
	UPDATE [t_MusicPublisher] SET 
	[MusicPublisherName] = @MusicPublisherName,[MusicPublisherDesc] = @MusicPublisherDesc
	WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_GetModel]
@MusicPublisherID int
 AS 
	SELECT 
	MusicPublisherID,MusicPublisherName,MusicPublisherDesc
	 FROM [t_MusicPublisher]
	 WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_GetMaxId]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicPublisherID])+1 FROM [t_MusicPublisher]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_GetList]
 AS 
	SELECT 
	MusicPublisherID,MusicPublisherName,MusicPublisherDesc
	 FROM [t_MusicPublisher]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_Exists]
@MusicPublisherID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicPublisher] WHERE MusicPublisherID=@MusicPublisherID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_Delete]
@MusicPublisherID int
 AS 
	DELETE [t_MusicPublisher]
	 WHERE MusicPublisherID=@MusicPublisherID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicPublisher_ADD]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicPublisher_ADD]
@MusicPublisherID int,
@MusicPublisherName varchar(200),
@MusicPublisherDesc varchar(500)

 AS 
	INSERT INTO [t_MusicPublisher](
	[MusicPublisherID],[MusicPublisherName],[MusicPublisherDesc]
	)VALUES(
	@MusicPublisherID,@MusicPublisherName,@MusicPublisherDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_Update]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_Update]
@MusicLyricID bigint,
@MusicID bigint,
@MusicLyricURL varchar(1000),
@MusicLyricCreateTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicLyric] SET 
	[MusicID] = @MusicID,[MusicLyricURL] = @MusicLyricURL,[MusicLyricCreateTime] = @MusicLyricCreateTime,[IsDeleted] = @IsDeleted
	WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_GetModel]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_GetModel]
@MusicLyricID bigint
 AS 
	SELECT 
	MusicLyricID,MusicID,MusicLyricURL,MusicLyricCreateTime,IsDeleted
	 FROM [t_MusicLyric]
	 WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_GetList]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_GetList]
 AS 
	SELECT 
	MusicLyricID,MusicID,MusicLyricURL,MusicLyricCreateTime,IsDeleted
	 FROM [t_MusicLyric]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_Exists]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_Exists]
@MusicLyricID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicLyric] WHERE MusicLyricID=@MusicLyricID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_Delete]    Script Date: 08/12/2013 18:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_Delete]
@MusicLyricID bigint
 AS 
	DELETE [t_MusicLyric]
	 WHERE MusicLyricID=@MusicLyricID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLyric_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLyric_ADD]
@MusicLyricID bigint,
@MusicID bigint,
@MusicLyricURL varchar(1000),
@MusicLyricCreateTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicLyric](
	[MusicLyricID],[MusicID],[MusicLyricURL],[MusicLyricCreateTime],[IsDeleted]
	)VALUES(
	@MusicLyricID,@MusicID,@MusicLyricURL,@MusicLyricCreateTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_Update]
@MusicLanguageID int,
@MusicLanguageName varchar(50),
@IsDeleted bit
 AS 
	UPDATE [t_MusicLanguage] SET 
	[MusicLanguageName] = @MusicLanguageName,[IsDeleted] = @IsDeleted
	WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_GetModel]
@MusicLanguageID int
 AS 
	SELECT 
	MusicLanguageID,MusicLanguageName,IsDeleted
	 FROM [t_MusicLanguage]
	 WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicLanguageID])+1 FROM [t_MusicLanguage]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_GetList]
 AS 
	SELECT 
	MusicLanguageID,MusicLanguageName,IsDeleted
	 FROM [t_MusicLanguage]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_Exists]
@MusicLanguageID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicLanguage] WHERE MusicLanguageID=@MusicLanguageID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_Delete]
@MusicLanguageID int
 AS 
	DELETE [t_MusicLanguage]
	 WHERE MusicLanguageID=@MusicLanguageID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicLanguage_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicLanguage_ADD]
@MusicLanguageID int,
@MusicLanguageName varchar(50),
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicLanguage](
	[MusicLanguageID],[MusicLanguageName],[IsDeleted]
	)VALUES(
	@MusicLanguageID,@MusicLanguageName,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_Update]
@MusicGuestbookID bigint,
@MusicID bigint,
@UserID int,
@LeaveWords varchar(1000),
@LeaveTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicGuestbook] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[LeaveWords] = @LeaveWords,[LeaveTime] = @LeaveTime,[IsDeleted] = @IsDeleted
	WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_GetModel]
@MusicGuestbookID bigint
 AS 
	SELECT 
	MusicGuestbookID,MusicID,UserID,LeaveWords,LeaveTime,IsDeleted
	 FROM [t_MusicGuestbook]
	 WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_GetList]
 AS 
	SELECT 
	MusicGuestbookID,MusicID,UserID,LeaveWords,LeaveTime,IsDeleted
	 FROM [t_MusicGuestbook]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_Exists]
@MusicGuestbookID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicGuestbook] WHERE MusicGuestbookID=@MusicGuestbookID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_Delete]
@MusicGuestbookID bigint
 AS 
	DELETE [t_MusicGuestbook]
	 WHERE MusicGuestbookID=@MusicGuestbookID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicGuestbook_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicGuestbook_ADD]
@MusicGuestbookID bigint,
@MusicID bigint,
@UserID int,
@LeaveWords varchar(1000),
@LeaveTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicGuestbook](
	[MusicGuestbookID],[MusicID],[UserID],[LeaveWords],[LeaveTime],[IsDeleted]
	)VALUES(
	@MusicGuestbookID,@MusicID,@UserID,@LeaveWords,@LeaveTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_Update]
@MusicCollectionID bigint,
@MusicID bigint,
@UserID int,
@CollectTime datetime,
@IsDeleted bit
 AS 
	UPDATE [t_MusicCollection] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[CollectTime] = @CollectTime,[IsDeleted] = @IsDeleted
	WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_GetModel]
@MusicCollectionID bigint
 AS 
	SELECT 
	MusicCollectionID,MusicID,UserID,CollectTime,IsDeleted
	 FROM [t_MusicCollection]
	 WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_GetList]
 AS 
	SELECT 
	MusicCollectionID,MusicID,UserID,CollectTime,IsDeleted
	 FROM [t_MusicCollection]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_Exists]
@MusicCollectionID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicCollection] WHERE MusicCollectionID=@MusicCollectionID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_Delete]
@MusicCollectionID bigint
 AS 
	DELETE [t_MusicCollection]
	 WHERE MusicCollectionID=@MusicCollectionID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicCollection_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicCollection_ADD]
@MusicCollectionID bigint,
@MusicID bigint,
@UserID int,
@CollectTime datetime,
@IsDeleted bit

 AS 
	INSERT INTO [t_MusicCollection](
	[MusicCollectionID],[MusicID],[UserID],[CollectTime],[IsDeleted]
	)VALUES(
	@MusicCollectionID,@MusicID,@UserID,@CollectTime,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_Update]
@MusicAlbumID int,
@MusicAlbumName varchar(50),
@MusicAlbumPY varchar(50),
@PublishDate datetime,
@IsDeleted bit,
@Musics varchar(500),
@MusicPublisherID int
 AS 
	UPDATE [t_MusicAlbum] SET 
	[MusicAlbumName] = @MusicAlbumName,[MusicAlbumPY] = @MusicAlbumPY,[PublishDate] = @PublishDate,[IsDeleted] = @IsDeleted,[Musics] = @Musics,[MusicPublisherID] = @MusicPublisherID
	WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_GetModel]
@MusicAlbumID int
 AS 
	SELECT 
	MusicAlbumID,MusicAlbumName,MusicAlbumPY,PublishDate,IsDeleted,Musics,MusicPublisherID
	 FROM [t_MusicAlbum]
	 WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([MusicAlbumID])+1 FROM [t_MusicAlbum]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_GetList]
 AS 
	SELECT 
	MusicAlbumID,MusicAlbumName,MusicAlbumPY,PublishDate,IsDeleted,Musics,MusicPublisherID
	 FROM [t_MusicAlbum]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_Exists]
@MusicAlbumID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_MusicAlbum] WHERE MusicAlbumID=@MusicAlbumID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_Delete]
@MusicAlbumID int
 AS 
	DELETE [t_MusicAlbum]
	 WHERE MusicAlbumID=@MusicAlbumID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_MusicAlbum_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_MusicAlbum_ADD]
@MusicAlbumID int,
@MusicAlbumName varchar(50),
@MusicAlbumPY varchar(50),
@PublishDate datetime,
@IsDeleted bit,
@Musics varchar(500),
@MusicPublisherID int

 AS 
	INSERT INTO [t_MusicAlbum](
	[MusicAlbumID],[MusicAlbumName],[MusicAlbumPY],[PublishDate],[IsDeleted],[Musics],[MusicPublisherID]
	)VALUES(
	@MusicAlbumID,@MusicAlbumName,@MusicAlbumPY,@PublishDate,@IsDeleted,@Musics,@MusicPublisherID
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_Update]
@MusicID bigint,
@MusicName varchar(100),
@MusicPY varchar(100),
@SingerId int,
@SingerGroupID int,
@MusicURL varchar(1000),
@MusicSearchURLEncoded varchar(1000),
@MusicSearchURLDecoded varchar(1000),
@ExtensionsID int,
@PublishDate datetime,
@MusicLyricID int,
@MusicStyleID int,
@MusicCreateTime datetime,
@MusicDesc varchar(1000),
@MusicLanguageID int,
@IsDeleted bit,
@MusicPublisherID int,
@MusicStateID int,
@RecommendUserId int
 AS 
	UPDATE [t_Music] SET 
	[MusicName] = @MusicName,[MusicPY] = @MusicPY,[SingerId] = @SingerId,[SingerGroupID] = @SingerGroupID,[MusicURL] = @MusicURL,[MusicSearchURLEncoded] = @MusicSearchURLEncoded,[MusicSearchURLDecoded] = @MusicSearchURLDecoded,[ExtensionsID] = @ExtensionsID,[PublishDate] = @PublishDate,[MusicLyricID] = @MusicLyricID,[MusicStyleID] = @MusicStyleID,[MusicCreateTime] = @MusicCreateTime,[MusicDesc] = @MusicDesc,[MusicLanguageID] = @MusicLanguageID,[IsDeleted] = @IsDeleted,[MusicPublisherID] = @MusicPublisherID,[MusicStateID] = @MusicStateID,[RecommendUserId] = @RecommendUserId
	WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_GetModel]
@MusicID bigint
 AS 
	SELECT 
	MusicID,MusicName,MusicPY,SingerId,SingerGroupID,MusicURL,MusicSearchURLEncoded,MusicSearchURLDecoded,ExtensionsID,PublishDate,MusicLyricID,MusicStyleID,MusicCreateTime,MusicDesc,MusicLanguageID,IsDeleted,MusicPublisherID,MusicStateID,RecommendUserId
	 FROM [t_Music]
	 WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_GetList]
 AS 
	SELECT 
	MusicID,MusicName,MusicPY,SingerId,SingerGroupID,MusicURL,MusicSearchURLEncoded,MusicSearchURLDecoded,ExtensionsID,PublishDate,MusicLyricID,MusicStyleID,MusicCreateTime,MusicDesc,MusicLanguageID,IsDeleted,MusicPublisherID,MusicStateID,RecommendUserId
	 FROM [t_Music]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_Exists]
@MusicID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Music] WHERE MusicID=@MusicID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_Delete]
@MusicID bigint
 AS 
	DELETE [t_Music]
	 WHERE MusicID=@MusicID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Music_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Music_ADD]
@MusicID bigint,
@MusicName varchar(100),
@MusicPY varchar(100),
@SingerId int,
@SingerGroupID int,
@MusicURL varchar(1000),
@MusicSearchURLEncoded varchar(1000),
@MusicSearchURLDecoded varchar(1000),
@ExtensionsID int,
@PublishDate datetime,
@MusicLyricID int,
@MusicStyleID int,
@MusicCreateTime datetime,
@MusicDesc varchar(1000),
@MusicLanguageID int,
@IsDeleted bit,
@MusicPublisherID int,
@MusicStateID int,
@RecommendUserId int

 AS 
	INSERT INTO [t_Music](
	[MusicID],[MusicName],[MusicPY],[SingerId],[SingerGroupID],[MusicURL],[MusicSearchURLEncoded],[MusicSearchURLDecoded],[ExtensionsID],[PublishDate],[MusicLyricID],[MusicStyleID],[MusicCreateTime],[MusicDesc],[MusicLanguageID],[IsDeleted],[MusicPublisherID],[MusicStateID],[RecommendUserId]
	)VALUES(
	@MusicID,@MusicName,@MusicPY,@SingerId,@SingerGroupID,@MusicURL,@MusicSearchURLEncoded,@MusicSearchURLDecoded,@ExtensionsID,@PublishDate,@MusicLyricID,@MusicStyleID,@MusicCreateTime,@MusicDesc,@MusicLanguageID,@IsDeleted,@MusicPublisherID,@MusicStateID,@RecommendUserId
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_Update]
@LoginStateID int,
@LoginStateName varchar(50),
@LoginStateDesc varchar(500)
 AS 
	UPDATE [t_LoginState] SET 
	[LoginStateName] = @LoginStateName,[LoginStateDesc] = @LoginStateDesc
	WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_GetModel]
@LoginStateID int
 AS 
	SELECT 
	LoginStateID,LoginStateName,LoginStateDesc
	 FROM [t_LoginState]
	 WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([LoginStateID])+1 FROM [t_LoginState]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_GetList]
 AS 
	SELECT 
	LoginStateID,LoginStateName,LoginStateDesc
	 FROM [t_LoginState]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_Exists]
@LoginStateID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_LoginState] WHERE LoginStateID=@LoginStateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_Delete]
@LoginStateID int
 AS 
	DELETE [t_LoginState]
	 WHERE LoginStateID=@LoginStateID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LoginState_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LoginState_ADD]
@LoginStateID int,
@LoginStateName varchar(50),
@LoginStateDesc varchar(500)

 AS 
	INSERT INTO [t_LoginState](
	[LoginStateID],[LoginStateName],[LoginStateDesc]
	)VALUES(
	@LoginStateID,@LoginStateName,@LoginStateDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_Update]
@LoginID bigint,
@UserID int,
@LoginTime datetime,
@LoginIP varchar(50),
@Browser varchar(50),
@Resolution varchar(100),
@LoginStateID int
 AS 
	UPDATE [t_Login] SET 
	[UserID] = @UserID,[LoginTime] = @LoginTime,[LoginIP] = @LoginIP,[Browser] = @Browser,[Resolution] = @Resolution,[LoginStateID] = @LoginStateID
	WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_GetModel]
@LoginID bigint
 AS 
	SELECT 
	LoginID,UserID,LoginTime,LoginIP,Browser,Resolution,LoginStateID
	 FROM [t_Login]
	 WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_GetList]
 AS 
	SELECT 
	LoginID,UserID,LoginTime,LoginIP,Browser,Resolution,LoginStateID
	 FROM [t_Login]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_Exists]
@LoginID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Login] WHERE LoginID=@LoginID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_Delete]
@LoginID bigint
 AS 
	DELETE [t_Login]
	 WHERE LoginID=@LoginID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Login_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Login_ADD]
@LoginID bigint,
@UserID int,
@LoginTime datetime,
@LoginIP varchar(50),
@Browser varchar(50),
@Resolution varchar(100),
@LoginStateID int

 AS 
	INSERT INTO [t_Login](
	[LoginID],[UserID],[LoginTime],[LoginIP],[Browser],[Resolution],[LoginStateID]
	)VALUES(
	@LoginID,@UserID,@LoginTime,@LoginIP,@Browser,@Resolution,@LoginStateID
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_Update]
@LastListenID bigint,
@MusicID bigint,
@UserID int,
@LastTime datetime
 AS 
	UPDATE [t_LastListen] SET 
	[MusicID] = @MusicID,[UserID] = @UserID,[LastTime] = @LastTime
	WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_GetModel]
@LastListenID bigint
 AS 
	SELECT 
	LastListenID,MusicID,UserID,LastTime
	 FROM [t_LastListen]
	 WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_GetList]
 AS 
	SELECT 
	LastListenID,MusicID,UserID,LastTime
	 FROM [t_LastListen]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_Exists]
@LastListenID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_LastListen] WHERE LastListenID=@LastListenID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_Delete]
@LastListenID bigint
 AS 
	DELETE [t_LastListen]
	 WHERE LastListenID=@LastListenID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_LastListen_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_LastListen_ADD]
@LastListenID bigint,
@MusicID bigint,
@UserID int,
@LastTime datetime

 AS 
	INSERT INTO [t_LastListen](
	[LastListenID],[MusicID],[UserID],[LastTime]
	)VALUES(
	@LastListenID,@MusicID,@UserID,@LastTime
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_Update]
@FeedbackID bigint,
@UserID int,
@FeedbackContent varchar(1000),
@FeedbackTime datetime,
@IsDeleted bit,
@FeedBackEmail varchar(50)
 AS 
	UPDATE [t_Feedback] SET 
	[UserID] = @UserID,[FeedbackContent] = @FeedbackContent,[FeedbackTime] = @FeedbackTime,[IsDeleted] = @IsDeleted,[FeedBackEmail] = @FeedBackEmail
	WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_GetModel]
@FeedbackID bigint
 AS 
	SELECT 
	FeedbackID,UserID,FeedbackContent,FeedbackTime,IsDeleted,FeedBackEmail
	 FROM [t_Feedback]
	 WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_GetList]
 AS 
	SELECT 
	FeedbackID,UserID,FeedbackContent,FeedbackTime,IsDeleted,FeedBackEmail
	 FROM [t_Feedback]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_Exists]
@FeedbackID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Feedback] WHERE FeedbackID=@FeedbackID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_Delete]
@FeedbackID bigint
 AS 
	DELETE [t_Feedback]
	 WHERE FeedbackID=@FeedbackID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Feedback_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Feedback_ADD]
@FeedbackID bigint,
@UserID int,
@FeedbackContent varchar(1000),
@FeedbackTime datetime,
@IsDeleted bit,
@FeedBackEmail varchar(50)

 AS 
	INSERT INTO [t_Feedback](
	[FeedbackID],[UserID],[FeedbackContent],[FeedbackTime],[IsDeleted],[FeedBackEmail]
	)VALUES(
	@FeedbackID,@UserID,@FeedbackContent,@FeedbackTime,@IsDeleted,@FeedBackEmail
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_Update]
@ExtensionsID int,
@ExtensionsName varchar(50),
@IsDeleted bit
 AS 
	UPDATE [t_Extensions] SET 
	[ExtensionsName] = @ExtensionsName,[IsDeleted] = @IsDeleted
	WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_GetModel]
@ExtensionsID int
 AS 
	SELECT 
	ExtensionsID,ExtensionsName,IsDeleted
	 FROM [t_Extensions]
	 WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ExtensionsID])+1 FROM [t_Extensions]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_GetList]
 AS 
	SELECT 
	ExtensionsID,ExtensionsName,IsDeleted
	 FROM [t_Extensions]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_Exists]
@ExtensionsID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Extensions] WHERE ExtensionsID=@ExtensionsID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_Delete]
@ExtensionsID int
 AS 
	DELETE [t_Extensions]
	 WHERE ExtensionsID=@ExtensionsID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Extensions_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Extensions_ADD]
@ExtensionsID int,
@ExtensionsName varchar(50),
@IsDeleted bit

 AS 
	INSERT INTO [t_Extensions](
	[ExtensionsID],[ExtensionsName],[IsDeleted]
	)VALUES(
	@ExtensionsID,@ExtensionsName,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_Update]
@BillboardID bigint,
@MusicID bigint,
@Hits int,
@CollectTimes int,
@Popularity int,
@IsDeleted bit
 AS 
	UPDATE [t_Billboard] SET 
	[MusicID] = @MusicID,[Hits] = @Hits,[CollectTimes] = @CollectTimes,[Popularity] = @Popularity,[IsDeleted] = @IsDeleted
	WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_GetModel]
@BillboardID bigint
 AS 
	SELECT 
	BillboardID,MusicID,Hits,CollectTimes,Popularity,IsDeleted
	 FROM [t_Billboard]
	 WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_GetList]
 AS 
	SELECT 
	BillboardID,MusicID,Hits,CollectTimes,Popularity,IsDeleted
	 FROM [t_Billboard]
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_Exists]
@BillboardID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [t_Billboard] WHERE BillboardID=@BillboardID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_Delete]
@BillboardID bigint
 AS 
	DELETE [t_Billboard]
	 WHERE BillboardID=@BillboardID
GO
/****** Object:  StoredProcedure [dbo].[sp_t_Billboard_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_t_Billboard_ADD]
@BillboardID bigint,
@MusicID bigint,
@Hits int,
@CollectTimes int,
@Popularity int,
@IsDeleted bit

 AS 
	INSERT INTO [t_Billboard](
	[BillboardID],[MusicID],[Hits],[CollectTimes],[Popularity],[IsDeleted]
	)VALUES(
	@BillboardID,@MusicID,@Hits,@CollectTimes,@Popularity,@IsDeleted
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_Update]
@ScriptID bigint,
@ScriptContent varchar(500),
@ScriptParameter varchar(200),
@ScriptDescription varchar(500),
@ModuleID int,
@PortalFuncName varchar(200),
@ScriptCreateTime datetime,
@UserID int
 AS 
	UPDATE [Sys_ScriptInjection] SET 
	[ScriptContent] = @ScriptContent,[ScriptParameter] = @ScriptParameter,[ScriptDescription] = @ScriptDescription,[ModuleID] = @ModuleID,[PortalFuncName] = @PortalFuncName,[ScriptCreateTime] = @ScriptCreateTime,[UserID] = @UserID
	WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_GetModel]
@ScriptID bigint
 AS 
	SELECT 
	ScriptID,ScriptContent,ScriptParameter,ScriptDescription,ModuleID,PortalFuncName,ScriptCreateTime,UserID
	 FROM [Sys_ScriptInjection]
	 WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_GetList]
 AS 
	SELECT 
	ScriptID,ScriptContent,ScriptParameter,ScriptDescription,ModuleID,PortalFuncName,ScriptCreateTime,UserID
	 FROM [Sys_ScriptInjection]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_Exists]
@ScriptID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_ScriptInjection] WHERE ScriptID=@ScriptID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_Delete]
@ScriptID bigint
 AS 
	DELETE [Sys_ScriptInjection]
	 WHERE ScriptID=@ScriptID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_ScriptInjection_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_ScriptInjection_ADD]
@ScriptID bigint,
@ScriptContent varchar(500),
@ScriptParameter varchar(200),
@ScriptDescription varchar(500),
@ModuleID int,
@PortalFuncName varchar(200),
@ScriptCreateTime datetime,
@UserID int

 AS 
	INSERT INTO [Sys_ScriptInjection](
	[ScriptID],[ScriptContent],[ScriptParameter],[ScriptDescription],[ModuleID],[PortalFuncName],[ScriptCreateTime],[UserID]
	)VALUES(
	@ScriptID,@ScriptContent,@ScriptParameter,@ScriptDescription,@ModuleID,@PortalFuncName,@ScriptCreateTime,@UserID
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_Update]
@OperateID int,
@OperateName varchar(50),
@OperateDesc varchar(500)
 AS 
	UPDATE [Sys_Operate] SET 
	[OperateName] = @OperateName,[OperateDesc] = @OperateDesc
	WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_GetModel]
@OperateID int
 AS 
	SELECT 
	OperateID,OperateName,OperateDesc
	 FROM [Sys_Operate]
	 WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([OperateID])+1 FROM [Sys_Operate]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_GetList]
 AS 
	SELECT 
	OperateID,OperateName,OperateDesc
	 FROM [Sys_Operate]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_Exists]
@OperateID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Operate] WHERE OperateID=@OperateID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_Delete]
@OperateID int
 AS 
	DELETE [Sys_Operate]
	 WHERE OperateID=@OperateID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Operate_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Operate_ADD]
@OperateID int,
@OperateName varchar(50),
@OperateDesc varchar(500)

 AS 
	INSERT INTO [Sys_Operate](
	[OperateID],[OperateName],[OperateDesc]
	)VALUES(
	@OperateID,@OperateName,@OperateDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_Update]
@ModuleID int,
@ModuleName varchar(50),
@ModuleDesc varchar(500)
 AS 
	UPDATE [Sys_Module] SET 
	[ModuleName] = @ModuleName,[ModuleDesc] = @ModuleDesc
	WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_GetModel]
@ModuleID int
 AS 
	SELECT 
	ModuleID,ModuleName,ModuleDesc
	 FROM [Sys_Module]
	 WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ModuleID])+1 FROM [Sys_Module]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_GetList]
 AS 
	SELECT 
	ModuleID,ModuleName,ModuleDesc
	 FROM [Sys_Module]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_Exists]
@ModuleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Module] WHERE ModuleID=@ModuleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_Delete]
@ModuleID int
 AS 
	DELETE [Sys_Module]
	 WHERE ModuleID=@ModuleID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Module_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Module_ADD]
@ModuleID int,
@ModuleName varchar(50),
@ModuleDesc varchar(500)

 AS 
	INSERT INTO [Sys_Module](
	[ModuleID],[ModuleName],[ModuleDesc]
	)VALUES(
	@ModuleID,@ModuleName,@ModuleDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_Update]
@LogID bigint,
@LogUserID int,
@LogUserName varchar(20),
@LogUserIP varchar(50),
@OperateID int,
@LogCreateTime datetime,
@ModuleID int,
@ModifyOldValue varchar(200),
@ModifyNewValue varchar(200),
@ModifyTableName varchar(200),
@PrimaryField varchar(200),
@SecondField varchar(200),
@ModifiedField varchar(200)
 AS 
	UPDATE [Sys_Log] SET 
	[LogUserID] = @LogUserID,[LogUserName] = @LogUserName,[LogUserIP] = @LogUserIP,[OperateID] = @OperateID,[LogCreateTime] = @LogCreateTime,[ModuleID] = @ModuleID,[ModifyOldValue] = @ModifyOldValue,[ModifyNewValue] = @ModifyNewValue,[ModifyTableName] = @ModifyTableName,[PrimaryField] = @PrimaryField,[SecondField] = @SecondField,[ModifiedField] = @ModifiedField
	WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_GetModel]
@LogID bigint
 AS 
	SELECT 
	LogID,LogUserID,LogUserName,LogUserIP,OperateID,LogCreateTime,ModuleID,ModifyOldValue,ModifyNewValue,ModifyTableName,PrimaryField,SecondField,ModifiedField
	 FROM [Sys_Log]
	 WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_GetList]
 AS 
	SELECT 
	LogID,LogUserID,LogUserName,LogUserIP,OperateID,LogCreateTime,ModuleID,ModifyOldValue,ModifyNewValue,ModifyTableName,PrimaryField,SecondField,ModifiedField
	 FROM [Sys_Log]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_Exists]
@LogID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Log] WHERE LogID=@LogID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_Delete]
@LogID bigint
 AS 
	DELETE [Sys_Log]
	 WHERE LogID=@LogID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Log_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Log_ADD]
@LogID bigint,
@LogUserID int,
@LogUserName varchar(20),
@LogUserIP varchar(50),
@OperateID int,
@LogCreateTime datetime,
@ModuleID int,
@ModifyOldValue varchar(200),
@ModifyNewValue varchar(200),
@ModifyTableName varchar(200),
@PrimaryField varchar(200),
@SecondField varchar(200),
@ModifiedField varchar(200)

 AS 
	INSERT INTO [Sys_Log](
	[LogID],[LogUserID],[LogUserName],[LogUserIP],[OperateID],[LogCreateTime],[ModuleID],[ModifyOldValue],[ModifyNewValue],[ModifyTableName],[PrimaryField],[SecondField],[ModifiedField]
	)VALUES(
	@LogID,@LogUserID,@LogUserName,@LogUserIP,@OperateID,@LogCreateTime,@ModuleID,@ModifyOldValue,@ModifyNewValue,@ModifyTableName,@PrimaryField,@SecondField,@ModifiedField
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_Update]
@ConfigID nchar(10),
@SettingKey nchar(10),
@SettingValue nchar(10),
@ConfigCreateTime nchar(10),
@ConfigModifyTime nchar(10),
@UserID nchar(10),
@IsDeleted nchar(10),
@IsActive nchar(10)
 AS 
	UPDATE [Sys_Config] SET 
	[SettingKey] = @SettingKey,[SettingValue] = @SettingValue,[ConfigCreateTime] = @ConfigCreateTime,[ConfigModifyTime] = @ConfigModifyTime,[UserID] = @UserID,[IsDeleted] = @IsDeleted,[IsActive] = @IsActive
	WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_GetModel]
@ConfigID nchar(10)
 AS 
	SELECT 
	ConfigID,SettingKey,SettingValue,ConfigCreateTime,ConfigModifyTime,UserID,IsDeleted,IsActive
	 FROM [Sys_Config]
	 WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_GetList]
 AS 
	SELECT 
	ConfigID,SettingKey,SettingValue,ConfigCreateTime,ConfigModifyTime,UserID,IsDeleted,IsActive
	 FROM [Sys_Config]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_Exists]
@ConfigID nchar(10)
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [Sys_Config] WHERE ConfigID=@ConfigID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_Delete]
@ConfigID nchar(10)
 AS 
	DELETE [Sys_Config]
	 WHERE ConfigID=@ConfigID
GO
/****** Object:  StoredProcedure [dbo].[sp_Sys_Config_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_Sys_Config_ADD]
@ConfigID nchar(10),
@SettingKey nchar(10),
@SettingValue nchar(10),
@ConfigCreateTime nchar(10),
@ConfigModifyTime nchar(10),
@UserID nchar(10),
@IsDeleted nchar(10),
@IsActive nchar(10)

 AS 
	INSERT INTO [Sys_Config](
	[ConfigID],[SettingKey],[SettingValue],[ConfigCreateTime],[ConfigModifyTime],[UserID],[IsDeleted],[IsActive]
	)VALUES(
	@ConfigID,@SettingKey,@SettingValue,@ConfigCreateTime,@ConfigModifyTime,@UserID,@IsDeleted,@IsActive
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_Update]
@URID bigint,
@UserID int,
@RoleID int,
@PEanble bit
 AS 
	UPDATE [PM_UserRole] SET 
	[UserID] = @UserID,[RoleID] = @RoleID,[PEanble] = @PEanble
	WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_GetModel]
@URID bigint
 AS 
	SELECT 
	URID,UserID,RoleID,PEanble
	 FROM [PM_UserRole]
	 WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_GetList]
 AS 
	SELECT 
	URID,UserID,RoleID,PEanble
	 FROM [PM_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_Exists]
@URID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_UserRole] WHERE URID=@URID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_Delete]
@URID bigint
 AS 
	DELETE [PM_UserRole]
	 WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserRole_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserRole_ADD]
@URID bigint,
@UserID int,
@RoleID int,
@PEanble bit

 AS 
	INSERT INTO [PM_UserRole](
	[URID],[UserID],[RoleID],[PEanble]
	)VALUES(
	@URID,@UserID,@RoleID,@PEanble
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_Update]
@UPID bigint,
@UserID int,
@PrivilegeID int,
@PEanble bit
 AS 
	UPDATE [PM_UserPrivilege] SET 
	[UserID] = @UserID,[PrivilegeID] = @PrivilegeID,[PEanble] = @PEanble
	WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_GetModel]
@UPID bigint
 AS 
	SELECT 
	UPID,UserID,PrivilegeID,PEanble
	 FROM [PM_UserPrivilege]
	 WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_GetList]
 AS 
	SELECT 
	UPID,UserID,PrivilegeID,PEanble
	 FROM [PM_UserPrivilege]
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_Exists]
@UPID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_UserPrivilege] WHERE UPID=@UPID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_Delete]
@UPID bigint
 AS 
	DELETE [PM_UserPrivilege]
	 WHERE UPID=@UPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_UserPrivilege_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_UserPrivilege_ADD]
@UPID bigint,
@UserID int,
@PrivilegeID int,
@PEanble bit

 AS 
	INSERT INTO [PM_UserPrivilege](
	[UPID],[UserID],[PrivilegeID],[PEanble]
	)VALUES(
	@UPID,@UserID,@PrivilegeID,@PEanble
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_Update]
@RPID bigint,
@RoleID int,
@PrivilegeID int,
@PEanble bit
 AS 
	UPDATE [PM_RolePrivilege] SET 
	[RoleID] = @RoleID,[PrivilegeID] = @PrivilegeID,[PEanble] = @PEanble
	WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_GetModel]
@RPID bigint
 AS 
	SELECT 
	RPID,RoleID,PrivilegeID,PEanble
	 FROM [PM_RolePrivilege]
	 WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_GetList]
 AS 
	SELECT 
	RPID,RoleID,PrivilegeID,PEanble
	 FROM [PM_RolePrivilege]
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_Exists]
@RPID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_RolePrivilege] WHERE RPID=@RPID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_Delete]
@RPID bigint
 AS 
	DELETE [PM_RolePrivilege]
	 WHERE RPID=@RPID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_RolePrivilege_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_RolePrivilege_ADD]
@RPID bigint,
@RoleID int,
@PrivilegeID int,
@PEanble bit

 AS 
	INSERT INTO [PM_RolePrivilege](
	[RPID],[RoleID],[PrivilegeID],[PEanble]
	)VALUES(
	@RPID,@RoleID,@PrivilegeID,@PEanble
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_Update]
@RoleID int,
@ParentRoleID int,
@RoleName varchar(50),
@RoleDesc varchar(200),
@RoleCreateTime datetime
 AS 
	UPDATE [PM_Role] SET 
	[ParentRoleID] = @ParentRoleID,[RoleName] = @RoleName,[RoleDesc] = @RoleDesc,[RoleCreateTime] = @RoleCreateTime
	WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_GetModel]
@RoleID int
 AS 
	SELECT 
	RoleID,ParentRoleID,RoleName,RoleDesc,RoleCreateTime
	 FROM [PM_Role]
	 WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([RoleID])+1 FROM [PM_Role]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_GetList]
 AS 
	SELECT 
	RoleID,ParentRoleID,RoleName,RoleDesc,RoleCreateTime
	 FROM [PM_Role]
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_Exists]
@RoleID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_Role] WHERE RoleID=@RoleID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_Delete]
@RoleID int
 AS 
	DELETE [PM_Role]
	 WHERE RoleID=@RoleID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Role_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Role_ADD]
@RoleID int,
@ParentRoleID int,
@RoleName varchar(50),
@RoleDesc varchar(200),
@RoleCreateTime datetime

 AS 
	INSERT INTO [PM_Role](
	[RoleID],[ParentRoleID],[RoleName],[RoleDesc],[RoleCreateTime]
	)VALUES(
	@RoleID,@ParentRoleID,@RoleName,@RoleDesc,@RoleCreateTime
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_Update]
@PrivilegeID int,
@ParentPrivilegeID int,
@PrivilegeName varchar(50),
@PrivilegeDesc varchar(200)
 AS 
	UPDATE [PM_Privilege] SET 
	[ParentPrivilegeID] = @ParentPrivilegeID,[PrivilegeName] = @PrivilegeName,[PrivilegeDesc] = @PrivilegeDesc
	WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_GetModel]
@PrivilegeID int
 AS 
	SELECT 
	PrivilegeID,ParentPrivilegeID,PrivilegeName,PrivilegeDesc
	 FROM [PM_Privilege]
	 WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([PrivilegeID])+1 FROM [PM_Privilege]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_GetList]
 AS 
	SELECT 
	PrivilegeID,ParentPrivilegeID,PrivilegeName,PrivilegeDesc
	 FROM [PM_Privilege]
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_Exists]
@PrivilegeID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_Privilege] WHERE PrivilegeID=@PrivilegeID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_Delete]
@PrivilegeID int
 AS 
	DELETE [PM_Privilege]
	 WHERE PrivilegeID=@PrivilegeID
GO
/****** Object:  StoredProcedure [dbo].[sp_PM_Privilege_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_PM_Privilege_ADD]
@PrivilegeID int,
@ParentPrivilegeID int,
@PrivilegeName varchar(50),
@PrivilegeDesc varchar(200)

 AS 
	INSERT INTO [PM_Privilege](
	[PrivilegeID],[ParentPrivilegeID],[PrivilegeName],[PrivilegeDesc]
	)VALUES(
	@PrivilegeID,@ParentPrivilegeID,@PrivilegeName,@PrivilegeDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_Update]
@ADID int,
@ADTypeID int,
@ADName varchar(500),
@ADDesc varchar(500),
@ImgUrl varchar(500),
@ImgWidth int,
@ImgHeight int,
@LinkUrl varchar(500),
@Priority int,
@Clicks int,
@CreateTime datetime,
@PassedTime datetime,
@OverdueTime datetime,
@ADCompanyID int
 AS 
	UPDATE [BC_Advertisement] SET 
	[ADTypeID] = @ADTypeID,[ADName] = @ADName,[ADDesc] = @ADDesc,[ImgUrl] = @ImgUrl,[ImgWidth] = @ImgWidth,[ImgHeight] = @ImgHeight,[LinkUrl] = @LinkUrl,[Priority] = @Priority,[Clicks] = @Clicks,[CreateTime] = @CreateTime,[PassedTime] = @PassedTime,[OverdueTime] = @OverdueTime,[ADCompanyID] = @ADCompanyID
	WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_GetModel]
@ADID int
 AS 
	SELECT 
	ADID,ADTypeID,ADName,ADDesc,ImgUrl,ImgWidth,ImgHeight,LinkUrl,Priority,Clicks,CreateTime,PassedTime,OverdueTime,ADCompanyID
	 FROM [BC_Advertisement]
	 WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADID])+1 FROM [BC_Advertisement]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_GetList]
 AS 
	SELECT 
	ADID,ADTypeID,ADName,ADDesc,ImgUrl,ImgWidth,ImgHeight,LinkUrl,Priority,Clicks,CreateTime,PassedTime,OverdueTime,ADCompanyID
	 FROM [BC_Advertisement]
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_Exists]
@ADID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_Advertisement] WHERE ADID=@ADID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_Delete]
@ADID int
 AS 
	DELETE [BC_Advertisement]
	 WHERE ADID=@ADID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_Advertisement_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_Advertisement_ADD]
@ADID int,
@ADTypeID int,
@ADName varchar(500),
@ADDesc varchar(500),
@ImgUrl varchar(500),
@ImgWidth int,
@ImgHeight int,
@LinkUrl varchar(500),
@Priority int,
@Clicks int,
@CreateTime datetime,
@PassedTime datetime,
@OverdueTime datetime,
@ADCompanyID int

 AS 
	INSERT INTO [BC_Advertisement](
	[ADID],[ADTypeID],[ADName],[ADDesc],[ImgUrl],[ImgWidth],[ImgHeight],[LinkUrl],[Priority],[Clicks],[CreateTime],[PassedTime],[OverdueTime],[ADCompanyID]
	)VALUES(
	@ADID,@ADTypeID,@ADName,@ADDesc,@ImgUrl,@ImgWidth,@ImgHeight,@LinkUrl,@Priority,@Clicks,@CreateTime,@PassedTime,@OverdueTime,@ADCompanyID
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_Update]
@ADTypeID int,
@ADTypeName varchar(50),
@ADTypeDesc varchar(500)
 AS 
	UPDATE [BC_ADType] SET 
	[ADTypeName] = @ADTypeName,[ADTypeDesc] = @ADTypeDesc
	WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_GetModel]
@ADTypeID int
 AS 
	SELECT 
	ADTypeID,ADTypeName,ADTypeDesc
	 FROM [BC_ADType]
	 WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADTypeID])+1 FROM [BC_ADType]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_GetList]
 AS 
	SELECT 
	ADTypeID,ADTypeName,ADTypeDesc
	 FROM [BC_ADType]
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_Exists]
@ADTypeID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_ADType] WHERE ADTypeID=@ADTypeID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_Delete]
@ADTypeID int
 AS 
	DELETE [BC_ADType]
	 WHERE ADTypeID=@ADTypeID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADType_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADType_ADD]
@ADTypeID int,
@ADTypeName varchar(50),
@ADTypeDesc varchar(500)

 AS 
	INSERT INTO [BC_ADType](
	[ADTypeID],[ADTypeName],[ADTypeDesc]
	)VALUES(
	@ADTypeID,@ADTypeName,@ADTypeDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_Update]
@ADCompanyID int,
@ADCompanyName varchar(100),
@ADCompanyDesc varchar(500)
 AS 
	UPDATE [BC_ADCompany] SET 
	[ADCompanyName] = @ADCompanyName,[ADCompanyDesc] = @ADCompanyDesc
	WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_GetModel]
@ADCompanyID int
 AS 
	SELECT 
	ADCompanyID,ADCompanyName,ADCompanyDesc
	 FROM [BC_ADCompany]
	 WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_GetMaxId]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到主键字段最大值 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_GetMaxId]
AS
	DECLARE @TempID int
	SELECT @TempID = max([ADCompanyID])+1 FROM [BC_ADCompany]
	IF @TempID IS NULL
		RETURN 1
	ELSE
		RETURN @TempID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_GetList]
 AS 
	SELECT 
	ADCompanyID,ADCompanyName,ADCompanyDesc
	 FROM [BC_ADCompany]
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_Exists]
@ADCompanyID int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [BC_ADCompany] WHERE ADCompanyID=@ADCompanyID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_Delete]
@ADCompanyID int
 AS 
	DELETE [BC_ADCompany]
	 WHERE ADCompanyID=@ADCompanyID
GO
/****** Object:  StoredProcedure [dbo].[sp_BC_ADCompany_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/6/26 14:23:59
------------------------------------
CREATE PROCEDURE [dbo].[sp_BC_ADCompany_ADD]
@ADCompanyID int,
@ADCompanyName varchar(100),
@ADCompanyDesc varchar(500)

 AS 
	INSERT INTO [BC_ADCompany](
	[ADCompanyID],[ADCompanyName],[ADCompanyDesc]
	)VALUES(
	@ADCompanyID,@ADCompanyName,@ADCompanyDesc
	)
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_Update]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_Update]
@URID bigint,
@UserID int,
@RoleID int,
@PEanble bit
 AS 
	UPDATE [PM_UserRole] SET 
	[UserID] = @UserID,[RoleID] = @RoleID,[PEanble] = @PEanble
	WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_GetModel]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_GetModel]
@URID bigint
 AS 
	SELECT 
	URID,UserID,RoleID,PEanble
	 FROM [PM_UserRole]
	 WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_GetList]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_GetList]
 AS 
	SELECT 
	URID,UserID,RoleID,PEanble
	 FROM [PM_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_Exists]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_Exists]
@URID bigint
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM [PM_UserRole] WHERE URID=@URID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_Delete]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_Delete]
@URID bigint
 AS 
	DELETE [PM_UserRole]
	 WHERE URID=@URID
GO
/****** Object:  StoredProcedure [dbo].[PM_UserRole_ADD]    Script Date: 08/12/2013 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：
--说明：
--时间：2013/7/1 17:05:30
------------------------------------
CREATE PROCEDURE [dbo].[PM_UserRole_ADD]
@URID bigint,
@UserID int,
@RoleID int,
@PEanble bit

 AS 
	INSERT INTO [PM_UserRole](
	[URID],[UserID],[RoleID],[PEanble]
	)VALUES(
	@URID,@UserID,@RoleID,@PEanble
	)
GO
