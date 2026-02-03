MERGE gold.t_1 AS target
USING silver.t_1 AS source
    ON target.id = source.id

-- Update
WHEN MATCHED 
     AND ISNULL(target.name, '') <> ISNULL(source.name, '')
THEN
    UPDATE SET
        target.name = source.name

-- Insert
WHEN NOT MATCHED BY TARGET
THEN
    INSERT (id, name)
    VALUES (source.id, source.name)

-- Delete
WHEN NOT MATCHED BY SOURCE
THEN
    DELETE;
