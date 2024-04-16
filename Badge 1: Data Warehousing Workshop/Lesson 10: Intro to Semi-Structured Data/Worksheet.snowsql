USE LIBRARY_CARD_CATALOG;

// Create an Ingestion Table for JSON Data
CREATE TABLE LIBRARY_CARD_CATALOG.PUBLIC.AUTHOR_INGEST_JSON
(
  RAW_AUTHOR VARIANT
);

//Create File Format for JSON Data
CREATE FILE FORMAT LIBRARY_CARD_CATALOG.PUBLIC.JSON_FILE_FORMAT
TYPE = 'JSON'
COMPRESSION = 'AUTO'
ENABLE_OCTAL = FALSE
ALLOW_DUPLICATE = FALSE
STRIP_OUTER_ARRAY = TRUE
STRIP_NULL_VALUES = FALSE
IGNORE_UTF8_ERRORS = FALSE;

copy into library_card_catalog.public.author_ingest_json
from @util_db.public.like_a_window_into_an_s3_bucket/author_with_header.json
file_format = (format_name = LIBRARY_CARD_CATALOG.PUBLIC.JSON_FILE_FORMAT);

select * from library_card_catalog.public.author_ingest_json;

//returns AUTHOR_UID value from top-level object's attribute
select raw_author:AUTHOR_UID
from author_ingest_json;

//returns the data in a way that makes it look like a normalized table
SELECT
 raw_author:AUTHOR_UID
,raw_author:FIRST_NAME::STRING as FIRST_NAME
,raw_author:MIDDLE_NAME::STRING as MIDDLE_NAME
,raw_author:LAST_NAME::STRING as LAST_NAME
FROM AUTHOR_INGEST_JSON;

use util_db;

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
  SELECT 'DWW16' as step
  ,( select row_count
    from LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES
    where table_name = 'AUTHOR_INGEST_JSON') as actual
  ,6 as expected
  ,'Check number of rows' as description
 );