select pizza_name, pizzeria.name as pizzeria_name, price
from menu
join pizzeria on pizzeria.id = menu.pizzeria_id
where pizza_name in ('mushroom pizza', 'pepperoni pizza')
order by 1, 2