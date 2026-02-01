select
date_date,
orders_id, 
s.products_id,
revenue, 
quantity, 
p.purchase_price, 
ROUND(s.quantity*p.purchase_price,2) as purchase_cost,
ROUND(s.revenue-(s.quantity*p.purchase_price),2) as margin
FROM {{ ref('stg_raw__sales') }} as s
LEFT JOIN {{ ref('stg_raw__product') }} as p 
USING(products_id)
