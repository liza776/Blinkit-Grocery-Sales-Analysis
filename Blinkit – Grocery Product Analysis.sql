create database blinkit;
use blinkit;
show tables;

select * from grocery;
describe grocery;

-- Questions:

-- 1.IMPORT DATA FROM TABLE GROCERY SALES USING THE PROVIDED CSV FILE.
create table grocery_1(Item_Identifier varchar(50),Item_Weight double,Item_Fat_Content varchar(50),Item_Visibility double,	
Item_Type varchar(50),Item_MRP double,Outlet_Identifier varchar(50),Outlet_Establishment_Year int,Outlet_Size varchar(50),
Outlet_Location_Type varchar(50),Outlet_Type	varchar(50),Item_Outlet_Sales double);

-- LOAD DATA LOCAL INFILE '"D:\Sql_DS\sql_projects\Blinkit – Grocery Product Analysis.csv"'
-- INTO TABLE grocery_1
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

alter table grocery_1 modify item_weight decimal(10,2) null;

SHOW VARIABLES LIKE 'local_infile';    

-- 2.WRITE AN SQL QUERY TO SHOW ALL ITEM_IDENTIFIER.
select item_identifier from grocery;

-- 3.WRITE AN SQL QUERY TO SHOW COUNT OF TOTAL ITEM_IDENTIFIER.
select count(item_identifier) as Total from grocery;

-- 4.WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM WEIGHT.
select max(item_weight) as Maximum from grocery;

-- 5.WRITE AN SQL QUERY TO SHOW MINIMUM ITEM WEIGHT.
select min(item_weight) as Minimum from grocery;

-- 6.WRITE AN SQL QUERY TO SHOW AVERAGE ITEM_WEIGHT.
select round(avg(item_weight),2) as Average from grocery;
 
-- 7.WRITE AN SQL QUERY TO SHOW COUNT OF ITEM_FAT_CONTENT WHERE ITEM_FAT_CONTENT IS LOW FAT.
select count(item_fat_content) as `Low fat count` from grocery
where item_fat_content = "low fat";

-- 8.WRITE AN SQL QUERY TO SHOW COUNT OF ITEM_FAT_CONTENT WHERE ITEM_FAT_CONTENT IS REGULAR.
select count(item_fat_content) as `Regular count` from grocery
where item_fat_content = "regular";

-- 9.WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_MRP
select round(max(item_mrp),2) as Maximum from grocery;

-- 10.WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_MRP
select round(min(item_mrp),2) as Maximum from grocery;

-- 11.WRITE AN SQL QUERY TO SHOW ITEM_IDENTIFIER , ITEM_FAT_CONTENT ,ITEM_TYPE, ITEM_MRP WHOSE ITEM_MRP IS GREATER THAN 200.
select item_identifier,item_fat_content,item_type,item_mrp from grocery
where item_mrp > 200;

-- 12.WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_MRP WHERE ITEM_FAT_CONTENT IS LOW FAT
select max(item_mrp) as `Max` from grocery
where item_fat_content = "low fat";

-- 13.WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_MRP WHOSE ITEM_FAT_CONTENT IS LOW FAT 
select min(item_mrp) as `Min` from grocery
where item_fat_content = "low fat";

-- 14.WRITE AN SQL QUERY TO SHOW ALL DATA WHERE ITEM MRP IS BETWEEN 50 TO 100
select * from grocery
where item_mrp between 50 and 100;

-- 15.WRITE AN SQL QUERY TO SHOW ALL UNIQUE VALUE OF ITEM_FAT_CONTENT
select distinct(item_fat_content) as `Unique` from grocery;

-- 16.WRITE AN SQL QUERY TO SHOW ALL UNIQUE VALUE OF  ITEM_TYPE 
select distinct(item_type) as `Unique` from grocery;

-- 17.WRITE AN SQL QUERY TO SHOW ALL DATA IN DESCENDING ORDER BY ITEM MRP 
select * from grocery order by item_mrp desc;

-- 18.WRITE AN SQL QUERY TO SHOW ALL DATA IN ASCENDING ORDER BY ITEM_OUTLET_SALES
select * from grocery order by item_outlet_sales asc;

