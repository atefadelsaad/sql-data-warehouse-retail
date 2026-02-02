IF OBJECT_ID('silver.erp_sys_branch','U') IS NOT NULL
      DROP TABLE silver.erp_sys_branch
CREATE TABLE silver.erp_sys_branch(
	[company] [smallint] NOT NULL primary key,
	[sector] [smallint] NOT NULL,
	[region] [smallint] NOT NULL,
	[branch] [int] NOT NULL,
	[branchtype] [smallint] NOT NULL,
	[activity] [smallint] NOT NULL,
	[a_name] [char](50) NOT NULL,
	[l_name] [char](50) NOT NULL,
	[country] [smallint] NOT NULL
)
