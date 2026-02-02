CREATE OR ALTER PROCEDURE bronze.reset_supplier_layers
AS
BEGIN
    TRUNCATE TABLE bronze.erp_sys_supplier
    TRUNCATE TABLE silver.erp_sys_supplier
END