-- 19.WRITE AN SQL QUERY TO SHOW ALL DATA IN ASCENDING BY ITEM_TYPE 
select * from grocery order by item_type asc;

-- 20.WRITE AN SQL QUERY TO SHOW DATA OF ITEM_TYPE DAIRY & MEAT
select * from grocery 
where item_type in ("dairy","meat");

-- 21.WRITE AN SQL QUERY TO SHOW ALL UNIQUE VALUE OF OUTLET_SIZE 
select distinct(outlet_size) as `Unique` from grocery where outlet_size <> ''; -- not empty

-- 22.WRITE AN SQL QUERY TO SHOW ALL UNIQUE VALUE OF OUTLET_LOCATION_TYPE
select distinct(outlet_location_type) as `Unique` from grocery;

-- 23.WRITE AN SQL QUERY TO SHOW ALL UNIQUE VALUE OF OUTLET_TYPE 
select distinct(outlet_type) as `Unique` from grocery; 

-- 24.WRITE AN SQL QUERY TO SHOW COUNT OF NUMBER OF ITEMS BY ITEM_TYPE  AND ORDER IT IN DESCENDING ORDER
select item_type,count(*) as `Total` from grocery
group by item_type
order by Total desc;

-- 25.WRITE AN SQL QUERY TO SHOW COUNT OF NUMBER OF ITEMS BY OUTLET_SIZE AND ORDERED IT IN ASCENDING ORDER 
select outlet_size,count(*) as `total` from grocery
where outlet_size <> '' -- exclude blank place
group by outlet_size 
order by total asc;

-- 26.WRITE AN SQL QUERY TO SHOW COUNT OF NUMBER OF ITEMS BY OUTLET_TYPE  AND ORDERED IT IN DESCENDING ORDER.
select outlet_type,count(*) as `Total` from grocery
group by outlet_type 
order by total desc;

-- 27.WRITE AN SQL QUERY TO SHOW COUNT OF ITEMS BY OUTLET_LOCATION_TYPE AND ORDER IT INDESCENDING ORDER
select outlet_location_type,count(*) as `Total` from grocery
group by outlet_location_type 
order by Total desc;

-- 28.WRITE AN SQL QUERY TO SHOW MAXIMUM MRP BY ITEM_TYPE 
select item_type,max(item_mrp) as `Max_MRP` from grocery
group by item_type;

-- 29.WRITE AN SQL QUERY TO SHOW MINIMUM MRP BY ITEM_TYPE 
select item_type,min(item_mrp) as `Min_MRP` from grocery
group by item_type;

-- 30.WRITE AN SQL QUERY TO SHOW MINIMUM MRP BY OUTLET_ESTABLISHMENT_YEAR AND ORDER IT IN DESCENDING ORDER.
select outlet_establishment_year,min(item_mrp) as `Min_MRP` from grocery
group by outlet_establishment_year 
order by Min desc;

-- 31.WRITE AN SQL QUERY TO SHOW MAXIMUM MRP BY OUTLET_ESTABLISHMENT_YEAR AND ORDER IT IN DESCENDING ORDER.
select outlet_establishment_year,max(item_mrp) as `Max_MRP` from grocery
group by outlet_establishment_year
order by max desc;

-- 32.WRITE AN SQL QUERY TO SHOW AVERAGE MRP BY OUTLET_SIZE AND ORDER IT IN DESCENDING ORDER.
select outlet_size,round(avg(item_mrp),2) as `Avg_MRP` from grocery
group by outlet_size 
order by avg desc;

-- 33.WRITE AN SQL QUERY TO AVERAGE MRP BY OUTLET_TYPE AND ORDERED IN ASCENDING ORDER.
select outlet_type,round(avg(item_mrp),2) as `Avg_MRP` from grocery
group by outlet_type 
order by Avg asc;

-- 34.WRITE AN SQL QUERY TO SHOW MAXIMUM MRP BY OUTLET_TYPE
select outlet_type,max(item_mrp) as `Max_MRP` from grocery
group by outlet_type;

-- 35.WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_WEIGHT BY ITEM_TYPE
select item_type,max(item_weight) as `Max_weight` from grocery
group by item_type;

