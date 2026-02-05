
CREATE OR ALTER PROCEDURE gold.load_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    WHEN MATCHED
               AND 
                    target.branchtype <> source.branchtype
                 or target.a_name <> source.a_name
                 or target.l_name  <> source.l_name
    THEN
        UPDATE SET
            target.branchtype = source.branchtype,
            target.a_name = source.a_name,
            target.l_name = source.l_name,
        
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (branch,branchtype,a_name,l_name,last_update)
        VALUES (source.branch,source.branchtype,source.a_name,source.l_name,getdate())
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		 
        OUTPUT
               $ACTION AS merge_action,
               inserted.branch AS inserted ,
               deleted.branch AS deleted;

END;
GO
