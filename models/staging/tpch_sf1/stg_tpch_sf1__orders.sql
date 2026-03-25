with 

source as (

    select * from {{ source('tpch_sf1', 'orders') }}

),

orders as (

    select
        o_orderkey as order_id,
        o_custkey as order_customer,
        o_orderstatus as order_order_status,
        o_totalprice as order_total_price,
        o_orderdate as order_date,
        o_orderpriority as order_priority,
        o_clerk as order_clerk,
        o_shippriority as order_ship_priority,
        o_comment as order_comment

    from source

)

select * from orders