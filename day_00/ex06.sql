select (select person.name
        from person
        where person.id = person_order.person_id) as name,
       (case
            when (select person.name
                  from person
                  where person.id = person_order.person_id) = 'Denis' then 'true'
            else 'false' end)                     as check_name
from person_order
where (person_order.menu_id = 13 or person_order.menu_id = 14 or
       person_order.menu_id = 18)
  and person_order.order_date = '2022-01-07';
