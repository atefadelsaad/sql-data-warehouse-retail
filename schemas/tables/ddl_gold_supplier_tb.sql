IF OBJECT_ID ('gold.dim_supplier','U') IS NOT NULL
    DROP TABLE gold.dim_supplier
CREATE TABLE gold.dim_supplier(
	[supplierno] [int] NOT NULL PRIMARY KEY ,
	[a_name] [varchar](50)  NOT NULL,
	[l_name] [varchar](50) NOT NULL
)
