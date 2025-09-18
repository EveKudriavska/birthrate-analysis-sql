SELECT
   p.product_id,
   p.product_name,
   return_reason AS top_return_reason
FROM (
   SELECT
       oli.product_id,
       oli.return_reason,
       COUNT(*) AS reason_count,
       ROW_NUMBER() OVER (
           PARTITION BY oli.product_id
           ORDER BY COUNT(*) DESC
       ) AS rn
   FROM `wyk-eve-kudriavska.WYK_project1_SQL.order_line_items` oli
   WHERE oli.return_reason IS NOT NULL
   GROUP BY oli.product_id, oli.return_reason
) return_r
JOIN `wyk-eve-kudriavska.WYK_project1_SQL.products` p
   ON p.product_id = return_r.product_id
WHERE rn = 1
ORDER BY p.product_name;
