select pizzeria.name, pizzeria.rating
from person_visits
         right join pizzeria on pizzeria_id = pizzeria.id
where visit_date is null;
