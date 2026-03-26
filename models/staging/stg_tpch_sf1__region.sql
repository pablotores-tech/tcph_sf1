with 

source as (

    select * from {{ source('tpch_sf1', 'region') }}

),

region as (

    select
        r_regionkey as region_id,
        r_name as region_name,
        r_comment as region_comment

    from source

)

select * from region