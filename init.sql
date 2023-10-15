CREATE TABLE IF NOT EXISTS publishing_house (
	publishing_house_name varchar(255) primary KEY,
	publishing_city varchar(255)
);

CREATE TABLE IF NOT EXISTS books (
	book_code serial PRIMARY KEY,
	book_name varchar(255),
	authors varchar(255),
 	year_of_publishing smallint,
	book_volume smallint,
 	book_price smallint,
 	number_of_copies_in_fund smallint,
  	publishing_house_id int,
  	CONSTRAINT fk_publishing_house
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_house(publishing_house_name)
);
ALTER TABLE books
	ADD CONSTRAINT unique_book_name UNIQUE (book_name);
CREATE TABLE IF NOT EXISTS readers (
  library_card_number serial primary key,
  name_of_reader varchar(255),
  phone_number int,
  address text
);
CREATE TABLE IF NOT EXISTS authors (
	author_code serial primary key,
	name_of_author varchar(255)
);
CREATE TABLE IF NOT EXISTS authors_and_books (
	id serial primary key,
 	book_name varchar(255),
	name_of_author varchar(255),
	CONSTRAINT fk_authors FOREIGN KEY (name_of_author) REFERENCES authors(name_of_author),
	CONSTRAINT fk_books FOREIGN KEY (book_name) REFERENCES books(book_name)
);
create table if not exists book_checkout(
	checkout_nubmer serial primary key,
	library_card_number int,
	book_code int,
	constraint fk_readers foreign key (library_card_number) references readers(library_card_number),
	constraint fk_books foreign key (book_code) references books(book_code)
	);