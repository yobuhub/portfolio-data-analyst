SELECT
	COUNT(*) AS total_rows, -- 2,595,732

	-- Identifiers / Keys
	COUNT(DISTINCT household_key) AS household_key_count, -- 2,500
	COUNT(DISTINCT basket_id)     AS basket_id_count, -- 276,484
	COUNT(DISTINCT product_id)    AS product_id_count, -- 92,339
	COUNT(DISTINCT store_id)      AS store_id_count, -- 582

	-- Time dimensions
	COUNT(DISTINCT [day])         AS day_count, -- 711
	COUNT(DISTINCT week_no)       AS week_no_count -- 102

FROM stg.transaction_data;

-- value range

SELECT

	-- Identifiers / Keys
	MIN(household_key) AS household_key_min,
    MAX(household_key) AS household_key_max,
	MIN(basket_id)     AS basket_id_min,
    MAX(basket_id)     AS basket_id_max,
	MIN(product_id)    AS product_id_min,
    MAX(product_id)    AS product_id_max,
	MIN(store_id)      AS store_id_min,
    MAX(store_id)      AS store_id_max,

	-- Time dimensions
	MIN([day])      AS day_min,
	MAX([day])      AS day_max,
	MIN(week_no)    AS week_no_min,
	MAX(week_no)    AS week_no_max,
	MIN(trans_time) AS trans_time_min,
	MAX(trans_time) AS trans_time_max,

	-- Measures
	MIN(quantity)          AS quantity_min,
	MAX(quantity)          AS quantity_max,
	MIN(sales_value)       AS sales_value_min,
	MAX(sales_value)       AS sales_value_max,
	MIN(retail_disc)       AS retail_disc_min,
	MAX(retail_disc)       AS retail_disc_max,
	MIN(coupon_disc)       AS coupon_disc_min,
	MAX(coupon_disc)       AS coupon_disc_max,
	MIN(coupon_match_disc) AS coupon_match_disc_min,
	MAX(coupon_match_disc) AS coupon_match_disc_max

FROM stg.transaction_data;

