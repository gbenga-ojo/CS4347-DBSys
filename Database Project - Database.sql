create database company;
use company;

create table people (
ID int primary key,
gender varchar(10) not null,
city varchar(20),
state varchar(2),
zip varchar(5),
line1 int,
line2 int,
FName varchar(20) not null,
LName varchar(20) not null,
age int not null
);

create table department (
D_ID int primary key,
D_Name varchar(20) not null
);

create table positions (
J_ID int primary key,
J_Desc varchar(50) not null,
date_posted date not null,
D_ID int,

foreign key (D_ID) references department(D_ID)
);

create table product (
Pr_ID int primary key,
Pr_type varchar(20),
weight int, 
size int,
price decimal(5),
style varchar(20),
D_ID int,

foreign key (D_ID) references department(D_ID)
);

create table parts (
Pa_ID int primary key,
price decimal(5)
);

create table marketing_site (
site_ID int primary key,
site_name varchar(20) not null,
location varchar(20) unique not null,
D_ID int,

foreign key (D_ID) references department(D_ID)
);

create table vendor (
V_ID int primary key,
VName varchar(20) not null,
credit int not null,
address varchar(20),
account_no int not null,
url varchar(20) not null
);

create table interviews (
J_Pos varchar(20) primary key,
J_time time,
J_ID int,

foreign key (J_ID) references positions(J_ID)
);

create table interviewees (
J_Pos varchar(20) not null,
J_ID int not null,
interviewees varchar(20),

foreign key (J_Pos) references interviews(J_Pos),
foreign key (J_ID) references positions(J_ID),
primary key (J_Pos, J_ID)
);

create table interviewers (
J_Pos varchar(20) not null,
J_ID int not null,
interviewers_name varchar(20),
interviewers_ID int not null,

foreign key (J_Pos) references interviews(J_Pos),
foreign key (J_ID) references positions(J_ID),
primary key (J_Pos, J_ID, interviewers_ID)
);

create table parts_use (
Used_in varchar(20),
amount int not null,
Pa_ID int not null,

foreign key (Pa_ID) references parts(Pa_ID),
primary key (Used_in, Pa_ID)
);

create table employee (
E_ID int primary key,
E_Rank varchar(20) not null,
title varchar(20) not null,
D_ID int,
S_ID int,

foreign key (E_ID) references people(ID),
foreign key (D_ID) references department(D_ID)
);

alter table employee
 add constraint Emp_emp foreign key (S_ID) references employee(E_ID);

create table pay (
E_ID int not null,
E_transaction int not null,
pay_date date not null,
amount int not null,

foreign key (E_ID) references employee(E_ID),
primary key (E_ID, pay_date)
);

create table customer (
C_ID int primary key,
Preferred_Salespeople varchar(20),
foreign key (C_ID) references people(ID)
);

create table candidate (
Can_ID int primary key,
foreign key (Can_ID) references people(ID)
);

create table grades (
Can_ID int primary key,
average int,
num_passed int,
foreign key (Can_ID) references candidate(Can_ID)
);

create table end_time (
end_time time not null,
E_ID int not null,
D_ID int not null,

foreign key (E_ID) references employee(E_ID),
foreign key (D_ID) references department(D_ID),
primary key(D_ID, E_ID)
);

create table start_time (
start_time time not null,
E_ID int not null,
D_ID int not null,

foreign key (E_ID) references employee(E_ID),
foreign key (D_ID) references department(D_ID),
primary key(D_ID, E_ID)
);

create table applies_to (
Can_ID int not null,
J_ID int not null,

foreign key (Can_ID) references candidate(Can_ID),
foreign key (J_ID) references positions(J_ID),
primary key(Can_ID, J_ID)
);

create table works_on (
E_ID int not null,
Site_ID int not null,

foreign key (E_ID) references employee(E_ID),
foreign key (Site_ID) references Marketing_Site(Site_ID),
primary key (E_ID, Site_ID)
);

create table buys (
Pa_ID int not null,
D_ID int not null,

foreign key (Pa_ID) references parts(Pa_ID),
foreign key (D_ID) references department(D_ID),
primary key (Pa_ID, D_ID)
);

create table sells (
Pr_ID int not null,
D_ID int not null,

foreign key (Pr_ID) references product(Pr_ID),
foreign key (D_ID) references department(D_ID),
primary key (Pr_ID, D_ID)
);

create table sale_history (
Site_ID int not null,
C_ID int not null,
sale_time time not null,
Salesperson varchar(20),
Pr_ID int not null,

foreign key (Site_ID) references marketing_site(Site_ID),
foreign key (C_ID) references customer(C_ID),
foreign key (Pr_ID) references product(Pr_ID),
primary key(Site_ID, C_ID, sale_time)
);