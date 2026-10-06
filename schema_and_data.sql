-- ============================================================
-- Retail Sales Database: Schema and Sample Data
-- Compatible with SQLite, PostgreSQL, and MySQL (see notes)
-- ============================================================

-- Drop tables if they exist (run in order to respect FK deps)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- TABLES
-- ============================================================

CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    city          VARCHAR(50),
    state         VARCHAR(2),
    joined_date   DATE         NOT NULL
);

CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50)  NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER NOT NULL,
    order_date    DATE    NOT NULL,
    status        VARCHAR(20) DEFAULT 'completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id       INTEGER PRIMARY KEY,
    order_id      INTEGER NOT NULL,
    product_id    INTEGER NOT NULL,
    quantity      INTEGER NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,  -- price at time of purchase
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- CUSTOMERS (25 rows)
-- ============================================================

INSERT INTO customers VALUES (1,  'Alice',   'Martin',   'alice.martin@email.com',    'New York',      'NY', '2022-03-15');
INSERT INTO customers VALUES (2,  'Bob',     'Johnson',  'bob.j@email.com',            'Los Angeles',   'CA', '2022-05-20');
INSERT INTO customers VALUES (3,  'Carol',   'Williams', 'carol.w@email.com',          'Chicago',       'IL', '2022-07-01');
INSERT INTO customers VALUES (4,  'David',   'Brown',    'david.b@email.com',          'Houston',       'TX', '2022-08-14');
INSERT INTO customers VALUES (5,  'Eva',     'Jones',    'eva.jones@email.com',        'Phoenix',       'AZ', '2022-09-30');
INSERT INTO customers VALUES (6,  'Frank',   'Garcia',   'frank.g@email.com',          'Philadelphia',  'PA', '2023-01-10');
INSERT INTO customers VALUES (7,  'Grace',   'Miller',   'grace.m@email.com',          'San Antonio',   'TX', '2023-02-28');
INSERT INTO customers VALUES (8,  'Henry',   'Davis',    'henry.d@email.com',          'San Diego',     'CA', '2023-04-05');
INSERT INTO customers VALUES (9,  'Iris',    'Wilson',   'iris.w@email.com',           'Dallas',        'TX', '2023-05-19');
INSERT INTO customers VALUES (10, 'Jack',    'Moore',    'jack.moore@email.com',       'San Jose',      'CA', '2023-06-22');
INSERT INTO customers VALUES (11, 'Karen',   'Taylor',   'karen.t@email.com',          'Austin',        'TX', '2023-07-15');
INSERT INTO customers VALUES (12, 'Leo',     'Anderson', 'leo.a@email.com',            'Jacksonville',  'FL', '2023-08-03');
INSERT INTO customers VALUES (13, 'Mia',     'Thomas',   'mia.thomas@email.com',       'Columbus',      'OH', '2023-09-11');
INSERT INTO customers VALUES (14, 'Nathan',  'Jackson',  'nathan.j@email.com',         'Charlotte',     'NC', '2023-10-25');
INSERT INTO customers VALUES (15, 'Olivia',  'White',    'olivia.w@email.com',         'Indianapolis',  'IN', '2023-11-08');
INSERT INTO customers VALUES (16, 'Paul',    'Harris',   'paul.h@email.com',           'Seattle',       'WA', '2023-12-01');
INSERT INTO customers VALUES (17, 'Quinn',   'Martin',   'quinn.m@email.com',          'Denver',        'CO', '2024-01-14');
INSERT INTO customers VALUES (18, 'Rachel',  'Thompson', 'rachel.t@email.com',         'Boston',        'MA', '2024-02-20');
INSERT INTO customers VALUES (19, 'Sam',     'Clark',    'sam.clark@email.com',        'Portland',      'OR', '2024-03-05');
INSERT INTO customers VALUES (20, 'Tina',    'Lewis',    'tina.l@email.com',           'Atlanta',       'GA', '2024-04-18');
INSERT INTO customers VALUES (21, 'Uma',     'Lee',      'uma.lee@email.com',          'Miami',         'FL', '2024-05-22');
INSERT INTO customers VALUES (22, 'Victor',  'Walker',   'victor.w@email.com',         'Minneapolis',   'MN', '2024-06-30');
INSERT INTO customers VALUES (23, 'Wendy',   'Hall',     'wendy.h@email.com',          'Cleveland',     'OH', '2024-07-12');
INSERT INTO customers VALUES (24, 'Xander',  'Allen',    'xander.a@email.com',         'Pittsburgh',    'PA', '2024-08-01');
INSERT INTO customers VALUES (25, 'Yara',    'Young',    'yara.young@email.com',       'Tampa',         'FL', '2024-09-10');

-- ============================================================
-- PRODUCTS (20 rows)
-- ============================================================

