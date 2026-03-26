with
parts_supplied as (
    select * from {{ ref("int_tpch_sf1__parts_supplied") }}
),
location as (
    select * from {{ ref("int_tpch_sf1__location") }}

)

select
    ps.part_id,
    ps.supplier_id,

    ps.part_name,
    ps.part_manufacturer,
    --p.part_brand, same info as part name
    ps.part_type,
    ps.part_size,
    ps.part_container,
    ps.part_retail_price,

    ps.supplier_name,
    ps.supplier_account_balance,
    l.nation_name as supplier_nation,
    l.region_name as supplier_region,
    
    ps.available_quantity,
    ps.supply_cost


from parts_supplied as ps
    join location as l on ps.supplier_nation = l.nation_id

