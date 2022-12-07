select order_date, concat(person.name, ' (age:', person.age, ')') as person_information
from (select order_date, person_id as id
      from person_order) as odi
         natural join person
order by order_date, person_information;