with order_details as (
    select *
    from {{ source('booming-entity-337621', 'salesorderdetail') }}
)

select *
from order_details