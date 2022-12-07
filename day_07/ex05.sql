select person.name
from person
where exists(select person_order.order_date
from person_order)
order by 1;