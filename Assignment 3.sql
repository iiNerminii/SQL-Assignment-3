--1. List all customers who live in Texas (use JOINs)

select *
from address
full join customer
on address.address_id  = customer.address_id
where district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name

select first_name, last_name, amount, count(amount)
from customer
inner join payment
on payment.customer_id = customer.customer_id 
where amount > 6.99
group by first_name, last_name, amount

--3. Show all customers names who have made payments over $175(use subqueries)

select first_name, last_name, amount
from customer
inner join payment
on payment.customer_id = customer.customer_id 
where amount > 175.00

--4. List all customers that live in Nepal (use the city table)
select *
from country 
full join city 
on city.country_id = country.country_id 
full join address
on address.city_id = city.city_id
full join customer
on customer.address_id = address.address_id 
where country = 'Nepal'

--5. Which staff member had the most transactions?

select first_name, last_name, staff.staff_id, count(payment.amount)
from staff 
left join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id 

--6. How many movies of each rating are there?

select rating, count(rating) 
from film
group by film.rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select first_name, last_name, amount, count(amount)
from customer
inner join payment
on payment.customer_id = customer.customer_id 
where amount > 6.99 
group by first_name, last_name, amount
having count(amount) = 1 

--8. How many free rentals did our stores give away?


select *, count(amount)
from payment
full join rental 
on rental.rental_id = payment.rental_id 
group by payment.payment_id, rental.rental_id 
having amount = 0
