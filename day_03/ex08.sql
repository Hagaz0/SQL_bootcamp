insert into menu (id, pizzeria_id, pizza_name, price)
select (select max(menu.id) + 1 from menu) as id
        ,
       (select id
        from pizzeria
        where name = 'Dominos'),
       'sicilian pizza',
       900;