CREATE OR ALTER PROCEDURE bronze.load_doctype
AS
BEGIN
    INSERT INTO db_Atef.bronze.erp_sys_doctype(
        systemcode,
        transtype,
        doctype,
        a_name,
        l_name,
        document,
        site_serial,
        manual_serial,
        period,
        program_name,
        program_type,
        nature,
        doc_group,
        usage,
        transdate,
        status,
        currency
    )
    SELECT
        systemcode,
        transtype,
        doctype,
        a_name,
        l_name,
        document,
        site_serial,
        manual_serial,
        period,
        program_name,
        program_type,
        nature,
        doc_group,
        usage,
        transdate,
        status,
        currency
    FROM Retail.dbo.sys_doctype;
END;

EXEC bronze.load_doctype;
