CREATE OR ALTER PROCEDURE bronze.sp_clean_supplier
AS
BEGIN
    TRUNCATE TABLE bronze.erp_sys_supplier
    TRUNCATE TABLE silver.erp_sys_supplier
END
