select
date_date,
orders_id, 
s.products_id,
revenue, 
quantity, 
p.purchase_price 
FROM {{ ref('stg_raw__sales') }} as s
LEFT JOIN {{ ref('stg_raw__product') }} as p 
USING(products_id)
