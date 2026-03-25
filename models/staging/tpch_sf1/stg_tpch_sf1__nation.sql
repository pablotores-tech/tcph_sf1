with 

source as (

    select * from {{ source('tpch_sf1', 'nation') }}

),

nation as (

    select
        n_nationkey as nation_id,
        n_name as nation_name,
        n_regionkey as nation_region,
        n_comment as nation_comment

    from source

)

select * from nation