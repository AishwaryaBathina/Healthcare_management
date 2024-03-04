/* Stored Procedures for UNCC Student Clinic Management System */

/* Procedure for Adding new Student Data to Students Table */
DELIMITER $$
CREATE PROCEDURE addStudent (
	IN s_id INT,
    IN s_first_name VARCHAR(50),
    IN s_last_name VARCHAR(50),
    IN s_ssn VARCHAR(50)
)
BEGIN
    INSERT INTO students VALUES (s_id, s_first_name, s_last_name, s_ssn);
END$$

# CALL addStudent(103, 'Pavan', 'Gidda', '656758765');

/* Procedure for Updating the Student data from Students table */
DELIMITER $$
CREATE PROCEDURE updateStudentsData
(
	IN s_id INT,
    IN s_first_name VARCHAR(50),
    IN s_last_name VARCHAR(50),
    IN s_ssn VARCHAR(50)
)
BEGIN
  UPDATE students SET student_first_name = s_first_name, student_last_name = s_last_name,  student_ssn = s_ssn WHERE student_id = s_id;
END$$

# CALL updateStudentsData(103, 'Pavan', 'Praneeth', '6758567897');

/* Procedure for Deleting the Students Record from Students Table */
DELIMITER $$
CREATE PROCEDURE deleteStudentRecord
(
  IN s_id INT
)
BEGIN
  DELETE FROM students WHERE student_id = s_id;
END$$

# CALL deleteStudentRecord(103);

/* Procedure for Retriving Students info and displaying them */
DELIMITER $$ 
CREATE PROCEDURE retriveStudentData
(
	IN s_id int
)
BEGIN
    IF EXISTS (SELECT * FROM students WHERE student_id = s_id) THEN
        SELECT * FROM students WHERE student_id = s_id;
	ELSE
        SELECT 'Error: Student Record not Found';
    END IF;
END$$
DELIMITER ;

# CALL retriveStudentData(10);

/* Procedure for Adding new Student Insurance Data to student_insurance_details Table */
DELIMITER $$
CREATE PROCEDURE addStudentInsuranceData (
	IN s_id INT,
    IN s_insurance_provider VARCHAR(50),
    IN s_insurance_policy_number VARCHAR(20)
)
BEGIN
	IF EXISTS (SELECT * FROM student_insurance_details WHERE student_id = s_id) THEN
		SELECT 'Error: Student Insurance details are already found. Try Updating them instead of adding new data.';
	ELSEIF EXISTS (SELECT * FROM students WHERE student_id = s_id) THEN
        INSERT INTO student_insurance_details (student_id, insurance_provider, insurance_policy_number) VALUES (s_id, s_insurance_provider, s_insurance_policy_number);
	ELSE
        SELECT 'Error: Student Record not Found. Kindly Add Data to Students Table first';
    END IF;
END$$

# CALL addStudentInsuranceData(10, 'Pavan', 'Gidda');

/* Procedure for Updating the Student Insurance details from students_insurance_details table */
DELIMITER $$
CREATE PROCEDURE updateStudentInsuranceData
(
	IN s_id INT,
    IN s_insurance_provider VARCHAR(50),
    IN s_insurance_policy_number VARCHAR(20)
)
BEGIN
  UPDATE student_insurance_details SET insurance_provider = s_insurance_provider, insurance_policy_number = s_insurance_policy_number WHERE student_id = s_id;
END$$

# CALL updateStudentInsuranceData(10, 'Pavan', 'Praneeth');

/* Procedure for Deleting the Students insurance Record from students_insurance_details Table */
DELIMITER $$
CREATE PROCEDURE deleteStudentInsuranceRecord
(
  IN s_id INT
)
BEGIN
  DELETE FROM student_insurance_details WHERE student_id = s_id;
END$$

# CALL deleteStudentInsuranceRecord(10);

/* Procedure for Retriving Students Insurance data and displaying them */
DELIMITER $$ 
CREATE PROCEDURE retriveStudentInsuranceData
(
	IN s_id int
)
BEGIN
    IF EXISTS (SELECT * FROM student_insurance_details WHERE student_id = s_id) THEN
        SELECT * FROM student_insurance_details WHERE student_id = s_id;
	ELSE
        SELECT 'Error: Student Insurance Record not Found';
    END IF;
END$$
DELIMITER ;

# CALL retriveStudentInsuranceData(1);

/* Procedure for Adding new Student Immunisation Data to student_immunisation_details Table */
DELIMITER $$
CREATE PROCEDURE addStudentImmunisationData (
	IN s_id INT,
    IN s_covid_vaccination_date DATE,
    IN s_chickenpox_vaccination DATE,
    IN s_TDAP_vaccination DATE,
    IN s_previous_complications VARCHAR(255)
)
BEGIN
	IF EXISTS (SELECT * FROM student_immunisation_details WHERE student_id = s_id) THEN
		SELECT 'Error: Student Immunisation details are already found. Try Updating them instead of adding new data.';
	ELSEIF EXISTS (SELECT * FROM students WHERE student_id = s_id) THEN
        INSERT INTO student_immunisation_details (student_id, covid_vaccination_date, chickenpox_vaccination, TDAP_vaccination, previous_complications) VALUES (s_id, s_covid_vaccination_date, s_chickenpox_vaccination, s_TDAP_vaccination, s_previous_complications);
	ELSE
        SELECT 'Error: Student Record not Found. Kindly Add Data to Students Table first';
    END IF;
END$$

# CALL addStudentImmunisationData(10, '2022-02-15', '2022-02-15', '2022-02-15', 'None');

/* Procedure for Updating the Student Immunisation details from student_immunisation_details table */
DELIMITER $$
CREATE PROCEDURE updateStudentImmunisationData
(
	IN s_id INT,
    IN s_covid_vaccination_date DATE,
    IN s_chickenpox_vaccination DATE,
    IN s_TDAP_vaccination DATE,
    IN s_previous_complications VARCHAR(255)
)
BEGIN
  UPDATE student_immunisation_details SET covid_vaccination_date = s_covid_vaccination_date, chickenpox_vaccination = s_chickenpox_vaccination, TDAP_vaccination = s_TDAP_vaccination, previous_complications = s_previous_complications WHERE student_id = s_id;
END$$

# CALL updateStudentImmunisationData(1, '2022-02-15', '2022-02-15', '2022-02-15', 'None');

/* Procedure for Deleting the Students Immunisation Record from student_immunisation_details Table */
DELIMITER $$
CREATE PROCEDURE deleteStudentImmunisationRecord
(
  IN s_id INT
)
BEGIN
  DELETE FROM student_immunisation_details WHERE student_id = s_id;
END$$

# CALL deleteStudentImmunisationRecord(10);

/* Procedure for Retriving Students Immunisation data and displaying them */
DELIMITER $$ 
CREATE PROCEDURE retriveStudentImmunisationData
(
	IN s_id int
)
BEGIN
    IF EXISTS (SELECT * FROM student_immunisation_details WHERE student_id = s_id) THEN
        SELECT * FROM student_immunisation_details WHERE student_id = s_id;
	ELSE
        SELECT 'Error: Student Immunisaion Record not Found';
    END IF;
END$$
DELIMITER ;

# CALL retriveStudentImmunisationData(100);










