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
    if user_role == "student":
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
    student_privilages = input("\nHi Ninners! Kindly select an option below:\n\na. Get Student's Data\nb. Get Student's Insurance Details\nc. Get Student's Immunisation Details\nd. Get Doctor's Details\ne. Make a new appointment\nf. Get Appointment Details\n(Enter 'exit' to close)\n\nSelect an option: ")

    if student_privilages == "exit":
        flag = 0
        break

    # Check the user's choice
    if student_privilages == "a":
        student_id = input("Enter the Student ID: ")
        cursor.callproc("retriveStudentData",(student_id))
        database_connection.commit()
        print("\nStudent Details: ",cursor.fetchall())
    elif student_privilages == "b":
        student_id = input("Enter the Student ID: ")
        cursor.callproc("retriveStudentInsuranceData",(student_id))
        database_connection.commit()
        print("\nStudent insurance details: ",cursor.fetchall())
    elif student_privilages == "c":
        student_id = input("Enter the Student ID: ")
        cursor.callproc("retriveStudentImmunisationData",(student_id))
        database_connection.commit()
        print("\nStudent Immunisation details: ",cursor.fetchall())
    elif student_privilages == "d":
        doctor_id = input("Enter the Doctor ID: ")
        cursor.callproc("retriveDoctorData",(doctor_id))
        database_connection.commit()
        print("\nDoctor details: ",cursor.fetchall())
    elif student_privilages == "e":
        # Get the user's input
        appointment_id = input("Enter a new appointment ID: ")
        student_id = input("Enter your Student ID: ")
        doctor_id = input("Enter the Doctor ID whom ypu want to make an appointment: ")
        appointment_date = input("Enter the appointment data (yyyy-mm-dd): ")
        appointment_time = input("Enter the appointment time (hh:mm:ss): ")
        appointment_reason = input("Enter the reason for appointment: ")
        cursor.callproc("addAppointment",(appointment_id, student_id, doctor_id, appointment_date, appointment_time, appointment_reason))
        database_connection.commit()
        print("\nAppointment created successfully on ",appointment_date)
    elif student_privilages == "f":
        appointment_id = input("Enter the Appointment ID: ")
        cursor.callproc("retriveDoctorData",(appointment_id))
        database_connection.commit()
        print("\nAppointment details: ",cursor.fetchall())
    else:
        print("\nImproper option selected.")


# Closing of the cursor and the database connection
cursor.close()
database_connection.close()

