CREATE OR ALTER PROCEDURE silver.load_doctype
AS
BEGIN
INSERT INTO silver.erp_sys_doctype (
    doctype,
    a_name,
    l_name
)
SELECT 
    doctype,
    a_name,
    CASE 
        WHEN l_name IS NULL OR l_name = '' THEN 'N/A'
        ELSE l_name
    END AS l_name
FROM bronze.erp_sys_doctype
WHERE
		systemcode IN (10)


INSERT INTO silver.erp_sys_doctype (
    doctype,
    a_name,
    l_name
)
SELECT 
    doctype,
    a_name,
    CASE 
        WHEN l_name IS NULL OR l_name = '' THEN 'N/A'
        ELSE l_name
    END AS l_name
FROM bronze.erp_sys_doctype
		WHERE
			systemcode IN (2) AND usage = 1 -- stock
			AND doctype NOT IN (SELECT doctype FROM silver.erp_sys_doctype)
END;
