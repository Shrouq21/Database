# Why `ORDER BY` Is Required with `WITH TIES`

## What `TOP` Does

`TOP(n)` selects the first `n` rows from the result set.

Example:

```sql
SELECT TOP(3) *
FROM Students;
```

This returns any 3 rows based on the database's current retrieval order.

---

## Why `ORDER BY` Is Important

A database table has no guaranteed order unless `ORDER BY` is used.

So SQL needs `ORDER BY` to know:

* which rows are highest,
* lowest,
* first,
* or last.

Example:

```sql
SELECT TOP(3) *
FROM Students
ORDER BY Age DESC;
```

This means:

1. Sort students by age from highest to lowest.
2. Return the first 3 rows.

---

## What `WITH TIES` Does

`WITH TIES` includes additional rows that have the same value as the last selected row according to the `ORDER BY` column.

Example:

```sql
SELECT TOP(3) WITH TIES *
FROM Students
ORDER BY Age DESC;
```

Suppose the data is:

| Name | Age |
| ---- | --- |
| Ali  | 25  |
| Sara | 24  |
| Mona | 24  |
| Adam | 24  |
| Omar | 22  |

After sorting by `Age DESC`:

1. Ali → 25
2. Sara → 24
3. Mona → 24

The 3rd row has age `24`.

`WITH TIES` adds all rows tied with `24`, so Adam is included too.

Final result:

| Name | Age |
| ---- | --- |
| Ali  | 25  |
| Sara | 24  |
| Mona | 24  |
| Adam | 24  |

---

## Why `WITH TIES` Requires `ORDER BY`

`WITH TIES` must compare rows using a specific column.

Without `ORDER BY`, SQL would not know:

* what values should be compared,
* or what "tied" means.

That is why this is invalid:

```sql
SELECT TOP(3) WITH TIES *
FROM Students;
```

SQL requires `ORDER BY` when using `WITH TIES`.

# SQL Notes

---

# Creating an Empty Table Using `SELECT INTO`

You can create a new table with the same structure as an existing table without copying any data by using a condition that is always false.

---

## Example

```sql
SELECT * INTO EmptyStudents
FROM Students
WHERE 1 = 2;
```

---

## How It Works

- `SELECT * INTO` creates a new table based on the selected columns.
- The condition:

```sql
WHERE 1 = 2
```

is always false.

- Since the condition is false:
  - no rows are copied
  - but SQL still creates the table structure.

---

## What Gets Copied?

The new table will contain:
- column names
- data types
- column order

But it will NOT copy:
- data
- primary keys
- foreign keys
- constraints
- indexes

---

# Understanding `UNIQUEIDENTIFIER` and `DEFAULT NEWID()`

---

# `UNIQUEIDENTIFIER`

`UNIQUEIDENTIFIER` is a special SQL Server data type used to store a GUID (Globally Unique Identifier).

Each GUID is globally unique, meaning it will never repeat across:
- tables
- databases
- servers
- systems

It is commonly used when strong uniqueness is needed instead of sequential integers like:

```text
1, 2, 3, 4
```

---

## Example GUID

```text
3F2504E0-4F89-11D3-9A0C-0305E82C3301
```

---

# `NEWID()`

`NEWID()` is a SQL Server function that generates a random GUID every time it is called.

---

## Example

```sql
SELECT NEWID();
```

Possible output:

```text
6F9619FF-8B86-D011-B42D-00CF4FC964FF
```

---

# `DEFAULT NEWID()`

When used with `DEFAULT`, SQL Server automatically generates a GUID if no value is provided during insertion.

---

## Example Table

```sql
CREATE TABLE MyUsers (
    userid UNIQUEIDENTIFIER DEFAULT NEWID(),
    username VARCHAR(50),
    _password VARCHAR(50)
);
```

---

## Example Insert

```sql
INSERT INTO MyUsers (username, _password)
VALUES ('Ali', '1234');
```

---

## What Happens?

Since no `userid` was provided:
- SQL Server automatically calls `NEWID()`
- a unique GUID is inserted into `userid`

---

# Why Use GUIDs?

## Advantages

- globally unique
- safe for distributed systems
- useful for replication and synchronization
- avoids ID collisions between databases

---

## Disadvantages

- larger than integers
- slower indexing compared to integer IDs
- harder to read manually

---

# Fully Qualified Table Name in SQL Server

SQL Server can identify database objects using the full naming structure:

```text
ServerName.DatabaseName.SchemaName.TableName
```

---

# Example

```sql
SELECT *
FROM [LAPTOP-GPED28K3].[ITI].HR.Student;
```

---

# Order Explanation

| Part | Meaning |
|---|---|
| `LAPTOP-GPED28K3` | Server Name |
| `ITI` | Database Name |
| `HR` | Schema Name |
| `Student` | Table Name |

---

# Important Notes

## Server Name
Represents the SQL Server instance.

---

## Database Name
The database containing the table.

---

## Schema Name
A logical container used to organize database objects.

Common schemas:
- `dbo`
- `HR`
- `Sales`

---

## Table Name
The actual table being queried.

---

# Why Use Fully Qualified Names?

