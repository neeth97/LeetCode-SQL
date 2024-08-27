(select Users.name as results
from Users
join MovieRating on Users.user_id = MovieRating.user_id
group by Users.user_id
order by count(*) desc, Users.name
limit 1)

union all

(select Movies.title as results
from Movies
join MovieRating on Movies.movie_id = MovieRating.movie_id
where month(MovieRating.created_at) = 2 and year(MovieRating.created_at) = 2020
group by Movies.movie_id
order by avg(rating) desc, Movies.title
limit 1);
