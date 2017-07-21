emp = LOAD '/home/acadgild/Pig/employee_details.txt' USING PigStorage(',') AS (empId:int,empName:chararray,empSalary:int,empRating:int);
emp_order = ORDER emp BY empRating DESC,empName ASC;
emp_order_select = FOREACH emp_order  GENERATE empId,empName;
result = LIMIT emp_order_select 5;
dump result;
