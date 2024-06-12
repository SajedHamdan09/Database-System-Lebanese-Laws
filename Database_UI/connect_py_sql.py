#https://www.youtube.com/watch?v=3vsC05rxZ8c
#Python MySQL Tutorial - Setup & Basic Queries (w/ MySQL Connector)
import mysql.connector
conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW')

my_cursor = conn.cursor()
conn.commit()
if conn.is_connected():
    print("Connection successfully created!")


my_cursor.execute('SHOW TABLES')
for table in my_cursor:
    print(table)

class User:
    def __init__(self, id=None, role=None):
        self.Id = id
        self.Role = role
        self.Password = password

    def print_info(self):
        print(self.Id, self.Role , self.Password)

    def from_result(self, row):
        self.Id = row[0]
        self.Role= row[1]
        self.Password= row[2]

    def to_database(self, my_cursor):
        my_cursor.execute('INSERT INTO USER_(ID , Role_ , Password_) VALUES ({self.Id},{self.Role},{self.Password})')


my_cursor.execute('SELECT * FROM USER_')
result = my_cursor.fetchall()

p = User()
for row in result:
    p.from_result(row)
    p.print_info()

id = input('Enter new User ID')
rl = input('Enter the Corresponding Role')
ps = input('Enter the User Password')

conn.close()