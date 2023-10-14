--which menu is the best seller
SELECT 
SUM(total_amount) || '$' total_selling_amount,
Menu.dish_name
from Invoice
JOIN Menu
on Invoice.menu_id = menu.menu_id
GROUP by dish_name 
ORDER by total_selling_amount desc;

--common table expression
--Who has spend the most 
create view if not EXISTS top_customers as
  with sub1 as ( 
    SELECT * from Invoice
    join Customer
    on Invoice.customer_id = Customer.customer_id
    ), sub2 AS (
     SELECT *
    from Menu
    JOIN Ingredient
    ON Menu.ingredient_id = Ingredient.ingredient_id
     )

  SELECT 
      sub1.name,
      sub2.dish_name,
      sub1.quantity as quantity,
      sub1.total_amount || '$' as total_amount 
  FROM sub1
  JOIN sub2
  ON sub1.menu_id = sub2.menu_id
  ORDER by sub1.total_amount desc;

SELECT * FROM top_customers;
