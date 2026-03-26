with 

source as (

    select * from {{ source('tpch_sf1', 'part') }}

),

part as (

    select
        p_partkey as part_id,
        p_name as part_name,
        substring(p_mfgr,14,1) as part_manufacturer,
        substring(p_brand,7,2) as part_brand,
        p_type as part_type,
        p_size as part_size,
        p_container as part_container,
        p_retailprice as part_retail_price,
        p_comment as part_comment

    from source

)

select * from part