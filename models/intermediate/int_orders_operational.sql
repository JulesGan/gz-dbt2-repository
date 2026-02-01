SELECT
o.orders_id,
o.date_date,
ROUND((o.margin + sh.shipping_fee - sh.log_cost - sh.ship_cost),2) as operational_margin,
o.quantity,
o.revenue,
o.purchase_cost,
o.margin,
sh.shipping_fee,
sh.log_cost,
sh.ship_cost
FROM {{ ref('int_orders_margin') }} as o
LEFT JOIN {{ ref('stg_raw__ship') }} as sh 
USING(orders_id)
ORDER BY orders_id desc

