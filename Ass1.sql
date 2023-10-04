create database LibrarySystem;
use LibrarySystem;
#Member – It contains information about the members
create table Members(Member_Id INT,Member_Name Varchar(30),Member_address Varchar(50),Acc_Open_Date Date,Membership_type enum('Lifetime','Annual','Half Yearly','Quarterly'),Fees_paid INT,Max_Books_Allowed INT,Penalty_Amount INT);
desc Members;

#Books- It contains information about the books belongs to the library
create table Books(Book_No INT,Book_Name varchar(30),Author_name varchar(30),Cost INT,Category char(10));

#Issue – It contains the information about issue of the books
create table Issue(Lib_Issue_Id INT,Book_No INT,Member_Id INT,Issue_Date date,Return_Date date);
desc Issue;
drop table Members;
#4)	Create the table Member again as per the schema description with the following constraints.
#a.	Member_Id – Primary Key
#b.	Membership_type - ‘Lifetime’,’ Annual’, ‘Half Yearly’,’ Quarterly’

create table Members(Member_Id INT not null,Member_Name Varchar(20),Member_address Varchar(50),Acc_Open_Date Date,Membership_type enum('Lifetime','Annual','Half Yearly','Quarterly'),Fees_paid INT,Max_Books_Allowed INT,Penalty_Amount INT,primary key(Member_Id));
desc Members;
#5)Modify the table Member increase the width of the member name to 30 characters
ALTER TABLE Members  
MODIFY Member_Name varchar(30); 
desc members;
#6)Add a column named as Reference of Char(30) to Issue table.
ALTER TABLE issue
Add column Reference Char(30);
#7)Delete/Drop the column Reference from Issue.
ALTER TABLE Issue drop column Reference;
#8)	Rename the table Issue to Lib_Issue.
alter table issue rename Lib_Issue;
#9)	Insert following data in table Member
insert into members values(1,'Richa Sharma','Pune','10-12-05','Lifetime',25000,5,50);
insert into members values(2,'Garima Sen','Pune',current_date(),'Annual',1000,3,null);
#10)Insert at least 5 records with suitable data and save it.
insert into members values(3,'Rupali Wagh','Nashik','10-11-05','Lifetime',35000,10,100);
insert into members values(4,'Ayesha Pathan','Kharadi','10-2-05','Half Yearly',20000,5,50);
insert into members values(5,'Nilam Patil','Kharadi','10-10-25','Lifetime',25000,5,100);
insert into members values(6,'Yash Varma','Pune','10-12-05','Quarterly',10000,5,50);
insert into members values(7,'Madhur Patil','Pune','10-12-25','Annual',15000,5,100);

#11) Modify the column Member_name. Decrease the width of the member  name to 20 characters. (If it does not allow state the reason for that)
ALTER TABLE Members  
MODIFY Member_Name varchar(20); 
#12) Try to insert a record with Max_Books_Allowed = 110, Observe   the error that comes. Report the reason for this error.
insert into members values(8,'Akshay Karpe','Pune','10-09-05','Annual',15000,110,100);
#13)Generate another table named Member101 using a Create command along with a simple SQL query on member table
CREATE TABLE Member101 AS
SELECT *FROM members;
#14)Add the constraints on columns max_books_allowed  and penalty_amt as follows
#a.	max_books_allowed  < 100 b.	penalty_amt maximum 1000.Also give names to the constraints.
ALTER TABLE Member101
ADD CONSTRAINT chk_max_books_allowed CHECK (Max_Books_Allowed <=100);

ALTER TABLE Member101
ADD CONSTRAINT chk_penaltyamount CHECK (Penalty_Amount <=1000);

#15)Drop the table books
drop table books;
#16)Create table Books again as per the schema description with the following constraints.
#a.	Book_No – Primary Key
#b.	Book_Name – Not Null
#c.	Category – Science, Fiction, Database, RDBMS, Others.
create table Books(Book_No INT NOT NULL,Book_Name varchar(30),Author_name varchar(30),Cost INT,Category char(10),primary key(Book_No));
ALTER table books modify Book_Name varchar(30) not null;
ALTER table books modify Category enum('Science','Fiction','Database','RDBMS','Others');

