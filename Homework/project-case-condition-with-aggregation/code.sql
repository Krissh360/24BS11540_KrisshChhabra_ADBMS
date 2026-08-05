/* The final output table should have the price grouped(Aliased as Pay_Category) as above and the count of the dishes falling in the respective category. */

select
(case WHEN Price > 18 then 'High'
WHEN Price BETWEEN 10 and 18 then 'Medium'
WHEN Price < 10 then 'Low' else 'NA' end) as Pay_Category,
COUNT(*) as Dish_count 
FROM Orders
GROUP BY 1;