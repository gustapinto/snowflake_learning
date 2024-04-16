list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET;

list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/this_;

list @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/THIS_;

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DWW10' as step
  ,( select count(*)
    from UTIL_DB.INFORMATION_SCHEMA.stages
    where stage_url='s3://uni-lab-files'
    and stage_type='External Named') as actual
  , 1 as expected
  , 'External stage created' as description
 );

 create or replace table vegetable_details_soil_type
( plant_name varchar(25)
 ,soil_type number(1,0)
);

copy into vegetable_details_soil_type
from @util_db.public.like_a_window_into_an_s3_bucket
files = ( 'VEG_NAME_TO_SOIL_TYPE_PIPE.txt')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.PIPECOLSEP_ONEHEADROW );

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
  SELECT 'DWW11' as step
  ,( select row_count
    from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES
    where table_name = 'VEGETABLE_DETAILS_SOIL_TYPE') as actual
  , 42 as expected
  , 'Veg Det Soil Type Count' as description
 );

 create or replace file format garden_plants.veggies.L8_CHALLENGE_FF
 type = csv
 field_delimiter =  '\t'
 skip_header = 1;

 create or replace table garden_plants.veggies.LU_SOIL_TYPE(
SOIL_TYPE_ID number,
SOIL_TYPE varchar(15),
SOIL_DESCRIPTION varchar(75)
 );

 copy into garden_plants.veggies.LU_SOIL_TYPE
 from @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/LU_SOIL_TYPE.tsv
 file_format = (format_name = garden_plants.veggies.L8_CHALLENGE_FF);

 create or replace table garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT (
    plant_name varchar(100),
    UOM varchar(1),
    Low_End_of_Range INTEGER,
    High_End_of_Range INTEGER
);

copy into garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT
from @LIKE_A_WINDOW_INTO_AN_S3_BUCKET/veg_plant_height.csv
file_format = (format_name = garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW);

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
      SELECT 'DWW12' as step
      ,( select row_count
        from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES
        where table_name = 'VEGETABLE_DETAILS_PLANT_HEIGHT') as actual
      , 41 as expected
      , 'Veg Detail Plant Height Count' as description
);

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
     SELECT 'DWW13' as step
     ,( select row_count
       from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES
       where table_name = 'LU_SOIL_TYPE') as actual
     , 8 as expected
     ,'Soil Type Look Up Table' as description
);

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
     SELECT 'DWW14' as step
     ,( select count(*)
       from GARDEN_PLANTS.INFORMATION_SCHEMA.FILE_FORMATS
       where FILE_FORMAT_NAME='L8_CHALLENGE_FF'
       and FIELD_DELIMITER = '\t') as actual
     , 1 as expected
     ,'Challenge File Format Created' as description
);

create or replace external function util_db.public.greeting(
      email varchar
    , firstname varchar
    , middlename varchar
    , lastname varchar)
returns variant
api_integration = dora_api_integration
context_headers = (current_timestamp,current_account, current_statement,current_account_name)
as 'https://awy6hshxy4.execute-api.us-west-2.amazonaws.com/dev/edu_dora/greeting'
;

select util_db.public.greeting('ghp2201@gmail.com', 'Gustavo', 'Henrique', 'Pinto');
