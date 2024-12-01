-- 1
SELECT first_name, surname, bill_date, COUNT(*) AS num_bills
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no
GROUP BY waiter_no, bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT room_name, COUNT(*) AS num_tables
FROM restRest_table T1
WHERE no_of_seats > 6
GROUP BY room_name;
-- 3
SELECT room_name, SUM(bill_total) AS total_bills
FROM restRest_table T1
INNER JOIN restBill T2 
ON T1.table_no = T2.table_no
GROUP BY room_name;
-- 4
SELECT first_name AS headwaiter_first_name, 
       surname AS headwaiter_surname, 
       SUM(bill_total) AS total_bill_amount
FROM restStaff T1
INNER JOIN restStaff T2 
ON T1.staff_no = T2.headwaiter
INNER JOIN restBill T3
ON T1.staff_no = T3.waiter_no  
GROUP BY staff_no
ORDER BY total_bill_amount DESC;
-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;
-- 6
SELECT first_name, 
       surname, 
       bill_date, 
       COUNT(*) AS number_of_bills
FROM restBill T1
INNER JOIN restStaff T2 
ON T1.waiter_no = T2.staff_no
GROUP BY staff_no, bill_date
HAVING COUNT(*) >= 3;
