IF OBJECT_ID('gold.dim_branch','U') IS NOT NULL
    DROP TABLE gold.dim_branch;

CREATE TABLE gold.dim_branch(
    company smallint NOT NULL,
    sector smallint NOT NULL,
    region smallint NOT NULL,
    branch int NOT NULL,
    branchtype smallint NOT NULL,
    activity smallint NOT NULL,
    a_name char(50) NOT NULL,
    l_name char(50) NOT NULL,
    country smallint NOT NULL,
    CONSTRAINT pk_erp_sys_branch PRIMARY KEY NONCLUSTERED (branch ASC)
);
