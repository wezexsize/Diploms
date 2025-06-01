CREATE DATABASE IF NOT EXISTS webstore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE webstore;
CREATE TABLE IF NOT EXISTS users (
                                     id INT AUTO_INCREMENT PRIMARY KEY,
                                     username VARCHAR(50) UNIQUE NOT NULL,
                                     password VARCHAR(255) NOT NULL,
                                     role VARCHAR(20) DEFAULT 'user'
);
CREATE TABLE IF NOT EXISTS products (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(100) NOT NULL,
                                        description TEXT,
                                        price DECIMAL(10,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS orders (
                                      id INT AUTO_INCREMENT PRIMARY KEY,
                                      user_id INT NOT NULL,
                                      order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS order_items (
                                           id INT AUTO_INCREMENT PRIMARY KEY,
                                           order_id INT NOT NULL,
                                           product_id INT NOT NULL,
                                           quantity INT NOT NULL,
                                           price DECIMAL(10,2) NOT NULL,
                                           FOREIGN KEY (order_id) REFERENCES orders(id),
                                           FOREIGN KEY (product_id) REFERENCES products(id)
);
