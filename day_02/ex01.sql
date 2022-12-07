select *
from (select table1 as missing_date
      from (select table1::date from generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS table1) as t
               left join (select * from person_visits where person_id = 1 or person_id = 2) as "pv*"
                         on table1 = visit_date
      where visit_date is null) "tp*md"
order by 1;
