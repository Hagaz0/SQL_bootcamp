with favorite_by_visits as (select pizzeria.name, count(pv.visit_date), 'visit' as action_type
                            from pizzeria
                            join person_visits pv on pizzeria.id = pv.pizzeria_id
                            group by pizzeria.name
                            order by 2 desc
                            limit 3),
    favorite_by_orders as (select pizzeria.name, count(po.order_date), 'order' as action_type
                            from pizzeria
                            join menu m on pizzeria.id = m.pizzeria_id
                            join person_order po on m.id = po.menu_id
                            group by pizzeria.name
                            order by 2 desc
                            limit 3)
select *
from favorite_by_orders
union all
select *
from favorite_by_visits
order by 3, 2 desc;