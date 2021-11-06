# drop library_management db if it exists
drop database if exists curling;

# create library_management db if it exists
create database if not exists curling;

# use database
use curling;

# drop all tables
drop table if exists WORKER;
drop table if exists SHEET;
drop table if exists DRAW;
drop table if exists WORKS;


-- #-----------------------------
-- # WORKER
-- #-----------------------------
create table WORKER (
    id int auto_increment,
    name varchar(35),
    address varchar(100),
    city varchar(20),
    primary key (id)
);


insert into WORKER values
(1, 'Rick Grimes', '123 Alexandria', 'Lethbridge'),
(2, 'Carl Grimes', '123 Alexandria', 'Lethbridge'),
(3, 'Daryl Dixon', '456 Whisperer Avenue', 'Miami'),
(4, 'Carol Peletier', '321 Terminus Boulevard', 'Harrisburg'),
(5, 'Sophia Peletier', '321 Terminus Boulevard', 'Harrisburg'),
(6, 'Merle Dixon', '457 Whisperer Avenue', 'Miami'),
(7, 'Negan', '900 Saviorville', 'Anchorage'),
(8, 'Ezekiel', 'Unit G 24 Street., The Kingdom', 'Calgary'),
(9, 'Eugene Porter', 'Unit B, 44 Avenue, Hilltop', 'Edmonton'),
(10, 'Father Gabriel', 'St. Angelicum Church', 'Lethbridge');
-- #-----------------------------
-- # WORKER
-- #-----------------------------



-- #-----------------------------
-- # SHEET
-- #-----------------------------
create table SHEET (
    sheetID int auto_increment,
    maint_time date,
    primary key (sheetID)
);

insert into SHEET values
(1, '2018-10-10'),
(2, '2018-12-25'),
(3, '2018-12-31'),
(4, '2019-05-12'),
(5, '2019-06-08'),
(6, '2019-06-09'),
(7, '2019-06-10'),
(8, '2020-10-11'),
(9, '2021-10-06'),
(10, '2021-11-02');
-- #-----------------------------
-- # SHEET
-- #-----------------------------

-- #-----------------------------
-- # DRAW
-- #-----------------------------
create table DRAW (
    drawID int,
    sheetID int,
    date varchar(35),
    time time,
    primary key (drawID),
    foreign key (sheetID) references SHEET(sheetID)
);

insert into DRAW values
(1, 2, 'October 6', '08:00:00'),
(2, 2, 'October 6', '14:00:00'),
(3, 2, 'October 6', '10:00:00'),
(4, 2, 'October 6', '11:00:00'),
(5, 2, 'November 1', '08:00:00'),
(6, 2, 'November 1', '14:00:00'),
(7, 2, 'November 1', '10:00:00'),
(8, 10, 'February 14', '08:00:00'),
(9, 10, 'February 14', '09:00:00'),
(10, 10, 'February 14', '14:00:00');
-- #-----------------------------
-- # DRAW
-- #-----------------------------


-- #-----------------------------
-- # WORKS
-- #-----------------------------
create table WORKS (
    id int,
    drawID int,
    pay float,
    primary key (id, drawID),
    foreign key (id) references WORKER (id),
    foreign key (drawID) references DRAW (drawID)
);

insert into WORKS values
(1, 8, 50.00),
(2, 8, 47.50),
(3, 8, 47.50),
(1, 9, 54.88),
(1, 7, 20.50),
(1, 6, 28.65),
(1, 5, 29.25),
(2, 9, 50.00),
(1, 10, 33.75),
(7, 10, 45.50),
(8, 10, 19.99),
(9, 10, 22.75),
(10, 10, 30.75),
(1, 4, 15.87),
(1, 3, 15.50),
(1, 2, 20.10),
(1, 1, 20.00),
(3, 7, 29.99);



-- #-----------------------------
-- # WORKS
-- #-----------------------------