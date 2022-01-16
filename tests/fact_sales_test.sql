with orders as (
    select *
    from {{ ref('fact_sales') }}
),

teste as (
    select
        count(distinct productid) as produtos
    from orders
    where salesorderid = 71774
)

select *
from teste
where produtos != 2