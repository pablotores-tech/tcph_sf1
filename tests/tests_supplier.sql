select *
from  {{ ref('stg_tpch_sf1__supplier') }}
where
    supplier_id < 0 or
    supplier_nation < 0

