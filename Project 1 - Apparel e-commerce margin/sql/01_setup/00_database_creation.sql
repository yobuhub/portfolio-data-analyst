/*

Creating the database used in the project.
Database is created in SQL Management Server Studio 22 (with Docker) using T-SQL. Technical specification details are outlined in `xxxxxxx`.

*/

IF DB_ID('ApparelMarginCS') IS NULL
    CREATE DATABASE ApparelMarginCS;
GO

USE ApparelMarginCS;
GO

IF SCHEMA_ID('stg') IS NULL EXEC('CREATE SCHEMA stg');
GO