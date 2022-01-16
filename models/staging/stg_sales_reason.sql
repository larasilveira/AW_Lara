with sales_reason as (
    select
        salesreasonid,
        reasontype,
        name as reason_name
    from {{ source('booming-entity-337621', 'salesreason') }}
)

select *
from sales_reason