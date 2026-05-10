WITH sales_data AS(
	SELECT
		customerkey,
		SUM(netprice * quantity / exchangerate) AS net_revenue
	FROM
		sales
	GROUP BY
		customerkey
)

SELECT
	-- c.customerkey,
	AVG(s.net_revenue) AS spending_customers_avg_net_revenue,
	AVG(COALESCE(s.net_revenue, 0)) AS all_customers_avg_net_revenues
FROM
	customer c
LEFT JOIN sales_data s ON c.customerkey = s.customerkey