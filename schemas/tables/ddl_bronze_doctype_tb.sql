IF OBJECT_ID('bronze.erp_sys_doctype','U') IS NOT NULL
    DROP TABLE bronze.erp_sys_doctype;

CREATE TABLE bronze.erp_sys_doctype (
    systemcode smallint NOT NULL,
    transtype smallint NOT NULL,
    doctype smallint NOT NULL,
    a_name varchar(50) NULL,
    l_name varchar(50) NULL,
    document varchar(20) NULL,
    site_serial smallint NULL,
    manual_serial smallint NULL,
    period smallint NULL,
    program_name varchar(50) NULL,
    program_type varchar(10) NULL,
    nature smallint NULL,
    doc_group smallint NULL,
    usage smallint NULL,
    transdate smalldatetime NULL,
    status smallint NULL,
    currency smallint NULL,
    CONSTRAINT pk_sys_doctype PRIMARY KEY NONCLUSTERED (z
        doctype ASC,
        systemcode ASC,
        systemcode ASC
    )
);

