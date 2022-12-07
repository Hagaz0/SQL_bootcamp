select distinct menu.id as menu_id
from menu
where menu.id not in (select distinct menu_id
                      from person_order)
order by 1;