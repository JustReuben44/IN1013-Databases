-- 1
SELECT DISTINCT cust_name
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no
WHERE bill_total > 450.00 AND headwaiter = (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = "Charles"
);
-- 2
SELECT first_name, surname
FROM restBill T1
INNER JOIN restRest_table T2 
ON T1.table_no = T2.t.table_no
INNER JOIN restRoom_management T3 
ON T2.room_name = T3.room_name AND T2.bill_date = T3.room_date
INNER JOIN restStaff T4 ON T3.headwaiter = T4.staff_no
WHERE cust_name = 'Nerida Smith' AND bill_date = 160111;
-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);
-- 4
SELECT first_name, surname
FROM restStaff T1
LEFT JOIN restBill T2 
ON T1.staff_no = T2.waiter_no
WHERE waiter_no IS NULL;
-- 5
SELECT cust_name, first_name AS headwaiter_first_name, surname AS headwaiter_surname, room_name
FROM restBill T1
INNER JOIN restRest_table T2 
ON T1.table_no = T2.table_no
INNER JOIN restRoom_management T3 
ON T2.room_name = T3.room_name AND T2.bill_date = T3.room_date
INNER JOIN restStaff T4 
ON T3.headwaiter = T4.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
