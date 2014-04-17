
GO

/****** Object:  Table [dbo].[USER_REGISTER]    Script Date: 04/17/2014 19:41:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER_REGISTER]') AND type in (N'U'))
DROP TABLE [dbo].[USER_REGISTER]
GO

USE [Mega_DB]
GO

/****** Object:  Table [dbo].[USER_REGISTER]    Script Date: 04/17/2014 19:41:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[USER_REGISTER](
	[EMAIL] [varchar](100) NULL,
	[SESSION_ID] [varchar](100) NULL,
	[MOBILE] [varchar](10) NULL,
	[GENDER] [varchar](10) NULL,
	[PASSWORD] [varchar](20) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


