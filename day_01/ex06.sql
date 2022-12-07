select action_date, person.name as person_name
from (select order_date as action_date, person_id as person_name
      from person_order
      intersect
      select visit_date as action_date, person_id as person_name
      from person_visits) as date
         join person on person.id = date.person_name
order by action_date, person_name desc;