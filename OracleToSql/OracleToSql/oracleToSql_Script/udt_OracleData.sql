
USE [OracleToSql]
GO

/****** Object:  UserDefinedTableType [dbo].[udt_OracleData]    Script Date: 04/07/2019 16:34:19 ******/
CREATE TYPE [dbo].[udt_OracleData] AS TABLE(
	[ID] [nvarchar](12) NULL,
	[AMT] [numeric](38, 20) NULL,
	[NO] [numeric](38, 0) NULL,
	[NO1] [numeric](38, 0) NULL,
	[NAME] [nvarchar](50) NULL,
	[ENT_DT] [datetime] NULL,
	[MOD_DT] [datetime] NULL,
	[NM] [char](50) NULL,
	[DIVN] [nvarchar](20) NOT NULL DEFAULT ('HT'),
	[FLAG] [nvarchar](5) NULL,
	[SITU] [nvarchar](5) NULL
)
GO


