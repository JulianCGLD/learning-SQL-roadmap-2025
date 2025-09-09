**STAGEPROJECT: create_data_bases_mysql**

[[Project title]]  
**STAGEPROJECT - Practice Pack**

[[1.1 Practice evey Day]]

## 📝 Description

Practice set focused exclusively on mastering the `CREATE DATABASE` statement in MySQL.

## 🔧 Functional Requirements Implemented

-  Create a new database using correct syntax
    
-  Apply character set and collation options
    
-  Enforce identifier constraints
    
-  Prevent creation conflicts using `IF NOT EXISTS`
    
-  Validate database presence via `information_schema`
    
-  Switch database context using `USE`
    

## 🌟 Stretch Goals (Optional)

-  Explore behavior under invalid naming conventions
    
-  Automate validation via metadata queries
    

## ⏱ Time Log

Estimated: 45 minutes  
Actual: TBD

## 📚 Concepts Practiced

- Database namespace creation
    
- Identifier rules for schema objects
    
- Charset and collation configuration
    
- Use of `information_schema` for validation
    
- Privilege-related outcomes
    

## 📌 Notes

Focuses on schema-level object creation without involving tables or data manipulation. Uses `information_schema.schemata` for structural verification.

---

**STAGEPROJECT: create_data_bases_mysql**

## **Stage**: create_data_bases_mysql

## 🎓 Learning Objectives

- Write syntactically valid `CREATE DATABASE` statements
    
- Apply character set and collation settings to new databases
    
- Prevent duplicate database creation with `IF NOT EXISTS`
    
- Verify database creation using `information_schema`
    
- Switch between databases using the `USE` command
    

---

## 🧪 1. Microproject Set (choose count and justify)

Number of microprojects chosen: 3 — Each targets a unique syntactic feature or database-level configuration required for mastery of `CREATE DATABASE`.

---

### 1.Name_create_basic_database.sql

- **Files**: schema.sql
    
- **Input**: none
    
- **Expected output / resulting DB state**: A new database named `analytics_db` is present in `information_schema.schemata`.
    
- **Constraints**: Use only `CREATE DATABASE`; no other SQL statements allowed.
    
- **Acceptance tests**:
    
    - `SELECT SCHEMA_NAME FROM information_schema.schemata WHERE SCHEMA_NAME = 'analytics_db';` returns 1 row
        
    - `SHOW CREATE DATABASE analytics_db;` executes without error
        
- **Example(s)**:
    
    ```sql
    -- schema.sql  
    CREATE DATABASE analytics_db;
    ```
    
- **Notes**: No schema objects are created; database presence is sufficient.
    
- **You do NOT have to use**: tables, users, procedures, views, or data.
    

---

### 2.Name_create_database_with_charset_collation.sql

- **Files**: schema.sql
    
- **Input**: none
    
- **Expected output / resulting DB state**: A database `lang_support` with `utf8mb4` charset and `utf8mb4_unicode_ci` collation.
    
- **Constraints**: Must explicitly define both charset and collation in the statement.
    
- **Acceptance tests**:
    
    - `SELECT DEFAULT_CHARACTER_SET_NAME FROM information_schema.schemata WHERE SCHEMA_NAME = 'lang_support';` returns `utf8mb4`
        
    - `SELECT DEFAULT_COLLATION_NAME FROM information_schema.schemata WHERE SCHEMA_NAME = 'lang_support';` returns `utf8mb4_unicode_ci`
        
- **Example(s)**:
    
    ```sql
    -- schema.sql  
    CREATE DATABASE lang_support CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```
    
- **Notes**: Charset and collation specified to test encoding control.
    
- **You do NOT have to use**: tables, foreign keys, triggers, or stored procedures.
    

---

### 3.Name_create_database_if_not_exists.sql

- **Files**: schema.sql
    
- **Input**: none
    
- **Expected output / resulting DB state**: The script runs without error even if `reporting_db` already exists.
    
- **Constraints**: Must use `IF NOT EXISTS` clause.
    
