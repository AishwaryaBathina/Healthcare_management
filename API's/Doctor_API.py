# Impoting all the required Libraries
import sys
import pymysql

flag = 1
stop = 0

while stop == 0:
    # Connection Parameters
    print("Trying to connect to the Database.")
    database_connection = pymysql.connect( host="localhost", user="root", password="Welcome@123", database='uncc_student_clinic', port=3306, charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)

    # Verifying the Database connection status
    try:
        with database_connection.cursor() as cursor:
            cursor.execute("SELECT 1")
        print("Connection Successful")
    except pymysql.Error:
        print("Error connecting to the database")
        flag = 0
        break

    # Input the user name for Role based access
    user_name = input("Enter your username: ")

    # Fetching the role for given username from database
    with database_connection.cursor() as cursor:
        cursor.execute("SELECT user_role FROM roleBasedData WHERE user_name = %s", (user_name))
        result_set = cursor.fetchone()
        if result_set and "user_role" in result_set:
            user_role = result_set["user_role"]
        else:
            user_role = None
    print("Role of", user_name, "is: ", user_role)

    # Verifying the role authorisation of the user
    if user_role == "doctor":
        print("User is authorised")
        cursor = database_connection.cursor()
    else:
        print("User is unauthorised")
        database_connection.close()
        flag = 0
        break
    stop = 1

if flag == 0:
    print("\nClosing the Student Clinic Management System\n")
    sys.exit()

flag = 1
while flag == 1:
    # Get the user's choice
    doctor_privilages = input("\nWelcome Doctor! Kindly select an option below:\n\na. Adding new Student data in clinic records\nb. Adding student immunisation data\nc. Updating student immunisation data\nd. Deleting student immunisation record\ne. Getting student immunisation data\nf. Updating the doctors data\n(Enter 'exit' to close)\n\nSelect an option: ")

    if doctor_privilages == "exit":
        flag = 0
        break

    # Check the user's choice
    if doctor_privilages == "a":
        # Adding new Student data to clinic records
        student_id = input("Enter the Student ID: ")
        first_name = input("Enter Student First name: ")
        last_name = input("Enter Student Last name: ")
        student_ssn = input("Enter the Student SSN: ")
        cursor.callproc("addStudent",(student_id, first_name, last_name, student_ssn))
        database_connection.commit()
        print("\nAdded students details successfully.")
    elif doctor_privilages == "b":
        # Adding Student immunisation data
        student_id = input("Enter the Student ID: ")
        covid_vaccination_date = input("Enter the COVID Vaccination date (yyyy-mm-dd): ")
        chickenpox_vaccination_date = input("Enter the Chickenpox Vaccination date (yyyy-mm-dd): ")
        TDAP_vaccination_date = input("Enter the TDAP Vaccination date (yyyy-mm-dd): ")
        previous_complication = input("Enter the previous complications (if any): ")
        cursor.callproc("addStudentImmunisationData",(student_id, covid_vaccination_date, chickenpox_vaccination_date, TDAP_vaccination_date, previous_complication))
        database_connection.commit()
        print("\nSuccessfully Added Student Immunisation Data !!!")
    elif doctor_privilages == "c":
        # Updating Student immunisation data
        student_id = input("Enter the Student ID: ")
        covid_vaccination_date = input("Enter the COVID Vaccination date (yyyy-mm-dd): ")
        chickenpox_vaccination_date = input("Enter the Chickenpox Vaccination date (yyyy-mm-dd): ")
        TDAP_vaccination_date = input("Enter the TDAP Vaccination date (yyyy-mm-dd): ")
        previous_complication = input("Enter the previous complications (if any): ")
        cursor.callproc("updateStudentImmunisationData",(student_id, covid_vaccination_date, chickenpox_vaccination_date, TDAP_vaccination_date, previous_complication))
        database_connection.commit()
        print("\nSuccessfully Updated Student Immunisation Data !!!")
    elif doctor_privilages == "d":
        # Deleting immunisation record
        student_id = input("Enter the Student ID: ")
        cursor.callproc("deleteStudentImmunisationRecord",(student_id))
        database_connection.commit()
        print("\nStudent Immunisation record deleted successfully !!!")
    elif doctor_privilages == "e":
        # Getting student immunisation data
        student_id = input("Enter the Student ID: ")
        cursor.callproc("retriveStudentImmunisationData",(student_id))
        database_connection.commit()
        print("\nStudent immunisation Details: ",cursor.fetchall())
    elif doctor_privilages == "f":
        # Updating the doctors data
        doctor_id = input("Enter the Doctor ID: ")
        first_name = input("Enter the Doctor's first name: ")
        last_name = input("Enter the Doctor's last name: ")
        speciality = input("Enter the Doctor's speciality: ")
        qualification = input("Enter the Doctor's qualification: ")
        phone_number = input("Enter the Doctor's phone number: ")
        email = input("Enter the Email ID: ")
        doctor_ssn = input("Enter the Doctor's SSN: ")
        cursor.callproc("updateDoctorData",(doctor_id, first_name, last_name, speciality, qualification, phone_number, email, doctor_ssn))
        database_connection.commit()
        print("\nUpdated Doctor details Successfully!!!")
    else:
        print("\nImproper option selected.")


# Closing of the cursor and the database connection
cursor.close()
database_connection.close()

