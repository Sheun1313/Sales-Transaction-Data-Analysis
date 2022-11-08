
--   Sales Transaction Data Analysis

--PROJECT REQUIREMENTS

--1.The Organization is planning to gift the best performing manager who made the best sales and want to know the region which the manager belongs to?


select rm.manager, rm.region, max(st.sales)Sales
from sales_transact st
left join
regional_manager rm
on st.region = rm.region
group by 
	rm.manager, rm.region
order by sales desc

-- Best performing manager: Sam 
-- Region : Atlantic
-- Sales : 89061.05


--2. How many times was delivery truck used as the ship mode?


select ship_mode, count(ship_mode)Nos_of_Delivery
from sales_transact 
where ship_mode = 'Delivery Truck'
group by ship_mode

-- Delivery Truck was used 1146 times


--3. How many orders were returned, and which product category got rejected the most?


select st.product_category, ri.order_status, COUNT(ri.Order_Status)Rejection_count
from returned_items ri
left join sales_transact st 
on ri.sales_id = st.sales_id
where Order_status = 'Returned'
group by st.product_category, ri.order_status
order by Rejection_count desc

-- Office Suppies got Rejected the most (461)


-- 4. Which Year did the company incurred the least shipping cost?

select shipping_cost, ship_date from sales_transact order by shipping_cost 

-- The least shipping cost (0.49) was incurred in 2009, 2010, 2011, 2012


-- 5. Display the day of the week in which customer segment has the most sales?

select top 3 datename(weekday,realorderdate)day_of_week, max(sales)Top_Sales 
from sales_transact 
group by sales, datename(weekday,realorderdate)
order by sales desc

-- Customer segment had most sales on a SATURDAY


-- 6. The company want to determine its profitability by knowing the actual orders that were delivered.

select * from sales_transact
select * from returned_items

select ri.order_id, ri.order_status, sum(st.profit )Profit
from returned_items ri
left join sales_transact st
on ri.order_id = st.order_id
where order_status = 'Delivered'
group by ri.order_id, ri.order_status
order by Profit desc