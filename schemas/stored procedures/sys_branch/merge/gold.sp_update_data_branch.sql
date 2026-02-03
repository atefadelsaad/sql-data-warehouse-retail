CREATE OR ALTER PROCEDURE gold.update_branch
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_branch AS target
    USING silver.erp_sys_branch AS source
        ON target.branch = source.branch

    -- UPDATE: لو الصف موجود والاسم اتغير
    WHEN MATCHED
         AND ISNULL(target.branch, '') <> ISNULL(source.branch, '')
    THEN
        UPDATE SET
            target.branch = source.branch

    -- INSERT: صف جديد دخل من Silver
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (id, name)
        VALUES (source.id, source.name)

    -- DELETE: صف موجود في Gold واختفى من Silver
    -- ⚠️ Silver هو Source of Truth
    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE;

END;
GO
