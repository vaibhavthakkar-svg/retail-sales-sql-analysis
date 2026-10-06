# Retail Sales SQL Analysis

A portfolio project demonstrating SQL skills through 15+ queries of increasing complexity on a retail sales dataset. Covers basic filtering, joins, aggregations, subqueries, CTEs, and window functions. Includes an Excel dashboard summarizing key findings.

## Project Structure

```
retail-sales-sql/
├── README.md
├── schema_and_data.sql      # Table creation + sample data inserts
├── queries.sql              # 15+ analysis queries with comments
├── excel_dashboard.md       # Excel dashboard instructions + formulas
```

## Dataset Overview

The dataset simulates a small retail business with:
- **customers** – customer demographics
- **products** – product catalog with categories and prices
- **orders** – order headers with customer and date info
- **order_items** – line items linking orders to products

## Skills Demonstrated

| Skill | Details |
|---|---|
| SQL | SELECT, WHERE, GROUP BY, HAVING, ORDER BY |
| SQL | INNER JOIN, LEFT JOIN, multi-table joins |
| SQL | Subqueries and correlated subqueries |
| SQL | CTEs (WITH clauses) |
| SQL | Window functions (ROW_NUMBER, RANK, SUM OVER, LAG) |
| Excel | PivotTables, charts, conditional formatting |

## How to Run

### Option 1: SQLite (recommended, no install needed beyond sqlite3)
```bash
sqlite3 retail.db < schema_and_data.sql
sqlite3 retail.db < queries.sql
```

### Option 2: PostgreSQL
```bash
psql -U your_user -d your_db -f schema_and_data.sql
psql -U your_user -d your_db -f queries.sql
```

### Option 3: MySQL
```bash
mysql -u your_user -p your_db < schema_and_data.sql
mysql -u your_user -p your_db < queries.sql
```

> **Note:** Window functions require SQLite 3.25+, PostgreSQL 8.4+, or MySQL 8.0+. Most queries are ANSI SQL compatible.

## Query Summary

| # | Query | Concept |
|---|---|---|
| 1 | All customers | Basic SELECT |
| 2 | Products under $50 | WHERE filter |
| 3 | Orders in 2024 | Date filtering |
| 4 | Revenue per order | JOIN + calculation |
| 5 | Top 10 customers by spend | GROUP BY + ORDER BY |
| 6 | Sales by category | Multi-table JOIN |
| 7 | Customers with no orders | LEFT JOIN |
| 8 | Average order value | Subquery |
| 9 | Orders above average | Correlated subquery |
| 10 | Monthly revenue trend | GROUP BY date part |
| 11 | Cumulative revenue | Window SUM OVER |
| 12 | Customer spend rank | RANK() window function |
| 13 | Month-over-month growth | LAG() window function |
| 14 | Top product per category | ROW_NUMBER() + CTE |
| 15 | Customer lifetime value segments | CTE + CASE |
| 16 | Rolling 3-month revenue | Window frame |
| 17 | Repeat vs one-time buyers | CTE + aggregation |

## Excel Dashboard

See `excel_dashboard.md` for step-by-step instructions to build a dashboard from query results including:
- Monthly revenue trend line chart
- Sales by category pie chart
- Top 10 customers bar chart
- KPI summary cards

## Author

Built as a portfolio project to demonstrate SQL and data analysis skills.