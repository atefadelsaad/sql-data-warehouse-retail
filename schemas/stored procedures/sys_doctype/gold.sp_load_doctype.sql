CREATE OR ALTER PROCEDURE gold.load_doctype
AS
BEGIN
	INSERT INTO gold.dim_doctype
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
EXEC gold.load_doctype