-- 36.	WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_WEIGHT BY OUTLET_ESTABLISHMENT_YEAR
select outlet_establishment_year,max(item_weight) as `Max_weight` from grocery
where item_weight is not null 
group by outlet_establishment_year;

-- 37.	WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_WEIGHT BY OUTLET_TYPE 
select outlet_type,min(item_weight) as `Max_weight` from grocery
where item_weight is not null
group by outlet_type;

-- 38.	WRITE AN SQL QUERY TO SHOW AVERAGE ITEM_WEIGHT BY OUTLET_LOCATION_TYPE AND ARRANGE IT BY DESCENDING ORDER
select outlet_location_type,round(avg(item_weight),2) as `Avg_weight` from grocery
group by outlet_location_type 
order by Avg_weight desc;

-- 39.	WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_OUTLET_SALES BY ITEM_TYPE
select item_type,max(item_outlet_sales) as `Max_sales` from grocery
group by item_type;

-- 40.	WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_OUTLET_SALES BY ITEM_TYPE
select item_type,min(item_outlet_sales) as `Min_sales` from grocery
group by item_type;

-- 41.	WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_OUTLET_SALES BY OUTLET_ESTABLISHMENT_YEAR
select outlet_establishment_year,min(item_outlet_sales) as `Min_sales` from grocery
group by outlet_establishment_year;

-- 42.	WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_OUTLET_SALES BY OUTLET_ESTABLISHMENT_YEAR AND ORDER IT BY DESCENDING ORDER
select outlet_establishment_year,max(item_outlet_sales) as `Max_sales` from grocery
group by outlet_establishment_year
order by max_sales desc;

-- 43.	WRITE AN SQL QUERY TO SHOW AVERAGE ITEM_OUTLET_SALES BY OUTLET_SIZE AND ORDER IT IT DESCENDING ORDER
select outlet_size,avg(item_outlet_sales) as `Avg_sales` from grocery
where outlet_size <> ''
group by outlet_size
order by Avg_sales desc;

-- 44.	WRITE AN SQL QUERY TO SHOW AVERAGE ITEM_OUTLET_SALES BY OUTLET_TYPE
select outlet_type,round(avg(item_outlet_sales),2) as `Avg_sales` from grocery
group by outlet_type;

-- 45.	WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_OUTLET_SALES BY OUTLET_TYPE 
select outlet_type,max(item_outlet_sales) as `Max_sales` from grocery
group by outlet_type;

-- 46.	WRITE AN SQL QUERY TO SHOW TOTAL ITEM_OUTLET_SALES BY ITEM_TYPE
select item_type,round(sum(item_outlet_sales),2) as `Total_sales` from grocery
group by item_type;

-- 47.	WRITE AN SQL QUERY TO SHOW TOTAL ITEM_OUTLET_SALES BY ITEM_FAT_CONTENT
select item_fat_content,round(sum(item_outlet_sales),2) as `Total_sales` from grocery
group by item_fat_content;

-- 48.	WRITE AN SQL QUERY TO SHOW MAXIMUM ITEM_VISIBILITY BY ITEM_TYPE
select item_type,max(item_visibility) as `Max_visibility` from grocery
group by item_type;

-- 49.	WRITE AN SQL QUERY TO SHOW MINIMUM ITEM_VISIBILITY BY ITEM_TYPE
select item_type,min(item_visibility) as `Min_visibility` from grocery
group by item_type;

-- 50.	WRITE AN SQL QUERY TO SHOW TOTAL ITEM_OUTLET_SALES BY ITEM_TYPE BUT ONLY WHERE OUTLET_LOCATION_TYPE IS TIER 1 
select item_type,round(sum(item_outlet_sales),2) as `Total_sales` from grocery
where outlet_location_type = "tier 1"
group by item_type;

-- 51.	WRITE AN SQL QUERY TO SHOW TOTAL ITEM_OUTLET_SALES BY ITEM_TYPE WHERE ITEM_FAT_CONTENT IS ONLY LOW FAT & LF
select item_type,round(sum(item_outlet_sales),2) as `Total_sales` from grocery
where item_fat_content in ("low fat","lf")
group by item_type;


