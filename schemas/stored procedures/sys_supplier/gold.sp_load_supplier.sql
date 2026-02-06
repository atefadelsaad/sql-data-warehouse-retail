CREATE OR ALTER PROCEDURE gold.load_supplier
AS
BEGIN

    MERGE gold.dim_supplier AS target
    USING silver.erp_sys_supplier   AS source
        ON target.supplierno = source.supplierno

    WHEN MATCHED                       
                AND 
                   target.arabic_name<> source.arabic_name
                OR target.latin_name <> source.latin_name
               
    THEN
        UPDATE SET
            target.arabic_name = source.arabic_name,
            target.latin_name = source.latin_name,
		    last_update = getdate()
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (supplierno,arabic_name, latin_name,last_update)
        VALUES (source.supplierno,source.arabic_name,source.latin_name,getdate())

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		OUTPUT
              $ACTION AS merge_action,
              inserted.supplierno AS inserted ,
			  inserted.arabic_name AS inserted ,
              deleted.supplierno AS deleted,
              deleted.arabic_name AS deleted;  

END;

exec gold.load_supplier
