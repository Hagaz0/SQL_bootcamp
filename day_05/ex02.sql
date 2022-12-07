create index idx_person_name on person ((upper(name)));

set enable_seqscan to off;
set enable_indexscan to on;

explain analyze select upper(name)
from person
where upper(name) = 'ANDREY';