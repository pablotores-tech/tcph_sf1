with customers as (

    select *

    from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.customer

)

select * from customers