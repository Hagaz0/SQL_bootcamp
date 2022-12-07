CREATE SEQUENCE seq_person_discounts
    INCREMENT 1
    MINVALUE 1
    START 1;
select setval('seq_person_discounts',  (SELECT count(*) FROM person_discounts));
ALTER TABLE ONLY person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts'::regclass);
