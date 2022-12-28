                
create database mavenmovies;
use mavenmovies;

 #|1|.Write a SQL query to count the number of characters except the spaces for each actor.
      #Return first 10 actors name length along with their name.
 #Query:
 select * from actor;
 select concat(first_name,' ',last_name) as Actorname,
 char_length(concat(first_name,'',last_name)) as Namelength from actor limit 10;
         
#******************************************************************************************************************************************#
 #|2|.List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names
 #Query:
 select * from actor_award;
 select concat(first_name,' ',last_name) as Actornames,Awards,
 char_length(concat(first_name,' ',last_name)) as Namelength from actor_award where awards = 'oscar';

#******************************************************************************************************************************************#
 #|3|.Find the actors who have acted in the film ‘Frost Head’.
 #Query:
 select * from film;
 select * from actor;
 select * from film_actor;
 select concat(first_name,' ',last_name) as Actornames ,(title) as Film from actor inner join
 film_actor on actor.actor_id=film_actor.actor_id
 inner join film on film_actor.film_id=film.film_id where title ='frost head';
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-OR-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
 
 select concat(a.first_name,' ',a.last_name) as Actornames, (b.title) as Film from actor a
 inner join film_actor f on a.actor_id=f.actor_id 
 inner join film b on f.film_id=b.film_id where title ='frost head'; 
 
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-OR-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 
 select concat(first_name,' ',last_name) as Actornames ,(Title) as Film from actor
 inner join film_actor using (actor_id) inner join film 
 using(film_id) where title ='frost head';
 
 #*****************************************************************************************************************************************#
 #|4|.Pull all the films acted by the actor ‘Will Wilson’.
 #Query:
 select * from actor;
 select * from film;
 select * from film_actor;
 select concat(a.first_name,' ',a.last_name) as Actorname,(Title) as Films from actor a 
 inner join film_actor f on a.actor_id=f.actor_id 
 inner join film b on f.film_id=b.film_id 
 where first_name ='will'and last_name='wilson'; 
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-OR-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 
 select concat(first_name,' ',last_name) as Actorname ,(Title) as Films from actor 
 inner join film_actor on actor.actor_id=film_actor.actor_id
 inner join film on film_actor.film_id=film.film_id
 where first_name ='will' and last_name='wilson';
 
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-OR-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 
 select concat(first_name,' ',last_name) as Actorname ,(Title) as Films  from actor
 inner join film_actor using (actor_id) inner join film 
 using(film_id) where first_name='will' and last_name='wilson';
 
 #*****************************************************************************************************************************************#
 #|5|.Pull all the films which were rented and return in the month of May
 #Query
 select * from film;
 select * from rental;
 select * from inventory;
 select (Title) as Films,rental_date,monthname(rental_date) Rental_month,monthname(return_date) Return_month
 from film inner join inventory on film.film_id=inventory.film_id inner join
 rental on rental.inventory_id=inventory.inventory_id where rental_date and return_date
 between '2005-05-01' and '2005-05-31' order by title asc; 
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-OR-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 
 select distinct(Title) as Films,monthname(rental_date) Rental_month,monthname(return_date) Return_month
 from film inner join inventory on film.film_id=inventory.film_id inner join
 rental on rental.inventory_id=inventory.inventory_id where rental_date  and return_date 
 between '2005-05-01' and '2005-05-31' order by title asc; 
 
 #*****************************************************************************************************************************************#
 #|6|.Pull all the films with ‘Comedy’ category.
 #Query:
 select * from category;
 select * from film_category;
 select * from film;
 select distinct(title) as Films,(Name) as Category from film
 inner join film_category on film.film_id=film_category.film_id
 inner join category on film_category.category_id=category.category_id where name LIKE 'comedy'; 

#----------------------------------------------------------=>THANK YOU<=-----------------------------------------------------------------#
