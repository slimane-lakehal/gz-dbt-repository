SELECT
    o.orders_id,
    o.date_date,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.log_cost,
    s.ship_cost,
    ROUND(o.margin + s.shipping_fee - (s.log_cost + s.ship_cost), 2)
        AS operational_margin
FROM {{ ref("int_orders_margin") }} AS o
LEFT JOIN {{ ref("stg_raw__ship") }} AS s
    ON o.orders_id = s.orders_id
ORDER BY orders_id DESC
