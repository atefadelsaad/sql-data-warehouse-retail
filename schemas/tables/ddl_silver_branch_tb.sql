IF OBJECT_ID('silver.erp_sys_branch','U') IS NOT NULL
    DROP TABLE silver.erp_sys_branch;

CREATE TABLE silver.erp_sys_branch(
    branch int NOT NULL,
    branchtype smallint NOT NULL,
    arabic_name char(50) NOT NULL,
    latin_name char(50) NOT NULL,
    CONSTRAINT pk_erp_sys_branch PRIMARY KEY NONCLUSTERED (branch ASC)
);
