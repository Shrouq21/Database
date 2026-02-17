## Topics Covered


### 1. Joins
- **Cross Join**: Produces a Cartesian product of two tables. Useful for testing all possible combinations.  
- **Inner Join**: Returns only the rows that have matching values in both tables. Can use aliases for clarity.  
- **Outer Join**:  
  - **Left Join**: Returns all rows from the left table, even if there is no match in the right table.  
  - **Right Join**: Returns all rows from the right table, even if there is no match in the left table.  
  - **Full Outer Join**: Combines left and right joins, returning all rows from both tables.  
- **Self Join**: A table joins with itself to represent recursive relationships (e.g., employee-supervisor relationships).  
- **Multi-table Joins**: Joining more than two tables requires a common field and typically `number of tables - 1` conditions in the `WHERE` clause.

### 2. Data Types

#### Numeric
- **bit** – Boolean (0: false, 1: true)  
- **tinyint** – 1 byte, range: -128 to +127  
- **smallint** – 2 bytes, range: -32,767 to +32,767  
- **int** – 4 bytes, range: -2^31 to 2^31-1  
- **bigint** – 8 bytes, range: -2^63 to 2^63-1  

#### Decimal & Money
- **smallmoney** – 4 bytes, format: 0.0000 $  
- **money** – 8 bytes, format: 0.0000 $  
- **real** – 4 bytes, precision ~7 digits  
- **float** – 8 bytes, precision ~15 digits  
- **decimal / dec(precision, scale)** – e.g., `dec(5,2)` allows 5 digits with 2 decimals (123.44)  

#### Character / String
- **char(n)** – fixed length string, n characters  
- **varchar(n)** – variable length string, up to n characters  
- **nchar(n)** – fixed length Unicode string  
- **nvarchar(n)** – variable length Unicode string  
- **nvarchar(max)** – up to 2 GB  
- **text / ntext** – large objects  

#### Date & Time
- **date** – MM/DD/YYYY  
- **time** – hh:mm:ss[.fractional]  
- **smalldatetime** – MM/DD/YYYY hh:mm:00, year 1900–2079  
- **datetime** – MM/DD/YYYY hh:mm:ss.fff, year 1753–9999  
- **datetime2(7)** – MM/DD/YYYY hh:mm:ss.ffffff, year 1–9999  
- **datetimeoffset** – datetime with time zone  
- **timestamp** – unique binary number, used for row versioning  

#### Binary
- **binary(n)** – fixed-length binary data  
- **image** – large binary data (e.g., photos)  

#### Others
- **sql_variant** – stores different SQL data types  
- **uniqueidentifier** – GUID  
- **XML** – XML data  
- **geography** – spatial data (maps)  
- **hierarchyID** – hierarchical data  



### 3. Keywords & Operators
- **LIKE operator**: Pattern matching using `%` (zero or more chars), `_` (single char), `[ ]` (range or set), `[^ ]` (negation).  
  - Examples:  
    - `'a%'` – starts with a  
    - `'%a'` – ends with a  
    - `'___'` – exactly 3 characters  
    - `'[(ah)(am)]%'` – starts with "ah" or "am"  
    - `'%[_]%'` – contains underscore  
- **ISNULL**: Replace NULL values with a default.  


### 4. Identity Columns
- Automatically increment primary key: `IDENTITY(start, increment)`  
- Can be manually inserted using `SET IDENTITY_INSERT <table> ON`  
- Useful functions:  
  - `@@IDENTITY` – last inserted identity in current session  
  - `SCOPE_IDENTITY()` – last inserted identity in current scope  
  - `IDENT_CURRENT('table')` – current identity value for a table  
  - `IDENT_INCR('table')` – increment value  
  - `IDENT_SEED('table')` – seed value  
- Reset identity:  
```sql
DBCC CHECKIDENT('table_name', RESEED, 0)

### 5. DML with Joins
- **UPDATE with join**: Update rows in one table based on related rows in another table.  
- **DELETE with join**: Delete rows in one table based on conditions from another table.

### 6. Data Deletion and Truncation
- `DELETE` → removes rows, can filter with WHERE.
- `TRUNCATE` → removes all rows, resets identity, faster than DELETE.
- `DROP TABLE` → removes table structure and data.
- Differences:
  - DELETE logs each row → can rollback.
  - TRUNCATE minimal logging → cannot rollback, affects structure.
  - Truncate is faster than delete because it bypasses logging and resets identity. 

### 7. Null Handling
- Use `IS NULL` / `IS NOT NULL` to filter nulls.  
- Replace nulls with `ISNULL(column, value)` to avoid null-related issues.


## 8. Foreign Keys & Cascading Rules

### Foreign Key Actions

When a parent table row is deleted or updated, the action specified on the foreign key determines what happens to related child rows:

| Action           | Delete Parent | Update Parent | Effect on Child Rows                 |
|-----------------|---------------|---------------|------------------------------------|
| NO ACTION/RESTRICT | Fail          | Fail          | Cannot delete/update parent if child exists |
| CASCADE          | Delete child   | Update child  | Automatically propagate changes     |
| SET NULL         | Child becomes NULL | Child becomes NULL | Foreign key in child set to NULL |
| SET DEFAULT      | Child becomes default | Child becomes default | Foreign key set to default value |

 