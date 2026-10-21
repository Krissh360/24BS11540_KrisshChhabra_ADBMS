/*Write a query to find the dishes which cost more than the average cost of all the dishes at the restaurant. The output should have the columns f_name, f_cost, and f_type.*/

select f_name, f_cost, f_type
from food
where f_cost > (
    select avg(f_cost) from food
)