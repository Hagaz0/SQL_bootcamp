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
             , dense_rank() over (order by t.total_cost)       as min_rank
             , dense_rank() over (order by t.total_cost desc) as max_rank
          from total_routes t
       ) tt
 where tt.min_rank = 1 or tt.max_rank = 1
 order by tt.total_cost, tt.total_route;