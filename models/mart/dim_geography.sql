with
geography as (
    select * from {{ ref("int_tpch_sf1__geography") }}

)

select * from geography
