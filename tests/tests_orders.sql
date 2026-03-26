select *
from  {{ ref('stg_tpch_sf1__orders') }}
where
    order_id < 0 or
    order_customer_id < 0 or
    order_total_price < 0 or
    order_clerk < 0


