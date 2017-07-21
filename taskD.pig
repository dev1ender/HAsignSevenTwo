emp = LOAD '/home/acadgild/Pig/employee_details.txt' USING PigStorage(',') AS (empId:int, empName:chararray, empSalary:int, empRating:int);
expenses = LOAD '/home/acadgild/Pig/employee_expenses.txt' AS (empId:int, empExpenses:int);
emp_expenses = JOIN emp BY empId, expenses BY empId;
emp_data = FOREACH emp_expenses GENERATE emp::empId, emp::empName;
result = DISTINCT emp_data;
dump result;
