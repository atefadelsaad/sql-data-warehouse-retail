
CREATE OR ALTER PROCEDURE gold.load_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    WHEN MATCHED
               AND (
		          target.arabic_name <> source.a_name
                  or target.latin_name  <> source.l_name
                  or target.branch_type <> source.branchtype
                   )
    THEN
        UPDATE SET
            target.arabic_name = source.a_name,
            target.latin_name = source.l_name,
            target.branch_type = source.branchtype,
            target.last_update = getdate()
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (branch,arabic_name,latin_name,branch_type,last_update)
        VALUES (source.branch, source.a_name, source.l_name, source.branchtype, GETDATE())
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		 
        OUTPUT
               $ACTION AS merge_action,
               inserted.branch AS inserted ,
               deleted.branch AS deleted;

END;
GO
