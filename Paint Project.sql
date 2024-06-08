# Project Paint Data 

# create databse  Paint 

create database Paint;

# use database
use Paint;

# show tables

show tables;

# Retrieve the full name of artists along with the names of the museums where their works are displayed.

select artist.full_name, museum.name
from artist
join work on artist.artist_id = work.artist_id
join museum on work.museum_id = museum.museum_id;

#GROUP BY AND COUNT
# How many works does each artist have in the database? Display the artist's 
# full name along with the count of their works, ordered by the count in descending order.

select artist.full_name, count(work.work_id) as work_count
from artist
left join work on artist.artist_id = work.artist_id
group by artist.artist_id, artist.full_name
order by work_count desc;

# ORDER BY AND LIMIT
#List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select museum.name, count(work.work_id) as work_count
from museum
left join  work on museum.museum_id = work.museum_id
group by  museum.museum_id, museum.name
order by work_count desc
limit 5;

# JOIN, ORDER BY AND LIMIT
#Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.

select work.name, work.style, museum.name as museum_name
from work
join museum on work.museum_id = museum.museum_id
order by museum.name asc
limit 10;
# JOIN, GROUP BY AND SUM
# ) Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

select artist.full_name, count(work.work_id) as work_count
from artist
left join work on artist.artist_id = work.artist_id
group by artist.artist_id, artist.full_name
order by work_count desc;

#JOIN, GROUP BY AND HAVING
#List artists who have more than 3 works in the database, along with the count of their works

select max(artist.full_name) AS full_name, count(work.work_id) as work_count
from artist
join work on artist.artist_id = work.artist_id
group by artist.artist_id
having work_count > 3;

#JOIN, WHERE AND ORDER BY 
#Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price.

Select work.name, artist.full_name
from work
join artist on work.artist_id = artist.artist_id
join product_size on work.work_id = product_size.work_id
where product_size.sale_price < product_size.regular_price;

#JOIN, GROUP AND AVERAGE 
#Calculate the average height and width of the artworks in the database. Display the average height and width.

select avg(canvas_size.height) as avg_height, 
avg(canvas_size.width) as avg_width
from canvas_size;

#JOIN, GROUP BY AND MAX 
# Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

# JOIN, GROUP BY AND CONCATENATE
# Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

SELECT CONCAT(artist.first_name, ' ', artist.last_name, ', ', artist.nationality) AS artist_info, COUNT(work.work_id) AS work_count 
FROM artist 
JOIN work ON artist.artist_id = work.artist_id 
GROUP BY artist.artist_id, artist.first_name, artist.last_name, artist.nationality 
ORDER BY work_count DESC;


