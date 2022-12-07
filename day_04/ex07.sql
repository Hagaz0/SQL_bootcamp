insert into person_visits (id, person_id, pizzeria_id, visit_date)
select (select max(id) + 1 from person_visits) as id,
       (select id from person where name = 'Dmitriy') as person_id,
       5,
       '2022-01-08';

insert into person_order (id, person_id, menu_id, order_date)
select (select max(id) + 1 from person_order) as id,
       (select id from person where name = 'Dmitriy') as person_id,
       16,
       '2022-01-08';

refresh materialized view mv_dmitriy_visits_and_eats;