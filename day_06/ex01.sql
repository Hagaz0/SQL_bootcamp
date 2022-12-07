with person_with_dicsount as (select row_number() over () as id, person_id, pizzeria_id,
                                     case
                                         when (count(pizzeria_id) = 1) then 10.5
                                         when (count(pizzeria_id) = 2) then 22
                                         else 30
                                         end as discount
                              from (select person_id, pizzeria_id
                                    from person_order
                                        join menu m on m.id = person_order.menu_id                                    where exists(select person_order.order_date                                                 from person_order)) as person_has_orders
                              group by person_id, pizzeria_id)
insert into person_discounts (id, person_id, pizzeria_id, discount) table person_with_dicsount;