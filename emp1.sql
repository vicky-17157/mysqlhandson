create table items(
id int auto_increment primary key,
title varchar(30) not null,
price float

);

select * from items;
insert into items(title,price) values('chocolate', 200);

create table employee(
empid int primary key,
empname varchar(50) not null,
desig varchar(30) not null,
salary float,
city varchar(25) not null
);

select * from employee;
insert into employee(empid,empname,desig,salary,city) values(60,'arjun','team lead',40000,'kerala');
select empid,empname,desig,salary,city from employee where city='coimbatore';
select empid,empname,desig,salary,city from employee where desig='software developer';
select empid,empname,desig,salary,city from employee where salary >= 30000;
select empid,empname,desig,salary,city from employee where salary between 32000 and 39000;
select empid,empname,desig,salary,city from employee order by salary;
select empid,empname,desig,salary,city from employee order by desig;

create table myemployee(
emplid int auto_increment primary key,
emplname varchar(40) not null,
jobrole varchar(50) not null,
city varchar(50) not null,
dept_id int references department(dept_id)
);

create table department(
dept_id int auto_increment primary key,
deptname varchar(50) not null,
location varchar(50) not null
);

insert into department(deptname,location) values('marketing','sector 2');
select * from department;
insert into myemployee(emplname,jobrole,city,dept_id) values('yuvan','tester','coimbatore',4);
select * from myemployee;

select myemployee.emplname, myemployee.jobrole, department.deptname, department.location
from myemployee
join department
on(myemployee.dept_id=department.dept_id);

create table course(
courseid int auto_increment primary key,
coursename varchar(100) not null,
fee float
);
create table student(
stid int auto_increment primary key,
stname varchar(50) not null,
city varchar(50),
courseid int,
foreign key(courseid) references course(courseid)
);
insert into course(coursename,fee) values('azure',20000);
select * from course;
insert into student(stname,city,courseid) values('yuvan','coimbatore',2);
select * from student;

select student.stname,student.city, course.coursename,course.fee
from student
join course
on student.courseid=course.courseid;



create table exams(
examid int auto_increment primary key,
examname varchar(100) not null,
examtime varchar(100) not null,
courseid int,
foreign key(courseid) references courses(courseid)
);
create table corses(
courseid int auto_increment primary key,
coursename varchar(100) not null,
fee float,
examid int,
foreign key(examid) references exams(examid)
);
create table studens(
stid int auto_increment primary key,
stname varchar(50) not null,
city varchar(50),
courseid int,
foreign key(courseid) references course(courseid),
examid int,
foreign key(examid) references exam(examid)
);

insert into exams(examname,examtime,courseid) values('periodical III','january',4);
select * from exams;
insert into corses(coursename,fee,examid) values('electrical machines I',27000,5);
select * from corses;
insert into studens(stname,city,courseid,examid) values('allen','bangalore',3,3);
select * from studens;

select * from studens where stid >= 2;

select studens.stname,studens.city, corses.coursename,corses.fee
from studens
join corses
on studens.courseid=corses.courseid;

select studens.stname,studens.city, exams.examname,exams.examtime
from studens
join exams
on studens.examid=exams.examid;

select studens.stname, exams.examname
from studens
join corses on studens.courseid = corses.courseid
join exams on corses.examid = exams.courseid;

DELETE FROM studens WHERE stid = 1;


create table category(
cid int auto_increment primary key,
cname varchar(100) not null,
calories float
);
create table fooditems(
fid int auto_increment primary key,
fname varchar(50) not null,
fcost float,
cid int,
foreign key(cid) references category(cid)
);
insert into category(cname,calories) values('rice',59);
select * from category;
insert into fooditems(fname,fcost,cid) values('chicken',500,3);
select * from fooditems;

select fooditems.fname,fooditems.fcost, category.cname,category.calories
from fooditems
join category
on fooditems.cid=category.cid;

DELETE FROM fooditems WHERE fid = 6;