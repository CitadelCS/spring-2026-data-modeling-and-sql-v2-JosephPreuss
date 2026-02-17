CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS publisher
(
    name            VARCHAR(100) NOT NULL PRIMARY KEY,
    address         VARCHAR(100), -- Left null assuming virtual publishers
    phone           VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS book
(
    book_id         SERIAL  PRIMARY KEY,
    title           VARCHAR(100) NOT NULL,
    publisher_name  VARCHAR(100) NOT NULL,

    CONSTRAINT fk_publisher_name
        FOREIGN KEY (publisher_name)
        REFERENCES publisher(name)
);

CREATE TABLE IF NOT EXISTS book_authors
(
    book_id         SERIAL NOT NULL,
    author_name     VARCHAR(100),

    CONSTRAINT pk_book_author_name
        PRIMARY KEY (book_id, author_name)
);

CREATE TABLE IF NOT EXISTS borrower
(
    card_no         SERIAL NOT NULL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    address         VARCHAR(100) NOT NULL,
    phone           VARCHAR(20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS library_branch
(
    branch_id       SERIAL NOT NULL PRIMARY KEY,
    branch_name     VARCHAR(100),
    address         VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS book_loans
(
    book_id         SERIAL NOT NULL,
    branch_id       SERIAL NOT NULL,
    card_no         SERIAL NOT NULL,
    date_out        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP + INTERVAL '2 weeks',

    CONSTRAINT pk_book_id_branch_id_card_no
        PRIMARY KEY (book_id, branch_id, card_no),

    CONSTRAINT check_due_date_gt_date_out
        CHECK (due_date > date_out)
);

CREATE TABLE IF NOT EXISTS book_copies
(
    book_id         SERIAL NOT NULL,
    branch_id       SERIAL NOT NULL,
    no_of_copies    INT NOT NULL DEFAULT 1,

    CONSTRAINT pk_book_id_branch_id
        PRIMARY KEY (book_id, branch_id),

    CONSTRAINT check_no_of_copies_above_zero
        CHECK (no_of_copies > 0)
);