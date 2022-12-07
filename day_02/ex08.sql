select person.name
from person
         join person_order on person.id = person_order.person_id
         join menu on menu.id = person_order.menu_id
where address in ('Moscow', 'Samara')
  and (gender = 'male')
  and (menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
    or (menu.pizza_name = 'pepperoni pizza' and menu.pizza_name = 'mushroom pizza'))
order by name desc;