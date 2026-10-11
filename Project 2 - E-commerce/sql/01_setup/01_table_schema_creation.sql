/*

Creating one source table per each CSV source file (available in `data\source`). All columns are included in the source table.
All columns are set to VARCHAR data type on purpose - all conversions, constraints and relationships will be conducted / set in the following steps (`sql/02_model`).

*/

USE ApparelMarginCS;
GO

DROP TABLE IF EXISTS dbo.raw_orders;
CREATE TABLE dbo.raw_orders (
    [order_id] VARCHAR(200) NULL,
    [user_session] VARCHAR(200) NULL,
    [user_id] VARCHAR(200) NULL,
    [order_ts] VARCHAR(200) NULL,
    [status] VARCHAR(200) NULL,
    [discount_pct] VARCHAR(200) NULL,
    [discount_code] VARCHAR(200) NULL,
    [payment_method] VARCHAR(200) NULL,
    [shipping_country] VARCHAR(200) NULL,
    [shipping_fee_charged] VARCHAR(200) NULL,
    [shipping_cost] VARCHAR(200) NULL,
    [payment_fee] VARCHAR(200) NULL,
    [loyalty_points_used] VARCHAR(200) NULL,
    [loyalty_discount] VARCHAR(200) NULL,
    [cancelled_at] VARCHAR(200) NULL,
    [cancellation_reason] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_order_items;
CREATE TABLE dbo.raw_order_items (
    [order_id] VARCHAR(200) NULL,
    [line_no] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [quantity] VARCHAR(200) NULL,
    [unit_price] VARCHAR(200) NULL,
    [unit_cost] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_returns;
CREATE TABLE dbo.raw_returns (
    [return_id] VARCHAR(200) NULL,
    [order_id] VARCHAR(200) NULL,
    [line_no] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [return_date] VARCHAR(200) NULL,
    [quantity] VARCHAR(200) NULL,
    [refund_amount] VARCHAR(200) NULL,
    [reason] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_support_tickets;
CREATE TABLE dbo.raw_support_tickets (
    [ticket_id] VARCHAR(200) NULL,
    [user_id] VARCHAR(200) NULL,
    [order_id] VARCHAR(200) NULL,
    [created_at] VARCHAR(200) NULL,
    [channel] VARCHAR(200) NULL,
    [topic] VARCHAR(200) NULL,
    [priority] VARCHAR(200) NULL,
    [agent_id] VARCHAR(200) NULL,
    [status] VARCHAR(200) NULL,
    [first_response_at] VARCHAR(200) NULL,
    [resolved_at] VARCHAR(200) NULL,
    [survey_sent] VARCHAR(200) NULL,
    [csat_score] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_customer_complaints;
CREATE TABLE dbo.raw_customer_complaints (
    [complaint_id] VARCHAR(200) NULL,
    [ticket_id] VARCHAR(200) NULL,
    [order_id] VARCHAR(200) NULL,
    [line_no] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [return_id] VARCHAR(200) NULL,
    [complaint_date] VARCHAR(200) NULL,
    [complaint_type] VARCHAR(200) NULL,
    [resolution] VARCHAR(200) NULL,
    [resolved_date] VARCHAR(200) NULL,
    [compensation_amount] VARCHAR(200) NULL,
    [handling_cost] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_products_catalog;
CREATE TABLE dbo.raw_products_catalog (
    [product_id] VARCHAR(200) NULL,
    [category_id] VARCHAR(200) NULL,
    [category_code] VARCHAR(200) NULL,
    [brand] VARCHAR(200) NULL,
    [list_price] VARCHAR(200) NULL,
    [unit_cost] VARCHAR(200) NULL,
    [supplier_id] VARCHAR(200) NULL,
    [lead_time_days] VARCHAR(200) NULL,
    [is_active] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_suppliers;
CREATE TABLE dbo.raw_suppliers (
    [supplier_id] VARCHAR(200) NULL,
    [supplier_name] VARCHAR(200) NULL,
    [country] VARCHAR(200) NULL,
    [payment_terms_days] VARCHAR(200) NULL,
    [standard_lead_time_days] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_discount_codes;
CREATE TABLE dbo.raw_discount_codes (
    [discount_code] VARCHAR(200) NULL,
    [description] VARCHAR(200) NULL,
    [discount_pct] VARCHAR(200) NULL,
    [code_type] VARCHAR(200) NULL,
    [valid_from] VARCHAR(200) NULL,
    [valid_to] VARCHAR(200) NULL,
    [member_only] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_inventory_daily;
CREATE TABLE dbo.raw_inventory_daily (
    [product_id] VARCHAR(200) NULL,
    [inventory_date] VARCHAR(200) NULL,
    [units_on_hand_end] VARCHAR(200) NULL,
    [units_demand] VARCHAR(200) NULL,
    [units_unfulfilled] VARCHAR(200) NULL,
    [units_received] VARCHAR(200) NULL,
    [units_ordered_from_supplier] VARCHAR(200) NULL,
    [units_on_order_end] VARCHAR(200) NULL,
    [stockout_flag] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_purchase_orders;
CREATE TABLE dbo.raw_purchase_orders (
    [po_id] VARCHAR(200) NULL,
    [supplier_id] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [order_date] VARCHAR(200) NULL,
    [promised_date] VARCHAR(200) NULL,
    [quantity_ordered] VARCHAR(200) NULL,
    [unit_purchase_price] VARCHAR(200) NULL,
    [status] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_stock_receipts;
CREATE TABLE dbo.raw_stock_receipts (
    [receipt_id] VARCHAR(200) NULL,
    [po_id] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [supplier_id] VARCHAR(200) NULL,
    [receipt_date] VARCHAR(200) NULL,
    [quantity_received] VARCHAR(200) NULL,
    [unit_purchase_price] VARCHAR(200) NULL,
    [receipt_type] VARCHAR(200) NULL
);
GO

DROP TABLE IF EXISTS dbo.raw_supplier_claims;
CREATE TABLE dbo.raw_supplier_claims (
    [claim_id] VARCHAR(200) NULL,
    [receipt_id] VARCHAR(200) NULL,
    [po_id] VARCHAR(200) NULL,
    [supplier_id] VARCHAR(200) NULL,
    [product_id] VARCHAR(200) NULL,
    [claim_date] VARCHAR(200) NULL,
    [claim_type] VARCHAR(200) NULL,
    [units_affected] VARCHAR(200) NULL,
    [claim_value] VARCHAR(200) NULL,
    [status] VARCHAR(200) NULL,
    [resolution] VARCHAR(200) NULL,
    [approved_amount] VARCHAR(200) NULL,
    [resolved_date] VARCHAR(200) NULL
);
GO
