select a.name as person_name1, person.name as person_name2, a.address as common_address
from (select name, address, id
from person) as a
join person on a.address = person.address
where a.name != person.name and person.id < a.id
order by 1, 2, 3;