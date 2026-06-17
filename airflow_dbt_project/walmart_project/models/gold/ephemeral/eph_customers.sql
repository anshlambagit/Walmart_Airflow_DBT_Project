SELECT 
    DISTINCT
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_email,
    customer_phone,
    customer_city,
    customer_province,
    customer_country,
    customer_created_timestamp,
    customer_updated_timestamp,
    customer_is_active,
    customer_processed_at,
    CURRENT_TIMESTAMP() AS customer_gold_processed_at
FROM 
    {{ ref('obt_b') }}