INSERT INTO products VALUES (1,  'Wireless Headphones',   'Electronics',  89.99);
INSERT INTO products VALUES (2,  'Bluetooth Speaker',     'Electronics',  59.99);
INSERT INTO products VALUES (3,  'USB-C Hub',             'Electronics',  34.99);
INSERT INTO products VALUES (4,  'Laptop Stand',          'Electronics',  45.00);
INSERT INTO products VALUES (5,  'Mechanical Keyboard',   'Electronics', 119.99);
INSERT INTO products VALUES (6,  'Running Shoes',         'Apparel',      79.99);
INSERT INTO products VALUES (7,  'Yoga Pants',            'Apparel',      49.99);
INSERT INTO products VALUES (8,  'Winter Jacket',         'Apparel',     129.99);
INSERT INTO products VALUES (9,  'Baseball Cap',          'Apparel',      24.99);
INSERT INTO products VALUES (10, 'Sunglasses',            'Apparel',      39.99);
INSERT INTO products VALUES (11, 'Coffee Maker',          'Home',         89.99);
INSERT INTO products VALUES (12, 'Air Purifier',          'Home',        149.99);
INSERT INTO products VALUES (13, 'Throw Blanket',         'Home',         34.99);
INSERT INTO products VALUES (14, 'Desk Lamp',             'Home',         29.99);
INSERT INTO products VALUES (15, 'Scented Candle Set',    'Home',         19.99);
INSERT INTO products VALUES (16, 'Protein Powder',        'Health',       54.99);
INSERT INTO products VALUES (17, 'Resistance Bands',      'Health',       18.99);
INSERT INTO products VALUES (18, 'Foam Roller',           'Health',       24.99);
INSERT INTO products VALUES (19, 'Vitamin C Supplement',  'Health',       14.99);
INSERT INTO products VALUES (20, 'Water Bottle',          'Health',       22.99);

-- ============================================================
-- ORDERS (40 rows)
-- ============================================================

INSERT INTO orders VALUES (1,  1,  '2023-01-12', 'completed');
INSERT INTO orders VALUES (2,  2,  '2023-01-25', 'completed');
INSERT INTO orders VALUES (3,  3,  '2023-02-08', 'completed');
INSERT INTO orders VALUES (4,  4,  '2023-02-20', 'completed');
INSERT INTO orders VALUES (5,  5,  '2023-03-05', 'completed');
INSERT INTO orders VALUES (6,  1,  '2023-03-18', 'completed');
INSERT INTO orders VALUES (7,  6,  '2023-04-02', 'completed');
INSERT INTO orders VALUES (8,  7,  '2023-04-15', 'completed');
INSERT INTO orders VALUES (9,  2,  '2023-05-01', 'completed');
INSERT INTO orders VALUES (10, 8,  '2023-05-20', 'completed');
INSERT INTO orders VALUES (11, 9,  '2023-06-07', 'completed');
INSERT INTO orders VALUES (12, 10, '2023-06-22', 'completed');
INSERT INTO orders VALUES (13, 3,  '2023-07-10', 'completed');
INSERT INTO orders VALUES (14, 11, '2023-07-28', 'completed');
INSERT INTO orders VALUES (15, 12, '2023-08-14', 'completed');
INSERT INTO orders VALUES (16, 4,  '2023-08-30', 'completed');
INSERT INTO orders VALUES (17, 13, '2023-09-12', 'completed');
INSERT INTO orders VALUES (18, 1,  '2023-09-25', 'completed');
INSERT INTO orders VALUES (19, 14, '2023-10-08', 'completed');
INSERT INTO orders VALUES (20, 5,  '2023-10-22', 'completed');
INSERT INTO orders VALUES (21, 15, '2023-11-05', 'completed');
INSERT INTO orders VALUES (22, 2,  '2023-11-18', 'completed');
INSERT INTO orders VALUES (23, 16, '2023-12-01', 'completed');
INSERT INTO orders VALUES (24, 6,  '2023-12-15', 'completed');
INSERT INTO orders VALUES (25, 17, '2024-01-08', 'completed');
INSERT INTO orders VALUES (26, 7,  '2024-01-22', 'completed');
INSERT INTO orders VALUES (27, 18, '2024-02-05', 'completed');
INSERT INTO orders VALUES (28, 1,  '2024-02-19', 'completed');
INSERT INTO orders VALUES (29, 8,  '2024-03-04', 'completed');
INSERT INTO orders VALUES (30, 19, '2024-03-18', 'completed');
INSERT INTO orders VALUES (31, 9,  '2024-04-01', 'completed');
INSERT INTO orders VALUES (32, 20, '2024-04-15', 'completed');
INSERT INTO orders VALUES (33, 10, '2024-05-02', 'completed');
INSERT INTO orders VALUES (34, 21, '2024-05-20', 'completed');
INSERT INTO orders VALUES (35, 3,  '2024-06-08', 'completed');
INSERT INTO orders VALUES (36, 22, '2024-06-25', 'completed');
INSERT INTO orders VALUES (37, 11, '2024-07-10', 'completed');
INSERT INTO orders VALUES (38, 23, '2024-07-28', 'completed');
INSERT INTO orders VALUES (39, 2,  '2024-08-12', 'completed');
INSERT INTO orders VALUES (40, 24, '2024-09-01', 'completed');

-- ============================================================
-- ORDER ITEMS (80 rows — 2 items per order on average)
-- ============================================================

INSERT INTO order_items VALUES (1,  1,  1,  1,  89.99);
INSERT INTO order_items VALUES (2,  1,  3,  2,  34.99);
INSERT INTO order_items VALUES (3,