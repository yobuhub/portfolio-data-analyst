/*

Loading 8 CSV files data into the staging tables.
Detailed setup for data loading using docker is outlined in `xxxxxx`

TODO: add correct link and description.

*/

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



