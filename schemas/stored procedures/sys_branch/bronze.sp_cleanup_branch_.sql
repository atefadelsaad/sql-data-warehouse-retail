CREATE OR ALTER PROCEDURE bronze.reset_branch_layers
AS
BEGIN
	  TRUNCATE TABLE bronze.erp_sys_branch
	  TRUNCATE TABLE silver.erp_sys_branch
END
