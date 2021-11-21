/* make a list of all project numbers for projects that involved an employee whose last name is'Smith', either as a worker or as a manager of the deparment that controls the project */

select distinct Pnumber
from PROJECT 
where Pnumber in
(
      select Pno
      from WORKS_ON, EMPLOYEE 
      where Essn = Ssn and 
            Lname = 'Smith'
)
or Pnumber in
(
      select Pnumber 
      from PROJECT, DEPARTMENT, EMPLOYEE 
      where Dnum = Dnumber and 
            Mgr_ssn = Ssn and 
            Lname = 'Smith' 
);



/* select Essns of all employees who work the same (projects, hours) combination on some project that employee 'John Smith' (whose Ssn = '123456789') works on */

select distinct Essn 
from WORKS_ON 
where (Pno, Hours) in 
      (
            select Pno, Hours 
            from WORKS_ON 
            where Essn = '123456789'
      );


/* retrieves the names of employees whose salary is greater than the salary of all employees in department 5 */

select Fname, Lname 
from EMPLOYEE 
where Salary > all 
    (
        select Salary 
        from EMPLOYEE
        where Dno = 5
    );

/* retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee */
select E.Fname, E.Lname
from EMPLOYEE as E
where E.Ssn in 
    (
        select D.Essn 
        from DEPENDENT as D 
        where E.Fname = D.Dependent_name and
              E.Sex = D.Sex
    );

/* the above query can be rewritten as follows using a single sql block */
select E.Fname, E.Lname 
from EMPLOYEE as E, DEPENDENT as D
where E.Ssn = D.Essn and 
      E.Fname = D.Dependent_name and
      E.Sex = D.Sex
    
/* the above query can be rewritten as follows using the exists funxtion */
select E.Fname, E.Lname 
from EMPLOYEE as E 
where exists 
    (
        select * 
        from DEPENDENT as D 
        where E.Ssn = D.Essn and 
              E.Fname = D.Dependent_name and 
              E.Sex = D.Sex
    );


/* retrieve the names of employees who have no dependents */
select E.Fname, E.Lname 
from EMPLOYEE as E
where not exists 
    (
        select *
        from DEPENDENT as D 
        where E.Ssn = D.Essn
    );

/* list the names of managers who have at least one dependent */
select Fname, Lname 
from EMPLOYEE 
where exists 
    (
        select *
        from DEPENDENT
        where Essn = Ssn
    )
    and exists
    (
        select *
        from DEPARTMENT 
        where Mgr_ssn = Ssn
    );

/* using one nested query */
select E.Fname, E.Lname 
from EMPLOYEE as E
where exists 
    (
        select *
        from DEPENDENT, DEPARTMENT
        where Essn = E.Ssn and 
              Mgr_ssn = E.Ssn 
    );

/* no nested query */
select distinct Fname, Lname
from EMPLOYEE, DEPARTMENT, DEPENDENT 
where Ssn = Mgr_ssn and 
      Ssn = Essn;
