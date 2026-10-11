/*

Creating a project database to store all the data and transformations.
Database is created in SQL Management Server Studio 22 (hosted with the help of Docker), thus code will be written henceforth with T-SQL.
Technical specification is stored in the docs folder.

*/

-- 1. Creating the database if it does not already exist

IF DB_ID('retail_promotions_retention') IS NULL
    CREATE DATABASE retail_promotions_retention;
GO

-- 2. Switching to the target database (from master)

USE retail_promotions_retention;
GO

-- 3. Creating a schema (for staging tables)
IF SCHEMA_ID('stg') IS NULL EXEC('CREATE SCHEMA stg');
GO