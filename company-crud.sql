/* create a temporary table that has the employee last name, project name, and hours per week for each employee working on a project */
drop table if exists WORKS_ON_INFO;

create table WORKS_ON_INFO (
      Emp_name varchar(15),
      Proj_name varchar(15),
      Hours_per_week decimal(3,1)
);

insert into WORKS_ON_INFO (Emp_name, Proj_name, Hours_per_week)
select E.Lname, P.Pname, W.Hours 
from EMPLOYEE E, PROJECT P, WORKS_ON W 
where E.Ssn = W.Essn and P.Pnumber = W.Pno;

/* create a table D5EMPS with similar structure to the EMPLOYEE table and load it with rows of employees who work in deparment 5 */
create table D5EMPS like EMPLOYEE 
(
      select E.*
      from EMPLOYEE E 
      where E.dno = 5;
)

/* delete an employee whose last name is Brown */
/* deletes 0 tuple */
delete from EMPLOYEE where Lname = 'Brown'; 

/* delete an employee whose Ssn is 123456789 */
/* deletes 1 tuple */
delete from EMPLOYEE where Ssn = '123456789';

/* delete all employee */
delete from EMPLOYEE;

/* change the location and controlling department number of project number 10 to 'Bellaire' and 5 respectively */
update PROJECT 
set Plocation = 'Bellaire', Dnum = 5
where Pnumber = 10;

/* Give all employees in the 'Research' department a 10% raise in salary */
update EMPLOYEE 
set Salary = Salary * 1.1 
where Dno = 5;