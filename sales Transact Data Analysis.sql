--1. The Organization is planning to gift the best performing manager who made the best sales and want to know the region which the manager belongs to?

select top 1 rm.Manager, rm.region, s.sales
from sales s
left join regional_manager rm
on s.region = rm.region
order by s.sales desc

-- ANSWER:
-- Best Performing Manager: Sam
-- Region: Atlantic

--2.how many times was delivery truck used as the ship mode?


select ship_mode, count(ship_mode)Nos_of_Delivery from sales where ship_mode = 'Delivery Truck' group by ship_mode

-- ANSWER: 1146


--3. How many orders were returned, and which product category got rejected the most?


select Order_Status, count(Order_id)Nos_of_returned_orders from returned_items where Order_Status = 'Returned' group by Order_Status

-- ANSWER : 872 Orders were returned

select s.product_category, ri.order_status, count(s.product_category)Nos_of_rejections
from sales s
left join returned_items ri
on s.sales_id = ri.sales_id
where Order_Status = 'Returned'
group by s.product_category, ri.order_status
order by Nos_of_rejections desc

-- ANSWER : Office Suppies got Rejected the most (461)


-- 4. Which Year did the company incurred the least shipping cost?

select min(shipping_cost),year(ship_date) from sales group by year(ship_date) order by year(ship_date) 


-- ANSWER: The least shipping cost (0.49) was incurred in 2009, 2010, 2011, 2012


--5 Display the day of the week in which customer segment has the most sales?

select top 3 customer_segment, datename(weekday, realorderdate)weekday, realorderdate, max(sales)Max_Sales from sales 
group by customer_segment, datename(weekday, realorderdate), realorderdate
order by max_sales desc

--ANSWER: Customer segment had most sales on a SATURDAY (2009-03-21)


--6. The company want to determine its profitability by knowing the actual orders that were delivered.

select count(distinct Order_id)Nos_of_orders_delivered from returned_items where Order_Status = 'delivered'

-- Answer: 4924 Orders were delivered


--7. The Organization is eager to know the customer names and persons born in 2011?


select First_Name, last_name, year(Birth_Date)Birth_Year from sales where year(Birth_Date) = '2011'

--Answer: No customer was born in 2011


--8. what are the aggregate orders made by all the customers?

select count(distinct order_id)Total_Orders from sales

--Aggregate Orders: 5496


--9. The company intends to discontinue any product that brings in the least profit, you are required to help the organization to determine the product?

select top 4 product_sub_category, sum(profit)Total_Profit from sales 
group by product_sub_category
order by Total_Profit

--Answer: The organisation should discontinue:
/*	Tables
	Bookcases
	Scissors, Rulers and Trimmers
	Rubber Bands*/

--10. what are the top 2 best selling items that the company should keep selling?
 
select Top 2 product_sub_category, sum(Sales)Total_Sales from sales 
group by product_sub_category
order by Total_Sales desc

--Answer: Top 2 best selling items:
-- Office Machines
-- Tables