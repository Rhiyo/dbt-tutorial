with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),

payment_orders as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by order_id
),


final as (

    select
        orders.customer_id,
        orders.order_id,
        orders.order_date,
        coalesce(payment_orders.amount, 0) as amount
    from orders

    left join payment_orders using (order_id)

)

select * from final