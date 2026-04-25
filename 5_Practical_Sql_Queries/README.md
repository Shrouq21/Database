# SQL Practice Scripts

This repository contains SQL scripts for practicing SQL operations. Each file introduces **new concepts or techniques**. Only new learning points or non-obvious parts are explained.

---

## **Files Overview**

### 1. `01_select_top_examples.sql`
**New Concepts Learned:**
- `TOP(n)` to select only a fixed number of rows.
- `ORDER BY` in combination with `TOP` to control which rows are returned.
- `WITH TIES` allows including rows that have the same value as the last row in the selection.

**Note:**  
- `TOP` without `ORDER BY` may return arbitrary rows.

---

### 2. `02_random_selection.sql`
**New Concepts Learned:**
- `NEWID()` generates a unique identifier for each row.
- Ordering by `NEWID()` is a standard trick to **randomly shuffle rows**.
- Useful for selecting random samples from a table.

**Note:**  
- Using `TOP(1) ORDER BY NEWID()` is a simple way to pick a random row.

---

### 3. `03_create_user_table.sql`
**New Concepts Learned:**
- Creating a table with `UNIQUEIDENTIFIER` as a primary key.
- Setting a **default value** with `NEWID()` so the ID is auto-generated.
- Basic `INSERT` syntax for adding rows to a table.

**Note:**  
- `UNIQUEIDENTIFIER` ensures globally unique values, useful for IDs across multiple systems.

---

### 4. `04_system_functions_and_joins.sql`
**New Concepts Learned:**
- `SUSER_NAME()` to get the current SQL Server user.
- Using `UNION ALL` to **combine results from multiple tables**, keeping duplicates.
- Accessing fully qualified table names (`database.schema.table`) when working across databases.

**Note:**  
- `UNION ALL` preserves duplicates, whereas `UNION` removes duplicates.

---

### 5. `05_select_into_examples.sql`
**New Concepts Learned:**
- `SELECT INTO` creates a **new table from the result of a query**.
- Can select all columns or only specific ones.
- Using `WHERE 1=2` creates the table structure **without any data**.

**Note:**  
- `SELECT INTO` is an easy way to duplicate tables or create temporary copies.

---

### 6. `06_insert_examples.sql`
**New Concepts Learned:**
- Multiple ways to insert data:
  - Single row insert.
  - Multiple rows in one statement.
  - Insert from another table with `INSERT ... SELECT`.
- Using conditions in `INSERT ... SELECT` to filter rows before inserting.

**Note:**  
- `INSERT ... SELECT` is very useful for populating new tables based on existing data.

---

## **How to Use**

- Open each `.sql` file in SQL Server Management Studio (SSMS).
- Execute scripts individually.
- Focus on the **new concepts highlighted above** as you run each file.
