
--TASK(A)

empLoad = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_details.txt' Using PigStorage(',') AS (empId : chararray ,empName : chararray, empSalary :int ,empRatings :int );

orderRatings = ORDER empLoad BY empRatings desc , empName asc;

trans = FOREACH orderRatings GENERATE empId , empName , empRatings ; 

top5Emp = LIMIT trans 5 ;

DUMP top5Emp ; 


--TASK2

empLoad = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_details.txt' Using PigStorage(',') AS (empId : chararray ,empName : chararray, empSalary :int ,empRatings :int );

filteredOdd = FILTER empLoad BY (int)empId%2 != 0 ;

highSalary = ORDER filteredOdd BY empSalary desc , empName asc;

trans = FOREACH highSalary GENERATE empId , empName , empSalary ; 

top3Emp = LIMIT trans 3 ; 

DUMP top3Emp ; 

--Task3

empLoad = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_details.txt' Using PigStorage(',') AS (empId : chararray ,empName : chararray, empSalary :int ,empRatings :int );

empExpenses = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_expenses.txt' Using PigStorage('\t') AS (empIdExp : chararray ,expenses : int);

joinEmp = JOIN empLoad by empId , empExpenses by empIdExp;

maxExpense = ORDER joinEmp BY expenses desc , empName asc; 

trans = FOREACH maxExpense GENERATE empId , empName , expenses ;

topExpEmployee = LIMIT trans 1 ;

DUMP topExpEmployee ; 

----Task4

empLoad = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_details.txt' Using PigStorage(',') AS (empId : chararray ,empName : chararray, empSalary :int ,empRatings :int );

empExpenses = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_expenses.txt' Using PigStorage('\t') AS (empIdExp : chararray ,expenses : int);

joinEmp = JOIN empLoad by empId , empExpenses by empIdExp;

trans = FOREACH joinEmp GENERATE empId , empName;

output_file = DISTINCT trans;

DUMP output_file ;

---Task5

empLoad = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_details.txt' Using PigStorage(',') AS (empId : chararray ,empName : chararray, empSalary :int ,empRatings :int );

empExpenses = LOAD '/home/cloudera/Desktop/Acadgild/5_1/employee_expenses.txt' Using PigStorage('\t') AS (empIdExp : chararray ,expenses : int);

joinEmp = JOIN empLoad by empId FULL OUTER , empExpenses by empIdExp;

noExpList = FILTER joinEmp by expenses is null; 

output_file = FOREACH noExpList GENERATE empId , empName ;

DUMP output_file ;








































 























