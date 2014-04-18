USE [Mega_DB]
GO

/****** Object:  Table [dbo].[FAV_LIST]    Script Date: 04/18/2014 20:19:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FAV_LIST]') AND type in (N'U'))
DROP TABLE [dbo].[FAV_LIST]
GO

USE [Mega_DB]
GO

/****** Object:  Table [dbo].[FAV_LIST]    Script Date: 04/18/2014 20:19:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FAV_LIST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SESSION_ID] [varchar](100) NOT NULL,
	[SKU] [varchar](100) NOT NULL,
	[DATE] [datetime] NOT NULL,
	[USER_ID] [int] NULL,
 CONSTRAINT [PK_FAV_LIST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


