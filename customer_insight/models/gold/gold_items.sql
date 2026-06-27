WITH dedup_query AS
(
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY update_date DESC) as deduplication_id
    FROM 
        {{ source('source','items')}}

)

SELECT 
    id,
    name,
    category,
    update_date
FROM 
    dedup_query
WHERE 
    deduplication_id = 1 
