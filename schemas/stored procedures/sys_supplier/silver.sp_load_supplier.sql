CREATE OR ALTER PROCEDURE silver.load_supplier
AS 
BEGIN
	INSERT INTO silver.erp_sys_supplier(
		supplierno,
		arabic_name,
		latin_name
	)
	SELECT 
		supplierno,
		TRIM(a_name) AS a_name,
		CASE 
			 WHEN l_name IS NULL OR l_name = '' 
				  THEN 'N/A'
			 ELSE TRIM(l_name)
		END l_name
	FROM bronze.erp_sys_supplier
END
EXEC silver.load_supplier
