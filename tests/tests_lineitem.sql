select *
from  {{ ref('stg_tpch_sf1__lineitem') }}
where
    line_order_id < 0 or
    line_part_id < 0 or
    line_supplier_id < 0 or
    line_number < 0 or
    line_quantity < 0 or
    line_extended_price < 0 or
    line_discount < 0 or
    line_tax < 0 or
    line_discount < 0