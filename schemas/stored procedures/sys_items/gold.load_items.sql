CREATE OR ALTER PROCEDURE gold.load_items AS
BEGIN
	INSERT INTO gold.dim_sys_item
	   (
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
	    )
     SELECT
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
     FROM silver.erp_sys_item
END

EXEC gold.load_items
SELECT * from gold.dim_sys_item
