select *
from  {{ ref('stg_tpch_sf1__partsupp') }}
where
    partsupp_part_id < 0 or
    partsupp_supplier_id < 0 or 
    partsupp_available_quantity < 0 or 
    partsupp_supplier_id < 0