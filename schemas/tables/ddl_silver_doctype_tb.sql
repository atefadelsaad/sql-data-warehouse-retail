IF OBJECT_ID('silver.erp_sys_doctype','U') IS NOT NULL
    DROP TABLE silver.erp_sys_doctype;

CREATE TABLE silver.erp_sys_doctype(
    doctype smallint NOT NULL,
    arabic_name varchar(50) NOT NULL,
    latin_name varchar(50) NOT NULL,
    CONSTRAINT pk_sys_doctype PRIMARY KEY NONCLUSTERED (
        doctype ASC
    )
);
