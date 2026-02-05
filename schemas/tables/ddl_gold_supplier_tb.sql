IF OBJECT_ID('gold.dim_supplier','U') IS NOT NULL
    DROP TABLE gold.dim_supplier;

CREATE TABLE gold.dim_supplier(
    supplierno int NOT NULL PRIMARY KEY,
    arabic_name varchar(50) NOT NULL,
    latin_name varchar(50) NOT NULL,
    last_update datetime NOT NULL
);
