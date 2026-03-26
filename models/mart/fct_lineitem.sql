with
lineitem as (
    select * from {{ ref("stg_tpch_sf1__lineitem") }}
),
parts_supplied as (
    select * from {{ ref("dim_parts_supplied") }}
),

orders as (
    select * from {{ ref("dim_orders") }}
)

select
    line_order_id,
    line_part_id,
    line_supplier_id,
    line_number,
    line_quantity,
    line_extended_price,
    line_discount,
    line_tax,
    line_return_flag,
    line_status,
    line_ship_date,
    line_commit_date,
    line_receipt_date,
    line_ship_instruct,
    line_ship_mode,

    ps.part_name,
    ps.part_manufacturer,
    ps.part_type,
    ps.part_size,
    ps.part_container,
    ps.part_retail_price,
    ps.supplier_name,
    ps.supplier_account_balance,
    ps.supplier_nation,
    ps.supplier_region,
    ps.available_quantity,
    ps.supply_cost,

    o.order_customer_id,
    o.order_status,
    o.order_total_price,
    o.order_date,
    o.order_priority,
    o.order_clerk,
    o.order_ship_priority,
    o.customer_market_segment,
    o.customer_nation,
    o.customer_region

from lineitem li
    join parts_supplied ps on ps.part_id = li.line_part_id and ps.supplier_id = li.line_supplier_id
    join orders o on o.order_id = li.line_order_id