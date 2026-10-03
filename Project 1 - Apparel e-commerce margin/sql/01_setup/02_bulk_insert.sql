/*

Loading the 12 source files into the source tables.
Detailed setup for data loading using docker is outlined in `xxxxxx`

*/

USE ApparelMarginCS;
GO

TRUNCATE TABLE dbo.raw_orders;
BULK INSERT dbo.raw_orders
FROM '/var/opt/mssql/data_source/orders.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_order_items;
BULK INSERT dbo.raw_order_items
FROM '/var/opt/mssql/data_source/order_items.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_returns;
BULK INSERT dbo.raw_returns
FROM '/var/opt/mssql/data_source/returns.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_support_tickets;
BULK INSERT dbo.raw_support_tickets
FROM '/var/opt/mssql/data_source/support_tickets.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_customer_complaints;
BULK INSERT dbo.raw_customer_complaints
FROM '/var/opt/mssql/data_source/customer_complaints.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_products_catalog;
BULK INSERT dbo.raw_products_catalog
FROM '/var/opt/mssql/data_source/products_catalog.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_suppliers;
BULK INSERT dbo.raw_suppliers
FROM '/var/opt/mssql/data_source/suppliers.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_discount_codes;
BULK INSERT dbo.raw_discount_codes
FROM '/var/opt/mssql/data_source/discount_codes.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_inventory_daily;
BULK INSERT dbo.raw_inventory_daily
FROM '/var/opt/mssql/data_source/inventory_daily.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_purchase_orders;
BULK INSERT dbo.raw_purchase_orders
FROM '/var/opt/mssql/data_source/purchase_orders.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_stock_receipts;
BULK INSERT dbo.raw_stock_receipts
FROM '/var/opt/mssql/data_source/stock_receipts.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

TRUNCATE TABLE dbo.raw_supplier_claims;
BULK INSERT dbo.raw_supplier_claims
FROM '/var/opt/mssql/data_source/supplier_claims.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
GO

-- Row counts check: source tables vs source files

SELECT t.table_name, t.rows_loaded, t.rows_expected,
       CASE WHEN t.rows_loaded = t.rows_expected THEN 'OK' ELSE 'CHECK' END AS result
FROM (
    SELECT 'raw_orders' AS table_name, COUNT(*) AS rows_loaded, 528299 AS rows_expected FROM dbo.raw_orders UNION ALL
    SELECT 'raw_order_items' AS table_name, COUNT(*) AS rows_loaded, 529884 AS rows_expected FROM dbo.raw_order_items UNION ALL
    SELECT 'raw_returns' AS table_name, COUNT(*) AS rows_loaded, 57272 AS rows_expected FROM dbo.raw_returns UNION ALL
    SELECT 'raw_support_tickets' AS table_name, COUNT(*) AS rows_loaded, 96198 AS rows_expected FROM dbo.raw_support_tickets UNION ALL
    SELECT 'raw_customer_complaints' AS table_name, COUNT(*) AS rows_loaded, 13044 AS rows_expected FROM dbo.raw_customer_complaints UNION ALL
    SELECT 'raw_products_catalog' AS table_name, COUNT(*) AS rows_loaded, 260 AS rows_expected FROM dbo.raw_products_catalog UNION ALL
    SELECT 'raw_suppliers' AS table_name, COUNT(*) AS rows_loaded, 12 AS rows_expected FROM dbo.raw_suppliers UNION ALL
    SELECT 'raw_discount_codes' AS table_name, COUNT(*) AS rows_loaded, 42 AS rows_expected FROM dbo.raw_discount_codes UNION ALL
    SELECT 'raw_inventory_daily' AS table_name, COUNT(*) AS rows_loaded, 190155 AS rows_expected FROM dbo.raw_inventory_daily UNION ALL
    SELECT 'raw_purchase_orders' AS table_name, COUNT(*) AS rows_loaded, 3605 AS rows_expected FROM dbo.raw_purchase_orders UNION ALL
    SELECT 'raw_stock_receipts' AS table_name, COUNT(*) AS rows_loaded, 3746 AS rows_expected FROM dbo.raw_stock_receipts UNION ALL
    SELECT 'raw_supplier_claims' AS table_name, COUNT(*) AS rows_loaded, 386 AS rows_expected FROM dbo.raw_supplier_claims
) AS t
ORDER BY t.table_name;
GO