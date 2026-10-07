-- 1. Create Employee table
CREATE TABLE Employee (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2),
    DEPARTMENT_NAME VARCHAR(100)
);


-- 2. Create the stored procedure
CREATE OR REPLACE PROCEDURE Insert_Employee(
    IN EMP_ID INT,
    IN EMP_NAME VARCHAR(100),
    IN SALARY NUMERIC(10,2),
    IN DEPARTMENT_NAME VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN

    -- 3. Check whether EMP_ID is even
    IF EMP_ID % 2 = 0 THEN

        -- 4. Raise exception for even EMP_ID
        RAISE EXCEPTION 'Even EMP_ID is not allowed. Only odd EMP_ID is allowed.';

    ELSE

        -- 5. Insert employee if EMP_ID is odd
        INSERT INTO Employee
        VALUES (EMP_ID, EMP_NAME, SALARY, DEPARTMENT_NAME);

        -- 6. Display success message
        RAISE NOTICE 'Employee inserted successfully.';

    END IF;

END;
$$;