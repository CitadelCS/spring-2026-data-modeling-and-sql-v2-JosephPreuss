SET search_path TO library;

INSERT INTO publisher (name, address, phone) VALUES
    ('Penguin Random House', 'New York, NY', '212-555-1000'),
    ('HarperCollins', 'New York, NY', '212-555-2000'),
    ('Simon & Schuster', 'New York, NY', '212-555-3000');

INSERT INTO book (book_id, title, publisher_name) VALUES
    (1, '1984', 'Penguin Random House'),
    (2, 'To Kill a Mockingbird', 'HarperCollins'),
    (3, 'Dune', 'Simon & Schuster');

INSERT INTO book_authors (book_id, author_name) VALUES
    (1, 'George Orwell'),
    (2, 'Harper Lee'),
    (3, 'Frank Herbert');

INSERT INTO borrower (card_no, name, address, phone) VALUES
    (1, 'Alice Johnson', '123 Main St', '555-1111'),
    (2, 'Bob Smith', '456 Oak Ave', '555-2222'),
    (3, 'Charlie Brown', '789 Pine Rd', '555-3333');

INSERT INTO library_branch (branch_id, branch_name, address) VALUES
    (1, 'Central Library', 'Downtown'),
    (2, 'Westside Branch', 'West District'),
    (3, 'Eastside Branch', 'East District');

INSERT INTO book_copies (book_id, branch_id, no_of_copies) VALUES
    (1, 1, 3),
    (2, 2, 2),
    (3, 3, 4);

INSERT INTO book_loans (book_id, branch_id, card_no, date_out, due_date) VALUES
    (1, 1, 1, '2026-02-01', '2026-02-15'),
    (2, 2, 2, '2026-02-05', '2026-02-19'),
    (3, 3, 3, '2026-02-10', '2026-02-24');
