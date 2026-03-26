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
    ps.supply_cost,

    avg(line_tax) over(partition by supplier_nation) as avg_nation_tax,
    avg(part_retail_price) over(partition by part_id) as avg_part_retail_price,
    sum(line_quantity) over(partition by line_number) as sum_line_quantity,
    sum(line_extended_price) over (partition by line_number) as sum_line_price,
    (line_extended_price*(1-line_discount)) as disc_price,
    (line_extended_price*(1-line_discount)*(1+line_tax)) as charge
from lineitem li
    join parts_supplied ps on ps.part_id = li.line_part_id and ps.supplier_id = li.line_supplier_id
    join time t on t.date_day = line_ship_date or  t.date_day = line_commit_date or  t.date_day = line_receipt_date