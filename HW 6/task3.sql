--1
SELECT DISTINCT first_name, surname
FROM restBill
JOIN restStaff ON waiter_no = staff_no
WHERE cust_name = 'Tanya Singh';

--2
SELECT restRoom_management.room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restRoom_management.room_name = 'Green'
  AND restStaff.first_name = 'Charles'
  AND restRoom_management.room_date BETWEEN 160201 AND 160229;

--3
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT restStaff.headwaiter
    FROM restStaff
    WHERE restStaff.first_name = 'Zoe' AND restStaff.surname = 'Ball'
);

--4
SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

--5
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no IN (
    SELECT restBill.waiter_no
    FROM restBill
    WHERE restBill.table_no IN (
        SELECT DISTINCT restBill.table_no
        FROM restBill
        WHERE restBill.bill_no IN (00014, 00017)
    )
);

--6
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no IN (
    SELECT restBill.waiter_no
    FROM restBill
    JOIN restRest_table ON restBill.table_no = restRest_table.table_no
    WHERE restRest_table.room_name = 'Blue' AND restBill.bill_date = 160312
)
OR restStaff.staff_no = (
    SELECT restRoom_management.headwaiter
    FROM restRoom_management
    WHERE restRoom_management.room_name = 'Blue' AND restRoom_management.room_date = 160312
);
