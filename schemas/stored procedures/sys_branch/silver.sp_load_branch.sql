CREATE OR ALTER PROCEDURE silver.load_branch
AS
BEGIN
    INSERT INTO silver.erp_sys_branch (
        branch,
        a_name,
        l_name,
        branchtype
    )
    SELECT     
        branch,
        ISNULL(TRIM(a_name),0) AS a_name,
        ISNULL(TRIM(l_name),0) AS l_name,     
        branchtype
    FROM bronze.erp_sys_branch
	where branch > 1
END;
