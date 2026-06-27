Use pharma_sales_20_25;
-- 1. Revenue per Region 
Select region,
Sum(Revenue) As Total_Revenue,
sum(units_sold) as Total_sale
from pharmacy_sales
group by region
Order by Total_revenue DESC, Total_sale Desc;

-- 2. Revenue per medicine per region
select region, medicine,
sum(revenue) as Revenue,
dense_rank() over (partition by region order by sum(revenue) desc) as Rnk
from pharmacy_sales
group by region, medicine;

-- 3. Top 3 medicine per Category
select category, medicine, revenue
from
(select category, medicine, 
sum(revenue) as revenue, 
row_number() over( partition by category order by sum(revenue) Desc) as rnk
from pharmacy_sales 
group by category, medicine) t
where rnk<=3;

-- 4. Supply crisis Countries
Select country, medicine,
min(stock_level) as min_stock
from Pharmacy_sales
group by country, medicine
having min_stock<500
order by min_stock;

-- 5. Expiry red flag (stock_level>2000, expiry_days_remaining<100)
Select region, medicine,
max(stock_level) as High_stock,
min(expiry_days_remaining) as Expirydays_alert
from pharmacy_sales
group by region, medicine
having high_stock>2000 and expirydays_alert<100
order by region,medicine;

-- 6.  Revenue driving Age group
select category, age_group,
sum(revenue) as Revenue
from pharmacy_sales
group by category, age_group
order by revenue desc;

-- 7.  Covid comparison
select category, covid_flag,
sum(revenue) as Revenue
from pharmacy_sales
group by category, covid_flag
order by revenue desc;

-- 8. Yearly Revenue
select year,
sum(revenue) as Revenue
from pharmacy_sales
group by Year
order by revenue desc;

-- 9. YoY Growth
select  YEAR,
sum(revenue) as Revenue,
lag(sum(revenue))over (order by year) as prev_rev,
((sum(revenue)-lag(sum(revenue))over (order by year))/
lag(sum(revenue))over (order by year)*100) as YoY_Growth
from pharmacy_sales
group by YEAR;

-- 10. COVID Impact on Antipyretics & Vitamins
select category, covid_flag,
sum(units_sold) as Unit_sold
from pharmacy_sales
where category in ('antipyretic', 'vitamins')
group by category, covid_flag;

-- 11. Chronic Revenue by Age
select category, age_group,
sum(revenue) as revenue
from pharmacy_sales
where category='chronic'
group by category, age_group
order by revenue desc;

-- 12. Seasonality drive
select month,category, region,  
sum(units_sold) as Units_sold
from Pharmacy_sales
where category in ('Cough_Cold','Antibiotic')
group by month,category, region 
order by category,units_sold desc;

-- 13. Worst Inventory Health Country (stock_level < 200 AND expiry_days_remaining < 90)
select country,
min(stock_level) as Stock_level,
min(expiry_days_remaining) as Expiry_days
from pharmacy_sales
group by country
having stock_level<=200 and Expiry_days<=90;