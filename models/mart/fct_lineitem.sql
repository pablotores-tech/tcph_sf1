with
lineitem as (
    select * from {{ ref("stg_tpch_sf1__lineitem") }}
),
parts_supplied as (
    select * from {{ ref("dim_parts_supplied") }}
),
time as (
    select * from {{ ref("dim_time") }}
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
    ps.supply_cost

from lineitem li
    join parts_supplied ps on ps.part_id = li.line_part_id and ps.supplier_id = li.line_supplier_id
    join time t on t.date_day = line_ship_date or  t.date_day = line_commit_date or  t.date_day = line_receipt_date