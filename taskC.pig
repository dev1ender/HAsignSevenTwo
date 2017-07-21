emp = LOAD '/home/acadgild/Pig/employee_details.txt' USING PigStorage(',') AS (empId:int,empName:chararray,empSalary:int,empRating:int);
emp_expense = LOAD '/home/acadgild/Pig/employee_expenses.txt' AS (empId:int ,expense:int);
join_emp = JOIN emp by empId,emp_expense by empId;
join_emp_group = GROUP join_emp BY (emp::empId,emp::empName);
emp_total_expense = FOREACH join_emp_group GENERATE group,SUM(join_emp.emp_expense::expense)as TotalExpense;
Order_totalexpense = ORDER emp_total_expense BY TotalExpense DESC;
result_emp = LIMIT Order_totalexpense  1;
Dump result_emp;

