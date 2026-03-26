with
orders as (
    select * from {{ ref("stg_tpch_sf1__orders") }}
),
customer as (
    select * from {{ ref("dim_customer") }}

),
time as (
    select * from {{ ref("dim_time") }}
)

select
    o.order_id,
    o.order_customer_id,
    o.order_status,
    o.order_total_price,
    o.order_date,
    o.order_priority,
    o.order_clerk,
    o.order_ship_priority,
    c.customer_market_segment,
    c.customer_nation,
    c.customer_region
from orders o
    join customer c on o.order_customer_id = c.customer_id
    join time t on t.date_day = order_date