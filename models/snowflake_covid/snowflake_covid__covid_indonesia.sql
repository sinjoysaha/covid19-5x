with source_covid_data as (
    select * from {{ source('fivetran_interview_db', 'covid_19_indonesia_sinjoy_saha') }} 
),

final as (
    select CAST(DATE AS date) as DATE, COUNTRY, LOCATION_LEVEL, PROVINCE, LOCATION_ISO_CODE, LATITUDE, LONGITUDE, 
    TOTAL_CASES, TOTAL_DEATHS, TOTAL_RECOVERED, TOTAL_ACTIVE_CASES,
    NEW_CASES, NEW_DEATHS, NEW_RECOVERED, NEW_ACTIVE_CASES,
    TOTAL_CASES_PER_MILLION, TOTAL_DEATHS_PER_MILLION,
    NEW_CASES_PER_MILLION, NEW_DEATHS_PER_MILLION,
    CASE_FATALITY_RATE, CASE_RECOVERED_RATE, 
    GROWTH_FACTOR_OF_NEW_CASES, GROWTH_FACTOR_OF_NEW_DEATHS,
    POPULATION 
    
    from source_covid_data
)

select * from final