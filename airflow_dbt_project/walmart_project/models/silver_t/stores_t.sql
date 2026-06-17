{{
    config(
        materialized='incremental',
        unique_key='store_id'
    )
}}

SELECT 
    *,
    current_timestamp() AS processed_at
FROM 
    {{ source('walmart_databricks', 'stores') }}


{% if is_incremental() %}
    WHERE updated_timestamp > (SELECT COALESCE(MAX(updated_timestamp), '1900-01-01') FROM {{ this }})
{% endif %}