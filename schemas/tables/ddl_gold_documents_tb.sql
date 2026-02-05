IF OBJECT_ID('gold.dim_documents_types','U') IS NOT NULL
    DROP TABLE gold.dim_documents_types;

CREATE TABLE gold.dim_documents_types(
    doctype smallint NOT NULL,
    arabic_name varchar(50) NOT NULL,
    latin_name varchar(50) NOT NULL,
    last_update datetime NOT NULL,
    CONSTRAINT pk_sys_doctype PRIMARY KEY NONCLUSTERED (
        doctype ASC
    )
);
