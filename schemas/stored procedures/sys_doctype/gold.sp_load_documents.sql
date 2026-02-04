
CREATE OR ALTER PROCEDURE gold.load_documents
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_documents_types AS target
    USING silver.erp_sys_doctype AS source
        ON target.systemcode = source.systemcode
        AND target.transtype = source.transtype
        AND target.doctype = source.doctype

    WHEN MATCHED
                AND 
                OR target.a_name <> source.a_name
                OR target.l_name <> source.l_name
    THEN
        UPDATE SET
            target.a_name = target.a_name,
            target.l_name = source.l_name

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (systemcode, transtype,doctype,a_name,l_name)
        VALUES (source.systemcode,source.transtype,source.doctype,source.a_name,source.l_name)

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE;

END;
GO

