with sales as (
    select
        purchaseordernumber,
        salesorderid,
        billtoaddressid,
        salesordernumber,
        cast(modifieddate as date) as modifieddate,
        rowguid,
        taxamt,
        shiptoaddressid,
        onlineorderflag,
        shipmethod,
        status,
        cast(orderdate as date) as orderdate,
        subtotal,
        revisionnumber,
        freight,
        cast(duedate as date) as duedate,
        totaldue,
        customerid,
        cast(shipdate as date) as shipdate,
        accountnumber
    from {{ source('booming-entity-337621', 'salesorderheader') }}
)

select *
from sales