with sales as (
    select *
    from {{ source('booming-entity-337621', 'salesorderheader') }}
)

select *
from sales