CREATE OR ALTER PROCEDURE gold.update_supplier
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_supplier AS target
    USING silver.erp_sys_supplier AS source
        ON target.supplierno = source.supplierno

    WHEN MATCHED
         AND ISNULL(target.a_name, '') <> ISNULL(source.a_name, '')
         AND ISNULL(target.l_name, '') <> ISNULL(source.l_name, '')
    THEN
        UPDATE SET
           target.a_name = source.a_name,
           target.l_name = source.l_name

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (supplierno,a_name,l_name)
        VALUES (source.supplierno,source.a_name,source.l_name)

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE;

END;
