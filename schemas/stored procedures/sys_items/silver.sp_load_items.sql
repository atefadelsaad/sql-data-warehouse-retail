
CREATE OR ALTER PROCEDURE silver.load_items AS
BEGIN
	INSERT INTO silver.erp_sys_item 
	   (
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
	    )
	SELECT 
	TRIM(itemean) AS itemean,
	TRIM(a_name) AS a_name,
	CASE
		WHEN l_name IS NULL l_name = ''
		THEN 'N/A'
		ELSE l_name
	END l_name,
	    department AS sub_group,
	    producerno AS supplier
	FROM bronze.erp_sys_item ORDER BY itemean
END

EXEC silver.load_sys_item
EXEC silver.trun_tb_clean_sys_item
SELECT * FROM silver.clean_sys_item
