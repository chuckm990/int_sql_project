WITH ranked_purchases AS(
	SELECT
		customerkey,
		full_name,
		orderdate,
		ROW_NUMBER() OVER(PARTITION BY customerkey ORDER BY orderdate DESC) AS rn,
		first_purchase_date,
		cohort_year
	FROM
		cohort_analysis
), churned_customers AS(
	SELECT
		customerkey,
		full_name,
		orderdate AS last_purchase_date,
		CASE
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - (INTERVAL '6 months') THEN 'churned'
			ELSE 'active'
		END AS customer_status,
		cohort_year
	FROM ranked_purchases
	WHERE rn = 1
		AND first_purchase_date < (SELECT MAX(orderdate) FROM sales) - (INTERVAL '6 months')
)

SELECT
	customer_status,
	cohort_year,
	COUNT(customerkey) AS nc,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
	100.0 * ROUND(COUNT(customerkey) / SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year), 4) AS percentage_churned
FROM
	churned_customers
GROUP BY
	cohort_year,
	customer_status;