# :package: Import guide 

This markdown file depicts the steps necessary to obtain the source dataset (more information available here - [Data source](sources.md)), load it locally and reproduce the analyses.

<h4>⚠️ Please note that the source data is **not** included in this repository, as per data redistribution policies set by the provider</h4>

## Overview

- **Dataset** - dunnhumby — The Complete Journey
- **Data format** - CSV files
- **Database set-up** - SQL Server (in a Docker container)
- **Result** - One source table per each CSV file - all columns as text

## Prerequisites

- [ ] Docker with a running SQL Server container
- [ ] SQL client able to run T-SQL (e.g. SSMS)
- [ ] Python + Jupyter (for easier presentation of findings and intermediary visualizations)
- [ ] Free disk space for the CSV files

> TODO: other environments to be described later (e.g. MySQL Workbench, sql_alchemy)
> TODO: how to setup a docker container

#
<br>

## Step 1 | Download the source data

1. Go to [dunnhumby Source Files](https://www.dunnhumby.com/source-files/).
2. Find the dataset and accept the terms through a form registration (name, surname, email address, position).
3. Download and unzip the archive.
4. Check that you have all the constituent CSV files, i.e.: campaign_desc, campaign_table, causal_data, coupon_redempt, coupon, hh_demographic, product, and transaction_data.

⚠️ Remember **not** to commit the source files or samples (and other reformatted files) to a public repository.

<br>

## Step 2 | Prepare the folder structure

- Keep the raw files in a dedicated local folder.
- Do not rename or edit the original files.
- Make sure the folder is listed in `.gitignore`, as to ensure it does not get uploaded to a public repo.

<br>

## Step 3 | Check the files before loading

| Parameter | Why? |
|---|---|
| **Header row** | each column name is used to define the source tables |
| **Field separator** | this parameter must match what is set in the csv file |
| **Line endings (CRLF or LF)** | a wrong setting will break the upload |
| **Row count** | checked for reference to ensure successful upload of data |

<br>

## Step 4 | Make the files visible to SQL Server Management Studio

- SQL Server runs inside Docker, so it reads files from **inside the container** - not from your Windows folders.
- Copy the CSV files into a folder in the container.
- Check that the SQL Server process has permission to read them.

>TODO: add exact commands once the scripts are ready

<br>

## Step 5 | Create the database and load the data

1. **Create database** - dedicated database for this project, e.g. `retail_promotions_retention`
2. **Create staging tables** - one table per CSV, all data as text. No column names are changed yet.
3. **Load data** - one load per each table.

>TODO: link to the SQL scripts. Import through wizard as other possibility.

<br>

## Step 6 | Validate the load

- [ ] Make sure that the row counts match those in source CSV files.
- [ ] Preview a few rows from each table.
- [ ] Make sure the data is displayed in correct columns.

<br>

## Step 7 | Next steps

- Data cleaning and profiling
- Table and field definitions: [Data dictionary](data_dictionary.md)

<br>

## Troubleshooting

| Problem | Likely cause |
|---|---|
| **Access denied** | file was not copied into the container or misses a read permission |
| **File not found** | the path must point to the location **inside** the container |
| **Row count mismatch** | wrong line ending setting |
| **Shifted columns** | separator inside quoted text |
| **Option not supported on Linux** | windows-only load option used in a Linux container |

> TODO: To be reviewed