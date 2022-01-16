with customer as (
    select
        customerid, 
        firstname,
        lastname,
        companyname
    from {{ source('booming-entity-337621', 'customer') }}
)

select *
from customer