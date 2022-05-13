/*
    whatabook.init.sql
    Alice Covell
    May 11 2022
    Professor John Woods
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('888 Drawing Rd S, Painting, GA 87109');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Light and Shadow', 'Alice Liddel', 'Part one');

INSERT INTO book(book_name, author, details)
    VALUES('Colors and Value', 'Alice Liddel', 'Part two');

INSERT INTO book(book_name, author, details)
    VALUES('Poses and Anatomy', 'Alice Liddel', 'Part three');

INSERT INTO book(book_name, author)
    VALUES('The Seven Princes Curse', 'Alice Liddel');

INSERT INTO book(book_name, author)
    VALUES('The Princess and The Moon', 'Alice Liddel');

INSERT INTO book(book_name, author)
    VALUES('The Rabbit and The Giant Carrot', 'Alice Liddel');

INSERT INTO book(book_name, author)
    VALUES('The Thousand Kilometer Journey', 'Sakura Torii');

INSERT INTO book(book_name, author)
    VALUES('I Want To Eat Your Kidney', 'Sakura Torii');

INSERT INTO book(book_name, author)
    VALUES('The Haunted Sand Castle', 'Sakura Torii');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Kaoru', 'Morita');

INSERT INTO user(first_name, last_name)
    VALUES('Kakeru', 'Manabe');

INSERT INTO user(first_name, last_name)
    VALUES('Yuuki', 'Soma');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Kaoru'), 
        (SELECT book_id FROM book WHERE book_name = 'I Want To Eat Your Kidney')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Kakeru'),
        (SELECT book_id FROM book WHERE book_name = 'The Haunted Sand Castle')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Yuuki'),
        (SELECT book_id FROM book WHERE book_name = 'The Princess and The Moon')
    );