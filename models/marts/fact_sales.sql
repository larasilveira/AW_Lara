{{
    config(
        materialized = 'table'
    )
}}

with orders as (
    select * 
    from {{ ref('stg_sales_header') }}
),

order_details as (
    select *
    from {{ ref('stg_order_detail') }}
),

orders_joined as (
    select
        o.salesorderid,
        o.customerid,
        o.shiptoaddressid,
        o.onlineorderflag,
        o.status,
        o.orderdate,
        o.subtotal,
        o.freight,
        od.productid,
        od.orderqty,
        od.unitprice,
        sum(od.linetotal - (od.unitpricediscount*orderqty)) as liquid_value
    from orders o
    left join order_details od on o.salesorderid = od.salesorderid
    group by 
        o.salesorderid,
        o.customerid,
        o.shiptoaddressid,
        o.onlineorderflag,
        o.status,
        o.orderdate,
        o.subtotal,
        o.freight,
        od.productid,
        od.orderqty,
        od.unitprice
)

select *
from orders_joined