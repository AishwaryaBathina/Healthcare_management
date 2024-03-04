/*  Creating a Database for UNCC Student Clinic  */
CREATE DATABASE uncc_student_clinic;

/* Creating tables in the Database */
/* Table-1: Creating Students table */
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_first_name VARCHAR(50),
  student_last_name VARCHAR(50),
  student_ssn VARCHAR(50)
);

/* Table-2: Creating Student Personal Info table */
CREATE TABLE student_personal_info (
  student_id INT PRIMARY KEY,
  student_gender VARCHAR(50),
  student_age VARCHAR(50),
  student_dob DATE,
  student_phone_number VARCHAR(50),
  student_email VARCHAR(50),
  student_address VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  zip_code VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

/* Table-3: Creating Student Insurance details table */
CREATE TABLE student_insurance_details (
  student_id INT PRIMARY KEY,
  insurance_provider VARCHAR(50),
  insurance_policy_number VARCHAR(20),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

/* Table-4: Creating Student Immunisation Details Table */
CREATE TABLE student_immunisation_details (
  student_id INT PRIMARY KEY,
  covid_vaccination_date DATE,
  chickenpox_vaccination DATE,
  TDAP_vaccination DATE,
  previous_complications VARCHAR(255),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

/* Table-5: Creating Doctors Table */
CREATE TABLE doctor (
  doctor_id INT PRIMARY KEY,
  doctor_first_name VARCHAR(100),
  doctor_last_name VARCHAR(50),
  doctor_specialty VARCHAR(50),
  Qualification VARCHAR(50),
  doctor_phone_number VARCHAR(50),
  doctor_email VARCHAR(50),
  doctor_ssn VARCHAR(10)
);

/* Table-6: Creating Staff Table */
CREATE TABLE staff (
  staff_id INT PRIMARY KEY,
  staff_first_name VARCHAR(100),
  staff_last_name VARCHAR(50),
  staff_ssn VARCHAR(10),
  staff_email VARCHAR(50),
  staff_phone_number VARCHAR(10),
  staff_address VARCHAR(255),
  staff_role VARCHAR(50)
);

/* Table-7: Creating Appointments Table */
CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY,
  student_id INT,
  doctor_id INT,
  appointment_date DATE,
  appointment_time TIME,
  appointment_reason VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

/* Table-8: Creating Appointment info table */
CREATE TABLE appointment_info (
  appointment_info_id INT PRIMARY KEY,
  appointment_id INT,
  diagnosis_name VARCHAR(50),
  diagnosis_report VARCHAR(50),
  medication_name VARCHAR(50),
  dosage VARCHAR(50),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

/* Table-9: Creating Surgery History table */
CREATE TABLE surgery_history (
  student_surgery_id INT PRIMARY KEY,
  student_id INT,
  doctor_id INT,
  staff_id INT,
  surgery_name  VARCHAR(50),
  surgery_date DATE,
  hospitalization_reason  VARCHAR(50),
  hospitalization_date  VARCHAR(50),
  number_of_days_of_stay  VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

/* Table-10: creating Billing table */
CREATE TABLE billing (
  billing_id INT PRIMARY KEY,
  appointment_id INT,
  amount FLOAT,
  billing_date DATE,
  billing_mode VARCHAR(50),
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


/* Inserting values into the Tables */
/* Inserting values into Students Table */
INSERT INTO students (student_id, student_first_name, student_last_name, student_ssn)
VALUES
(1, 'John', 'Doe', '123-45-6789'),
(2, 'Jane', 'Doe', '234-56-7890'),
(3, 'Alice', 'Smith', '345-67-8901'),
(4, 'Bob', 'Johnson', '456-78-9012'),
(5, 'Mary', 'Williams', '567-89-0123'),
(6, 'David', 'Brown', '678-90-1234'),
(7, 'Karen', 'Miller', '789-01-2345'),
(8, 'Michael', 'Garcia', '890-12-3456'),
(9, 'Julie', 'Davis', '901-23-4567'),
(10, 'Mark', 'Wilson', '012-34-5678'),
(11, 'Linda', 'Anderson', '123-45-6781'),
(12, 'William', 'Thomas', '234-56-7892'),
(13, 'Maria', 'Jackson', '345-67-8903'),
(14, 'Richard', 'White', '456-78-9014'),
(15, 'Susan', 'Harris', '567-89-0125'),
(16, 'Christopher', 'Martin', '678-90-1236'),
(17, 'Stephanie', 'Lee', '789-01-2347'),
(18, 'Daniel', 'Clark', '890-12-3458'),
(19, 'Melissa', 'Rodriguez', '901-23-4569'),
(20, 'Anthony', 'Lewis', '012-34-5670'),
(21, 'Kimberly', 'Lee', '123-45-6782'),
(22, 'Matthew', 'Walker', '234-56-7893'),
(23, 'Amanda', 'Hall', '345-67-8904'),
(24, 'Steven', 'Allen', '456-78-9015'),
(25, 'Laura', 'Young', '567-89-0126'),
(26, 'Kevin', 'King', '678-90-1237'),
(27, 'Tiffany', 'Wright', '789-01-2348'),
(28, 'Eric', 'Scott', '890-12-3459'),
(29, 'Rachel', 'Green', '901-23-4570'),
(30, 'Brandon', 'Baker', '012-34-5671'),
(31, 'Emily', 'Nelson', '123-45-6783'),
(32, 'Andrew', 'Carter', '234-56-7894'),
(33, 'Nicole', 'Mitchell', '345-67-8905'),
(34, 'Joshua', 'Perez', '456-78-9016'),
(35, 'Christina', 'Robinson', '567-89-0127'),
(36, 'Brian', 'Turner', '678-90-1238'),
(37, 'Stephanie', 'Phillips', '789-01-2349'),
(38, 'Patrick', 'Campbell', '890-12-3460');

/* Inserting values into Student Personal Details Table */
INSERT INTO student_personal_info (student_id, student_gender, student_age, student_dob, student_phone_number, student_email, student_address, city, state, zip_code)
VALUES
(1, 'Male', '23', '2000-05-12', '(123) 456-7890', 'john.doe@example.com', '123 Main St', 'Anytown', 'CA', '12345'),
(2, 'Female', '22', '2001-03-18', '(234) 567-8901', 'jane.doe@example.com', '456 Oak Ave', 'Anycity', 'NY', '23456'),
(3, 'Female', '21', '2002-11-08', '(345) 678-9012', 'alice.smith@example.com', '789 Elm St', 'Anyville', 'TX', '34567'),
(4, 'Male', '24', '1999-07-31', '(456) 789-0123', 'bob.johnson@example.com', '321 Maple Ave', 'Anyborough', 'OH', '45678'),
(5, 'Female', '23', '2000-02-14', '(567) 890-1234', 'mary.williams@example.com', '654 Pine St', 'Anystate', 'FL', '56789'),
(6, 'Male', '22', '2001-09-03', '(678) 901-2345', 'david.brown@example.com', '987 Cedar Ln', 'Anycity', 'CA', '67890'),
(7, 'Female', '21', '2002-05-24', '(789) 012-3456', 'karen.miller@example.com', '246 Oak St', 'Anyville', 'NY', '78901'),
(8, 'Male', '24', '1999-12-01', '(890) 123-4567', 'michael.garcia@example.com', '369 Main St', 'Anytown', 'TX', '89012'),
(9, 'Female', '23', '2000-07-17', '(901) 234-5678', 'julie.davis@example.com', '258 Maple Ave', 'Anyborough', 'OH', '90123'),
(10, 'Male', '22', '2001-01-09', '(012) 345-6789', 'mark.wilson@example.com', '753 Elm St', 'Anystate', 'FL', '01234'),
(11, 'Female', '21', '2002-09-22', '(123) 456-7810', 'linda.anderson@example.com', '147 Pine St', 'Anycity', 'CA', '12345'),
(12, 'Male', '24', '1999-04-11', '(234) 567-8921', 'william.thomas@example.com', '258 Cedar Ln', 'Anytown', 'NY', '23456'),
(13, 'Female', '23', '2000-11-29', '(345) 678-9034', 'maria.jackson@example.com', '369 Oak St', 'Anyville', 'TX', '34567'),
(14, 'Male', '22', '2001-06-19', '(456) 789-0145', 'richard.white@example.com', '753 Maple Ave', 'Anyborough', 'OH', '45678');

INSERT INTO student_personal_info (student_id, student_gender, student_age, student_dob, student_phone_number, student_email, student_address, city, state, zip_code)
VALUES
(15, 'Female', '20', '2002-02-18', '555-555-5565', 'susan.harris@example.com', '1234 Spruce St', 'Philadelphia', 'PA', '19101'),
(16, 'Male', '23', '1999-06-20', '555-555-5566', 'christopher.martin@example.com', '456 Pinecone Ln', 'Seattle', 'WA', '98101'),
(17, 'Female', '22', '2000-09-01', '555-555-5567', 'stephanie.lee@example.com', '789 Oakwood Ave', 'San Francisco', 'CA', '94102'),
(18, 'Male', '20', '2001-02-05', '555-555-5568', 'daniel.clark@example.com', '12 Maplewood Dr', 'Los Angeles', 'CA', '90001'),
(19, 'Female', '21', '2000-01-01', '555-555-5569', 'melissa.rodriguez@example.com', '345 Elm St', 'Houston', 'CA', '90001');

INSERT INTO student_personal_info (student_id, student_gender, student_age, student_dob, student_phone_number, student_email, student_address, city, state, zip_code)
VALUES
(20, 'Male', '22', '2000-05-23', '555-555-5555', 'anthony.lewis@example.com', '456 Elm St', 'Orlando', 'FL', '32801'),
(21, 'Female', '23', '1999-01-01', '555-555-5555', 'kimberly.lee@example.com', '789 Oak Ave', 'Tampa', 'FL', '33601'),
(22, 'Male', '24', '1998-02-14', '555-555-5555', 'matthew.walker@example.com', '111 Pine St', 'Gainesville', 'FL', '32601'),
(23, 'Female', '25', '1997-03-27', '555-555-5555', 'amanda.hall@example.com', '222 Maple St', 'Miami', 'FL', '33101'),
(24, 'Male', '26', '1996-04-10', '555-555-5555', 'steven.allen@example.com', '333 Elm St', 'Orlando', 'FL', '32801'),
(25, 'Female', '27', '1995-05-23', '555-555-5555', 'laura.young@example.com', '444 Oak Ave', 'Tampa', 'FL', '33601'),
(26, 'Male', '28', '1994-06-05', '555-555-5555', 'kevin.king@example.com', '555 Pine St', 'Gainesville', 'FL', '32601'),
(27, 'Female', '29', '1993-07-18', '555-555-5555', 'tiffany.wright@example.com', '666 Maple St', 'Miami', 'FL', '33101'),
(28, 'Male', '30', '1992-08-31', '555-555-5555', 'eric.scott@example.com', '777 Elm St', 'Orlando', 'FL', '32801'),
(29, 'Female', '31', '1991-10-13', '555-555-5555', 'rachel.green@example.com', '888 Oak Ave', 'Tampa', 'FL', '33601'),
(30, 'Male', '32', '1990-11-26', '555-555-5555', 'brandon.baker@example.com', '999 Pine St', 'Gainesville', 'FL', '32601'),
(31, 'Female', '33', '1989-01-08', '555-555-5555', 'emily.nelson@example.com', '1234 Maple St', 'Miami', 'FL', '33101'),
(32, 'Male', '34', '1987-02-20', '555-555-5555', 'andrew.carter@example.com', '5678 Elm St', 'Orlando', 'FL', '32801');

INSERT INTO student_personal_info (student_id, student_gender, student_age, student_dob, student_phone_number, student_email, student_address, city, state, zip_code)
VALUES
(33, 'Female', '24', '1999-02-15', '555-123-4567', 'nicole.mitchell@example.com', '123 Main St', 'Los Angeles', 'CA', '90001'),
(34, 'Male', '22', '2001-07-02', '555-234-5678', 'joshua.perez@example.com', '456 1st St', 'San Francisco', 'CA', '94105'),
(35, 'Female', '20', '2003-12-10', '555-345-6789', 'christina.robinson@example.com', '789 Elm St', 'San Diego', 'CA', '92101'),
(36, 'Male', '21', '2002-09-27', '555-456-7890', 'brian.turner@example.com', '987 Oak St', 'San Jose', 'CA', '95110'),
(37, 'Female', '23', '1998-04-05', '555-567-8901', 'stephanie.phillips@example.com', '654 Pine St', 'Los Angeles', 'CA', '90001'),
(38, 'Male', '24', '1997-01-20', '555-678-9012', 'patrick.campbell@example.com', '321 Cedar St', 'San Francisco', 'CA', '94105');


/* Inserting values into Student Insurance details table */
INSERT INTO student_insurance_details (student_id, insurance_provider, insurance_policy_number)
VALUES
(1, 'Blue Cross Blue Shield', 'ABCD1234'),
(2, 'Aetna', 'EFGH5678'),
(3, 'Cigna', 'IJKL9012'),
(4, 'Humana', 'MNOP3456'),
(5, 'UnitedHealthcare', 'QRST7890'),
(6, 'Anthem', 'UVWX1234'),
(7, 'Kaiser Permanente', 'YZAB5678'),
(8, 'MetLife', 'CDEF9012'),
(9, 'GEICO', 'GHIJ3456'),
(10, 'State Farm', 'KLMN7890'),
(11, 'Progressive', 'OPQR1234'),
(12, 'Nationwide', 'STUV5678'),
(13, 'Allstate', 'WXYZ9012'),
(14, 'USAA', 'ABCD3456'),
(15, 'Farmers', 'EFGH7890'),
(16, 'Liberty Mutual', 'IJKL1234'),
(17, 'Travelers', 'MNOP5678'),
(18, 'Chubb', 'QRST9012'),
(19, 'American Family', 'UVWX3456'),
(20, 'Erie Insurance', 'YZAB7890'),
(21, 'Hartford', 'CDEF1234'),
(22, 'Esurance', 'GHIJ5678'),
(23, 'Mercury Insurance', 'KLMN9012'),
(24, 'Aflac', 'OPQR3456'),
(25, 'Mutual of Omaha', 'STUV7890'),
(26, 'New York Life', 'WXYZ1234'),
(27, 'Prudential', 'ABCD5678'),
(28, 'Northwestern Mutual', 'EFGH9012'),
(29, 'Guardian Life', 'IJKL3456'),
(30, 'MassMutual', 'MNOP7890'),
(31, 'Transamerica', 'QRST1234'),
(32, 'Principal Financial', 'UVWX5678'),
(33, 'AIG', 'YZAB9012'),
(34, 'The Standard', 'CDEF3456'),
(35, 'Lincoln Financial', 'GHIJ7890'),
(36, 'Pacific Life', 'KLMN1234'),
(37, 'Symetra', 'OPQR5678'),
(38, 'Voya Financial', 'STUV9012');

/* Inserting values into Student Medical immunisation table */
INSERT INTO student_immunisation_details (student_id, covid_vaccination_date, chickenpox_vaccination, TDAP_vaccination, previous_complications)
VALUES
(1, '2022-02-15', '2010-05-20', '2018-09-02', 'None'),
(2, '2022-02-28', '2009-10-12', '2018-11-20', 'None'),
(3, '2022-03-08', '2011-04-15', '2019-02-12', 'None'),
(4, '2022-03-16', '2012-01-01', '2019-05-05', 'None'),
(5, '2022-03-28', '2013-06-17', '2019-08-18', 'None'),
(6, '2022-04-06', '2014-09-30', '2019-11-25', 'None'),
(7, '2022-04-18', '2015-02-22', '2020-03-15', 'None'),
(8, '2022-05-01', '2016-07-07', '2020-06-28', 'None'),
(9, '2022-05-08', '2017-12-25', '2020-10-11', 'None'),
(10, '2022-05-18', '2018-06-01', '2021-01-24', 'None'),
(11, '2022-06-02', '2009-09-10', '2018-08-25', 'None'),
(12, '2022-06-08', '2008-12-15', '2018-11-07', 'None'),
(13, '2022-06-20', '2010-01-18', '2019-02-05', 'None'),
(14, '2022-06-28', '2011-07-05', '2019-05-18', 'None'),
(15, '2022-07-08', '2012-08-08', '2019-08-31', 'None'),
(16, '2022-07-20', '2013-12-25', '2019-12-13', 'None'),
(17, '2022-07-27', '2014-06-30', '2020-03-22', 'None'),
(18, '2022-08-08', '2015-11-15', '2020-07-04', 'None'),
(19, '2022-08-18', '2016-04-21', '2020-10-17', 'None'),
(20, '2022-08-31', '2017-09-05', '2021-01-30', 'None'),
(21, '2022-09-08', '2010-11-30', '2018-07-24', 'None'),
(22, '2022-09-20', '2009-05-12', '2018-11-06', 'None'),
(23, '2022-09-28', '2010-07-15', '2019-02-04', 'None');

INSERT INTO student_immunisation_details (student_id, covid_vaccination_date, chickenpox_vaccination, TDAP_vaccination, previous_complications)
VALUES
(24, '2022-01-15', '2013-05-20', '2018-02-01', 'Dog bite'),
(25, '2022-02-20', '2015-09-10', '2019-01-05', 'none'),
(26, '2022-03-05', '2012-11-12', '2017-09-25', 'none'),
(27, '2022-04-10', '2014-03-15', '2018-12-01', 'Obesity'),
(28, '2022-05-15', '2016-08-18', '2019-08-20', 'none'),
(29, '2022-06-20', '2011-04-22', '2016-07-10', 'none'),
(30, '2022-07-25', '2017-01-05', '2020-03-05', 'none'),
(31, '2022-08-30', '2013-12-10', '2018-10-01', 'Got leg bone fracture'),
(32, '2022-09-05', '2016-05-15', '2019-06-01', 'none'),
(33, '2022-10-10', '2012-08-20', '2017-05-10', 'none'),
(34, '2022-11-15', '2015-11-25', '2018-09-15', 'negative impact to antibiotics'),
(35, '2022-12-20', '2013-07-30', '2018-04-20', 'none'),
(36, '2023-01-25', '2016-02-12', '2019-11-05', 'none'),
(37, '2023-02-28', '2011-09-05', '2016-09-25', 'have high cholestral'),
(38, '2023-04-03', '2014-01-08', '2018-11-10', 'none');


/* Inserting values to Doctors table */
INSERT INTO doctor (doctor_id, doctor_first_name, doctor_last_name, doctor_specialty, Qualification, doctor_phone_number, doctor_email, doctor_ssn)
VALUES
(1, 'John', 'Smith', 'Cardiology', 'MD', '555-1234', 'john.smith@example.com', '123456789'),
(2, 'Mary', 'Johnson', 'Pediatrics', 'DO', '555-5678', 'mary.johnson@example.com', '234567890'),
(3, 'David', 'Brown', 'Neurology', 'MD', '555-9012', 'david.brown@example.com', '345678901'),
(4, 'Karen', 'Miller', 'Dermatology', 'DO', '555-2345', 'karen.miller@example.com', '456789012'),
(5, 'Michael', 'Garcia', 'Oncology', 'MD', '555-6789', 'michael.garcia@example.com', '567890123'),
(6, 'Julie', 'Davis', 'Endocrinology', 'DO', '555-0123', 'julie.davis@example.com', '678901234'),
(7, 'Mark', 'Wilson', 'Orthopedics', 'MD', '555-4567', 'mark.wilson@example.com', '789012345'),
(8, 'Linda', 'Anderson', 'Gynecology', 'DO', '555-8901', 'linda.anderson@example.com', '890123456'),
(9, 'William', 'Thomas', 'Psychiatry', 'MD', '555-2345', 'william.thomas@example.com', '901234567'),
(10, 'Maria', 'Jackson', 'Allergy & Immunology', 'DO', '555-6789', 'maria.jackson@example.com', '012345678');


/* Inserting values into Staff table */
INSERT INTO staff (staff_id, staff_first_name, staff_last_name, staff_ssn, staff_email, staff_phone_number, staff_address, staff_role)
VALUES
  (1, 'John', 'Doe', '123456789', 'johndoe@example.com', '1234567890', '123 Main St, Anytown USA', 'Receptionist'),
  (2, 'Jane', 'Smith', '234567890', 'janesmith@example.com', '2345678901', '456 Elm St, Anycity USA', 'Nurse'),
  (3, 'Mike', 'Johnson', '345678901', 'mikejohnson@example.com', '3456789012', '789 Oak St, Anyvillage USA', 'Doctor'),
  (4, 'Lisa', 'Williams', '456789012', 'lisawilliams@example.com', '4567890123', '321 Pine St, Anyhamlet USA', 'Administrator'),
  (5, 'David', 'Brown', '567890123', 'davidbrown@example.com', '5678901234', '654 Cedar St, Anyburg USA', 'Janitor'),
  (6, 'Sarah', 'Miller', '678901234', 'sarahmiller@example.com', '6789012345', '987 Birch St, Anycounty USA', 'Nurse'),
  (7, 'Kevin', 'Davis', '789012345', 'kevindavis@example.com', '7890123456', '753 Maple St, Anytown USA', 'Doctor'),
  (8, 'Melissa', 'Garcia', '890123456', 'melissagarcia@example.com', '8901234567', '159 Pine St, Anytown USA', 'Receptionist'),
  (9, 'Brian', 'Lee', '901234567', 'brianlee@example.com', '9012345678', '951 Oak St, Anytown USA', 'Doctor'),
  (10, 'Jessica', 'Taylor', '012345678', 'jessicataylor@example.com', '0123456789', '753 Elm St, Anytown USA', 'Nurse'),
  (11, 'Matthew', 'Wilson', '345678901', 'matthewwilson@example.com', '3456789012', '357 Oak St, Anytown USA', 'Receptionist'),
  (12, 'Emily', 'Anderson', '456789012', 'emilyanderson@example.com', '4567890123', '741 Cedar St, Anytown USA', 'Nurse'),
  (13, 'Jonathan', 'Thomas', '567890123', 'jonathanthomas@example.com', '5678901234', '963 Pine St, Anytown USA', 'Doctor'),
  (14, 'Elizabeth', 'Jackson', '678901234', 'elizabethjackson@example.com', '6789012345', '159 Oak St, Anytown USA', 'Administrator'),
  (15, 'Christopher', 'Harris', '789012345', 'christopherharris@example.com', '7890123456', '357 Cedar St, Anytown USA', 'Janitor');

/*  Inserting values into appointments table */
INSERT INTO appointments (appointment_id, student_id, doctor_id, appointment_date, appointment_time, appointment_reason)
VALUES
(1, 11, 1, '2023-04-01', '09:00:00', 'Annual Checkup'),
(2, 2, 2, '2023-04-02', '10:30:00', 'Vaccination'),
(3, 33, 3, '2023-04-03', '11:00:00', 'Stomach pain'),
(4, 14, 4, '2023-04-04', '13:30:00', 'Flu'),
(5, 25, 5, '2023-04-05', '14:30:00', 'Injury'),
(6, 16, 6, '2023-04-06', '10:00:00', 'Fever'),
(7, 7, 7, '2023-04-07', '09:30:00', 'Chest pain'),
(8, 18, 8, '2023-04-08', '12:30:00', 'Headache'),
(9, 29, 9, '2023-04-09', '14:00:00', 'Allergies'),
(10, 11, 10, '2023-04-10', '15:00:00', 'Physical'),
(11, 1, 1, '2023-04-11', '10:00:00', 'Stomach pain'),
(12, 12, 2, '2023-04-12', '11:30:00', 'Fever'),
(13, 11, 3, '2023-04-13', '13:00:00', 'Flu'),
(14, 4, 4, '2023-04-14', '14:30:00', 'Injury'),
(15, 15, 5, '2023-04-15', '09:00:00', 'Vaccination'),
(16, 17, 6, '2023-04-16', '11:00:00', 'Headache'),
(17, 27, 7, '2023-04-17', '12:30:00', 'Allergies'),
(18, 38, 8, '2023-04-18', '13:00:00', 'Physical'),
(19, 29, 9, '2023-04-19', '15:30:00', 'Annual Checkup'),
(20, 20, 10, '2023-04-20', '16:30:00', 'Chest pain');

/* Inserting values into appointment info table */
INSERT INTO appointment_info (appointment_info_id, appointment_id, diagnosis_name, diagnosis_report, medication_name, dosage, start_date, end_date)
VALUES
(1, 1, 'Routine Checkup', 'Normal', 'N/A', 'N/A', '2023-04-01', '2023-04-01'),
(2, 2, 'Vaccination', 'Normal', 'Flu Vaccine', '1 dose', '2023-04-02', '2023-04-02'),
(3, 3, 'Stomach Ulcer', 'Moderate', 'Antacid', '1 tablet daily', '2023-04-03', '2023-04-10'),
(4, 4, 'Influenza', 'Severe', 'Tamiflu', '1 capsule twice daily', '2023-04-04', '2023-04-08'),
(5, 5, 'Wrist Fracture', 'Serious', 'Painkillers', '1 tablet every 6 hours', '2023-04-05', '2023-04-12'),
(6, 6, 'Fever', 'Mild', 'Tylenol', '1 tablet every 8 hours', '2023-04-06', '2023-04-09'),
(7, 7, 'Angina', 'Moderate', 'Nitroglycerin', '1 tablet every 4 hours', '2023-04-07', '2023-04-14'),
(8, 8, 'Migraine', 'Severe', 'Sumatriptan', '1 tablet twice daily', '2023-04-08', '2023-04-13'),
(9, 9, 'Allergic Rhinitis', 'Mild', 'Claritin', '1 tablet daily', '2023-04-09', '2023-04-16'),
(10, 10, 'Routine Physical', 'Normal', 'N/A', 'N/A', '2023-04-10', '2023-04-10'),
(11, 11, 'Stomach Ulcer', 'Moderate', 'Antacid', '1 tablet daily', '2023-04-11', '2023-04-18'),
(12, 12, 'Fever', 'Mild', 'Tylenol', '1 tablet every 8 hours', '2023-04-12', '2023-04-15'),
(13, 13, 'Influenza', 'Moderate', 'Tamiflu', '1 capsule twice daily', '2023-04-13', '2023-04-17'),
(14, 14, 'Wrist Fracture', 'Serious', 'Painkillers', '1 tablet every 6 hours', '2023-04-14', '2023-04-21'),
(15, 15, 'Vaccination', 'Normal', 'TDAP Vaccine', '1 dose', '2023-04-15', '2023-04-15'),
(16, 16, 'Migraine', 'Mild', 'Acetaminophen', '1 tablet every 6 hours', '2023-04-16', '2023-04-20'),
(17, 17, 'Allergic Rhinitis', 'Moderate', 'Claritin', '1 tablet daily', '2023-04-17', '2023-04-20');

INSERT INTO appointment_info (appointment_info_id, appointment_id, diagnosis_name, diagnosis_report, medication_name, dosage, start_date, end_date)
VALUES
(18, 18, 'Sore Throat', 'Mild', 'Ibuprofen', '200mg', '2023-04-19', '2023-04-21'),
(19, 19, 'Sinus Infection', 'Severe', 'Amoxicillin', '500mg', '2023-04-20', '2023-04-27'),
(20, 20, 'Pneumonia', 'Moderate', 'Azithromycin', '250mg', '2023-04-21', '2023-04-28');


/* Inserting values to Surgery History table */
INSERT INTO surgery_history (student_surgery_id, student_id, doctor_id, staff_id, surgery_name, surgery_date, hospitalization_reason, hospitalization_date, number_of_days_of_stay)
VALUES
(1, 1, 1, 1, 'Appendectomy', '2022-05-01', 'Appendicitis', '2022-05-01', '3'),
(2, 2, 2, 2, 'Knee replacement', '2022-06-05', 'Osteoarthritis', '2022-06-05', '5'),
(3, 3, 3, 3, 'Gallbladder removal', '2022-07-10', 'Gallstones', '2022-07-10', '2'),
(4, 4, 4, 4, 'Hernia repair', '2022-08-15', 'Inguinal hernia', '2022-08-15', '1'),
(5, 5, 5, 5, 'Cataract surgery', '2022-09-20', 'Cataracts', '2022-09-20', '2');

/* Inserting into billings table */
INSERT INTO billing (billing_id, appointment_id, amount, billing_date, billing_mode)
VALUES
(1, 1, 100.00, '2023-04-01', 'Cash'),
(2, 2, 75.50, '2023-04-02', 'Credit Card'),
(3, 3, 150.00, '2023-04-03', 'Cash'),
(4, 4, 50.00, '2023-04-04', 'Cash'),
(5, 5, 200.00, '2023-04-05', 'Insurance'),
(6, 6, 75.00, '2023-04-06', 'Cash'),
(7, 7, 125.00, '2023-04-07', 'Credit Card'),
(8, 8, 90.00, '2023-04-08', 'Cash'),
(9, 9, 100.00, '2023-04-09', 'Cash'),
(10, 10, 150.00, '2023-04-10', 'Insurance'),
(11, 11, 75.00, '2023-04-11', 'Cash'),
(12, 12, 200.00, '2023-04-12', 'Credit Card'),
(13, 13, 50.00, '2023-04-13', 'Cash'),
(14, 14, 100.00, '2023-04-14', 'Cash'),
(15, 15, 75.00, '2023-04-15', 'Credit Card'),
(16, 16, 125.00, '2023-04-16', 'Cash'),
(17, 17, 90.00, '2023-04-17', 'Cash'),
(18, 18, 100.00, '2023-04-18', 'Credit Card'),
(19, 19, 150.00, '2023-04-19', 'Cash'),
(20, 20, 75.00, '2023-04-20', 'Cash');

