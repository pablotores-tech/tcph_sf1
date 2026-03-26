with
customer as (
    select * from {{ ref("stg_tpch_sf1__customer") }}
),
location as (
    select * from {{ ref("int_tpch_sf1__location") }}

)

select * from customer
