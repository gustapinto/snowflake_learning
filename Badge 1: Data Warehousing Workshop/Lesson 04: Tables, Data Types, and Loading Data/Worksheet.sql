USE WAREHOUSE COMPUTE_WH;

create or replace table garden_plants.veggies.root_depth (
   root_depth_id number(1),
   root_depth_code text(1),
   root_depth_name text(7),
   unit_of_measure text(2),
   range_min number(2),
   range_max number(2)
);

insert into garden_plants.veggies.root_depth (
    root_depth_id,
    root_depth_code,
    root_depth_name,
    unit_of_measure,
    range_min,
    range_max
)
values (
    1,
    'S',
    'Shallow',
    'cm',
    30,
    45
);

select
    *
from
    garden_plants.veggies.root_depth
limit 1;

insert into garden_plants.veggies.root_depth (
    root_depth_id,
    root_depth_code,
    root_depth_name,
    unit_of_measure,
    range_min,
    range_max
)
values (
    2,
    'M',
    'Medium',
    'cm',
    45,
    60
), (
    3,
    'D',
    'Deep',
    'cm',
    60,
    90
);