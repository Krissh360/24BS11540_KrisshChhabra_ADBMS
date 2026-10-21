/* Write a query to do the following. Try and use the concept of sub-queries.
- You need to output details of the dish - 'f_name', 'f_cost' and 'f_type' ONLY if the following condition is satisfied
- Average rating of the dish is greater than or equal to 4 */ 

select f_name, f_cost, f_type
from food
where f_id IN (
  select f_id
  from ratings
  group by f_id
  having avg(f_rating) >= 4
)