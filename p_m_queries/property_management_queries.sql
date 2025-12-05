-- Query 1: Percent of Rent Collected by Month
WITH billed AS (
    SELECT DATE_TRUNC('month', due_date) AS month,
           SUM(amount_due) AS billed_amt
    FROM rent_payments
    GROUP BY 1
),
paid AS (
    SELECT DATE_TRUNC('month', due_date) AS month,
           SUM(amount_paid) AS paid_amt
    FROM rent_payments
    GROUP BY 1
)
SELECT b.month, b.billed_amt, p.paid_amt,
       ROUND(100.0 * p.paid_amt / NULLIF(b.billed_amt,0), 2) AS pct_collected
FROM billed b
LEFT JOIN paid p USING (month)
ORDER BY 1;

-- Query 2: Maintenance Cost Share by Category
WITH c_cost AS (
    SELECT category, SUM(cost) AS category_cost
    FROM work_orders
    GROUP BY category
)
SELECT category, category_cost,
       ROUND(category_cost * 100.0 / SUM(category_cost) OVER (), 2) AS percent_share
FROM c_cost
ORDER BY category_cost DESC;

-- Query 3: Average Rent per Property
SELECT property_id,
       ROUND(AVG(monthly_rent), 0) AS avg_rent
FROM leases
JOIN units USING (unit_id)
GROUP BY property_id
ORDER BY avg_rent;

-- Query 4: Maximum Days Past Due (DPD) Per Lease
SELECT lease_id,
       MAX(GREATEST(0, COALESCE(paid_date, CURRENT_DATE) - due_date)) AS max_dpd
FROM rent_payments
GROUP BY lease_id
ORDER BY max_dpd DESC, lease_id;

-- Query 5: Monthly On-Time Payment Rate
SELECT DATE_TRUNC('month', due_date) AS month,
       ROUND(AVG(CASE WHEN paid_date <= due_date THEN 1.0 ELSE 0.0 END) * 100, 2)
         AS on_time_payment_rate
FROM rent_payments
GROUP BY 1
ORDER BY 1;

-- Query 6: Unit Maintenance Cost Ranking
WITH unit_cost AS (
    SELECT u.property_id, u.unit_id,
           COALESCE(SUM(w.cost),0) AS total_cost
    FROM units u
    LEFT JOIN work_orders w USING (unit_id)
    GROUP BY 1,2
)
SELECT property_id, unit_id, total_cost,
       RANK() OVER (PARTITION BY property_id ORDER BY total_cost DESC) AS rank_in_property
FROM unit_cost
ORDER BY property_id, rank_in_property;

-- Query 7: Running Total of Payments Per Lease
SELECT lease_id, due_date, amount_paid,
       SUM(amount_paid) OVER (PARTITION BY lease_id ORDER BY due_date) AS running_paid
FROM rent_payments
ORDER BY lease_id, due_date;

-- Query 8: Vacancy Rate Per Property
SELECT property_id,
       COUNT(*) FILTER (WHERE status = 'vacant') AS vacant_units,
       COUNT(*) AS total_units,
       ROUND(
           COUNT(*) FILTER (WHERE status = 'vacant') * 100.0 / COUNT(*),
           2
       ) AS vacancy_rate_pct
FROM units
GROUP BY property_id;
