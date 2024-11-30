--1
SELECT DISTINCT restBill.cust_name
FROM restBill
JOIN restRoom_management ON restBill.bill_date = restRoom_management.room_date
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total > 450.00
  AND restStaff.first_name = 'Charles';

--2
SELECT restStaff.first_name, restStaff.surname
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restRoom_management.room_date = 160111
  AND restRoom_management.room_name IN (
    SELECT restRest_table.room_name
    FROM restRest_table
    JOIN restBill ON restRest_table.table_no = restBill.table_no
    WHERE restBill.cust_name = 'Nerida Smith' AND restBill.bill_date = 160111
  );

--3
SELECT restBill.cust_name
FROM restBill
WHERE restBill.bill_total = (
    SELECT MIN(restBill.bill_total)
    FROM restBill
);

--4
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no NOT IN (
    SELECT restBill.waiter_no
    FROM restBill
);

--5
SELECT restBill.cust_name, restStaff.first_name, restStaff.surname, restRoom_management.room_name
FROM restBill
JOIN restRoom_management ON restBill.bill_date = restRoom_management.room_date
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (
    SELECT MAX(restBill.bill_total)
    FROM restBill
);