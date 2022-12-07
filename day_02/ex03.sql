with x as (SELECT table1 AS missing_date
      FROM (SELECT table1::date FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS table1) as t
               LEFT JOIN (SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2) as "pv*"
                         ON table1 = visit_date
      WHERE visit_date IS NULL)

select *
from  x
order by 1;