-- which actors have the first name 'scarlett'
select  first_name, last_name
from actor
where first_name = 'scarlett';

-- which actors have the last name 'johansson'
select first_name, last_name
from actor
where last_name = 'johansson';

-- how many distinct actors last name are there
select distinct last_name, count(last_name)
from actor
group by last_name;
-- which last names are not repeated
select distinct last_name,count(last_name) as 'not repeated'
from actor
group by last_name
having count(last_name) ='1'
order by count(last_name);

-- which last names appear more than once
select last_name,count(last_name) as 'repeated'
from actor
group by last_name
having count(last_name) >'1'
order by count(last_name);

-- which actor has appeared in most films

select a.first_name,a.last_name, count(fa.actor_id) as 'film count'
from actor as a 
inner join film_actor as fa on a.actor_id=fa.actor_id
group by a.actor_id
order by count(a.actor_id) desc;

-- is academy dinosaur available for rent in store 1
select *
from film as f
inner join inventory as i on f.film_id=i.inventory_id
inner join rental as r on r.inventory_id=i.inventory_id
where title='academy dinosaur' and store_id='1';
-- OR
select title,film_id,inventory_id,store_id
from inventory join film using (film_id) join store using(store_id)
where title= 'academy dinosaur' and store_id='1';

-- what is the average running time of all movies in the sakila database?
select round(avg(length))
from film;

-- what is the average running time of film by category
select name, round(avg(length))
from film as f
inner join film_category as fc on f.film_id=fc.film_id
inner join category as c on c.category_id=fc.category_id
group by c.name
order by round(avg(length)) desc;

-- display the first name and last name of all actors from the table actor
select first_name, last_name
from actor;

-- display the first name and last name of all actors in a single column in upper case letters. name the column actor name.
select upper (concat(first_name,' ',last_name)) as 'Actor name'
from actor;

-- you need to find the id number , first name, last name of an actor, of whom you know only the first name, 'joe'. what is one query would you use to obtain this information.
select actor_id, first_name, last_name
from actor
where first_name='joe';

-- find all actors whose last name contain the letter GEN
select first_name, last_name
from actor
where last_name like '%gen%';

-- find all actors whose last names contain the letter LI. this time, order the rows by last name and first name in that order
select last_name, first_name
from actor
where last_name like '%LI%'
order by last_name,first_name;

-- using IN, display the country id and country columns of the following countries; afghanistan,bangladesh,china.
select country,country_id
from country
where country in ('afghanistan','bangladesh','china');

-- list the last names of actors, as well as how many actors have that last name
select last_name, count(last_name) as  'actors with same last name'
from actor
group by last_name;

--  list last names of actors and the number of actors who have the last name but only for names that are shared by at least two actors.
select last_name, count(last_name)
from actor
group by last_name
having count(last_name) >'2'
order by count(last_name) desc;


