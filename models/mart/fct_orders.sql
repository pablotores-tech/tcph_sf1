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

    c.customer_market_segment,
    c.customer_nation,
    c.customer_region,
    
    avg(order_total_price) over(partition by order_customer_id) as avg_customer_price,
    avg(order_total_price) over(partition by customer_nation) as avg_nation_price,
    avg(order_total_price) over(partition by customer_market_segment) as avg_market_segment_price


from orders o
    join customer c on o.order_customer_id = c.customer_id
    join time t on t.date_day = order_date