select menu.pizza_name          as pizza_name,
       menu.price               as price,
       pizzeria.name            as pizzeria_name,
       person_visits.visit_date as visit_date
from menu
         join pizzeria on menu.pizzeria_id = pizzeria.id
         join person_visits on pizzeria.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where (price between 800 and 1000)
  and person.name = 'Kate'
order by 1, 2, 3;