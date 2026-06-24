  CREATE OR REPLACE FORCE EDITIONABLE VIEW "AGENT_SALES_VIEW" ("CUSTOMER_ID", "CUSTOMER_NAME", "PRODUCT_NAME", "SKU", "QUANTITY", "PRICE", "PROMOTION_NAME", "DISCOUNT_PRICE", "TOTAL_AMOUNT", "DISCOUNTED_TOTAL") AS 
  SELECT
    c.id as customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.name AS product_name,
    p.sku AS sku,
    s.quantity AS quantity,
    s.unit_price AS price,
    promo.name AS promotion_name,
    ROUND(
        s.unit_price * (1 - NVL(promo.discount_percentage, 0) / 100),
        2
    ) AS discount_price,
    ROUND(s.quantity * s.unit_price, 2) AS total_amount,
    ROUND(
        s.quantity * s.unit_price * (1 - NVL(promo.discount_percentage, 0) / 100),
        2
    ) AS discounted_total
FROM agent_sales s
JOIN agent_customers c
    ON c.id = s.customer_id
JOIN agent_products p
    ON p.id = s.product_id
LEFT JOIN agent_promotions promo
    ON promo.id = s.promotion_id; 