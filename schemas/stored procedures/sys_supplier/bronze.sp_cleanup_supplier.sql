CREATE OR ALTER PROCEDURE bronze.cleanup_supplier
AS
BEGIN
    TRUNCATE TABLE bronze.erp_sys_supplier
    TRUNCATE TABLE silver.erp_sys_supplier
END
