CREATE OR ALTER PROCEDURE gold.load_branch
AS
BEGIN
    INSERT INTO gold.dim_branch (
        company,
        sector,
        region,
        branch,
        branchtype,
        activity,
        a_name,
        l_name,
        country
    )
    SELECT
        company,
        sector,
        region,
        branch,
        branchtype,
        activity,
        a_name,
        l_name,
        country
    FROM silver.erp_sys_branch;
END;

EXEC gold.load_branch;
