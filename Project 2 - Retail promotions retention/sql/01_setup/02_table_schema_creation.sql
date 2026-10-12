/*

Creating one staging table per CSV file. All columns are included in the source table.
All columns are set to VARCHAR data type on purpose - all conversions and relationships between tables will be set in the next steps.

*/

USE retail_promotions_retention;
GO

DROP TABLE IF EXISTS stg.transaction_data;
CREATE TABLE stg.transaction_data (
    [household_key] VARCHAR(200) NULL,
    [basket_id] VARCHAR(200) NULL,
    [day] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [quantity] VARCHAR(200) NULL,
    [sales_value] VARCHAR(200) NULL,
    [store_id] VARCHAR(200) NULL,
    [retail_disc] VARCHAR(200) NULL,
    [trans_time] VARCHAR(200) NULL,
    [week_no] VARCHAR(200) NULL,
    [coupon_disc] VARCHAR(200) NULL,
    [coupon_match_disc] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.campaign_table;
CREATE TABLE stg.campaign_table(
    [description] VARCHAR(200) NULL,
    [household_key] VARCHAR(200) NULL,
    [campaign] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.hh_demographic;
CREATE TABLE stg.hh_demographic(
    [classification_1] VARCHAR(200) NULL,
    [classification_2] VARCHAR(200) NULL,
    [classification_3] VARCHAR(200) NULL,
    [homeowner_desc] VARCHAR(200) NULL,
    [classification_5] VARCHAR(200) NULL,
    [classification_4] VARCHAR(200) NULL,
    [kid_category_desc] VARCHAR(200) NULL,
    [household_key] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.campaign_desc;
CREATE TABLE stg.campaign_desc(
    [description] VARCHAR(200) NULL,
    [campaign] VARCHAR(200) NULL,
    [start_day] VARCHAR(200) NULL,
    [end_day] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.coupon_redempt;
CREATE TABLE stg.coupon_redempt(
    [household_key] VARCHAR(200) NULL,
    [day] VARCHAR(200) NULL,
    [coupon_upc] VARCHAR(200) NULL,
    [campaign] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.product;
CREATE TABLE stg.product(
    [product_id] VARCHAR(200) NULL,
    [manufacturer] VARCHAR(200) NULL,
    [department] VARCHAR(200) NULL,
    [brand] VARCHAR(200) NULL,
    [commodity_desc] VARCHAR(200) NULL,
    [sub_commodity_desc] VARCHAR(200) NULL,
    [curr_size_of_product] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.coupon;
CREATE TABLE stg.coupon(
    [coupon_upc] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [campaign] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS stg.causal_data;
CREATE TABLE stg.causal_data(
    [product_id] VARCHAR(200) NULL,
    [store_id] VARCHAR(200) NULL,
    [week_no] VARCHAR(200) NULL,
    [display] VARCHAR(200) NULL,
    [mailer] VARCHAR(200) NULL
);
GO


-- Table creation check - all tables should have the 'stg' table schema, VARCHAR datatype, 
-- nullable feature and char length of max. 200.

SELECT 
    table_schema, 
    table_name, 
    column_name, 
    data_type, 
    character_maximum_length, 
    is_nullable
FROM INFORMATION_SCHEMA.columns
ORDER BY table_name, ordinal_position;

-- Table schema has been created correctly.