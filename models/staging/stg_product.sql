with products as (
    select
        productid,
        name as product_name,
        productcategoryid
    from {{ source('booming-entity-337621', 'product') }}
)

select *
from products