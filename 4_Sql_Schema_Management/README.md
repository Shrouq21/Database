# SQL Schema and Security Management

## Overview
This project demonstrates:

- Creating schemas
- Creating tables in specific schemas
- Transferring objects between schemas
- Creating synonyms
- Creating SQL Server logins and users
- Granting permissions

---

## Schemas
Schemas are logical containers used to organize database objects.

Example:
- HR
- Sales

---

## Object Transfer
Objects can be moved between schemas using:

```sql
ALTER SCHEMA TargetSchema TRANSFER SourceSchema.ObjectName;