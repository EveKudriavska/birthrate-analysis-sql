
WITH campaign_info AS (
 SELECT
     om.marketing_campaign,
     COUNT(DISTINCT ot.customer_id) AS num_customers,
     SUM(oli.revenue) AS total_revenue,
     COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Return' THEN ot.order_transaction_id END) AS total_returns,
     COUNT(DISTINCT CASE WHEN ot.order_transaction_type = 'Sale' THEN ot.order_transaction_id END) AS total_sales
 FROM
     `wyk-eve-kudriavska.WYK_project1_SQL.order_marketing_details` om
 JOIN `wyk-eve-kudriavska.WYK_project1_SQL.order_transactions` ot
     ON om.transaction_id = ot.order_transaction_id
 JOIN `wyk-eve-kudriavska.WYK_project1_SQL.order_line_items` oli
     ON ot.order_transaction_id = oli.order_transaction_id
 WHERE om.marketing_campaign IS NOT NULL
 GROUP BY om.marketing_campaign
)


SELECT
   marketing_campaign,
   num_customers,
   ROUND(total_revenue, 2) AS total_revenue,
   total_sales,
   total_returns,
   ROUND(SAFE_DIVIDE(total_returns, total_sales) * 100, 2) AS return_percentage
FROM campaign_info
ORDER BY total_revenue DESC;
