CREATE TABLE Orders (
    Order_ID NUMBER,
    Product_name VARCHAR2(50),
    Amount NUMBER(10,2)
);

INSERT INTO Orders VALUES (1, 'Monitor', 15000);
INSERT INTO Orders VALUES (2, 'Mouse', 8000);
INSERT INTO Orders VALUES (3, 'Keyboard', 25000);
INSERT INTO Orders VALUES (4, 'Mousepad', 5000);
INSERT INTO Orders VALUES (5, 'table', 12000);

COMMIT;
select * from ORDERS;

ALTER TABLE Orders
ADD value VARCHAR2(20);


DECLARE
    CURSOR order_cursor IS
        SELECT Order_ID, Product_Name, Amount
        FROM Orders;

    value VARCHAR2(20);

BEGIN
    FOR order_rec IN order_cursor LOOP

        IF order_rec.Amount > 10000 THEN
            value := 'High Value';
        ELSE
            value := 'Normal Value';
        END IF;

        UPDATE Orders
        SET value = value
        WHERE Order_ID = order_rec.Order_ID;

        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || order_rec.Order_ID ||
            ' | Product: ' || order_rec.Product_Name ||
            ' | Amount: ' || order_rec.Amount ||
            ' | Value: ' || value
        );

    END LOOP;

    COMMIT;
END;
/