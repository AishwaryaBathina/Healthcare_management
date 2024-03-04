/* Script for Audit Logs */

/* Table for maintaining DDL audit logs */
CREATE TABLE ddl_log (
    operation_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    operation_type VARCHAR(10),
    timestamp TIMESTAMP
);

/* Table for maintaining DML Audit Logs */
CREATE TABLE dml_log (
    operation_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    operation_type VARCHAR(10),
    timestamp TIMESTAMP
);

/* Audit Logs on Table-1: Student Table */

# Trigger for DDL audit logs on students table
DELIMITER $$
CREATE TRIGGER students_create_trigger
AFTER CREATE ON students
FOR EACH STATEMENT
BEGIN
    INSERT INTO ddl_log (table_name, operation_type, timestamp) VALUES ('students', 'create', NOW());
END;
DELIMITER ;

# Trigger for maintaining audit logs for Update operation on students table
DELIMITER $$
CREATE TRIGGER dml_trigger
  AFTER UPDATE ON students
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('students', 'update', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Delete operation on students table
DELIMITER $$
CREATE TRIGGER student_delete_trigger
  AFTER DELETE ON students
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('students', 'delete', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Insert operation on students table
DELIMITER $$
CREATE TRIGGER student_insert_trigger
  AFTER INSERT ON students
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('students', 'insert', NOW());
END$$
DELIMITER ;


/* Audit Logs on Table-2: Doctor Table */

# Trigger for DDL audit logs on doctors table
DELIMITER $$
CREATE TRIGGER doctor_create_trigger
AFTER CREATE ON doctor
FOR EACH STATEMENT
BEGIN
    INSERT INTO ddl_log (table_name, operation_type, timestamp) VALUES ('doctor', 'create', NOW());
END;
DELIMITER ;

# Trigger for maintaining audit logs for Update operation on doctor table
DELIMITER $$
CREATE TRIGGER doctor_update_trigger
  AFTER UPDATE ON doctor
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('doctor', 'update', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Delete operation on doctor table
DELIMITER $$
CREATE TRIGGER doctor_delete_trigger
  AFTER DELETE ON doctor
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('doctor', 'delete', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Insert operation on doctor table
DELIMITER $$
CREATE TRIGGER doctor_insert_trigger
  AFTER INSERT ON doctor
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('doctor', 'insert', NOW());
END$$
DELIMITER ;

/* Audit Logs on Table-3: Appointment Table */

# Trigger for maintaining audit logs for Update operation on appointment table
DELIMITER $$
CREATE TRIGGER appointment_update_trigger
  AFTER UPDATE ON appointments
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('appointments', 'update', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Delete operation on doctor table
DELIMITER $$
CREATE TRIGGER appointments_delete_trigger
  AFTER DELETE ON appointments
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('appointments', 'delete', NOW());
END$$
DELIMITER ;

# Trigger for maintaining audit logs for Insert operation on doctor table
DELIMITER $$
CREATE TRIGGER appointments_insert_trigger
  AFTER INSERT ON appointments
  FOR EACH ROW
BEGIN
  INSERT INTO dml_log (table_name, operation_type, timestamp) VALUES ('appointments', 'insert', NOW());
END$$
DELIMITER ;

SELECT * FROM dml_log;
SELECT * FROM ddl_log;
