CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    published_year INT,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
 ALTER TABLE books ADD COLUMN gpa VARCHAR(100);
 ALTER TABLE books ADD CONSTRAIN published_year CHECK (published_year<=2025);
 ALTER TABLE books DROP COLUMN author_id;

 CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    published_year INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
 );
 CREATE TABLE temp_Table (
    temp_id INT
 );

 DROP TABLE Temp_Table