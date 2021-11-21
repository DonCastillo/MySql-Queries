/* Retrieve the birth date and address of the employees whose name is 'John B. Smith' */
select Bdate, Address 
from EMPLOYEE
where Fname = 'John' and 
      Minit = 'B' and 
      Lname = 'Smith';

/* Retrieve the name and address of all employees who work for the 'Research' department */
select Fname, Minit, Lname, Address
from EMPLOYEE, DEPARTMENT
where Dno = Dnumber and 
      Dname = 'Research';

/* For every project located in 'Stafford', list the project number, the controlling department number, and the department manager's last name, address, and birth date */
select Pnumber, Dnum, Lname, Address, Bdate 
from PROJECT, DEPARTMENT, EMPLOYEE 
where Dnum = Dnumber and 
      Mgr_ssn = Ssn and 
      Plocation = 'Stafford';

/* For each employee, retrieve the employee's first and last name and the first and last name of his or her immediate supervisor */
select E.Fname as emp_fName, 
       E.Lname as emp_lName, 
       S.Fname as sup_fName, 
       S.Lname as sup_lName 
from EMPLOYEE as E, EMPLOYEE as S
where E.Super_ssn = S.Ssn;

/* Retrieves all the attribute values of any employee who works in department number 5 */
select * 
from EMPLOYEE
where Dno = 5;

/* Retrieves all the attributes of an employee and the attributes of the deparment in which he or she works for every employee of the 'Research' department */
select *
from EMPLOYEE, DEPARTMENT 
where Dno = Dnumber and 
      Dname = 'Research';

/* specifies the cross product of the employee and department relations */
select * from EMPLOYEE, DEPARTMENT;

/* retrieve the salary of every employee */
select all Salary from EMPLOYEE;

/* retrieve all distinct salary of every employee */
select distinct Salary from EMPLOYEE;

/* make a list of all project numbers for projects that involved an employee whose last name is'Smith', either as a worker or as a manager of the deparment that controls the project */
(
    select distinct Pnumber
    from PROJECT, WORKS_ON, EMPLOYEE 
    where Pnumber = Pno and 
        Essn = Ssn and 
        LName = 'Smith'
)
union
(
    select distinct Pnumber 
    from PROJECT, DEPARTMENT, EMPLOYEE 
    where Dnum = Dnumber and
          Mgr_ssn = Ssn and 
          Lname = 'Smith'
);



/* retrieve any employees who do not have a supervisor */
select Fname, Lname 
from EMPLOYEE 
where Super_ssn is null;

