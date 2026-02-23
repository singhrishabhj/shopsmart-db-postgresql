# ShopSmart DB  
### A Production-Style PostgreSQL E-Commerce Backend

ShopSmart DB is a structured relational database project built using PostgreSQL to simulate the backend of a real-world e-commerce application.

The goal of this project was not just to practice SQL, but to design a system with proper normalization, strong data integrity enforcement, business reporting capability, QA-focused validation queries, and performance optimization awareness.

This project reflects backend engineering fundamentals with an SDET mindset.

---

## Project Objectives

- Design a clean relational schema from scratch  
- Enforce strict data validation at the database level  
- Write business-oriented analytical queries  
- Implement QA validation queries to detect inconsistencies  
- Optimize performance using indexing and query plan analysis  

---

## Database Architecture

The system consists of four core tables:

### 1. users  
Stores customer information with validation constraints.

### 2. products  
Manages product catalog with price and stock enforcement rules.

### 3. orders  
Tracks user purchases with controlled order status values.

### 4. order_items  
Acts as a junction table connecting orders and products while preserving historical pricing.

---

## Data Integrity and Validation

To ensure reliability, the schema includes:

- Primary and Foreign Keys  
- UNIQUE constraints  
- CHECK constraints (e.g., price > 0, stock ≥ 0)  
- Controlled order status values  
- Referential integrity rules using CASCADE and RESTRICT strategies  
- Default timestamp tracking  

These constraints prevent invalid or inconsistent data from entering the system and reduce dependency on application-layer validation.

---

## Business Queries Implemented

The project includes real-world reporting queries such as:

- Complete order details using multi-table JOINs  
- Total revenue calculation (excluding cancelled orders)  
- Top-selling products  
- Monthly revenue breakdown  
- Users who never placed an order  

These queries simulate backend reporting and analytics use cases commonly found in production systems.

---

## QA Validation Queries

To demonstrate SDET-level thinking, additional validation queries were implemented to detect:

- Orders where stored total does not match calculated totals  
- Products with invalid stock levels  
- Duplicate user emails  
- Orphaned relational records  

This ensures database-level quality control beyond standard business queries.

---

## Performance Optimization

Indexes were strategically added on frequently joined and filtered columns:

- users.email  
- orders.user_id  
- order_items.order_id  
- order_items.product_id  
- products.category  

Query execution plans were analyzed using:

EXPLAIN ANALYZE

to understand performance behavior and optimize query efficiency.

---

## Tech Stack

- PostgreSQL  
- SQL  
- pgAdmin  
- Git and GitHub  

---

## Project Structure

shopsmart-db-postgresql/
│
├── schema/
│ └── create_tables.sql
│
├── data/
│ └── sample_data.sql
│
├── queries/
│ ├── business_queries.sql
│ └── qa_validation_queries.sql
│
├── performance/
│ └── indexes.sql
│
└── README.md


---

## Key Takeaways

This project demonstrates:

- Strong understanding of relational database design  
- Defensive schema modeling  
- Business-driven SQL query writing  
- QA validation thinking at the database level  
- Awareness of performance tuning fundamentals  

---

## How to Run This Project

1. Create a PostgreSQL database:
   CREATE DATABASE shopsmart_db;

2. Run the schema script:
   Execute schema/create_tables.sql

3. Insert sample data:
   Execute data/sample_data.sql

4. Run business and QA queries:
   Execute files inside the queries/ folder

5. (Optional) Apply indexing:
   Execute performance/indexes.sql

---

## Project Summary

ShopSmart DB is a PostgreSQL-based e-commerce backend simulation designed to demonstrate strong database engineering fundamentals with an SDET mindset.

The system models four core entities: users, products, orders, and order_items, with proper normalization and relational integrity using primary and foreign keys.

The project emphasizes:

- Strict data validation through CHECK, UNIQUE, and referential constraints  
- Business-focused SQL queries including revenue reporting, analytics, and multi-table JOIN operations  
- QA-oriented validation queries to detect inconsistencies such as incorrect order totals, duplicate data, and orphan records  
- Performance optimization using indexing and query plan analysis with EXPLAIN ANALYZE  

The goal of this project was not just to build tables, but to design a reliable, testable, and performance-aware database system similar to what would be used in a production environment.

## Author

Rishabh Singh  
SDET | Automation Engineer  
SQL | Java | Selenium | API Testing | Agile
