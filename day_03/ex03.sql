with only_male as (select pizzeria.name as pizzeria_name
                   from pizzeria
                            join person_visits on pizzeria.id = person_visits.pizzeria_id
                            join person on person_visits.person_id = person.id
                   where gender = 'male'),
     only_female as (select pizzeria.name as pizzeria_name
                     from pizzeria
                              join person_visits on pizzeria.id = person_visits.pizzeria_id
                              join person on person_visits.person_id = person.id
                     where gender = 'female')

    (select *
     from only_male
     except all
     select *
     from only_female)
union
(select *
 from only_female
 except all
 select *
 from only_male)

order by 1;
