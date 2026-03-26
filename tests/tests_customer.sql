select *
from  {{ ref('stg_tpch_sf1__customer') }}
where
    customer_id < 0