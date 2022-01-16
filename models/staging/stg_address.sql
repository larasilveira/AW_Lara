with address as (
    select
        addressid,
        countryregion,
        stateprovince,
        city
    from {{ source('booming-entity-337621', 'address') }}
)

select *
from address