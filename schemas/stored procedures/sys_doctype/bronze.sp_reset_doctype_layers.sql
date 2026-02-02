CREATE OR ALTER PROCEDURE bronze.reset_doctype_layers
AS
BEGIN
      TRUNCATE TABLE  bronze.erp_sys_doctype
      TRUNCATE TABLE  silver.erp_sys_doctype 
END 
EXEC bronze.reset_branch_lay
