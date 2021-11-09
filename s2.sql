create table student(
stid int auto_increment primary key,
stname varchar(50) not null,
city varchar(50),
courseid int,
foreign key(courseid) references course(courseid)
foreign key(examid) references exam(examid)
);