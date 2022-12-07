select name
from (select distinct p.name as name, count(m.pizza_name) as pizza
      from person_order
               join menu m on m.id = person_order.menu_id
               join person p on person_order.person_id = p.id
      where (pizza_name = 'pepperoni pizza' or pizza_name = 'cheese pizza')
        and p.gender = 'female'
      group by name) x
where pizza = 2
order by 1;
