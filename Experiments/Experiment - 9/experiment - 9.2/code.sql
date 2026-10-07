-- Create table
CREATE TABLE employee2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    per_hour_salary NUMERIC(10,2),
    working_hours NUMERIC(10,2),
    payable_amount NUMERIC(10,2)
);


-- Function to calculate payable amount
CREATE OR REPLACE FUNCTION CAL_PAYABLE()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.payable_amount := NEW.working_hours * NEW.per_hour_salary;

    IF NEW.payable_amount > 25000 THEN
        RAISE EXCEPTION 'PAYABLE AMOUNT GREATER THAN 25000 NOT ALLOWED';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;


-- Trigger to calculate payable amount
CREATE TRIGGER CAL_PAYABLEAMT
BEFORE INSERT OR UPDATE
ON EMPLOYEE2
FOR EACH ROW
EXECUTE FUNCTION CAL_PAYABLE();


-- Function to print message after operation
CREATE OR REPLACE FUNCTION PRINT_MSG()
RETURNS TRIGGER
AS
$$
BEGIN
    RAISE NOTICE 'ROWS UPDATED SUCCESSFULLY';

    RETURN NULL;
END;
$$
LANGUAGE PLPGSQL;


-- Drop old trigger if it already exists
DROP TRIGGER IF EXISTS PRINT_MSG ON EMPLOYEE2;


-- Trigger to print message
CREATE TRIGGER PRINT_MSG
AFTER INSERT OR UPDATE
ON EMPLOYEE2
FOR EACH STATEMENT
EXECUTE FUNCTION PRINT_MSG();


-- Insert data
INSERT INTO EMPLOYEE2
(emp_id, emp_name, per_hour_salary, working_hours, payable_amount)
VALUES
(101, 'Amit', 500, 8, 0),
(102, 'Rahul', 60, 7, 0),
(103, 'Priya', 550, 9, 0);


-- Display result
SELECT * FROM EMPLOYEE2;