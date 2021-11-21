# drop library_management db if it exists
drop database if exists company;

# create library_management db if it exists
create database if not exists company;

# use database
use company;

# drop all tables
drop table if exists EMPLOYEE;
drop table if exists DEPARTMENT;
drop table if exists DEPT_LOCATIONS;
drop table if exists PROJECT;
drop table if exists WORKS_ON;
drop table if exists DEPENDENT;


create table EMPLOYEE (
    Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    primary key (Ssn)
);

insert into EMPLOYEE values
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

create table DEPARTMENT (
    Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references EMPLOYEE (Ssn)
);

insert into DEPARTMENT values
('Research', 5, '333445555', '1988-05-22'),
('Administration', 4, '987654321', '1995-01-01'),
('Headquarters', 1, '888665555', '1981-06-19');


create table DEPT_LOCATIONS (
    Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references DEPARTMENT (Dnumber)
);

insert into DEPT_LOCATIONS values
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

create table PROJECT (
    Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references DEPARTMENT (Dnumber)
);

insert into PROJECT values
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

create table WORKS_ON (
    Essn char(9) not null,
    Pno int not null, 
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    foreign key (Essn) references EMPLOYEE (Ssn),
    foreign key (Pno) references PROJECT (Pnumber)
);

insert into WORKS_ON values 
('123456789', 1, 32.5), 
('123456789', 2, 7.5), 
('666884444', 3, 40.0), 
('453453453', 1, 20.0), 
('453453453', 2, 20.0), 
('333445555', 2, 10.0), 
('333445555', 3, 10.0), 
('333445555', 10, 10.0), 
('333445555', 20, 10.0), 
('999887777', 30, 30.0), 
('999887777', 10, 10.0), 
('987987987', 10, 35.0), 
('987987987', 30, 5.0), 
('987654321', 30, 20.0), 
('987654321', 20, 15.0), 
('888665555', 20, NULL); 

create table DEPENDENT (
    Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references EMPLOYEE (Ssn) 
);  

insert into DEPENDENT values
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');