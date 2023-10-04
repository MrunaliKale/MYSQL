DELIMITER $$
CREATE FUNCTION CalcIncome ( starting_value INT )
RETURNS  INT DETERMINISTIC 
BEGIN
   DECLARE income INT;
   SET income = 0;
   
   #CASE 4: A Stored Function that Accept No Parameters
DELIMITER $$
CREATE FUNCTION sample_fn_no_param ()
RETURNS INT DETERMINISTIC
BEGIN
DECLARE count INT;
SELECT COUNT(*) INTO count FROM emp;
RETURN count;
END $$
#Execute and Verify Commands
select sample_fn_no_param ();
   label1: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label1;

   RETURN income;
END 

#You could then reference your new function as follows:

SELECT CalcIncome (1000);
