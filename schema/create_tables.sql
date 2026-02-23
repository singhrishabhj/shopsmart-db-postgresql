-- ShopSmart DB - Database Schema

-- USERS TABLE

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT name_not_empty CHECK (length(trim(name)) > 0),
    CONSTRAINT email_format_check CHECK (email LIKE '%@%'),
    CONSTRAINT created_at_not_future CHECK (created_at <= CURRENT_TIMESTAMP)
);


-- PRODUCTS TABLE

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INTEGER NOT NULL,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT product_name_not_empty CHECK (length(trim(name)) > 0),
    CONSTRAINT price_positive CHECK (price > 0),
    CONSTRAINT stock_non_negative CHECK (stock_quantity >= 0)
);


-- ORDERS TABLE

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    total_amount NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT valid_status
        CHECK (status IN ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED')),

    CONSTRAINT total_amount_non_negative
        CHECK (total_amount >= 0)
);


-- ORDER_ITEMS TABLE

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    price_at_purchase NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE RESTRICT,

    CONSTRAINT quantity_positive CHECK (quantity > 0),
    CONSTRAINT order_item_price_positive CHECK (price_at_purchase > 0)
);



--SELECT table_name
--FROM information_schema.tables
--WHERE table_schema = 'public';