- **Acceptance tests**:
    
    - Script runs twice without error
        
    - `SELECT COUNT(*) FROM information_schema.schemata WHERE SCHEMA_NAME = 'reporting_db';` returns 1
        
- **Example(s)**:
    
    ```sql
    -- schema.sql  
    CREATE DATABASE IF NOT EXISTS reporting_db;
    ```
    
- **Notes**: Avoids error during re-execution using optional clause.
    
- **You do NOT have to use**: data population, constraints, privileges, or table structures.
    

---

## 🧠 2. Applied Problem Set (choose counts and justify)

Total problems chosen: 12 — [justification: Concept is foundational but has limited surface area, so we favor a larger count of basic exercises and fewer intermediate ones.]  
Breakdown: Basic 8, Intermediate 4, Advanced 0 (not applicable to this construct)

---

### [Basic] — 1.problem_1_create_database_with_valid_name.sql

- **Statement**: Create a database named `finance_data`.
    
- **Input**: none
    
- **Expected output**: Database `finance_data` is listed in `information_schema.schemata`.
    
- **Constraints**: Use only `CREATE DATABASE`
    
- **Example**:
    
    ```sql
    CREATE DATABASE finance_data;
    ```
    
- **Acceptance tests**:
    
    - `SELECT SCHEMA_NAME FROM information_schema.schemata WHERE SCHEMA_NAME = 'finance_data';`
        
    - `SHOW CREATE DATABASE finance_data;` runs without error
        
- **You do NOT have to use**: any table or DML statements.
    

---

### [Basic] — 2.problem_2_illegal_database_name.sql

- **Statement**: Try to create a database named `123start` and correct the error.
    
- **Input**: original invalid statement
    
- **Expected output**: Syntax error on first run, corrected version on second run
    
- **Constraints**: Only `CREATE DATABASE` allowed
    
- **Example**:
    
    ```sql
    CREATE DATABASE 123start;  
    ```
    
- **Acceptance tests**:
    
    - Original query fails with syntax error
        
    - Revised name like `start123` succeeds and appears in `information_schema`
        
- **You do NOT have to use**: table definitions or permissions.
    

---

## ⚙️ 3. Debugging & Refactor Challenge

**Number chosen: 2 — demonstrates syntax and logic errors relevant to `CREATE DATABASE`.**

---

### Broken Code: debug_1_invalid_charset.sql

```sql
CREATE DATABASE mydata CHARACTER SET utf9 COLLATE utf9_general_ci;
```

- **Bug list**:
    
    1. Invalid charset name (`utf9` does not exist)
        
    2. Collation doesn't match any real charset
        
- **Required fix**:
    
    ```sql
    CREATE DATABASE mydata CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;  
    ```
    
- **Refactor notes**:
    
    - Use only supported charsets
        
    - Confirm collation matches declared charset
        
    - Add `IF NOT EXISTS` if re-runnable
        

---

### Broken Code: debug_2_missing_identifier.sql

```sql
CREATE DATABASE ;
```

- **Bug list**:
    
    1. Missing identifier
        
    2. Syntax error
        
- **Required fix**:
    

- **Refactor notes**:
    
    - Validate identifier non-nullity
        
    - Avoid reserved names
        
    - Prefer snake_case for portability
        

---

## ✅ Final Validation Checklist

-  All queries run without syntax errors on MySQL 8.0+
    
-  All acceptance tests pass as SQL assertions
    
-  No illegal identifiers or charset/collation mismatches
    
-  `IF NOT EXISTS` used where needed
    
-  Correct usage of metadata inspection
    

---

## 📌 Grading rubric

- **Correctness** (0–40): Valid syntax and expected DB state
    
- **Schema & Semantics** (0–30): Proper naming, charset/collation use
    
- **Data Integrity & Constraints** (0–20): Uses `IF NOT EXISTS`, valid encodings
    
- **Tests & Automation** (0–10): Acceptance tests provided and deterministic