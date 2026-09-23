DELIMITER //

CREATE PROCEDURE FetchStudentRecords()
BEGIN
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(100);
    DECLARE v_dept INT;
    DECLARE done INT DEFAULT FALSE;

    DECLARE student_cursor CURSOR FOR 
        SELECT StudentID, StudentName, DepartmentID FROM Student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO v_id, v_name, v_dept;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT v_id AS StudentID, v_name AS StudentName, v_dept AS DepartmentID;
    END LOOP;

    CLOSE student_cursor;
END //

DELIMITER ;
