with only_male as (select distinct p.name as pizzeria_name
                   from person_order
                            join menu m on m.id = person_order.menu_id
                            join pizzeria p on m.pizzeria_id = p.id
                            join person p2 on person_order.person_id = p2.id
                   where p2.gender = 'male'),
     only_female as (select distinct p.name as pizzeria_name
                     from person_order
                              join menu m on m.id = person_order.menu_id
                              join pizzeria p on m.pizzeria_id = p.id
                              join person p2 on person_order.person_id = p2.id
                     where p2.gender = 'female')

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

