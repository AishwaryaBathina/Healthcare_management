/* Stored Procedures - 2 for UNCC Student Clinic Management System */

/* Procedure for Adding new Doctor Data to doctors Table */
DELIMITER $$
CREATE PROCEDURE addDoctor (
	IN d_id INT,
    IN d_first_name VARCHAR(100),
    IN d_last_name VARCHAR(50),
    IN d_specialty VARCHAR(50),
    IN d_qualification VARCHAR(50),
    IN d_phone_number VARCHAR(50),
    IN d_email VARCHAR(50),
    IN d_ssn VARCHAR(10)
)
BEGIN
    INSERT INTO doctor VALUES (d_id, d_first_name, d_last_name, d_specialty, d_qualification, d_phone_number, d_email, d_ssn);
END$$

# CALL addDoctor(103, 'Pavan', 'Gidda', 'Cardio', 'MD', '656758765', 'pavan@gmail.com', '656758765');

/* Procedure for Updating the Doctor data from doctors table */
DELIMITER $$
CREATE PROCEDURE updateDoctorData
(
	IN d_id INT,
    IN d_first_name VARCHAR(100),
    IN d_last_name VARCHAR(50),
    IN d_specialty VARCHAR(50),
    IN d_qualification VARCHAR(50),
    IN d_phone_number VARCHAR(50),
    IN d_email VARCHAR(50),
    IN d_ssn VARCHAR(10)
)
BEGIN
  UPDATE doctor SET doctor_first_name = d_first_name, doctor_last_name = d_last_name,  doctor_specialty = d_specialty, Qualification = d_qualification, doctor_phone_number = d_phone_number, doctor_email = d_email, doctor_ssn = d_ssn WHERE doctor_id = d_id;
END$$

# CALL updateDoctorData(103, 'Pavan', 'Gidda', 'Cardio', 'MS', '656758765', 'pavan@gmail.com', '656758765');

/* Procedure for Deleting the Doctor Record from doctors Table */
DELIMITER $$
CREATE PROCEDURE deleteDoctorRecord
(
  IN d_id INT
)
BEGIN
  DELETE FROM doctor WHERE doctor_id = d_id;
END$$

# CALL deleteDoctorRecord(103);

/* Procedure for Retriving Doctor info and displaying them */
DELIMITER $$ 
CREATE PROCEDURE retriveDoctorData
(
	IN d_id int
)
BEGIN
    IF EXISTS (SELECT * FROM doctor WHERE doctor_id = d_id) THEN
        SELECT * FROM doctor WHERE doctor_id = d_id;
	ELSE
        SELECT 'Error: Doctor Record not Found';
    END IF;
END$$
DELIMITER ;

# CALL retriveDoctorData(103);

/* Procedure for Adding new Appointment Data */
DELIMITER $$
CREATE PROCEDURE addAppointment (
	IN a_id INT,
	IN s_id INT,
	IN d_id INT,
	IN a_date DATE,
	IN a_time TIME,
	IN a_reason VARCHAR(50)
)
BEGIN
    INSERT INTO appointments VALUES (a_id, s_id, d_id, a_date, a_time, a_reason);
END$$

# CALL addAppointment(100, 1, 1, '2022-02-15', '09:00:00', 'Health fever');

/* Procedure for Updating the Appointment data */
DELIMITER $$
CREATE PROCEDURE updateAppointmentData
(
	IN a_id INT,
	IN s_id INT,
	IN d_id INT,
	IN a_date DATE,
	IN a_time TIME,
	IN a_reason VARCHAR(50)
)
BEGIN
  UPDATE appointments SET student_id = s_id, doctor_id = d_id, appointment_date = a_date, appointment_time = a_time, appointment_reason = a_reason WHERE appointment_id = a_id;
END$$

# CALL updateAppointmentData(100, 1, 1, '2022-02-17', '09:00:00', 'Health fever');

/* Procedure for Deleting the Appointment Record */
DELIMITER $$
CREATE PROCEDURE deleteAppointmentRecord
(
  IN a_id INT
)
BEGIN
  DELETE FROM appointments WHERE appointment_id = a_id;
END$$

# CALL deleteAppointmentRecord(100);

/* Procedure for Retriving Appointment info and displaying them */
DELIMITER $$ 
CREATE PROCEDURE retriveAppointmentData
(
	IN a_id int
)
BEGIN
    IF EXISTS (SELECT * FROM appointments WHERE appointment_id = a_id) THEN
        SELECT * FROM appointments WHERE appointment_id = a_id;
	ELSE
        SELECT 'Error: Appointment Record not Found';
    END IF;
END$$
DELIMITER ;

# CALL retriveAppointmentData(100);