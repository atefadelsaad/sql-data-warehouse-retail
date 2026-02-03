CREATE OR ALTER PROCEDURE gold.load_documents
AS
BEGIN
	INSERT INTO gold.dim_documents_types
		(
		 [systemcode]
		,[transtype]
		,[doctype]
		,[a_name]
		,[l_name]
		)
	SELECT 
		 [systemcode]
		,[transtype]
		,[doctype]
		,[a_name]
		,[l_name]
	  FROM silver.erp_sys_doctype
END
EXEC gold.load_documents
