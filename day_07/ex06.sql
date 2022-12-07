select pizzeria.name, count(po.order_date) as count_of_orders,
       round(avg(m.price), 2) as average_price,
       round(max(m.price), 2) as max_price,
       round(min(m.price), 2) as min_price
from pizzeria
    join menu m on pizzeria.id = m.pizzeria_id
    join person_order po on m.id = po.menu_id
group by pizzeria.name
order by 1;