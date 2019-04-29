CREATE PROCEDURE SaveDataFromOracle  @dt_OracleData udt_OracleData READONLY
AS
BEGIN
    -- Create Temp table
    CREATE TABLE #tmpOracleData(
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
    )

    -- We will stage all data passed in into temp table
    INSERT INTO #tmpOracleData
    SELECT ID, AMT, NO, NO1, NAME,ENT_DT,MOD_DT,NM, DIVN,FLAG, SITU FROM @dt_OracleData

    -- NB: you will need to think about locking strategy a bit here
    MERGE SqlDataTable AS p
    USING #tmpOracleData AS t
    ON p.ID = t.ID
    WHEN NOT MATCHED BY TARGET THEN
        -- We want to insert new person
        INSERT (ID, AMT, NO, NO1, NAME,ENT_DT,MOD_DT,NM, DIVN,FLAG, SITU) VALUES (T.ID , T.AMT, T.NO, T.NO1, T.NAME,T.ENT_DT,T.MOD_DT,T.NM, T.DIVN,T.FLAG, T.SITU);
   -- WHEN MATCHED THEN
        -- you may not need this, assume updating name for example
     --   UPDATE SET p.name = t.name
END