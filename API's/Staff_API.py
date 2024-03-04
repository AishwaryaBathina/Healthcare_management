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
    if user_role == "staff":
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
    staff_privilages = input("\nWelcome staff members! Kindly select an option below:\n\na. Updating Student data\nb. Updating Student Insurance data\nc. Adding Student Insurance details\nd. Updating appointment details\ne. Deleting appointment details\nf. Retrieving appointment details\n(Enter 'exit' to close)\n\nSelect an option: ")

    if staff_privilages == "exit":
        flag = 0
        break

    # Check the user's choice
    if staff_privilages == "a":
        # Updating student data
        student_id = input("Enter the Student ID: ")
        first_name = input("Enter Student First name: ")
        last_name = input("Enter Student Last name: ")
        student_ssn = input("Enter the Student SSN: ")
        cursor.callproc("updateStudentsData",(student_id, first_name, last_name, student_ssn))
        database_connection.commit()
        print("\nUpdated students details successfully.")
    elif staff_privilages == "b":
        # Updating student insurance data
        student_id = input("Enter the Student ID: ")
        insurance_provider = input("Enter Insurance provider name: ")
        insurance_policy_number = input("Enter Insurance policy number: ")
        cursor.callproc("updateStudentInsuranceData",(student_id, insurance_provider, insurance_policy_number))
        database_connection.commit()
        print("\nSuccessfully updated new Student insurance details")
    elif staff_privilages == "c":
        # Adding Student Insurance details
        student_id = input("Enter the Student ID: ")
        insurance_provider = input("Enter Insurance provider name: ")
        insurance_policy_number = input("Enter Insurance policy number: ")
        cursor.callproc("addStudentInsuranceData",(student_id, insurance_provider, insurance_policy_number))
        database_connection.commit()
        print("\nSuccessfully added new Student insurance details")
    elif staff_privilages == "d":
        # Updating appointment details
        appointment_id = input("Enter appointment ID: ")
        student_id = input("Enter your Student ID: ")
        doctor_id = input("Enter the Doctor ID whom ypu want to make an appointment: ")
        appointment_date = input("Enter the appointment data (yyyy-mm-dd): ")
        appointment_time = input("Enter the appointment time (hh:mm:ss): ")
        appointment_reason = input("Enter the reason for appointment: ")
        cursor.callproc("updateAppointmentData",(appointment_id, student_id, doctor_id, appointment_date, appointment_time, appointment_reason))
        database_connection.commit()
        print("\nAppointment updated successfully for ",appointment_date)
    elif staff_privilages == "e":
        # Deleting appointment details
        appointment_id = input("Enter appointment ID: ")
        cursor.callproc("deleteAppointmentRecord",(appointment_id))
        database_connection.commit()
        print("\nAppointment deleted successfully")
    elif staff_privilages == "f":
        # Retrieving appointment details
        appointment_id = input("Enter the Appointment ID: ")
        cursor.callproc("retriveAppointmentData",(appointment_id))
        database_connection.commit()
        print("\nAppointment details: ",cursor.fetchall())
    else:
        print("\nImproper option selected.")


# Closing of the cursor and the database connection
cursor.close()
database_connection.close()