#17)Insert data in Book table as follows:
insert into books values(101,'Let us C','Denis Ritchie',450,"Science");
insert into books values(102,'Oracle – Complete Ref','Loni',550,'Database');
insert into books values(103,'Mastering SQL','Loni',250,'Database');
insert into books values(104,'PL SQL-Ref','Scott Urman',750,'Database');
#18)Insert more records in Book table using & operator in the insert statement.
#19)Create table Book101 similar to Book in structure with no data in it.
create table Book101 like books;
#20)Insert into Book101 all the data in Book table using Select Statement
INSERT INTO Book101 (Book_No,Book_Name,Author_name,Cost,Category)
SELECT Book_No,Book_Name,Author_name,Cost,Category
FROM Books;
#21)Save all the data so far inserted in the tables.

#22)View the data in the tables using simple SQL query.
select *From books;
select *FROM issue;
select *FROM Book101;
#23)Insert into Book following data.105,National Geographic, Adis Scott, 1000,  Science
insert into Books values(105,'National Geographic', 'Adis Scott',1000, 'Science');
#24)Undo the last changes.
rollback;
#25)Modify the price of book with id 103 to Rs 300 and category to RDBMS
update Books SET Cost=300 and Category='RDBMS' WHERE Book_No=103;
#26)Rename the table Lib_Issue to Issue.
alter table Lib_Issue rename Issue;
#27)Drop table Issue.
drop table issue;
#28)As per the given structure Create table Issue again with following constraints.Lib_Issue_Id-Primary key,Book_No-  foreign key,Member_id - foreign key,Issue_date < Return_date
create table Issue(Lib_Issue_Id int not null primary key,book_no int,member_Id int,foreign key(book_no) REFERENCES Book101(book_no),foreign key(member_Id) REFERENCES Members(member_Id));
desc Issue;
Alter table Issue Add column Issue_date date;
Alter table Issue Add column Return_date date;
ALTER TABLE Issue ADD CONSTRAINT chk_IssueDate CHECK (Issue_date< Return_date);
#29)Insert following data into Issue table. Note leave the column Return_Date blank.
insert into Issue values(7001,101,1,'10-10-06',null);
insert into Issue values(7002,102,2,'25-10-06',null);
insert into Issue values(7003,104,1,'15-01-06',null);
insert into Issue values(7004,101,1,'04-07-06',null);
insert into Issue values(7005,104,2,'15-11-06',null);
insert into Issue values(7006,101,3,'18-02-06',null);
# 31)Disable the constraints on Issue table //Alter table Issue disable CONSTRAINT ALL;
SET FOREIGN_KEY_CHECKS = 0;

#32)Insert a record in Issue table. The member_id should not exist in member table.
insert into Issue values(7007,101,10,'18-02-06',null);
#33)Now enable the constraints of Issue table. Observe the error
SET FOREIGN_KEY_CHECKS = 1;

#34)	Delete the recor
#35)Try to delete the record of member id 1 from member table and observe the error 
delete from Issue where member_id=1;
#36)Modify the Return_Date of 7004,7005 to 15 days after the Issue_date.
update Issue set Return_date=Issue_date+15 where Lib_Issue_Id=7005;
update Issue set Return_date=Issue_date+15 where Lib_Issue_Id=7002;
#37)Modify the Penalty_Amount for Garima Sen to Rs 100.
SET SQL_SAFE_UPDATES = 0;
update Members set Penalty_amount=100 where Member_Name='Garima Sen';
#38)Perform a save point X here.
savepoint X;

select *FROM Members;

#39)Remove all the records from Issue table where member_ID is 1 and Issue date in before 10-Dec-06.
delete from Issue where member_id=1 and Issue_date< '10-12-06';
#40)Remove all the records from Book table with category other than RDBMS and Database.
delete From Books where category NOT IN('RDBMS','Database');
#41)Undo the changes done after savepoint X.
rollback TO SAVEPOINT X;
#42)Save all the changes done before X.
commit;
#45)View the data and structure of all the three tables Member, Issue, Book.
desc Members;
#46)Create a sequence no_seq of even numbers starting with 100 and ending with 200.
#