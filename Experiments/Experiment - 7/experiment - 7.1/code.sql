create table staff(
    id INT,
    name varchar2 (20),
    salary INT
);

INSERT INTO staff values (1, 'Krissh', 100000);
INSERT INTO staff values (2, 'John', 50000);
INSERT INTO staff values (3, 'Kajal', 100000);
INSERT INTO staff values (4, 'Ram', 40000);
INSERT INTO staff values (5, 'someone', 60000);
INSERT INTO staff values (6, 'noone', 70000);
INSERT INTO staff values (7, 'Shyam', 40000);

select * from staff;


DECLARE
    CURSOR c_staff IS
        SELECT name, salary FROM (
            SELECT name, salary
            FROM Staff
            ORDER BY salary DESC
        )
        WHERE ROWNUM <= 5;

    v_name Staff.name%TYPE;
    v_salary Staff.salary%TYPE;
    
BEGIN
    OPEN c_staff;

    LOOP
        FETCH c_staff INTO v_name, v_salary;
        EXIT WHEN c_staff%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);
    END LOOP;

    CLOSE c_staff;
END;
/