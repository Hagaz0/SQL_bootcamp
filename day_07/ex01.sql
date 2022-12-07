with top4 as (
    select p.name, count(person_visits.visit_date) as count_of_visits
    from person_visits
    join person p on p.id = person_visits.person_id
    group by p.name
    order by count_of_visits desc
    limit 4)

select *
from top4
order by 2 desc, 1;