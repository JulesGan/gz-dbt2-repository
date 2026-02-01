WITH per_date as (
    SELECT 
    date_date,
    COUNT(DISTINCT(orders_id)) as nb_transactions,
    ROUND(SUM(revenue),2) as revenue,
    ROUND(SUM(margin),2) as margin,
    ROUND(SUM(operational_margin),2) as operational_margin,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    ROUND(SUM(shipping_fee),2) as shipping_fee,
    ROUND(SUM(log_cost),2) as log_cost,
    ROUND(SUM(ship_cost),2) as ship_cost,
    SUM(quantity) as quantity
    FROM {{ ref('int_orders_operational') }}
    GROUP BY date_date)

SELECT 
date_date,
nb_transactions,
revenue,
margin,
operational_margin,
purchase_cost,
shipping_fee,
log_cost,
ship_cost,
quantity,
ROUND(revenue/NULLIF(nb_transactions,0),2) as average_basket
FROM per_date
ORDER BY date_date desc

