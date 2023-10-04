use learningmysql;
select *From cars_india_dataset;
select *From cars_india_dataset where maker='Hyundai' order by displacement;
select count(*) as 'total_count',maker from cars_india_dataset group by maker;
select count(*),seats from cars_india_dataset group by seats order by count(*) desc;
select count(*) as 'total_count',type from cars_india_dataset group by type having total_count>5;
select max(fuel) from cars_india_dataset;
Select distinct Model From cars_india_dataset;
select Model,fuel from cars_india_dataset;
select distinct Model,fuel,count(*) from cars_india_dataset group by fuel;
create table Department(dept_id int not null primary key,dept_name varchar(40) not null);
insert into Department values(101,'Finance');
insert into Department values(102,'HR');
insert into Department values(103,'Admin');
Alter table Employee add primary key(empid);
create table Employee(id INT Primary key Not Null,name varchar(40),address varchar(100),age INT,dept_Id INT,Foreign key(dept_Id) REFERENCES department(dept_id));
insert into Department values(106,'HR');
insert into Employee values(1,'Virat','Pune',30,101);
insert into Employee values(2,'Nilam','Pune',22,102);
insert into Employee values(3,'Kunal','Mumbai',30,101);
insert into Employee values(4,'Rutu','Pune',30,103);

#Inner Join
select e.id,e.name,d.dept_name From Department d inner join Employee e on e.dept_Id=d.dept_id;
#Left Join

select d.dept_id,d.dept_name,e.name from department d left join employee e on d.departmentid=e.deptid;
create database university;
use university;
create table students (s_id INT(10) NOT NULL AUTO_INCREMENT, s_firstname VARCHAR(30) NOT NULL, s_lastname VARCHAR(30) NOT NULL, s_email VARCHAR(40), PRIMARY KEY (s_id));
desc students;
insert into students (s_firstname,s_lastname,s_email) values ('Shankar', 'Bhat', 'shankar@example.com');
 insert into students (s_firstname,s_lastname,s_email) values ('Venkat', 'Rao', 'venkat@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Mohan', 'Nair', 'mohan@example.com');
insert into students (s_firstname,s_lastname,s_email) values ('Abhijeet', 'Patel', 'abhi@example.com');
select * from students;
select * from students where s_id='3';
create table Atable (aid int primary key);
  insert into atable values (1);
create table Btable (bid int primary key);
   insert into btable values (11);
create table ctable (aid int,bid int,foreign key(aid) references atable(aid),foreign key(bid) references btable(bid));
insert into ctable values(1,11);
select a.aid "A",b.bid "B" from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;
truncate ctable;

desc employee;
create table Atable (aid int primary key);
alter table atable add name varchar(20);
insert into atable values (1,'one');


create table Btable (bid int primary key);
alter table btable add name varchar(20);
insert into btable values (11,'eleven');



create table ctable (aid int,bid int,foreign key(aid) references atable(aid),foreign key(bid) references btable(bid));


insert into ctable values(1,11);

select a.aid "A",b.bid "B" from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;

select a.name,b.name from atable a,btable b, ctable c where b.bid=c.bid and c.aid = a.aid;
create table EmployeeNew(empid int not null primary key,name varchar(30),salary int );
create table departmentNew(deptid int not null primary key,deptname varchar(30));
create table organization(empid int,deptid int ,foreign key(empid) references EmployeeNew(empid),foreign key(deptid) references DepartmentNew(deptid));
desc organization;