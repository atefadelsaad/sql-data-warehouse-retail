IF OBJECT_ID('gold.dim_item','U') IS NOT NULL
     DROP TABLE gold.dim_item
CREATE TABLE gold.dim_item (
  itemean CHAR(13) NOT NULL PRIMARY KEY,
  arabic_name NVARCHAR(50) NOT NULL,
  latin_name NVARCHAR(50) NOT NULL,
  sub_group SMALLINT NOT NULL,
  supplier INT NOT NULL,
)
