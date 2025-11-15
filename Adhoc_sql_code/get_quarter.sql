DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_quarter`(calendar_date DATE) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
   DECLARE x tinyint;
   DECLARE quarter tinyint;
   SET x = CEIL(((MONTH(calendar_date) + 4)%12)/3);
   SET quarter = CASE WHEN x = 0 THEN 4
                    WHEN x != 0 THEN x
				END;
RETURN CONCAT("Q",CONVERT(quarter,CHAR));
END$$
DELIMITER ;
