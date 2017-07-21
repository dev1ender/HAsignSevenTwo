emp = LOAD '/home/acadgild/Pig/employee_details.txt' USING PigStorage(',') AS (empId:int, empName:chararray, empSalary:int, empRating:int);
expenses = LOAD '/home/acadgild/Pig/employee_expenses.txt' AS (empId:int, empExpenses:int);
emp_expenses = JOIN emp BY empId LEFT OUTER, expenses BY empId;
emp_data = FILTER emp_expenses BY expenses::empId is null;
dump emp_data;

