
CREATE TABLE customers (
    customer_id BIGINT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(50),
    city VARCHAR(100),
    province VARCHAR(100),
    country VARCHAR(100),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);

CREATE TABLE stores (
    store_id BIGINT PRIMARY KEY,
    store_name VARCHAR(255),
    city VARCHAR(100),
    province VARCHAR(100),
    country VARCHAR(100),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);

CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price NUMERIC(10,2),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);

CREATE TABLE employees (
    employee_id BIGINT PRIMARY KEY,
    store_id BIGINT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    job_title VARCHAR(100),
    salary NUMERIC(10,2),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    store_id BIGINT,
    order_timestamp TIMESTAMP,
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    total_amount NUMERIC(12,2),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);

CREATE TABLE order_items (
    order_item_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    product_id BIGINT,
    quantity INT,
    unit_price NUMERIC(10,2),
    line_amount NUMERIC(12,2),
    created_timestamp TIMESTAMP,
    updated_timestamp TIMESTAMP,
    is_active CHAR(1)
);
