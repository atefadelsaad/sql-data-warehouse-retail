CREATE PROCEDURE bronze.sp_clean_items 
AS
BEGIN
	TRUNCATE TABLE bronze.erp_sys_item
END
