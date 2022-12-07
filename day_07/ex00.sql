select person_visits.person_id, count(person_visits.visit_date) as count_of_visits
    from person_visits
group by person_id
order by 2 desc, 1;