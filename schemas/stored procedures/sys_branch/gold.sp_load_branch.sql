
CREATE OR ALTER PROCEDURE gold.load_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    WHEN MATCHED
               AND 
		          target.arbic_name <> source.arbic_name
                  or target.latin_name  <> source.latin_name
                  or target.branch_type <> source.branch_type
      
    THEN
        UPDATE SET
            target.arbic_name = source.arbic_name,
            target.latin_name = source.latin_name,
            target.branch_type = source.branch_type,
            target.last_update = getdate()
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (branch,arbic_name,latin_name,branch_type,last_update)
        VALUES (source.branch,source.arbic_name,source.latin_name,source.branch_type,getdate())
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		 
        OUTPUT
               $ACTION AS merge_action,
               inserted.branch AS inserted ,
               deleted.branch AS deleted;

END;
GO
