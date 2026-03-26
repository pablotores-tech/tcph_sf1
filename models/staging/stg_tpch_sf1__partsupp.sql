with 

source as (

    select * from {{ source('tpch_sf1', 'partsupp') }}

),

partsupp as (

    select
        ps_partkey  as partsupp_part_id,
        ps_suppkey  as partsupp_supplier_id,
        ps_availqty  as partsupp_available_quantity,
        ps_supplycost  as partsupp_supply_cost,
        ps_comment  as partsupp_comment

    from source

)

select * from partsupp