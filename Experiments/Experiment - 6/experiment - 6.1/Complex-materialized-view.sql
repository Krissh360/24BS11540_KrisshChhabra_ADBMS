CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR(20),
    Category VARCHAR(20),
    Product_price INT NOT NULL
);

CREATE TABLE Orders_Details (
    Order_id INT PRIMARY KEY,
    Product_id INT,

    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);


INSERT INTO Products (Product_id, Product_name, Category, Product_price)
VALUES
    (1, 'Laptop', 'Electronics', 100000),
    (2, 'Phone', 'Electronics', 50000),
    (3, 'Refrigerator', 'Home Appliance', 40000),
    (4, 'TV', 'Home Appliance', 30000);

INSERT INTO Orders_Details (Order_id, Product_id)
VALUES
    (101, 1),
    (102, 2);

CREATE MATERIALIZED VIEW Unsold_Items AS
SELECT
    Product_name, Category, Product_price
FROM Products
WHERE Product_id NOT IN (
    SELECT Product_id
    FROM Orders_Details
);

SELECT * FROM Unsold_Items;