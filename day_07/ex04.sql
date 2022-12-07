with count_by_name as (
select p.name, count(person_visits.visit_date) as count_of_visits
    from person_visits
    join person p on p.id = person_visits.person_id
    group by p.name)
select *
from count_by_name
where count_of_visits > 3;