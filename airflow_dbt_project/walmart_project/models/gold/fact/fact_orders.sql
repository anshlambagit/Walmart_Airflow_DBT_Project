SELECT 
    order_id,
    order_item_id,
    product_id,
    store_id,
    employee_id,
    customer_id,
    total_amount,
    quantity,
    unit_price,
    line_amount
FROM 
    {{ ref('obt_b') }}