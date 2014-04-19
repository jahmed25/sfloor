USE [Mega_DB]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CART_DATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CART] DROP CONSTRAINT [DF_CART_DATE]
END

GO

USE [Mega_DB]
GO

/****** Object:  Table [dbo].[CART]    Script Date: 04/18/2014 23:38:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CART]') AND type in (N'U'))
DROP TABLE [dbo].[CART]
GO

USE [Mega_DB]
GO

/****** Object:  Table [dbo].[CART]    Script Date: 04/18/2014 23:38:39 ******/
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
	[USER_ID] [int] NULL,
	[DATE] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CART] ADD  CONSTRAINT [DF_CART_DATE]  DEFAULT (getdate()) FOR [DATE]
GO


