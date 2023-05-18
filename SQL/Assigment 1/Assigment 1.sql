create database Testing_System_Assigment_1;
Use Testing_System_Assigment_1;

create table department (
Department_ID int,
Department_name varchar(30)
);

create table Position (
Position_ID int,
Position_name varchar(30)
);

create table `Account` (
Account_ID int,
Email varchar(100),
user_name varchar(20),
Full_name varchar(40),
Department_ID int,
Position_ID int,
create_date date
);