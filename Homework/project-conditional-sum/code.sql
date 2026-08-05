/* Write a query to find the sum of prices of the dishes fall under the category 'Non veg' across the Cuisine.
The output table should have the types of Cuisines and the sum of prices of the 'Non veg' dishes(mentioned under the column 'category') in each of them. Alias the sum function as 'Non_Veg_Price' */

select cuisine,
sum (case when category = 'Non veg' then price else 0 end)
as Non_Veg_Price
from Orders
GROUP BY cuisine;