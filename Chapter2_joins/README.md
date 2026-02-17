# Additional SQL Topics

---

## 1. Joins

### Types of Joins

- **Cross Join**  
  Produces a Cartesian product of two tables. It returns all possible combinations of rows from both tables.

- **Inner Join**  
  Returns only the rows that have matching values in both tables. Table aliases are commonly used for readability.

- **Outer Join**
  - **Left Join (LEFT OUTER JOIN)**  
    Returns all rows from the left table and matching rows from the right table. If no match exists, NULL values are returned for the right table.
  - **Right Join (RIGHT OUTER JOIN)**  
    Returns all rows from the right table and matching rows from the left table. If no match exists, NULL values are returned for the left table.
  - **Full Outer Join**  
    Returns all rows from both tables. Non-matching rows are filled with NULL values.

- **Self Join**  
  A table joins with itself. It is commonly used to represent hierarchical or recursive relationships (e.g., employee–manager relationships).

- **Multi-table Joins**  
  Joining more than two tables requires a common relationship between tables. Typically, the number of join conditions equals `number of tables - 1`.

---

## 2. Data Types (SQL Server)

### Numeric Types

- **bit** – Boolean (0 = false, 1 = true)
- **tinyint** – 1 byte, range: 0 to 255  
- **smallint** – 2 bytes, range: -32,768 to 32,767  
- **int** – 4 bytes, range: -2,147,483,648 to 2,147,483,647  
- **bigint** – 8 bytes, range: -2^63 to 2^63 - 1  

---

### Decimal & Floating Types

- **smallmoney** – 4 bytes, 4 decimal places  
- **money** – 8 bytes, 4 decimal places  
- **real** – 4 bytes, approximately 7-digit precision  
- **float** – 8 bytes, approximately 15-digit precision  
- **decimal(p, s)** / **numeric(p, s)**  
  Example: `decimal(5,2)` allows 5 total digits with 2 digits after the decimal point (e.g., 123.45)

---

### Character / String Types

- **char(n)** – Fixed-length string  
- **varchar(n)** – Variable-length string  
- **nchar(n)** – Fixed-length Unicode string  
- **nvarchar(n)** – Variable-length Unicode string  
- **nvarchar(max)** – Up to 2 GB  
- **text / ntext** – Deprecated (use varchar(max) or nvarchar(max) instead)

---

### Date & Time Types

- **date** – Date only  
- **time** – Time only  
- **smalldatetime** – 1900–2079, minutes precision  
- **datetime** – 1753–9999, milliseconds precision  
- **datetime2(7)** – 0001–9999, higher precision  
- **datetimeoffset** – Date and time with time zone offset  
- **timestamp (rowversion)** – Auto-generated binary number used for versioning (not a real date/time type)

---

### Binary Types

- **binary(n)** – Fixed-length binary data  
- **varbinary(n)** – Variable-length binary data  
- **image** – Deprecated (use varbinary(max))

---

### Other Types

- **sql_variant** – Stores multiple SQL data types  
- **uniqueidentifier** – GUID  
- **XML** – XML data  
- **geography** – Spatial geographic data  
- **hierarchyid** – Hierarchical data  

---

## 3. Keywords & Operators

### LIKE Operator

Used for pattern matching.

Wildcards:
- `%` → zero or more characters  
- `_` → exactly one character  
- `[abc]` → matches any one character inside brackets  
- `[^abc]` → matches any character NOT inside brackets  

Examples:
- `'a%'` → starts with "a"  
- `'%a'` → ends with "a"  
- `'___'` → exactly 3 characters  
- `'[am]%'` → starts with "a" or "m"  
- `'%[_]%'` → contains underscore  

---

### ISNULL

Replaces NULL values with a specified default value.

Example:
```sql
ISNULL(Salary, 0)
```

---

## 4. Identity Columns

Identity columns automatically generate incremented values.

Syntax:
```sql
IDENTITY(seed, increment)
```

Example:
```sql
ID INT IDENTITY(1,1)
```

### Identity Functions

- `@@IDENTITY` – Last inserted identity value in the current session  
- `SCOPE_IDENTITY()` – Last inserted identity value in the current scope (recommended)  
- `IDENT_CURRENT('table')` – Current identity value for a specific table  
- `IDENT_INCR('table')` – Increment value  
- `IDENT_SEED('table')` – Seed value  

### Reset Identity

```sql
DBCC CHECKIDENT('table_name', RESEED, 0)
```

---

## 5. DML with Joins

- **UPDATE with JOIN**  
  Update records in one table based on matching records in another table.

- **DELETE with JOIN**  
  Delete records from one table based on related conditions in another table.

---

## 6. Data Deletion and Truncation

- `DELETE` → Removes rows and supports WHERE clause.
- `TRUNCATE TABLE` → Removes all rows, resets identity, and is faster than DELETE.
- `DROP TABLE` → Removes the table structure and data permanently.

### Key Differences

- DELETE logs each row individually → Can be rolled back.
- TRUNCATE uses minimal logging → Can be rolled back if inside a transaction.
- TRUNCATE resets identity automatically.
- DROP removes the entire table.

---

## 7. Null Handling

- Use `IS NULL` or `IS NOT NULL` for filtering.
- Use `ISNULL(column, value)` to replace NULL values.

---

## 8. Foreign Keys & Cascading Rules

### Foreign Key Actions

When a parent row is deleted or updated, the foreign key action determines what happens to related child rows:

| Action              | On Delete      | On Update      | Effect on Child Rows |
|--------------------|---------------|---------------|----------------------|
| NO ACTION / RESTRICT | Prevent action | Prevent action | Parent cannot be deleted/updated if child exists |
| CASCADE            | Delete child   | Update child   | Automatically propagates changes |
| SET NULL           | Set to NULL    | Set to NULL    | Foreign key column becomes NULL |
| SET DEFAULT        | Set to default | Set to default | Foreign key column becomes default value |

