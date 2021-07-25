Create database Animal_Rescue_Center;
use Animal_Rescue_Center;

create table Kinds_animal(
	ani_ID varchar(5) primary key,
    ani_kind varchar(20) not null
);

create table Rescued_animal(
	res_date date not null,
	ani_ID varchar(5),
	res_ID int,
    ani_name varchar(20) not null unique,
    locate varchar(100) not null,
check (res_date <= now()),
foreign key (ani_ID) references Kinds_animal(ani_ID),
primary key (ani_ID, res_ID)
); 

create table Adopters(
	adt_ID int primary key auto_increment,
    adt_name varchar(30) not null,
    phone_num char(10) not null unique,
    email varchar(50),
    address varchar(100)
);
create table Released_animal(
	rel_date date not null,
    ani_ID varchar(5),
    res_ID int,
    note text,
check (rel_date <= now()),
foreign key (ani_ID, res_ID) references Rescued_animal(ani_ID, res_ID),
primary key (ani_ID, res_ID)
);
create table Adopted_history(
	adopted_date date not null,
    ani_ID varchar(5),
    res_ID int,
    adt_ID int,
check (adopted_date <= now()),
foreign key (ani_ID, res_ID) references Rescued_animal(ani_ID, res_ID),
foreign key (adt_ID) references Adopters(adt_ID),
primary key (ani_ID, res_ID)
);
create table Health_status(
	check_date date not null,
    ani_ID varchar(5),
	res_ID int,
    ani_status text not null,
Check (check_date <= now()),
foreign key (ani_ID, res_ID) references Rescued_animal(ani_ID, res_ID),
primary key (check_date, ani_ID, res_ID)
);
create table Cost_types(
	cost_ID varchar(5) primary key,
    cost_name varchar(20) not null
);

create table Bill_history(
	bill_date date not null,
	bill_ID int primary key auto_increment,
    cost_ID varchar(5),
    cost int not null,
check (bill_date <= now()),
foreign key (cost_ID) references Type_cost(cost_ID)
);
create table Donors(
	donor_ID varchar(5) primary key,
    donor_name varchar(30) not null,
    phone char(10) unique
);
create table Donation_goods(
	goods_ID varchar(5) primary key,
    goods_name varchar(20)
);
create table Donation_history(
	donation_date date not null,
	donation_ID int primary key auto_increment,
    donor_ID varchar(5),
    goods_ID varchar(5),
    note text,
check (donation_date <= now()),
foreign key (donor_ID) references Donor(donor_ID),
foreign key (goods_ID) references Donation_goods(goods_ID)
);
create table Departments(
	dep_ID varchar(5) primary key,
    dep_name varchar(50) not null
);
create table Jobs(
	job_ID varchar(5) primary key,
    job_name varchar(50) not null,
    dep_ID varchar(5),
foreign key (dep_ID) references Departments(dep_ID)
);
create table Employees(
	emp_ID int primary key auto_increment,
    emp_name varchar(30) not null,
    job_ID varchar(5),
    phone_num char(10),
    email varchar(50) not null,
    address varchar(50),
foreign key (job_ID) references Jobs(job_ID)
);
-- ------------------Select All-----------------------

select * from kinds_animal;
select * from rescued_animal;
select * from Adopters;
select * from Adopted_history;
select * from released_animal;
select * from health_status;
select * from donors;
select * from donation_goods;
select * from donation_history;
select * from cost_types;
select * from bill_history;
select* from employees;
select * from jobs;
select * from departments; 

-- -----------------Set SQL -------------------------
-- set foreign_key_checks = 0;
-- set SQL_safe_updates = 0;

-- ------------------Drop----------------------------
-- drop table
-- drop database










