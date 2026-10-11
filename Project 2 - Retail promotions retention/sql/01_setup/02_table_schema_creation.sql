/*

Creating one source table per each CSV file. All columns are included in the source table.
All columns are set to VARCHAR data type on purpose - all conversions and relationships between tables will be set in the next steps.

*/

USE retail_promotions_retention;
GO

-- TODO: create all staging tables

DROP TABLE IF EXISTS