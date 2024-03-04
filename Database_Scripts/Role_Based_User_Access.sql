/* Script for handling Role based user access */

/* Creating table for role based access control data */
CREATE TABLE roleBasedData (
  user_id INT PRIMARY KEY,
  user_name VARCHAR(50),
  user_role VARCHAR(50)
);

INSERT INTO roleBasedData (user_id, user_name, user_role) VALUES (1, 'pavan', 'student');
INSERT INTO roleBasedData (user_id, user_name, user_role) VALUES (2, 'amar', 'doctor');
INSERT INTO roleBasedData (user_id, user_name, user_role) VALUES (3, 'john', 'staff');

/* Creating a Student User */
CREATE USER 'pavan'@'localhost' IDENTIFIED BY 'Welcome@123';

/* Creating a Doctor User */
CREATE USER 'amar'@'localhost' IDENTIFIED BY 'Welcome@124';

/* Creating a Staff User */
CREATE USER 'john'@'localhost' IDENTIFIED BY 'Welcome@125';

/* Granting access for the Student user */
GRANT EXECUTE ON PROCEDURE retriveStudentData TO 'pavan'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveStudentInsuranceData TO 'pavan'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveStudentImmunisationData TO 'pavan'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveDoctorData TO 'pavan'@'localhost';
GRANT EXECUTE ON PROCEDURE addAppointment TO 'pavan'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveAppointmentData TO 'pavan'@'localhost';
GRANT SELECT ON students_view_table TO 'pavan'@'localhost';
GRANT SELECT ON doctor_view_table TO 'pavan'@'localhost';
GRANT SELECT ON staff_view_table TO 'pavan'@'localhost';
GRANT INSERT ON appointments TO 'pavan'@'localhost';

/* Granting access for the Doctor user */
GRANT EXECUTE ON PROCEDURE addStudent TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE addStudentImmunisationData TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE updateStudentImmunisationData TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteStudentImmunisationRecord TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveStudentImmunisationData TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE addDoctor TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE updateDoctorData TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteDoctorRecord TO 'amar'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveDoctorData TO 'amar'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON student_immunisation_details TO 'amar'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON students TO 'amar'@'localhost';

/* Granting access for the Staff user */
GRANT EXECUTE ON PROCEDURE updateStudentsData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteStudentRecord TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveStudentData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE addStudentInsuranceData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE updateStudentInsuranceData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteStudentInsuranceRecord TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveStudentInsuranceData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE addAppointment TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE updateAppointmentData TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE deleteAppointmentRecord TO 'john'@'localhost';
GRANT EXECUTE ON PROCEDURE retriveAppointmentData TO 'john'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON students TO 'john'@'localhost';

/* Verifying the Role based access control for users */
SELECT mysql.user.host, mysql.user.user, roleBasedData.user_name, roleBasedData.user_role 
FROM mysql.user JOIN roleBasedData ON mysql.user.user = roleBasedData.user_name;
