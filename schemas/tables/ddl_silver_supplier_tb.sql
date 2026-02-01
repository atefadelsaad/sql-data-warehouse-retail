IF OBJECT_ID('silver.erp_sys_supplier','U') IS NOT NULL
     DROP TABLE silver.erp_sys_supplier
CREATE TABLE silver.erp_sys_supplier(
	[supplierno] [int] NOT NULL PRIMARY KEY ,
	[a_name] [varchar](50) NOT NULL,
	[l_name] [varchar](50) NOT NULL,
)
