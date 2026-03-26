with
parts as (
    select * from {{ ref("stg_tpch_sf1__part") }}
),

supplier as (
    select * from {{ ref("stg_tpch_sf1__supplier")}}
),

partsupp as (
    select * from {{ ref("stg_tpch_sf1__partsupp")}}
)

select 
    p.part_id,
    s.supplier_id,

    p.part_name,
    p.part_manufacturer,
    --p.part_brand, same info as part name
    p.part_type,
    p.part_size,
    p.part_container,
    p.part_retail_price,

    s.supplier_name,
    s.supplier_nation,
    s.supplier_account_balance,

    ps.partsupp_available_quantity  as available_quantity,
    ps.partsupp_supply_cost  as supply_cost


from partsupp ps
    join parts p on ps.partsupp_part_id = p.part_id
    join supplier s on ps.partsupp_supplier_id = s.supplier_id