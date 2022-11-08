with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),

payment_orders as (
    select
        order_id,
        sum(amount) as amount
    from payments
    group by order_id
),


final as (

    select
        orders.customer_id,
        orders.order_id,
        payment_orders.amount
    from orders

    left join payment_orders using (order_id)

)

select * from final