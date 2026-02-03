CREATE OR ALTER PROCEDURE gold.load_items
AS
BEGIN
    INSERT INTO gold.dim_item (
        itemean,
        arabic_name,
        latin_name,
        sub_group,
        supplier
    )
    SELECT
        itemean,
        arabic_name,
        latin_name,
        sub_group,
        supplier
    FROM silver.erp_sys_item;
END;
  
EXEC gold.load_items;
  
SELECT * FROM gold.dim_item;
