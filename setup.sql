-- Sample SQL schema for demonstration
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    quantity INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Sample data
INSERT INTO users (user_id, username, email) VALUES
(1, 'alice', 'alice@example.com'),
(2, 'bob', 'bob@example.com'),
(3, 'charlie', 'charlie@example.com');

INSERT INTO orders (order_id, user_id, product_name, quantity, order_date) VALUES
(101, 1, 'Laptop', 1, '2023-10-01'),
(102, 1, 'Mouse', 2, '2023-10-05'),
(103, 2, 'Keyboard', 1, '2023-10-03'),
(104, 3, 'Monitor', 1, '2023-10-07');