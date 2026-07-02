-- Backup Orders Table Migration
CREATE TABLE orders_backup (
    id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO orders_backup (id, customer_id, order_date, total)
SELECT id, customer_id, order_date, total
FROM orders;