CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO users (name, email, is_active) VALUES
('Данила','danila@test.com', TRUE),
('Анна','anna@test.com', TRUE),
('Петр','petr@test.com', FALSE),
('Мария','danila@test.com', TRUE),
('Иван','ivan@test.com', TRUE);

INSERT INTO orders (user_id, total, status) VALUES
(1, 1500.00, 'completed'),
(1, 300.00, 'pending'),
(2, 750.50, 'completed'),
(3, 200.00, 'cancelled'),
(5, 999.99, 'completed');

INSERT INTO order_items (order_id, product_name, price, quantity) VALUES
(1, 'Ноутбук', 1200.00, 1),
(1, 'Мышь', 300.00, 1),
(2, 'Клавиатура', 300.00, 1),
(3, 'Монитор', 750.50, 1),
(4, 'Наушники', 200.00, 1),
(5, 'Планшет', 499.99, 1),
(5, 'Чехол', 500.00, 1);
