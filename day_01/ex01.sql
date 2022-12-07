select *
from(select person.name
     from person
     order by person.name) as object_name
union all
select *
from(select menu.pizza_name
     from menu
     order by menu.pizza_name
    ) as object_name;