SELECT
	customerkey,
	full_name
	SUM(total_revenue) AS total_ltv
FROM
	cohort_analysis
GROUP BY
	customerkey,
	full_name