-- SELECT tablename FROM pg_tables WHERE schemaname = 'public'

-- Select id, "first_name", "last_name" from actors 
-- WHere first_name ILIKE 'John%'
-- LIMIT 100
-- OFFSET 0;

-- select kiri.id AS ai, kiri.name, kanan.genre from movies kiri
-- JOIN movies_genres kanan ON kanan.movie_id = kiri.id
-- Limit 10;

-- SELECT movies.id, movies.name, movies_genres.genre
-- FROM movies
-- LEFT JOIN movies_genres
--     ON movies.id = movies_genres.movie_id
-- LIMIT 10;

-- SELECT actors.id AS Actor, actors.first_name, actors.last_name, roles.role, movies.name AS Movies
-- FROM actors 
-- LEFT JOIN roles
--     ON actors.id = roles.actor_id
-- LEFT JOIN movies
--     ON roles.movie_id = movies.id;
-- LIMIT 100;


-- Constraint
-- CREATE TABLE users_serial (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(100) NOT NULL
-- )

-- CREATE TABLE user_identity (
--     id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(100) not null
-- )

-- CREATE TABLE categories (
--     id INTEGER GENERATED AlWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(100) NOT NULL UNIQUE
-- );

-- CREATE TABLE products(
--     id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     price NUMERIC(12, 2) NOT NULL CHECK(price > 0),
--     category_id INTEGER NOT NULL REFERENCES categories(id)
-- )

INSERT INTO categories (name)
VALUES ('Sendal');

-- INSERT INTO products(name, price, category_id)
-- VALUES('Sneaker', 150000, 1)
-- select * from products












-- ==========================================================
-- INSERT INTO actors (id, first_name, last_name, gender)
-- SELECT
--     id,
--     (ARRAY[
--         -- Index 1-15: Nama Laki-laki ('M')
--         'John', 'Johnny', 'Johan', 'James', 'Chris',
--         'Thomas', 'Lucas', 'Marcus', 'Michael', 'Robert',
--         'David', 'William', 'Richard', 'Charles', 'Nicholas',
--         -- Index 16-30: Nama Perempuan ('F')
--         'Johna', 'Johnnetta', 'Mary', 'Patricia', 'Jennifer',
--         'Linda', 'Elizabeth', 'Barbara', 'Jessica', 'Sarah',
--         'Karen', 'Alexis', 'Iris', 'Gladys', 'Dolores'
--     ])[name_idx] AS first_name,
--     (ARRAY[
--         'Smith', 'Johnson', 'Johnstone', 'Williams', 'Brown',
--         'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez',
--         'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson',
--         'Anderson', 'Taylor', 'Moore', 'Jackson', 'Martin',
--         'Lee', 'Perez', 'Thompson', 'White', 'Harris',
--         'Sanchez', 'Clark', 'Ramirez', 'Lewis', 'Robinson',
--         'Walker', 'Young', 'Allen', 'King', 'Wright'
--     ])[last_idx] AS last_name,
--     CASE 
--         WHEN name_idx <= 15 THEN 'M' 
--         ELSE 'F' 
--     END AS gender
-- FROM (
--     SELECT
--         g AS id,
--         floor(random() * 30 + 1)::int AS name_idx,
--         floor(random() * 35 + 1)::int AS last_idx
--     FROM generate_series(1, 1000) AS g
-- ) AS dummy_data;

-- Select count(first_name) from actors

-- SELECT id, first_name, last_name
-- FROM actors
-- WHERE first_name LIKE 'John%';

-- ============================================================================
-- ALL-IN-ONE SCRIPT: SETUP DATABASE IMDB (7 TABEL + AUTO GENERATE DATA)
-- Cukup jalankan (Execute Script) 1x, semua tabel & ribuan data langsung siap!
-- ============================================================================

-- 1. Bersihkan tabel lama jika sudah terlanjur dibuat
-- DROP TABLE IF EXISTS roles CASCADE;
-- DROP TABLE IF EXISTS movies_genres CASCADE;
-- DROP TABLE IF EXISTS movies_directors CASCADE;
-- DROP TABLE IF EXISTS directors_genres CASCADE;
-- DROP TABLE IF EXISTS movies CASCADE;
-- DROP TABLE IF EXISTS directors CASCADE;
-- DROP TABLE IF EXISTS actors CASCADE;

-- -- 2. Buat 7 Tabel sesuai struktur IMDb
-- CREATE TABLE actors (
--     id int8 PRIMARY KEY,
--     first_name varchar(100),
--     last_name varchar(100),
--     gender bpchar(1)
-- );

-- CREATE TABLE directors (
--     id int8 PRIMARY KEY,
--     first_name varchar(100),
--     last_name varchar(100)
-- );

-- CREATE TABLE directors_genres (
--     director_id int8 REFERENCES directors(id),
--     genre varchar(100),
--     prob float4
-- );

-- CREATE TABLE movies (
--     id int8 PRIMARY KEY,
--     name varchar(100),
--     year int4,
--     "rank" float4,
--     rating float4
-- );

-- CREATE TABLE movies_directors (
--     director_id int8 REFERENCES directors(id),
--     movie_id int8 REFERENCES movies(id)
-- );

-- CREATE TABLE movies_genres (
--     movie_id int8 REFERENCES movies(id),
--     genre varchar(100)
-- );

