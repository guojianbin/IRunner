USE [master]
GO
/****** Object:  Database [IceMMR]    Script Date: 06/24/2013 17:44:03 ******/
CREATE DATABASE [IceMMR] ON  PRIMARY 
( NAME = N'IceMMR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\IceMMR.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IceMMR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\IceMMR_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[t_User]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_SingerGroup]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_SingerCountry]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_SingerCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Singer]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_SearchKeywords]    Script Date: 06/24/2013 17:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_SearchKeywords](
	[SearchKeywordsID] [int] NULL,
	[Keyword] [varchar](100) NULL,
	[SearchCount] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicStyle]    Script Date: 06/24/2013 17:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_MusicStyle](
	[MusicStyleID] [int] NULL,
	[MusicStyleName] [varchar](50) NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicState]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_MusicState] PRIMARY KEY CLUSTERED 
(
	[MusicStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicPublisher]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_MusicPublisher] PRIMARY KEY CLUSTERED 
(
	[MusicPublisherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicLyric]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_MusicLanguage]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_MusicLanguage] PRIMARY KEY CLUSTERED 
(
	[MusicLanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_MusicGuestbook]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_MusicCollection]    Script Date: 06/24/2013 17:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_MusicCollection](
	[MusicCollectionID] [bigint] NULL,
	[MusicID] [bigint] NULL,
	[UserID] [int] NULL,
	[CollectTime] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_MusicAlbum]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_Music]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_LoginState]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_LoginState] PRIMARY KEY CLUSTERED 
(
	[LoginStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Login]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_LastListen]    Script Date: 06/24/2013 17:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_LastListen](
	[LastListenID] [bigint] NULL,
	[MusicID] [bigint] NULL,
	[UserID] [int] NULL,
	[LastTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_Feedback]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[t_Extensions]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_t_Extensions] PRIMARY KEY CLUSTERED 
(
	[ExtensionsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Billboard]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[Sys_ScriptInjection]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[Sys_Operate]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_Sys_Operate] PRIMARY KEY CLUSTERED 
(
	[OperateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Module]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_Sys_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Log]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[Sys_Config]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[PM_UserRole]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[PM_UserPrivilege]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[PM_RolePrivilege]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[PM_Role]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_PM_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PM_Privilege]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_PM_Privilege] PRIMARY KEY CLUSTERED 
(
	[PrivilegeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BC_Advertisement]    Script Date: 06/24/2013 17:44:05 ******/
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
/****** Object:  Table [dbo].[BC_ADType]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_BC_ADType] PRIMARY KEY CLUSTERED 
(
	[ADTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BC_ADCompany]    Script Date: 06/24/2013 17:44:05 ******/
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
 CONSTRAINT [PK_BC_ADCompany] PRIMARY KEY CLUSTERED 
(
	[ADCompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
