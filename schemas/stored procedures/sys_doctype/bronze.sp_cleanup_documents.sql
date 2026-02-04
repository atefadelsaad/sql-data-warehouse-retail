CREATE OR ALTER PROCEDURE bronze.cleanup_documents
AS
BEGIN
      TRUNCATE TABLE  bronze.erp_sys_doctype
      TRUNCATE TABLE  silver.erp_sys_doctype 
END 
EXEC bronze.cleanup_documents
