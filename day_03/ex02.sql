select menu.pizza_name as pizza_name, price, pizzeria.name as pizzeria_name
from menu
         join pizzeria on pizzeria.id = menu.pizzeria_id
         join (select distinct menu.id as menu_id
               from menu
               where menu.id not in (select distinct menu_id
                                     from person_order)) as t1 on menu.id = t1.menu_id
order by 1, 2;