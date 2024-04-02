
# Walmart Sales Data Analysis
This project analyzes Walmart Sales data from 45 stores to understand top-performing branches, sales trends, and customer behavior, aiming to optimize sales strategies and resource allocation. 



## Pupose of The Project
The purpose of this project is to optimize sales strategies and resource allocation within Walmart stores using historical sales data analysis.
## About
This project seeks to delve into the Walmart Sales dataset sourced from the Kaggle Walmart Sales Forecasting Competition. The primary objective is to gain insights into the performance of various branches and products, discern sales trends across different product categories, and analyze customer behavior patterns. The ultimate goal is to devise strategies for enhancing and optimizing sales performance.

The dataset encompasses historical sales data from 45 Walmart stores situated in diverse regions. Each store comprises numerous departments, and the task at hand involves projecting sales figures for each department within every store. Complicating matters further, the dataset includes designated holiday markdown events. While these markdowns are acknowledged to impact sales, accurately predicting their influence on specific departments and the magnitude of their effect presents a significant challenge.
## About Data
The dataset, sourced from the Kaggle Walmart Sales Forecasting Competition, consists of sales transactions from three distinct Walmart branches situated in Mandalay, Yangon, and Naypyitaw, featuring 17 columns and 1000 rows of data.






| Column  | Description      | Data Type              |
| :-------- | :------- | :------------------------- |
| invoice_id | Invoice of the sales made | VARCHAR(50)|
|Branch    |Branch at which sales were made|VARCHA(5)|
|city|The location of the branch|VARCHAR(30)|
|customer_type|The type of the customer|VARCHAR(30)|
|gender|Gender of the customer making purchase|VARCHAR(10)|
|product_line|Product line of the product solf|VARCHAR(100)|
|unit_price|The price of each product|DECIMAL(10, 2)|
|quantity|The amount of the product sold|INT|
|VAT|The amount of tax on the purchase|	FLOAT(6, 4)|
|total|The total cost of the purchase|DECIMAL(10, 2)|
|date|	The date on which the purchase was made|DATE|
|time|The time at which the purchase was made|	TIMESTAMP|
|payment_method|The total amount paid|DECIMAL(10, 2)|
|cogs|Cost Of Goods sold|	DECIMAL(10, 2)|
|gross_margin_percentage|	Gross margin percentage	|FLOAT(11, 9)|
|gross_income	|Gross Income	|DECIMAL(10, 2)|
|rating|	Rating|	FLOAT(2, 1)







## Analysis


  1)  Product Analysis

    Product analysis entails assessing sales performance, market trends, and customer preferences to optimize product strategy.

  2) Customer Analysis

    Sales analysis involves examining sales data to identify trends, patterns, and performance metrics to inform strategic decision-making and improve sales strategies.

  3) Sales Analysis

    Customer analysis entails scrutinizing customer data to gain insights into demographics, behaviors, preferences, and purchasing patterns to tailor marketing strategies and enhance customer satisfaction.










## Approach Used



- Data Wrangling :- Data wrangling involves the initial inspection of data to identify and handle missing or NULL values through various replacement methods, ensuring data quality and integrity for further analysis.


- Feature Engineering: This will help use generate some new columns from existing ones.


## Business Questions To Answers 

Generic Quetions

      1. How many unique cities does the data have?
      2. In which city is each branch?



Product

      1. How many unique product lines does the data have?
      2. What is the most common payment method?
      3. What is the most selling product line?
      4. What month had the largest COGS?
      5. What is the total revenue by month?
      6. What product line had the largest revenue?
      7. What is the city with the largest revenue?
      8. What product line had the largest VAT?
      9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
      10.Which branch sold more products than average product sold?
      11.What is the most common product line by gender?
      12.What is the average rating of each product line?

Sales 
      
      1. Number of sales made in each time of the day per weekday
      2. Which of the customer types brings the most revenue?
      3. Which city has the largest tax percent/ VAT (Value Added Tax)?
      4. Which customer type pays the most in VAT?

Customer

      1. How many unique customer types does the data have?
      2. How many unique payment methods does the data have?
      3. What is the most common customer type?
      4. Which customer type buys the most?
      5. What is the gender of most of the customers?
      6. What is the gender distribution per branch?
      7. Which time of the day do customers give most ratings?
      8. Which time of the day do customers give most ratings per branch?
      9. Which day fo the week has the best avg ratings?
      10.Which day of the week has the best average ratings per branch?




