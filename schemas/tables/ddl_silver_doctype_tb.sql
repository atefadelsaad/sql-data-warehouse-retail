IF OBJECT_ID('silver.erp_sys_doctype','U') IS NOT NULL
    DROP TABLE silver.erp_sys_doctype;

CREATE TABLE silver.erp_sys_doctype(
    systemcode smallint NOT NULL,
    transtype smallint NOT NULL,
    doctype smallint NOT NULL,
    a_name varchar(50) NOT NULL,
    l_name varchar(50) NOT NULL,
    CONSTRAINT pk_sys_doctype PRIMARY KEY NONCLUSTERED (
        systemcode ASC,
        transtype ASC,
        doctype ASC
    )
);
