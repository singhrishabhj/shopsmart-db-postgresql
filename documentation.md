# ShopSmart DB – SDET Documentation

## Overview

This document outlines the quality assurance strategy, validation logic, and database-level testing mindset applied while designing the ShopSmart DB project.

The objective was not only to build a relational database schema, but to approach it from a Software Development Engineer in Test (SDET) perspective, ensuring data integrity, reliability, and performance awareness.

---

## 1. Testing Philosophy

The database was designed using a defensive engineering approach:

- Do not trust external input
- Enforce validation at the lowest level (database layer)
- Prevent invalid states instead of detecting them later
- Ensure referential integrity through strict constraints
- Validate business rules using SQL-based assertions

---

## 2. Data Integrity Strategy

### 2.1 Primary and Foreign Keys

- All tables use primary keys for uniqueness.
- Foreign keys enforce relational consistency.
- `ON DELETE CASCADE` and `ON DELETE RESTRICT` strategies were applied intentionally to simulate real production decisions.

This prevents orphaned or inconsistent records.

---

### 2.2 CHECK Constraints

The following validations were enforced at schema level:

- Product price must be greater than zero.
- Stock quantity must be non-negative.
- Order total amount must be non-negative.
- Order status restricted to controlled values.
- User name cannot be empty.
- Email must follow basic format rule.

This ensures invalid data never enters the system.

---

## 3. Business Logic Validation Queries

In addition to schema constraints, validation queries were implemented to simulate data auditing.

### 3.1 Order Total Validation

A query checks whether:

stored order total = SUM(quantity × price_at_purchase)

This helps detect:
- Calculation bugs
- Rounding errors
- Inconsistent transactional updates

---

### 3.2 Duplicate Detection

Although UNIQUE constraints exist, validation queries were written to detect:

- Duplicate emails
- Data anomalies

This simulates real-world production data audits.

---

### 3.3 Orphan Record Detection

LEFT JOIN validation queries detect:

- Order items without corresponding orders
- Broken relational mappings

This reflects production-grade data health monitoring.

---

## 4. Edge Case Considerations

The schema accounts for several edge cases:

- Prevent negative inventory
- Prevent zero or negative pricing
- Restrict invalid order status values
- Preserve historical product pricing in order_items

Storing `price_at_purchase` ensures that future price updates do not affect historical orders.

---

## 5. Performance Awareness

Indexes were added based on:

- High-frequency JOIN columns
- Lookup-heavy attributes (email)
- Analytical query fields

Query execution plans were analyzed using EXPLAIN ANALYZE to observe:

- Sequential scans
- Index scans
- Join strategies

Even though the dataset is small, the structure simulates performance-conscious design.

---

## 6. Risk Areas in Real Systems

If extended to production scale, attention would be required for:

- Concurrency control in stock updates
- Transaction isolation levels
- Deadlock handling
- Bulk insert performance
- Index maintenance overhead

These considerations demonstrate awareness beyond basic SQL implementation.

---

## 7. SDET Mindset Applied

This project demonstrates:

- Preventive validation rather than reactive debugging
- Database-level quality control
- Business rule enforcement through SQL
- Audit-style verification queries
- Performance analysis awareness

The focus was to build not just a schema, but a testable, reliable, and production-conscious system.

---

## Author

Rishabh Singh  
SDET | Automation Engineer  
SQL | Java | Selenium | API Testing | Agile