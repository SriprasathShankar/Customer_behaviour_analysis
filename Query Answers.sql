use customer_behavior;

SELECT * FROM customer_behavior.customer_sales;

select 
gender,
sum(purchase_amount) as revenue_amount
from customer_sales
group by gender;

select
customer_id,
purchase_amount
from customer_sales
where discount_applied = "Yes" and purchase_amount >= (select avg(purchase_amount) from customer_sales);


select
item_purchased,
round(avg(review_rating)) as Average_review_rating
from customer_sales
group by item_purchased
order by avg(review_rating) desc 
limit 5;

select
shipping_type,
round(avg(purchase_amount),2)
from customer_sales
where shipping_type in ('Standard','Express')
group by shipping_type;

select
subscription_status, 
count(customer_id) as total_customer,
round(avg(purchase_amount),2) as average_spent,
sum(purchase_amount) as Total_revenue
from customer_sales
group by subscription_status
order by Total_revenue,average_spent desc;

select
item_purchased,
round(sum(case 
	when discount_applied = 'Yes' then 1
    else 0 
    end) /count(*) * 100,2) as discount_rate
from customer_sales
group by item_purchased
order by discount_rate desc
limit 5;

with customer_type as (
select
customer_id,
purchase_amount,
case
	when previous_purchases = 1 then 'New'
    when previous_purchases between 2 and 10 then 'Retuening'
    else 'Loyal'
end as custumer_segment
from customer_sales
) 

select 
custumer_segment,
count(*) as total_customer
from customer_type
group by custumer_segment;

with item_counts as (
select 
category,
item_purchased,
count(customer_id) as total_orders,
row_number() over(partition by category order by count(customer_id) desc) as item_rank
from customer_sales
group by category,item_purchased
)

select
item_rank,
category,
item_purchased,
total_orders
from item_counts
where item_rank <=3;

select
subscription_status,
count(customer_id) as repeat_buyers
from customer_sales
where previous_purchases > 5
group by subscription_status;

select
age_group,
sum(purchase_amount) as revenu
from customer_sales 
group by age_group
order by revenu desc;