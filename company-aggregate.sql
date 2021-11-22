/* find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary */
select sum(Salary) as Total_Sal, 
       max(Salary) as Highest_Sal, 
       min(Salary) as Lowest_Sal, 
       avg(Salary) as Average_Sal
from EMPLOYEE;

/* find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary working under the Research Department */
select sum(Salary) as Total_Sal, 
       max(Salary) as Highest_Sal, 
       min(Salary) as Lowest_Sal, 
       avg(Salary) as Average_Sal
from EMPLOYEE, DEPARTMENT 
where Dno = Dnumber and Dname = 'Research';

/* retrieve the total number of employees in the company */
select count(*) from EMPLOYEE;

select count(*)
from EMPLOYEE, DEPARTMENT 
where Dno = Dnumber and 
      Dname = 'Research';


/* count the number of distinct salary values in the database */
select count(distinct Salary)
from EMPLOYEE;

/* retrieve the names of all employees who have two or more dependents */
select Fname, Lname 
from EMPLOYEE
where 
    (
        select count(*)
        from DEPENDENT 
        where Essn = Ssn
    ) >= 2;

/* for each department, retrieve the department number, the number of employees in the department, and their average salary */
select Dno, count(*), avg(Salary) 
from EMPLOYEE
group by Dno;

/* for each project, retrieve the project number, the project name, and the number of employees who work on that project */
select Pnumber, Pname, count(Essn)
from PROJECT, WORKS_ON 
where Pnumber = Pno 
group by Pnumber, Pname;

/* for each project on which more than two employees work, retrieve the project number the project name, and the number of employees who work on that project */
select Pnumber, Pname, count(*)
from PROJECT, WORKS_ON
where Pno = Pnumber 
group by Pnumber, Pname 
having count(*) > 2;


/* for each project, retrieve the project number, the project name, and the number of employees from department 5 who work on the project */
select P.Pnumber, P.Pname, count(*)
from PROJECT as P, 
     WORKS_ON as W, 
     EMPLOYEE as E
where P.Pnumber = W.Pno and
      W.Essn = E.Ssn and 
      E.Dno = 5 
group by P.Pnumber, P.Pname;


/* for each department that has more than five employees, retrieve the department number and the number of its employees who are making more than $40,000  */
select Dno, count(*)
from EMPLOYEE 
where Salary > 4000 and 
      Dno in 
        (
            select Dno
            from EMPLOYEE
            group by Dno 
            having count(*) > 5
        )
group by Dno;