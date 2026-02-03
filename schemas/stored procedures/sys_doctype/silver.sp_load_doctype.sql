CREATE OR ALTER PROCEDURE silver.load_doctype
AS
BEGIN
    INSERT INTO silver.erp_sys_doctype (
        systemcode,
        transtype,
        doctype,
        a_name,
        l_name
    )
    SELECT 
        systemcode,
        transtype,
        doctype,
        a_name,
        CASE 
            WHEN l_name IS NULL OR l_name = '' THEN 'N/A'
            ELSE l_name
        END AS l_name
    FROM bronze.erp_sys_doctype;
END;

EXEC silver.load_doctype;
