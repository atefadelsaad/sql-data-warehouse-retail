CREATE OR ALTER PROCEDURE silver.load_branch 
AS
BEGIN

	INSERT INTO silver.erp_sys_branch)
		 [company]
		,[sector]
		,[region]
		,[branch]
		,[branchtype]
		,[activity]
		,[a_name]
		,[l_name]
		,[country]
		)
	SELECT 
		company,
		sector,
		region,
		branch,
		branchtype,
		ISNULL(activity,0) AS activity,
		TRIM(a_name) as a_name,
		TRIM(l_name) as l_name,
		ISNULL(country,0) AS country
	FROM bronze.erp_sys_branch
END
EXEC silver.load_branch 
