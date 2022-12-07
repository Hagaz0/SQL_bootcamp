COMMENT ON TABLE person_discounts
    IS 'Таблица содержит данные о персональной скидке для клиентов в разных пиццериях';
COMMENT ON column person_discounts.id is 'Уникальный ID';
COMMENT ON column person_discounts.person_id is 'ID клиента для кого предоставляется скидка';
COMMENT ON column person_discounts.pizzeria_id is 'ID пиццерии в которой предоставляется скидка';
COMMENT ON column person_discounts.discount is 'Размер скидки в %';