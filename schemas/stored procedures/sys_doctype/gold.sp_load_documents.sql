CREATE OR ALTER PROCEDURE gold.load_documents
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_documents_types AS target
    USING silver.erp_sys_doctype AS source
        ON 
         target.doctype = source.doctype

    WHEN MATCHED
                AND 
                   target.a_name <> source.a_name
                OR target.l_name <> source.l_name
    THEN
        UPDATE SET
            target.a_name = target.a_name,
            target.l_name = source.l_name,
			target.systemcode = source.systemcode,
            target.transtype = source.transtype

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (systemcode, transtype,doctype,a_name,l_name,last_update)
        VALUES (source.systemcode,source.transtype,source.doctype,source.a_name,source.l_name,getdate())

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE

        OUTPUT
        $ACTION AS merge_action,
        inserted.a_name AS inserted ,
        deleted.a_name AS deleted;

END;
GO
exec gold.load_documents
