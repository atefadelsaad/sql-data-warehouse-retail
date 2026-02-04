CREATE OR ALTER PROCEDURE gold.update_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    WHEN MATCHED
         AND ISNULL(target.company, '') <> ISNULL(source.company, '')
         AND ISNULL(target.sector, '') <> ISNULL(source.sector, '')
         AND ISNULL(target.region, '') <> ISNULL(source.region, '')
         AND ISNULL(target.branchtype, '') <> ISNULL(source.branchtype, '')
         AND ISNULL(target.activity, '') <> ISNULL(source.activity, '')
         AND ISNULL(target.a_name, '') <> ISNULL(source.a_name, '')
         AND ISNULL(target.l_name, '') <> ISNULL(source.l_name, '')
         AND ISNULL(target.country, '') <> ISNULL(source.country, '')
    THEN
        UPDATE SET
            target.company = source.company,
            target.sector = source.sector,
            target.region = source.region,
            target.branchtype = source.branchtype,
            target.activity = source.activity,
            target.a_name = source.a_name,
            target.l_name = source.l_name,
            target.country = source.country
        
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (company, sector,region,branch,branchtype,activity,a_name,l_name,country)
        VALUES (source.company, source.sector,source.region,source.branch,source.branchtype,source.activity,source.a_name,source.l_name,source.country)

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE;

END;
GO
