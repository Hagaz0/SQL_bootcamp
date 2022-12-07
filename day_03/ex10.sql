insert into person_order (id, person_id, menu_id, order_date)
select (select max(person_order.id) + 1 from person_order), (select person.id from person where name = 'Denis'), (select menu.id from menu where pizza_name = 'sicilian pizza'), '2022-02-24'::date
union
select (select max(person_order.id) + 2 from person_order), (select person.id from person where name = 'Irina'), (select menu.id from menu where pizza_name = 'sicilian pizza'), '2022-02-24'::date
