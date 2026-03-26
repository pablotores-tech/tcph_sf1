with 

source as (

    select * from {{ source('tpch_sf1', 'lineitem') }}

),

lineitem as (

    select
        l_orderkey as line_order_id,
        l_partkey as line_part_id,
        l_suppkey as line_supplier_id,
        l_linenumber as line_number,
        l_quantity as line_quantity,
        l_extendedprice as line_extended_price,
        l_discount as line_discount,
        l_tax as line_tax,
        l_returnflag as line_return_flag,
        l_linestatus as line_status,
        l_shipdate as line_ship_date,
        l_commitdate as line_commit_date,
        l_receiptdate as line_receipt_date,
        l_shipinstruct as line_ship_instruct,
        l_shipmode as line_ship_mode,
        l_comment as line_comment

    from source

)

select * from lineitem