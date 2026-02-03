CREATE OR ALTER PROCEDURE gold.update_documents
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.t_1 AS target
    USING silver.t_1 AS source
        ON target.id = source.id

    -- UPDATE: لو الصف موجود والاسم اتغير
    WHEN MATCHED
         AND ISNULL(target.name, '') <> ISNULL(source.name, '')
    THEN
        UPDATE SET
            target.name = source.name

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
