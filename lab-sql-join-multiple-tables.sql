use sakila;

-- Query 1
select s.store_id, a.address_id, c.city_id, cr.country_id from store as s
join address as a
using(address_id)
join city as c
using(city_id)
join country as cr
using(country_id);

-- Query 2
select s.store_id, sum(p.amount) from staff as s
join payment as p
using(staff_id)
group by s.store_id;

-- Query 3
select c.category_id, c.name, avg(f.length) from category as c
join film_category as fc
using(category_id)
join film as f
using(film_id)
group by c.category_id;

-- Query 4
select c.category_id, c.name, max(f.length) as maximum from category as c
join film_category as fc
using(category_id)
join film as f
using(film_id)
group by c.category_id;

-- Query 5
select f.title, count(r.rental_id) as count from film as f
join inventory as i
using(film_id)
join rental as r
using(inventory_id)
group by f.title
order by count desc;

-- Query 6
select fc.category_id, c.name, sum(p.amount) as sum from category as c
join film_category as fc
using(category_id)
join film as f
using(film_id)
join inventory as i
using(film_id)
join rental as r
using(inventory_id)
join payment as p
using(customer_id)
group by fc.category_id
order by sum desc
limit 5;

-- Query 7
select i.store_id, f.title, r.rental_date, r.return_date from film as f
join inventory as i
using(film_id)
join rental as r
using(inventory_id)
where f.title = 'ACADEMY DINOSAUR' and i.store_id = 1