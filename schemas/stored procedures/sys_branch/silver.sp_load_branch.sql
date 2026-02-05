CREATE OR ALTER PROCEDURE silver.load_branch
AS
BEGIN
    INSERT INTO silver.erp_sys_branch (
        branch,
        arabic_name,
        latin_name,
        branch_type
    )
    SELECT distinct    
        branch,
        ISNULL(TRIM(a_name),'N/A') AS arabic_name,
        ISNULL(TRIM(l_name),'N/A') AS latin_name,     
        branchtype
    FROM bronze.erp_sys_branch
	where branch > 1
END;
