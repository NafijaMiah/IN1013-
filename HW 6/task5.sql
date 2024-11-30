--1
SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(restBill.bill_no) AS number_of_bills
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;

--2
SELECT restRest_table.room_name, COUNT(restRest_table.table_no) AS tables_count
FROM restRest_table
WHERE restRest_table.no_of_seats > 6
GROUP BY restRest_table.room_name;

--3
SELECT restRoom_management.room_name, SUM(restBill.bill_total) AS total_bills
FROM restRoom_management
JOIN restBill ON restRoom_management.room_date = restBill.bill_date
GROUP BY restRoom_management.room_name;

--4
SELECT restStaff.first_name, restStaff.surname, SUM(restBill.bill_total) AS total_bill_amount
FROM restStaff
JOIN restRoom_management ON restStaff.staff_no = restRoom_management.headwaiter
JOIN restBill ON restRoom_management.room_date = restBill.bill_date
WHERE restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname
ORDER BY total_bill_amount DESC;

--5
SELECT restBill.cust_name
FROM restBill
GROUP BY restBill.cust_name
HAVING AVG(restBill.bill_total) > 400;
