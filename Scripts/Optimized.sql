DROP VIEW cohort_analysis;

CREATE VIEW cohort_analysis AS
WITH customer_revenue AS (
	SELECT
		s.customerkey,
		s.orderdate,
		sum(s.netprice * s.quantity::double PRECISION / s.exchangerate) AS total_revenue,
		count(s.orderkey) AS num_orders,
		MAX(c.countryfull) AS countryfull,
		MAX(c.age) AS age,
		MAX(c.givenname) AS givenname,
		MAX(c.surname) AS surname
	FROM
		sales s
	INNER JOIN customer c ON
		s.customerkey = c.customerkey
	GROUP BY
		s.customerkey,
		s.orderdate
)
 SELECT
	cr.customerkey,
	cr.orderdate,
	cr.total_revenue,
	cr.num_orders,
	cr.countryfull,
	cr.age,
	concat(TRIM(BOTH FROM cr.givenname), ' ', TRIM(BOTH FROM cr.surname)) AS full_name,
	min(cr.orderdate) OVER (
		PARTITION BY cr.customerkey
	) AS first_purchase_date,
	EXTRACT(YEAR FROM min(cr.orderdate) OVER (PARTITION BY cr.customerkey)) AS cohort_year
FROM
	customer_revenue cr;