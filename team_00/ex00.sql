create table route (
    point1 varchar(255),
    point2 varchar(255),
    cost int
);

insert into route
values ('a','b',10),
       ('b','a',10),
       ('b','c',35),
       ('c','b',35),
       ('a','c',15),
       ('c','a',15),
       ('a','d',20),
       ('d','a',20),
       ('b','d',25),
       ('d','b',25),
       ('d','c',30),
       ('c','d',30);

with total_routes as (
    select coalesce(r1.cost, 0) + coalesce(r2.cost, 0) + coalesce(r3.cost, 0) + coalesce(r4.cost, 0)   as total_cost
         , concat('{', r1.point1, ',', r1.point2, ',', r2.point2, ',', r3.point2, ',', r4.point2, '}') as total_route
      from route r1
     inner join route r2 on r2.point1 = r1.point2 and r2.point2 <> r1.point1
     inner join route r3 on r3.point1 = r2.point2 and r3.point2 <> r2.point1 
     inner join route r4 on r4.point1 = r3.point2 and r4.point2 <> r3.point1 
     where r1.point1 = 'a' and r3.point2 <> 'a' and r4.point2 = 'a'
)
select tt.total_cost  as total_cost
     , tt.total_route as tour
  from (
        select t.total_cost
             , t.total_route
             , dense_rank() over (order by t.total_cost) as rank
          from total_routes t
       ) tt
 where tt.rank = 1
 order by tt.total_cost, tt.total_route;
