-- For Cust table
-- check for nulls or duplicates in primary key
-- Expections No result 

SELECT 
cst_id, COUNT(*)
FROM bronze.crm_cst_info
GROUP BY cst_id
HAVING COUNT(*)>1;


-- Check for unwanted spaces 
-- Expected no result 

SELECT cst_lastname
FROM bronze.crm_cst_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Data Standardization & Consistancy


SELECT DISTINCT cst_gndr
FROM bronze.crm_cst_info;

SELECT DISTINCT cst_material_status
FROM bronze.crm_cst_info;


-- for Prod Table 
-- check for nulls or duplicates in primary key
-- Expections No result 

SELECT 
prod_id,
COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL 

-- Check for unwanted spaces 
-- Expected no result 
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check NULLs or Negative Numbers 
-- Expected no result 

SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost <0 OR prd_cost IS NULL

--Data Standardizaton & Consistancy 
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

--Check for invalid date and order 
SELECT * 
FROM bronze.crm_prd_info
where prd_end_dt < prd_start_dt
