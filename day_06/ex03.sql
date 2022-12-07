create unique index idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

set enable_seqscan = off;

explain analyze select *
from person_discounts
where discount = 30 and pizzeria_id = 1;