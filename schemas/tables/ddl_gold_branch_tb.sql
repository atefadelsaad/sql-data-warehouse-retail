IF OBJECT_ID('gold.dim_branch','U') IS NOT NULL
    DROP TABLE gold.dim_branch;

CREATE TABLE gold.dim_branch(
    branch int NOT NULL,
    arabic_name char(50) NOT NULL,
    latin_name char(50) NOT NULL,
    branch_type smallint NOT NULL,
    lest_update datetime NOT NULL
    CONSTRAINT pk_erp_sys_branch PRIMARY KEY NONCLUSTERED (branch ASC)
);
