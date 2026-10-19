-- select datname from pg_database
-- select tablename from pg_tables;
-- CREATE DATABASE koda_b1_db;

SELECT tablename FROM pg_tables WHERE schemaname = 'public'

-- CREATE TABLE kategori (
--     id Serial PRIMARY KEY,
--     nama_kategori VARCHAR(255) NOT NULL
-- )

-- CREATE TABLE product (
--     id SERIAL PRIMARY KEY,
--     email VARCHAR(80) NOT NULL UNIQUE,
--     password_hash VARCHAR(255) NOT NULL,
--     created_at TIMESTAMPTZ DEFAULT NOW(),
--     id_kategori INT REFERENCES kategori(id)
-- );

-- ALTER TABLE product ADD CONSTRAINT fk_product_kategori FOREIGN KEY (kategori_id) REFERENCES kategori(id);

-- Select * from users;
-- INSERT INTO users (email, password_hash) VALUES
-- ('admin@gmail.com', '22222222'),
-- ('admin10@gmail.com', '12345678'),
-- ('admin1@gmail.com', '12345678'),
-- ('admin3@gmail.com', '12345678'),
-- ('admin4@gmail.com', '12345678'),
-- ('admin5@gmail.com', '12345678'),
-- ('admin6@gmail.com', '12345678'),
-- ('admin7@gmail.com', '12345678'),
-- ('admin8@gmail.com', '12345678'),
-- ('admin9@gmail.com', '12345678');

-- UPDATE users SET email = 'minda@gmail.com' where id = 1;

-- DELETE from users where id = 1;

-- CREATE TABLE test (
--     id SERIAL PRIMARY KEY
-- )
-- DROP TABLE test;

-- select * from users where email='admin@gmail.com'

-- INSERT INTO kategori (nama_kategori) VALUES
-- ('Minuman'),
-- ('Makanan');
-- SELECT * FROM kategori;

-- INSERT INTO product (nama_product, harga, stok, id_kategori) VALUES
-- ('Susu', 2000, 5, "1"),
-- ('Pizza', 2000, 5, "2");

-- Select p.name_product, p.stok, k.name_kategori FROM product p JOIN kategori k ON p.id_kategori = k.id_kategori; 