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

orderaddress as (
    select
        addressid,
        countryregion,
        stateprovince,
        city
    from {{ ref('dim_address') }}
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
        oa.countryregion,
        oa.stateprovince,
        oa.city,
        od.productid,
        od.orderqty,
        od.unitprice,
        sum(od.linetotal - (od.unitpricediscount*orderqty)) as liquid_value
    from orders o
    left join order_details od on o.salesorderid = od.salesorderid
    left join orderaddress oa on o.shiptoaddressid = oa.addressid
    group by 
        o.salesorderid,
        o.customerid,
        o.shiptoaddressid,
        o.onlineorderflag,
        o.status,
        o.orderdate,
        o.subtotal,
        o.freight,
        oa.countryregion,
        oa.stateprovince,
        oa.city,
        od.productid,
        od.orderqty,
        od.unitprice
)

select *
from orders_joined