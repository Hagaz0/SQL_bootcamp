select p.name, m.pizza_name, m.price,
       m.price * (1 - d.discount::float/100) as discount_price,
       z.name as pizzeria_name
from person_order o
    inner join menu m on m.id = o.menu_id
    inner join pizzeria z on z.id = m.pizzeria_id
    inner join person p on p.id = o.person_id
    inner join person_discounts d on d.person_id = p.id and d.pizzeria_id = z.id
order by name, pizza_name;