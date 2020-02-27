--
-- trigger: if a student record is deleted and not in enrollment, 
-- move records to past_Student table.
-- procedure used in this trigger
--

delimiter //
CREATE TRIGGER delete_student
BEFORE DELETE ON student
FOR EACH ROW BEGIN

IF(OLD.student_id NOT IN (SELECT student_id FROM enrollment)) THEN
	 
		CALL studentAddToPast_student(OLD.student_id, OLD.eircode, OLD.first_name, OLD.last_name, OLD.DOB);
        
     END IF;
   END;//
delimiter ;

--
-- --------------------
--

-- procedure to insert record to past_student table

delimiter //
CREATE PROCEDURE studentAddToPast_student(
	IN a CHAR(8), 
	IN b CHAR(6),
	IN c VARCHAR(35),
	IN d VARCHAR(35),
	IN e date
)
BEGIN
  INSERT INTO past_students(student_id, eircode, first_name, last_name, DOB)
		VALUES(a,b,c,d,e);
END;//

delimiter ;

--
-- -----------------------------------------------------------------------------------------------
--

-- 
-- If more than 30 student enrolled in one subject, 10% discount is applied from the subject fee.
--

delimiter //
CREATE TRIGGER Discount_popular_subject
BEFORE INSERT ON enrollment
FOR EACH ROW 
BEGIN
	IF (number_enrolled(NEW.subject_id) >30) THEN
		UPDATE subject SET subject_fee = 0.9 * subject_fee WHERE subject_id = NEW.subject_ID;
	END IF;
END;//


--
-- --------------------
-- 

-- This function will return the total number of students enrolled in the subject with the subject id (subid)

delimiter //
CREATE FUNCTION number_enrolled(subid char(6))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE total_students_enrolled INT;
	IF subid NOT IN (SELECT subject_id FROM enrollment) THEN 
    	RETURN 0;
	ELSE
        SELECT COUNT(student_id) INTO total_students_enrolled 
        FROM enrollment
        WHERE subid = subject_id;
        RETURN (total_students_enrolled);
	END IF;
END;//




