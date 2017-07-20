emp = LOAD '/home/acadgild/Pig/employee_details.txt' USING PigStorage(',') AS (empId:int,empName:chararray,empSalary:int,empRating:int);
emp_oddNo = FILTER emp by (empId%2 !=0);
emp_oddNo_order= ORDER emp_oddNo BY empSalary DESC, empName ASC;
emp_oddNo_order_select = FOREACH emp_oddNo_order GENERATE empId,empName;
result = LIMIT emp_oddNo_order_select 3;
DUMP result;

