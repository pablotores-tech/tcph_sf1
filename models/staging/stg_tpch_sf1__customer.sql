with

    source as (
        select * from {{ source("tpch_sf1", "customer") }}
        ),

    customer as (

        select
            c_custkey as customer_id,
            substring(c_name, 11, 8) as customer_name,
            c_address as customer_address,
            c_nationkey as customer_nation,
            replace(c_phone, '-', '') as customer_phone,
            c_acctbal as customer_account_balance,
            c_mktsegment as customer_market_segment,
            c_comment as customer_comment

        from source

    )

select *
from
    customer