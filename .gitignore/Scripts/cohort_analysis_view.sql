DROP VIEW cohort_analysis;

CREATE OR REPLACE VIEW cohort_analysis AS
WITH customer_revenue AS (
         SELECT s.customerkey,
            s.orderdate,
            sum(s.netprice * s.quantity::double precision / s.exchangerate) AS total_revenue,
            count(s.orderkey) AS num_orders,
            c.countryfull,
            c.age,
            c.givenname,
            c.surname
           FROM sales s
             LEFT JOIN customer c ON s.customerkey = c.customerkey
          GROUP BY s.customerkey, s.orderdate, c.countryfull, c.age, c.givenname, c.surname
        )
 SELECT cr.customerkey,
    cr.orderdate,
    cr.total_revenue,
    cr.num_orders,
    cr.countryfull,
    cr.age,
    CONCAT(TRIM(givenname), ' ', TRIM(surname)) AS full_name,
    min(cr.orderdate) OVER (PARTITION BY cr.customerkey) AS first_purchase_date,
    EXTRACT(year FROM min(cr.orderdate) OVER (PARTITION BY cr.customerkey)) AS cohort_year
   FROM customer_revenue cr;