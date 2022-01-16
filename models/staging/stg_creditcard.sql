with credit_card as (
    select
        creditcardid,
        cardtype
    from {{ source('booming-entity-337621', 'creditcard') }}
)

select *
from credit_card