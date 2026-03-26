select *
from  {{ ref('stg_tpch_sf1__part') }}
where
    part_id < 0 or
    part_size < 0 or
    part_retail_price < 0


