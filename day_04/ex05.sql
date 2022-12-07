create view v_price_with_discount as
    select person.name as name, menu.pizza_name as pizza_name,
       menu.price as price, (price - price * 0.1)::int as discount_price
    from person
    join person_order on person.id = person_order.person_id
    join menu on menu.id = person_order.menu_id
    order by 1, 2;