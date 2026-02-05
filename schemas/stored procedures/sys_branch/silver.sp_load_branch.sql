CREATE OR ALTER PROCEDURE silver.load_branch
AS
BEGIN
    INSERT INTO silver.erp_sys_branch (
        branch,
        branchtype,
        a_name,
        l_name,
    )
    SELECT     
        branch,
        branchtype,
        ISNULL(TRIM(a_name),0) AS a_name,
        ISNULL(TRIM(l_name),0) AS l_name,     
    FROM bronze.erp_sys_branch;
END;

EXEC silver.load_branch;
