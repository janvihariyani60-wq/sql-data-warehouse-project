/*
================================================================================
Data Load Script: Source to Bronze Layer
================================================================================
Script Purpose :
  Loads data into the bronze-layer tables inside the 'DataWarehouse' database
  from external CSV files.
  The script performs the following actions:
    - Truncates bronze tables before loading data.
    - Uses LOAD DATA LOCAL INFILE to import CSV data into bronze tables.

Usage:
  Run this script to refresh the bronze-layer data from source CSV files.
================================================================================
*/
  SET @start_time = NOW();
    
  TRUNCATE TABLE bronze_crm_cust_info;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
	INTO TABLE bronze_crm_cust_info
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_crm_prd_info;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
	INTO TABLE bronze_crm_prd_info
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_crm_sales_details;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
	INTO TABLE bronze_crm_sales_details
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_cust_az12;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
	INTO TABLE bronze_erp_cust_az12
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_loc_a101;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
	INTO TABLE bronze_erp_loc_a101
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;

	TRUNCATE TABLE bronze_erp_px_cat_g1v2;
	LOAD DATA LOCAL INFILE 
	'D:/data analysis/SQL YOUTUBE BARAA/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
	INTO TABLE bronze_erp_px_cat_g1v2
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;
	
  SET @end_time = NOW();
  SELECT CONCAT(timestampdiff(second, @start_time, @end_time), ' seconds') AS time_taken;
