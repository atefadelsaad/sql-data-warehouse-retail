CREATE OR ALTER PROCEDURE gold.sp_load_supplier
AS
BEGIN
	INSERT INTO gold.dim_supplier
	   (
    	  supplierno,
	     	a_name,
	    	l_name
	    )
  SELECT
	     supplierno,
		   a_name,
		   l_name
     FROM silver.erp_sys_supplier
END

	
