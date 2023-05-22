create database testing_system_assignment_1;
use testing_system_assignment_1;

create table department (
department_ID int auto_increment primary key,
department_name varchar(20)
);

create table position (
position_ID int auto_increment primary key,
position_name varchar(20) 
);

create table account (
account_ID int auto_increment primary key,
email varchar(50),
user_name varchar(30),
full_name varchar(20),
department_ID int,
foreign key (department_ID) references department(department_ID),
position_ID int,
foreign key (position_ID) references `position`(position_ID),
create_date date
);

create table `group` (
group_ID int auto_increment primary key,
group_name varchar(20),
creator_ID int,
foreign key (creator_ID) references account(account_ID),
create_date date
);

create table group_account (
group_ID int,
foreign key (group_ID) references `group`(group_ID),
account_ID int,
foreign key (account_ID) references account(account_ID),
join_date date
);

create table type_question (
type_ID int auto_increment primary key,
type_name enum ('essay', 'Mutiple-choice')
);

create table category_question (
category_ID int primary key,
category_name varchar(30)
);

create table question (
question_ID int primary key auto_increment,
content varchar(100),
category_ID int,
foreign key (category_ID) references category_question(category_ID),
type_ID int,
foreign key (type_ID) references type_question(type_ID),
creator_ID int,
foreign key (creator_ID) references `group`(creator_ID),
create_date date
);

create table answer (
answer_ID int primary key auto_increment,
content varchar(1000),
question_ID int,
foreign key (question_ID) references question(question_ID),
is_correct enum('TRUE', 'FALSE')
);

create table exam (
exam_ID int primary key auto_increment,
`code` int,
title varchar(50),
category_ID int,
duration time,
creator_ID int,
foreign key (creator_ID) references account(account_ID),
create_date date
);

create table exam_question (
exam_ID int,
foreign key (exam_ID) references exam(exam_ID),
question_ID int,
foreign key (question_ID) references answer(question_ID)
);
