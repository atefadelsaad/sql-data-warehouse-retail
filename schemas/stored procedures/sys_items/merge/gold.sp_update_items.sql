CREATE OR ALTER PROCEDURE gold.update_items
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_item AS target
    USING silver.erp_sys_item   AS source
        ON target.itemean = source.itemean

    -- UPDATE: لو الصف موجود والاسم اتغير
    WHEN MATCHED
         AND ISNULL(target.arabic_name, '') <> ISNULL(source.arabic_name, '')
         AND ISNULL(target.latin_name, '') <> ISNULL(source.latin_name, '')
         AND ISNULL(target.sub_group, '') <> ISNULL(source.sub_group, '')
         AND ISNULL(target.supplier, '') <> ISNULL(source.supplier, '')
    THEN
        UPDATE SET
            target.arabic_name = source.arabic_name
            target.latin_name = source.latin_name
            target.sub_group = source.sub_group
            target.supplier = source.supplier

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (itemean,arabic_name, latin_name,sub_group,supplier)
        VALUES (source.itemean,source.arabic_name,source.latin_name,source.sub_group,source.supplier)

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE;

END;
GO
