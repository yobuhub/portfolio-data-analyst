/*

Loading 8 CSV files data into the staging tables.
Detailed setup for data loading using docker is outlined in `xxxxxx`

TODO: add correct link and description.

*/

-- Importing data into created tables

USE retail_promotions_retention;
GO

TRUNCATE TABLE stg.transaction_data;
BULK INSERT stg.transaction_data
FROM '/var/opt/mssql/data/transaction_data.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.campaign_table;
BULK INSERT stg.campaign_table
FROM '/var/opt/mssql/data/campaign_table.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.hh_demographic;
BULK INSERT stg.hh_demographic
FROM '/var/opt/mssql/data/hh_demographic.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.campaign_desc;
BULK INSERT stg.campaign_desc
FROM '/var/opt/mssql/data/campaign_desc.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.coupon_redempt;
BULK INSERT stg.coupon_redempt
FROM '/var/opt/mssql/data/coupon_redempt.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.product;
BULK INSERT stg.product
FROM '/var/opt/mssql/data/product.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.coupon;
BULK INSERT stg.coupon
FROM '/var/opt/mssql/data/coupon.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

TRUNCATE TABLE stg.causal_data;
BULK INSERT stg.causal_data
FROM '/var/opt/mssql/data/causal_data.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0X0A', TABLOCK);
GO

-- Checking total row count against documentation / CSV files (incl. powershell inspection)

SELECT COUNT(*) AS row_no
FROM stg.transaction_data; -- output: 2,595,732

SELECT COUNT(*) AS row_no
FROM stg.campaign_table; -- output: 7,208

SELECT COUNT(*) AS row_no
FROM stg.hh_demographic; -- output: 801

SELECT COUNT(*) AS row_no
FROM stg.campaign_desc; -- output: 30

SELECT COUNT(*) AS row_no
FROM stg.coupon_redempt; -- output: 2,318

SELECT COUNT(*) AS row_no
FROM stg.product; -- output: 92,353

SELECT COUNT(*) AS row_no
FROM stg.coupon; -- output: 124,548

SELECT COUNT(*) AS row_no
FROM stg.causal_data; -- output: 36,786,524

-- All files and data have been successfully imported.