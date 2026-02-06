CREATE OR ALTER PROCEDURE gold.load_documents
AS
BEGIN

    MERGE gold.dim_documents_types AS target
    USING silver.erp_sys_doctype AS source
        ON 
         target.doctype = source.doctype

    WHEN MATCHED
                AND 
                   target.arabic_name <> source.arabic_name
                OR target.latin_name <> source.latin_name
    THEN
        UPDATE SET
            target.arabic_name = source.arabic_name,
            target.latin_name = source.latin_name,
			target.last_update = getdate()
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (doctype,arabic_name,latin_name,last_update)
        VALUES (source.doctype,source.arabic_name,source.latin_name,getdate())

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE

        OUTPUT
        $ACTION AS merge_action,
        inserted.arabic_name AS inserted ,
        deleted.arabic_name AS deleted;

END;
GO
