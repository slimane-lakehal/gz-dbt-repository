 
 WITH stg_raw__sales AS (
  SELECT
      orders_id,
      products_id,
      date_date,
      revenue,
      quantity
  FROM {{ref("stg_raw__sales")}}
),
stg_raw__product AS (
    SELECT * FROM {{ref("stg_raw__product")}}
)
 
 SELECT
      products_id,
      date_date,
      orders_id,
      revenue,
      quantity,
      purchase_price,
      ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
      ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
  FROM stg_raw__sales s
  LEFT JOIN stg_raw__product p
      USING (products_id)