CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


-- 1. INNER JOIN
SELECT 
    Books.BookID,
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
INNER JOIN Authors
    ON Books.AuthorID = Authors.AuthorID;

-- 2. LEFT JOIN

SELECT 
    Books.BookID,
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
LEFT JOIN Authors
    ON Books.AuthorID = Authors.AuthorID;


-- 3. RIGHT JOIN

SELECT 
    Books.BookID,
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
RIGHT JOIN Authors
    ON Books.AuthorID = Authors.AuthorID;


SELECT 
    Books.BookID,
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
LEFT JOIN Authors
    ON Books.AuthorID = Authors.AuthorID
UNION
SELECT 
    Books.BookID,
    Books.Title,
    Authors.Name AS AuthorName
FROM Books
RIGHT JOIN Authors
    ON Books.AuthorID = Authors.AuthorID;


-- Task 6 Task 6:Subqueries and Nested Queries
-- 1. Scalar Subquery in SELECT
SELECT 
    Title,
    (SELECT COUNT(*) FROM Books) AS TotalBooks
FROM Books;

-- 2. Subquery in WHERE with IN
SELECT Name 
FROM Authors
WHERE AuthorID IN (
    SELECT AuthorID 
    FROM Books
    WHERE Title LIKE '%Java%'
);

-- 3. Subquery in WHERE with =
SELECT * 
FROM Books
WHERE BookID = (
    SELECT MAX(BookID) FROM Books
);

-- 4. Correlated Subquery
SELECT Name,
       (SELECT COUNT(*) 
        FROM Books 
        WHERE Books.AuthorID = Authors.AuthorID) AS BookCount
FROM Authors;


-- 5. EXISTS Subquery


SELECT Name
FROM Authors a
WHERE EXISTS (
    SELECT 1
    FROM Books b
    WHERE b.AuthorID = a.AuthorID
);
