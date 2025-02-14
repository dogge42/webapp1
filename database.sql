CREATE DATABASE LoginDB;
USE LoginDB;
CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password) VALUES
                                           ('admin', '123456'),
                                           ('user1', 'password1');

CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL,
                          quantity INT NOT NULL DEFAULT 0,
                          description TEXT
);


INSERT INTO products (name, price, quantity, description) VALUES
                                                              ('Product 1', 10.0, 0, 'Description for Product 1'),
                                                              ('Product 2', 20.0, 0, 'Description for Product 2');



