
CREATE OR ALTER PROCEDURE gold.load_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    WHEN MATCHED
               AND 
                    target.company <> source.company
                 or target.sector <> source.sector
                 or target.region <> source.region
                 or target.branchtype <> source.branchtype
                 or target.activity  <> source.activity
                 or target.a_name <> source.a_name
                 or target.l_name  <> source.l_name
                 or target.country <> source.country
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
        INSERT (company, sector,region,branch,branchtype,activity,a_name,l_name,country,last_update)
        VALUES (source.company, source.sector,source.region,source.branch,source.branchtype,source.activity,source.a_name,source.l_name,source.country,getdate())
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		 
        OUTPUT
               $ACTION AS merge_action,
               inserted.branch AS inserted ,
               deleted.branch AS deleted;

END;
GO