-- CREATE TABLE roles (
--     actor_id int8 REFERENCES actors(id),
--     movie_id int8 REFERENCES movies(id),
--     "role" varchar(100)
-- );

-- -- 3. Generate 1.000 data actors otomatis
-- INSERT INTO actors (id, first_name, last_name, gender)
-- SELECT
--     id,
--     (ARRAY[
--         'John', 'Johnny', 'Jonah', 'Johan', 'James',
--         'Chris', 'Thomas', 'Lucas', 'Marcus', 'Michael',
--         'Robert', 'David', 'William', 'Richard', 'Charles',
--         'Johna', 'Johnnetta', 'Mary', 'Patricia', 'Jennifer',
--         'Linda', 'Elizabeth', 'Barbara', 'Jessica', 'Sarah',
--         'Karen', 'Alexis', 'Iris', 'Gladys', 'Dolores'
--     ])[name_idx],
--     (ARRAY[
--         'Smith', 'Johnson', 'Johnstone', 'Williams', 'Brown',
--         'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez',
--         'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson',
--         'Anderson', 'Taylor', 'Moore', 'Jackson', 'Martin'
--     ])[last_idx],
--     CASE WHEN name_idx <= 15 THEN 'M' ELSE 'F' END
-- FROM (
--     SELECT
--         g AS id,
--         floor(random() * 30 + 1)::int AS name_idx,
--         floor(random() * 20 + 1)::int AS last_idx
--     FROM generate_series(1, 1000) AS g
-- ) AS dummy_actors;

-- -- 4. Tambahkan data spesifik
-- INSERT INTO actors (id, first_name, last_name, gender) VALUES
-- (671521, 'Johan', 'Smith', 'M'),       
-- (845465, 'Michael', 'Johnstone', 'M')  
-- ON CONFLICT (id) DO NOTHING;

-- -- 5. Generate 200 data directors otomatis
-- INSERT INTO directors (id, first_name, last_name)
-- SELECT
--     g,
--     (ARRAY['Christopher', 'Steven', 'Quentin', 'Martin', 'James', 'Ridley', 'Peter', 'David', 'Denis', 'Greta'])[floor(random() * 10 + 1)::int],
--     (ARRAY['Nolan', 'Spielberg', 'Tarantino', 'Scorsese', 'Cameron', 'Scott', 'Jackson', 'Fincher', 'Villeneuve', 'Gerwig'])[floor(random() * 10 + 1)::int]
-- FROM generate_series(1, 200) AS g;

-- -- 6. Generate 400 data directors_genres otomatis
-- INSERT INTO directors_genres (director_id, genre, prob)
-- SELECT
--     floor(random() * 200 + 1)::int,
--     (ARRAY['Action', 'Drama', 'Sci-Fi', 'Thriller', 'Comedy', 'Horror', 'Adventure', 'Crime'])[floor(random() * 8 + 1)::int],
--     round((random()::numeric), 2)::float4
-- FROM generate_series(1, 400);

-- -- 7. Generate 1.000 data movies otomatis 
-- INSERT INTO movies (id, name, year, "rank", rating)
-- SELECT
--     id,
--     (ARRAY['The Last', 'Secret', 'Dark', 'Eternal', 'Lost', 'Silent', 'Golden', 'Broken', 'Hidden', 'Infinite'])[t1] || ' ' ||
--     (ARRAY['Horizon', 'Empire', 'Shadow', 'Journey', 'Knight', 'Legacy', 'Protocol', 'Symphony', 'Paradox', 'Odyssey'])[t2] || ' ' || id,
--     yr,
--     val_rating,
--     val_rating
-- FROM (
--     SELECT
--         g AS id,
--         floor(random() * 10 + 1)::int AS t1,
--         floor(random() * 10 + 1)::int AS t2,
--         floor(random() * (2024 - 1980 + 1) + 1980)::int AS yr,
--         CASE 
--             WHEN g % 5 = 0 THEN 6.0::float4
--             WHEN g % 7 = 0 THEN 5.0::float4
--             WHEN g % 9 = 0 THEN 7.0::float4
--             ELSE round((random() * (9.5 - 4.0) + 4.0)::numeric, 1)::float4
--         END AS val_rating
--     FROM generate_series(1, 1000) AS g
-- ) AS dummy_movies;

-- -- 8. Generate relasi movies_directors, movies_genres, dan roles
-- INSERT INTO movies_directors (director_id, movie_id)
-- SELECT floor(random() * 200 + 1)::int, g FROM generate_series(1, 1000) AS g;

-- INSERT INTO movies_genres (movie_id, genre)
-- SELECT floor(random() * 1000 + 1)::int,
--        (ARRAY['Action', 'Drama', 'Sci-Fi', 'Thriller', 'Comedy', 'Horror', 'Adventure', 'Crime', 'Romance'])[floor(random() * 9 + 1)::int]
-- FROM generate_series(1, 1500);

-- INSERT INTO roles (actor_id, movie_id, "role")
-- SELECT floor(random() * 1000 + 1)::int,
--        floor(random() * 1000 + 1)::int,
--        (ARRAY['Detective', 'Captain', 'Doctor', 'Agent', 'Professor', 'Hero', 'Villain', 'Pilot', 'Reporter', 'Soldier'])[floor(random() * 10 + 1)::int]
-- FROM generate_series(1, 2000);

-- select current_database();