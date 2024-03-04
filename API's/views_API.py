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
    student_privilages = input("\nWelcome Ninner! Kindly select an option below:\n\na. Getting Student data\nb. Getting Doctor data\nc. Getting Staff Data\n(Enter 'exit' to close)\n\nSelect an option: ")

    if student_privilages == "exit":
        flag = 0
        break

    # Check the user's choice
    if student_privilages == "a":
        # Getting Student data
        student_id = input("Enter the Student ID: ")
        cursor.callproc("retriveStudentDataFromViews",(student_id))
        database_connection.commit()
        print("\nStudent Details: ",cursor.fetchall())
    elif student_privilages == "b":
        doctor_id = input("Enter the Doctor ID: ")
        cursor.callproc("retriveDoctorDataFromViews",(doctor_id))
        database_connection.commit()
        print("\nDoctor Details: ",cursor.fetchall())
    elif student_privilages == "c":
        staff_id = input("Enter the Staff ID: ")
        cursor.callproc("retriveStaffDataFromViews",(staff_id))
        database_connection.commit()
        print("\nStaff Details: ",cursor.fetchall())
    else:
        print("\nImproper option selected.")


# Closing of the cursor and the database connection
cursor.close()
database_connection.close()

