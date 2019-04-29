
USE [OracleToSql]
GO

/****** Object:  Table [dbo].[SqlDataTable]    Script Date: 04/07/2019 16:31:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SqlDataTable](
	[ID] [nvarchar](12) NULL,
	[AMT] [numeric](38, 20) NULL,
	[NO] [numeric](38, 0) NULL,
	[NO1] [numeric](38, 0) NULL,
	[NAME] [nvarchar](50) NULL,
	[ENT_DT] [datetime] NULL,
	[MOD_DT] [datetime] NULL,
	[NM] [char](50) NULL,
	[DIVN] [nvarchar](20) NOT NULL,
	[FLAG] [nvarchar](5) NULL,
	[SITU] [nvarchar](5) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SqlDataTable] ADD  DEFAULT ('HT') FOR [DIVN]
GO


