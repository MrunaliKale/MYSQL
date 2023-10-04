Delimiter $$
CREATE PROCEDURE fact1(IN x INT)
BEGIN
  DECLARE result INT;
  DECLARE i INT;
  SET result = 1;
  SET i = 1;
  WHILE i <= x DO
    SET result = result * i;
    SET i = i + 1;
  END WHILE;
  SELECT x AS Number, result as Factorial;

END $$
CALL fact1(1);
CALL fact1(2) ;
CALL fact1(4);
CALL fact1(0);
