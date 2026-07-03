-- Backup Orders Table Migration
CREATE TABLE orders_backup (
    id BIGINT NOT NULL,
    customer_id BIGINT,
    order_date DATE,
    total DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);