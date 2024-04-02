create database walmart_analysis;

CREATE TABLE IF NOT EXISTS sales_data(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- data cleaning
select * from sales_data;

-- Add the time_of_day column
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales_data;

ALTER TABLE sales_data ADD COLUMN time_of_day VARCHAR(20);

-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE sales_data
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

select * from sales_data;

-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales_data;

alter table sales_data 
add column  day_name varchar(50); 

-- update value in column
update sales_data
set day_name = DAYNAME(date);



-- Add ,month_name column
select date,
       monthname(date)
       from sales_data;
       
alter table sales_data
add column month_name varchar(10);

       
update sales_data
set month_name = monthname(date);
       

select* from sales_data;

-- -----------------------------------------------------------------
--          GENERIC ---------------------

-- Unique cities
select DISTINCT city from sales_data;

-- In which city is each branch?
select DISTINCT city,branch from sales_data;

-- ------------------ PRODUCT----------------------

-- how many Unique product lines does the data have?
select DISTINCT Product_line from sales_data;

-- Most selling Product_line
select 
       sum(quantity) as qty, 
       Product_line  
from sales_data
GROUP BY Product_line
ORDER BY qty desc;

-- Total Revenue by month
select month_name as Month,
       sum(total) as Total_Revenue from sales_data
group by month_name
order by total_revenue;
	
-- What month have largest cogs
select month_name as Month,
       sum(total) as Total_Revenue from sales_data
group by month_name
order by total_revenue desc;

-- What is the city with largest revenue
select branch,city ,sum(total) as total_revenue from sales_data
group by city ,branch
order by total_revenue desc;

-- what product_line has the largest VAT
select product_line, avg(tax_pct) as avg_tax from sales_data
group by product_line
order by avg_tax;

-- Fetch each product line and add a column  to those product;
-- line showing "Good","Bad". good if its greater than average sales

select avg(quantity) as avg_qnty from sales_data;

select product_line,
       case
          when avg(quantity) > 5 then "Good"
          else "Bad"
          END AS remark
          from sales_data
          group by  product_line;
          
          
-- which branch sold more products than avrage product sold?

select branch, sum(quantity) as qnty from sales_data
group by branch 
having sum(quantity) > (select avg(quantity) from sales_data);

-- what is most common product line by gender

select gender, product_line , count(gender) as total_count from sales_data 
group by gender , product_line
order by total_count desc;

-- avergae rating of each product_line
select round(avg(rating), 2) as avg_rating, product_line from sales_data
group by product_line
order by avg_rating desc;


-- -----------------------------------------------------------
-- ---------------------------CUSTOMERS ---------------------------------
-- Unique customers types 

select * from sales_data;
select DISTINCT customer_type from sales_data;

-- most common customer_tye

select customer_type, count(*) as count from sales_data
group by customer_type
order by count desc;

-- which customers_type buys the most 
select customer_type, count(*) from sales_data
group by customer_type;

-- what is the gender of most of the customer_type
select gender ,count(*) as gender_cnt from sales_data
group by gender
order by gender_cnt desc;

-- what is the gender dsitribution per branch 
select branch ,gender, count(*) as gender_cnt from sales_data
where branch in ("C", "B", "A")   -- WHERE branch = "c" this indivisual query is also work 
group by branch , gender
order by gender_cnt;

--  Gender per branch is more or less the same hence, I don't think has
-- an effect of the sales per branch and other factors.

-- which time of day customers give most ratings

select time_of_day, avg(rating) as avg_rating from sales_data
group by time_of_day
order by avg_rating desc;

-- looks like time of day does not really  affect the ratings
-- its more or less the same rating each time of day


-- -- whcih time of day customers give most ratings per branch ?
select time_of_day, branch ,avg(rating)as avg_rating from sales_data
where branch in ("A" and "B" AND "C")
group by time_of_day
order by avg_rating desc;

-- BRANCH A AND C are doing well in ratings,branch b needs to
-- be a little more to get better ratings. 


-- whcih day of week has the best avg_rating?
select day_name, avg(rating) as avg_rating from sales_data
group by day_name
order by avg_rating desc;

-- Mon,tue,friday are the top best days  for good ratings.
-- why is that the case, how many sales are made on these day

select day_name , avg(Total) as avg_sales from sales_data
group by day_name 
order by avg_sales;

-- which day of the week hs the best average ratings per branch 
select branch ,day_name, count(day_name) total_sales from sales_data
where branch in("C" AND "A" AND "B")
GROUP BY DAY_NAME
order by total_sales;


-- -------------------------------------------------------------
-- ------------------------------SALES ---------------------------

-- Number of sales made in each time of day per weekly 
select time_of_day, count(*) as total_sales from sales_data
where day_name = "Sunday"
group by time_of_day
order by total_sales desc;

-- Evenings experience most sales, the stores are 
-- filled during the evening hours

-- whcih of the customer_types brings the most revenue?
select customer_type,sum(total) as total_revenue from sales_data
group by customer_type
order by total_revenue;

-- which city has the largest tax/VAT percent?
select city, round(avg(tax_pct),2) as avg_tax_pct from sales_data
group by city
order by avg_tax_pct desc;

-- which customer_type paysbthe most in VAT?
select customer_type, avg(tax_pct) as total_tax from sales_data
group by customer_type
order by total_tax;













          
