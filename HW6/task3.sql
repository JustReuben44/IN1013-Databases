--1
SELECT first_name
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
WHERE cust_name = "Tanya Singh";
--2
SELECT room_date
FROM restRoom_management T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
WHERE room_name = "Green" AND first_name = "Charles" AND room_date LIKE '1602%';
--3
SELECT T1.first_name, T1.surname
FROM restStaff T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.headwaiter
WHERE T2.first_name = "Zoe" AND T2.surname = "Ball";
--4
SELECT cust_name,bill_total,first_name
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no
ORDER BY bill_total DESC;
--5
SELECT first_name, surname
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
WHERE T2.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN ('OOO14', '00017')
);


--6
SELECT DISTINCT first_name, surname
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
INNER JOIN restRest_table T3
ON T2.table_no = T3.table_no
WHERE room_name = 'Blue' AND bill_date = 160312
UNION
SELECT first_name, surname
FROM restStaff T1
INNER JOIN restRoom_management T2
ON T1.headwaiter = T2.headwaiter
WHERE room_name = 'Blue' AND room_date = 160312;


