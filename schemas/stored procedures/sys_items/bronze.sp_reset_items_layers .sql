CREATE PROCEDURE bronze.sp_reset_items_layers 
AS
BEGIN
	TRUNCATE TABLE bronze.erp_sys_item
  TRUNCATE TABLE silver.erp_sys_item
END
