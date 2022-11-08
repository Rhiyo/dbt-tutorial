with payments as (

    select
        orderid as order_id,
        amount
    from dbt-tutorial.stripe.payment

)

select * from payments