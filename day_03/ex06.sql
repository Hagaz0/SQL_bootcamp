with a as (select pizza_name, pizzeria.name as pizzeria_name_1, price, pizzeria.id as id
           from menu
                    join pizzeria on menu.pizzeria_id = pizzeria.id)

select distinct a.pizza_name as pizza_name, a.pizzeria_name_1, pizzeria.name as pizzeria_name_2, a.price as price
from a
         join menu on a.price = menu.price
         join pizzeria on pizzeria.id = menu.pizzeria_id
where a.pizza_name = menu.pizza_name
  and a.pizzeria_name_1 != pizzeria.name
  and a.id < pizzeria.id
order by 1, 2, 3