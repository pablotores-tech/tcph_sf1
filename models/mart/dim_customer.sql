with
customer as (
    select * from {{ ref("stg_tpch_sf1__customer") }}
),
location as (
    select * from {{ ref("int_tpch_sf1__location") }}

)

select
    customer_id,
    --customer_name,
    customer_market_segment,
    l.nation_name as customer_nation,
    l.region_name as customer_region
from customer c
    join location l on c.customer_nation = l.nation_id