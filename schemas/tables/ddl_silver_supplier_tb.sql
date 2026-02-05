IF OBJECT_ID('silver.erp_sys_supplier','U') IS NOT NULL
    DROP TABLE silver.erp_sys_supplier;

CREATE TABLE silver.erp_sys_supplier(
    supplierno int NOT NULL,
    arabic_name varchar(50) NOT NULL,
    latin_name varchar(50) NOT NULL,
    CONSTRAINT pk_erp_sys_supplier PRIMARY KEY NONCLUSTERED (supplierno ASC)
);
