CREATE OR ALTER PROCEDURE bronze.sp_reset_supplier_layers
BEGIN
    TRUNCATE TABLE bronze.erp_sys_supplier
    TRUNCATE TABLE silver.erp_sys_supplier
END
