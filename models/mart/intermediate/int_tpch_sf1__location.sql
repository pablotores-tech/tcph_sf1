with
nation as (
    select * from {{ ref("stg_tpch_sf1__nation") }}
),

region as (
    select * from {{ ref("stg_tpch_sf1__region")}}
)

select 
    nation_id,
    nation_name,
    region_name
from nation join region on nation.nation_region = region.region_id