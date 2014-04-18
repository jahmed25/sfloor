USE [Mega_DB]
GO

/****** Object:  Table [dbo].[CART]    Script Date: 04/18/2014 19:19:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CART]') AND type in (N'U'))
DROP TABLE [dbo].[CART]
GO

USE [Mega_DB]
GO

/****** Object:  Table [dbo].[CART]    Script Date: 04/18/2014 19:19:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CART](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [varchar](100) NOT NULL,
	[SESSION_ID] [varchar](100) NOT NULL,
	[QTY] [int] NOT NULL,
	[TOTAL] [int] NOT NULL,
	[UNIT_PRICE] [int] NOT NULL,
	[USER_ID] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


