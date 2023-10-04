CREATE TABLE emp1(`first name` VARCHAR(20), id INT PRIMARY KEY);
insert into emp1 values('HJK', 1);
insert into emp1 values('ABC', 2);
insert into emp1 values('DEF', 3);


#Verify Using:
select * from emp1;
#CASE 2: A Stored Procedure that Accept Parameters (IN, OUT, INOUT)
DELIMITER |
CREATE PROCEDURE sample_sp_with_params (IN empId INT UNSIGNED, OUT oldName VARCHAR(20), INOUT newName VARCHAR(20))
BEGIN
SELECT `first name` into oldName FROM emp where id = empId;
UPDATE emp SET `first name`= newName where id = empId;

END
|
DELIMITER ;

 

#Execute and Verify Commands
set @inout='updatedHJK';
CALL sample_sp_with_params(1,@out,@inout);
select @out,@inout;
select * from emp;





#Creating procedure in and out
DELIMITER $$
CREATE procedure getHyundaiTotal(IN mkrName varchar(30),OUT total int)
BEGIN
select count(*) into total from cars_india_dataset where maker=mkrName;
END 
$$
call getHyundaiTotal("Hyundai",@tol);
select @tol as "Total";


#creating procedure
delimiter $$
Create procedure myProcedure()
begin
select *FROM cars_india_dataset;
end $$
#calling the procedure
call myProcedure;
delimiter $$
Create procedure myProcedure1(IN mkr varchar(50))
begin
select *FROM cars_india_dataset where maker=mkr;
end $$
#calling the procedure
call myProcedure1("Hyundai");

#out parameter
delimiter $$
Create procedure myProcedure3(OUT param1 INT)
begin
select count(*) into param1 FROM cars_india_dataset;
end $$
#calling the procedure
call myProcedure3(@a);
select @a;

