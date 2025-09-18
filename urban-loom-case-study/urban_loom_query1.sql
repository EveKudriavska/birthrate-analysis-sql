SELECT
   p.product_id,
   p.product_name,
   COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Sale' THEN oli.order_transaction_id END) AS total_sales,
   COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Return' THEN oli.order_transaction_id END) AS total_returns,
   ROUND(
       SAFE_DIVIDE(
           COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Return' THEN oli.order_transaction_id END),
           COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Sale' THEN oli.order_transaction_id END)
       ) * 100,
       2
   ) AS return_percentage,


   CASE
       WHEN COUNTIF(ot.order_transaction_type = 'Sale') > 100 THEN 'Frequently Bought'
       WHEN COUNTIF(ot.order_transaction_type = 'Sale') BETWEEN 25 AND 100 THEN 'Average'
       WHEN COUNTIF(ot.order_transaction_type = 'Sale') BETWEEN 1 AND 25 THEN 'Rarely Bought'
       ELSE 'Never Bought'
   END AS product_classification


FROM `wyk-eve-kudriavska.WYK_project1_SQL.products` p
LEFT JOIN `wyk-eve-kudriavska.WYK_project1_SQL.order_line_items` oli
   ON p.product_id = oli.product_id
LEFT JOIN `wyk-eve-kudriavska.WYK_project1_SQL.order_transactions` ot
   ON oli.order_transaction_id = ot.order_transaction_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;
