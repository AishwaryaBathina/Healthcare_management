/* Creating indexes in uncc_student_clinic database */

/* Creating index for student id column in students table */
CREATE UNIQUE INDEX student_index on students(student_id);

SELECT * FROM students;

/* Creating index for student id column in doctors table */
CREATE UNIQUE INDEX doctor_index on doctor(doctor_first_name);

/* Creating index for student id column in staff table */
CREATE UNIQUE INDEX staff_index on staff(staff_id);

SELECT * FROM staff WHERE staff_id=8;

/* Creating index for student id column in billings table */
CREATE INDEX billing_index on billing(billing_date);

/* Creating index for student id column in surgery table */
CREATE INDEX surgery_index on surgery_history(surgery_name);


/* Views for uncc_student-clinic database */
# Creating a view for Students table
CREATE VIEW students_view_table AS
SELECT student_id, student_first_name, student_last_name
FROM students;

# Creating a view for Doctor table
CREATE VIEW doctor_view_table AS
SELECT doctor_id, doctor_first_name, doctor_last_name
FROM doctor;

# Creating a view for Students table
CREATE VIEW staff_view_table AS
SELECT staff_id, staff_first_name, staff_last_name
FROM staff;

/* Procedure for Retriving Students info through views*/
DELIMITER $$ 
CREATE PROCEDURE retriveStudentDataFromViews
(
	IN s_id int
)
BEGIN
    IF EXISTS (SELECT * FROM students_view_table WHERE student_id = s_id) THEN
        SELECT * FROM students_view_table WHERE student_id = s_id;
	ELSE
        SELECT 'Error: Student Record not Found';
    END IF;
END$$
DELIMITER ;

/* Procedure for Retriving Doctor info through views*/
DELIMITER $$ 
CREATE PROCEDURE retriveDoctorDataFromViews
(
	IN d_id int
)
BEGIN
    IF EXISTS (SELECT * FROM doctor_view_table WHERE doctor_id = d_id) THEN
        SELECT * FROM doctor_view_table WHERE doctor_id = d_id;
	ELSE
        SELECT 'Error: Doctor Record not Found';
    END IF;
END$$
DELIMITER ;

/* Procedure for Retriving Staff info through views*/
DELIMITER $$ 
CREATE PROCEDURE retriveStaffDataFromViews
(
	IN s_id int
)
BEGIN
    IF EXISTS (SELECT * FROM staff_view_table WHERE staff_id = s_id) THEN
        SELECT * FROM staff_view_table WHERE staff_id = s_id;
	ELSE
        SELECT 'Error: Staff Record not Found';
    END IF;
END$$
DELIMITER ;
