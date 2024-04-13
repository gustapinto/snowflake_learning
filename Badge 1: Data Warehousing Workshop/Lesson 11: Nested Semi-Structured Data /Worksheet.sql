// Create an Ingestion Table for the NESTED JSON Data
CREATE OR REPLACE TABLE LIBRARY_CARD_CATALOG.PUBLIC.NESTED_INGEST_JSON
(
    "RAW_NESTED_BOOK" VARIANT
);

copy into library_card_catalog.public.NESTED_INGEST_JSON
from @util_db.public.like_a_window_into_an_s3_bucket/json_book_author_nested.txt
file_format = (format_name = LIBRARY_CARD_CATALOG.PUBLIC.JSON_FILE_FORMAT);

//a few simple queries
SELECT RAW_NESTED_BOOK
FROM library_card_catalog.public.NESTED_INGEST_JSON;

SELECT RAW_NESTED_BOOK:year_published
FROM library_card_catalog.public.NESTED_INGEST_JSON;

SELECT RAW_NESTED_BOOK:authors
FROM library_card_catalog.public.NESTED_INGEST_JSON;

//Use these example flatten commands to explore flattening the nested book and author data
SELECT value:first_name
FROM library_card_catalog.public.NESTED_INGEST_JSON
,LATERAL FLATTEN(input => RAW_NESTED_BOOK:authors);

SELECT value:first_name
FROM library_card_catalog.public.NESTED_INGEST_JSON
,table(flatten(RAW_NESTED_BOOK:authors));

//Add a CAST command to the fields returned
SELECT value:first_name::VARCHAR, value:last_name::VARCHAR
FROM library_card_catalog.public.NESTED_INGEST_JSON
,LATERAL FLATTEN(input => RAW_NESTED_BOOK:authors);

//Assign new column  names to the columns using "AS"
SELECT value:first_name::VARCHAR AS FIRST_NM
, value:last_name::VARCHAR AS LAST_NM
FROM library_card_catalog.public.NESTED_INGEST_JSON
,LATERAL FLATTEN(input => RAW_NESTED_BOOK:authors);
