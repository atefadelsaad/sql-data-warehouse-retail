CREATE OR ALTER PROCEDURE gold.load_supplier
AS
BEGIN
    SET NOCOUNT ON;

    MERGE gold.dim_supplier AS target
    USING silver.erp_sys_supplier   AS source
        ON target.supplierno = source.supplierno

    WHEN MATCHED                       
                AND 
                   target.a_name<> source.a_name
                OR target.l_name <> source.l_name
               
    THEN
        UPDATE SET
            target.a_name = source.a_name,
            target.l_name = source.l_name
    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT (supplierno,a_name, l_name,last_update)
        VALUES (source.supplierno,source.a_name,source.l_name,getdate())

    WHEN NOT MATCHED BY SOURCE
    THEN
        DELETE
		OUTPUT
              $ACTION AS merge_action,
              inserted.supplierno AS inserted ,
			  inserted.a_name AS inserted ,
              deleted.supplierno AS deleted,
              deleted.a_name AS deleted;  

END;

exec gold.load_supplier
