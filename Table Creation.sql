create database customer_behavior;

use customer_behavior;

create table customer_sales(
	customer_id int,
    age int,
    gender varchar(50),
    item_purchased varchar(200),
    category varchar(150),
    purchase_amount int,
    location varchar(100),
    size varchar(100),
    color varchar(100),
    season varchar(200),
    review_rating decimal(10,1),
    subscription_status varchar(100),
    shipping_type varchar(150),
    discount_applied varchar(150),
    previous_purchases int,
    payment_method varchar(100),
    frequency_of_purchases varchar(150),
    age_group varchar(100),
    Purchase_frequency_days int
);