Useful when:
- accessing tables from another database
- working with linked servers
- avoiding ambiguity between objects
- organizing large systems

---

# Summary

- `SELECT INTO` can create an empty table structure.
- `UNIQUEIDENTIFIER` stores globally unique IDs.
- `NEWID()` generates random GUIDs.
- `DEFAULT NEWID()` auto-generates IDs during insertion.
- SQL Server object naming follows:

```text
Server.Database.Schema.Table
```


#  SQL Window Functions & Grouping Guide

A complete, beginner-friendly guide to **SQL window functions**, ranking, and the difference between `GROUP BY` and `PARTITION BY`.

---

#  Table of Contents

-  [Introduction](#-introduction)
-  [Window Functions Basics](#️-window-functions-basics)
-  [Core Concepts](#-core-concepts)
-  [Ranking Functions](#-ranking-functions)
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()
  - NTILE()
- [Analytical Functions](#-analytical-functions)
  - LAG()
  - LEAD()
  - FIRST_VALUE()
  - LAST_VALUE()
  - PERCENT_RANK()
-  [GROUP BY vs PARTITION BY](#️-group-by-vs-partition-by)
-  [Quick Summary](#-quick-summary)

---

#  Introduction

SQL window functions allow you to perform calculations **across related rows without collapsing the result set**.

Unlike `GROUP BY`, window functions keep all rows and add extra computed columns.

---

#  Window Functions Basics

##  Syntax

```sql
FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
)
```

---

##  Key Parts

###  OVER()
Defines a window function.

---

###  PARTITION BY
Splits data into groups (without removing rows).


---

### 🔹 ORDER BY (inside OVER)
Defines order inside each group.

Used for:
- ranking
- sequencing
- comparisons between rows

---

#  Ranking Functions

---

##  ROW_NUMBER()

Assigns a unique number to each row.

```sql
ROW_NUMBER() OVER (
    PARTITION BY Crs_Duration
    ORDER BY Top_Id
)
```

### ✔ Features:
- always unique
- restarts per partition

---

##  RANK()

Assigns ranks but skips numbers for ties.

```sql
RANK() OVER (ORDER BY salary DESC)
```

### Example:
```
1, 1, 3, 4
```

---

##  DENSE_RANK()

Like `RANK()` but without gaps.

### Example:
```
1, 1, 2, 3
```

---

##  NTILE(n)

Splits rows into equal groups.

```sql
NTILE(3) OVER (ORDER BY Crs_Duration)
```

 Used for:
- quartiles
- segmentation
- distribution analysis

---

#  Analytical Functions

---

## ⬅ LAG()

Gets the previous row value.

```sql
LAG(Crs_Name) OVER (ORDER BY Top_Id)
```

 “What was before me?”

---

## ➡️ LEAD()

Gets the next row value.

```sql
LEAD(Crs_Name) OVER (ORDER BY Top_Id)
```

 “What comes after me?”

---

## 🔝 FIRST_VALUE()

Returns the first value in the window.

```sql
FIRST_VALUE(Crs_Name) OVER (ORDER BY Top_Id)
```

 Always returns the first row in the ordered window.

---

## 🔚 LAST_VALUE()

Returns the last value in the window.

 Requires full window frame:

```sql
LAST_VALUE(Crs_Name) OVER (
    ORDER BY Top_Id
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
```

👉 Ensures SQL considers the entire partition.

---

##  PERCENT_RANK()

Shows relative position between 0 and 1.

```sql
PERCENT_RANK() OVER (ORDER BY grade)
```

### Formula:
```
(rank - 1) / (total_rows - 1)
```

---

### Example (6 rows):

| Rank | Percent |
|------|--------|
| 1    | 0.0    |
| 2    | 0.2    |
| 3    | 0.4    |
| 4    | 0.6    |
| 5    | 0.8    |
| 6    | 1.0    |

---

#  GROUP BY vs PARTITION BY

---

##  GROUP BY

###  Purpose:
Aggregates and **reduces rows**

```sql
SELECT Crs_Duration, COUNT(*)
FROM course
GROUP BY Crs_Duration;
```

### Output:
| Crs_Duration | Count |
|--------------|-------|
| 30           | 5     |
| 60           | 3     |

 One row per group

---

##  PARTITION BY

###  Purpose:
Keeps all rows but adds calculations

```sql
SELECT *,
       COUNT(*) OVER (PARTITION BY Crs_Duration) AS cnt
FROM course;
```

### Output:
| Crs_Duration | Top_Id | cnt |
|--------------|--------|-----|
| 30           | 1      | 5   |
| 30           | 2      | 5   |

 Same rows + extra info

---

##  Key Difference

| Feature | GROUP BY | PARTITION BY |
|--------|----------|--------------|
| Keeps rows | ❌ No | ✅ Yes |
| Output type | Summary | Detailed |
| Used with | Aggregates | Window functions |

---

# 🧠 Quick Summary

-  `GROUP BY` → compress data
-  `PARTITION BY` → analyze data without losing rows
-  Window functions → perform row-based calculations
-  ORDER BY inside OVER → defines calculation order

---
 
