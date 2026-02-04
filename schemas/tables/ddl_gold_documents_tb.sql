IF OBJECT_ID('gold.dim_documents_types','U') IS NOT NULL
    DROP TABLE gold.dim_documents_types;

CREATE TABLE gold.dim_documents_types(
    systemcode smallint NOT NULL,
    transtype smallint NOT NULL,
    doctype smallint NOT NULL,
    a_name varchar(50) NOT NULL,
    l_name varchar(50) NOT NULL,
    last_update datetime NOT NULL,
    CONSTRAINT pk_sys_doctype PRIMARY KEY NONCLUSTERED (
        doctype ASC
    )
);
