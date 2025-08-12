# Task 6 – Subqueries and Nested Queries

## Objective
Practice writing SQL queries that use **subqueries** inside `SELECT`, `WHERE`, and `FROM` clauses, including scalar and correlated subqueries.  
This will help in developing **advanced query logic skills**.

---

## Tools Used
- **DB Browser for SQLite**
- **MySQL Workbench**

---

## Dataset
**Database:** `LibraryDB`  

**Tables:**

1. **Authors**
   - `AuthorID` (Primary Key)  
   - `Name` (Author Name)  

2. **Books**
   - `BookID` (Primary Key)  
   - `Title` (Book Title)  
   - `AuthorID` (Foreign Key → Authors.AuthorID)  

---

## Queries Implemented

### 1. Scalar Subquery in SELECT
Get each book with the **total number of books** in the library.
```sql
SELECT 
    Title,
    (SELECT COUNT(*) FROM Books) AS TotalBooks
FROM Books;
# SQL_intern_Task-6-Subqueries-and-Nested-Queries
