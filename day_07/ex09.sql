select address,
       round(((max(age) - (min(age) / max(age)::float))::numeric), 2) as formula,
       round(avg(age), 2) as average,
       (case
           when round(((max(age) - (min(age) / max(age)::float))::numeric), 2) > round(avg(age)::numeric, 2)
               then true
           else false end) as comparsion
from person
group by address
order by 1;