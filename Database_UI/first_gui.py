#  python "/home/sajedhamdan/Desktop/CMPS252/Project UI/first_gui.py"


# ‏تراكمت الخلافات بين هادي ورب عمله المدعو أحمد وبدأ الأخير يضايقه بعمله حتى صمم هادي على قتله فقام باستدراجه إلى منزله بحجة قيامه بتحضير القهوة واستلّ بندقية الصيد وأطلق النار عليه من الخلف أرداه قتيلا


class User:
    def __init__(self, id=None, role=None , password=None):
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



class LawyerJudgeUser:
    def __init__(self, user_id=None, premium_access=None):
        self.UserId = user_id
        self.PremiumAccess = premium_access

    def print_info(self):
        print(self.UserId, self.PremiumAccess)

    def from_result(self, row):
        self.UserId = row[0]
        self.PremiumAccess = row[1]

    def to_database(self, my_cursor):
        sql_query = f'INSERT INTO LAWYER_JUDGE_USER(User_id , Premium_access) VALUES ({self.UserId},{self.PremiumAccess})'
        my_cursor.execute(sql_query)


# def handle_clickevent():
#     import mysql.connector
#     conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW')
#     my_cursor = conn.cursor()
#     conn.commit()
#     if conn.is_connected():
#         print("Connection successfully created!")
#     my_cursor.execute('SHOW TABLES')
#     for table in my_cursor:
#         print(table)
#     my_cursor.execute('SELECT * FROM USER_')
#     result = my_cursor.fetchall()
#     p = User()
#     for row in result:
#         p.from_result(row)
#         # Insert user info into the Text widget
#         text.insert(tk.END, f'ID: {p.Id}, Role: {p.Role}, Password: {p.Password}\n')
#     id = input('Enter new User ID')
#     rl = input('Enter the Corresponding Role')
#     ps = input('Enter the User Password')
#     conn.close()


import tkinter as tk
window = tk.Tk()
# Create an Entry widget


def handle_clickevent_1():
    import mysql.connector
    conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW' , charset='utf8')
    my_cursor = conn.cursor()
    conn.commit()
    if conn.is_connected():
        print("Connection successfully created!")
    my_cursor.execute('SHOW TABLES')
    for table in my_cursor:
        print(table)
    
    # Get the ID from the Entry widget
    id = entry.get()
    
    # Use the ID in your query
    my_query = f"""
    SELECT CITIZEN_CIVIL_REGISTRY.Id, PREVIOUS_CHARGE.Case_outcome, PREVIOUS_CHARGE.Accusation_date
    FROM CITIZEN_CIVIL_REGISTRY JOIN CRIMINAL_HISTORY ON CITIZEN_CIVIL_REGISTRY.Id = CRIMINAL_HISTORY.Citizen_id
        JOIN PREVIOUS_CHARGE ON CRIMINAL_HISTORY.Case_Outcome = PREVIOUS_CHARGE.Case_outcome AND
        CRIMINAL_HISTORY.Accusation_Date = PREVIOUS_CHARGE.Accusation_date
    WHERE CITIZEN_CIVIL_REGISTRY.Id = '{id}';
    """
    my_cursor.execute(my_query)
    
    result = my_cursor.fetchall()
    
    # Clear the Text widget
    text.delete("1.0", tk.END)
    
    for row in result:
        case_outcome = row[1][::-1]  # Reverse the Arabic string
        # Insert result into the Text widget
        text.insert(tk.END, f'ID: {row[0]}, Case Outcome: {case_outcome}, Accusation Date: {row[2]}\n')
        # Center align the text
        text.tag_configure("center", justify='center')
        text.tag_add("center", "1.0", "end")
    conn.close()




def handle_clickevent_2():
    import mysql.connector
    conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW')
    my_cursor = conn.cursor()
    conn.commit()
    if conn.is_connected():
        print("Connection successfully created!")
    my_cursor.execute('SHOW TABLES')
    for table in my_cursor:
        print(table)
    
    # Run your query
    my_query = """
    SELECT ARCHIVED_CASE.Case_content, ARCHIVED_CASE.Result 
    FROM  COMPATIBILITY JOIN ARCHIVED_CASE ON ARCHIVED_CASE.ID=COMPATIBILITY.Archived_case_id WHERE COMPATIBILITY.Compatibility_percentage >= 90;
    """
    my_cursor.execute(my_query)
    
    result = my_cursor.fetchall()
    
    # Clear the Text widget
    text.delete("1.0", tk.END)
    
    for row in result:
        result_text = row[0][::-1]  # Reverse the Arabic string
        # Insert result into the Text widget
        text.insert(tk.END, f'Result: {result_text}\n')
        # Center align the text
        text.tag_configure("center", justify='center')
        text.tag_add("center", "1.0", "end")
    conn.close()




def handle_clickevent_3():
    import mysql.connector
    conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW' , charset='utf8')
    my_cursor = conn.cursor()
    conn.commit()
    if conn.is_connected():
        print("Connection successfully created!")
    my_cursor.execute('SHOW TABLES')
    for table in my_cursor:
        print(table)
    
    # Run your query
    my_query = """
    SELECT Law_Id, Title, Issuance_date, Law_Definition
    FROM ENTERED_CASE
    JOIN CASE_MATCH ON ENTERED_CASE.ID = CASE_MATCH.Entered_case_id
    JOIN LAW ON CASE_MATCH.Law_id = LAW.ID
    WHERE Accuracy_percentage >= 90;
    """
    my_cursor.execute(my_query)
    
    result = my_cursor.fetchall()
    
    # Clear the Text widget
    text.delete("1.0", tk.END)
    
    for row in result:
        title = row[1][::-1]  # Reverse the Arabic string
        law_definition = row[3][::-1]  # Reverse the Arabic string
        # Insert result into the Text widget
        text.insert(tk.END, f'Law ID: {row[0]}, Title: {title}, Issuance Date: {row[2]}, Law Definition: {law_definition}\n')
        # Center align the text
        text.tag_configure("center", justify='center')
        text.tag_add("center", "1.0", "end")
    conn.close()



def handle_clickevent_4():
    import mysql.connector
    conn = mysql.connector.connect(host='localhost',username='root',password='root',database='LEBANESE_LAW' , charset='utf8')
    my_cursor = conn.cursor()
    conn.commit()
    if conn.is_connected():
        print("Connection successfully created!")
    my_cursor.execute('SHOW TABLES')
    for table in my_cursor:
        print(table)
    
    # Run your new query
    my_query = """
    SELECT RELATED_ARTICLES.Related_article
    FROM RELATED_ARTICLES
    JOIN (
      SELECT CASE_MATCH.Entered_case_id
      FROM ENTERED_CASE
      JOIN CASE_MATCH ON ENTERED_CASE.ID = CASE_MATCH.Entered_case_id
      JOIN LAW ON CASE_MATCH.Law_id = LAW.ID
      WHERE CASE_MATCH.Accuracy_percentage > 85
    ) AS HighAccuracyMatches
    ON RELATED_ARTICLES.Law_id = HighAccuracyMatches.Entered_case_id;
    """
    my_cursor.execute(my_query)
    
    result = my_cursor.fetchall()
    
    # Clear the Text widget
    text.delete("1.0", tk.END)
    
    for row in result:
        related_article = row[0]  # Keep the Arabic string as is
        # Insert result into the Text widget
        text.insert(tk.END, f'Related Article: {related_article}\n')
        # Center align the text
        text.tag_configure("center", justify='center')
        text.tag_add("center", "1.0", "end")
    conn.close()






#https://realpython.com/python-gui-tkinter/
import tkinter as tk
from tkinter import font
window.geometry('800x600')
window.configure(bg='white')  # Set the background color to blue
window.title("Welcome to LawBot: Your Personal Legal Assistant")

label_font = font.Font(family="Helvetica", size=20, weight="bold")
# label_font = font.Font(size=20, weight="bold")

label = tk.Label(
    text="AI Advocate, Your Personal Legal Assistant",
    foreground="Blue",  # Set the text color to red
    background="white",  # Set the background color to white
    height=2,
    font=label_font  # Apply the font settings
)

label.pack(fill=tk.X)


entry = tk.Entry(window, width=50)
entry.pack(padx=20, pady=20)  # Add 10px horizontal and vertical padding

# Add a hint inside the Entry widget
entry.insert(0, "Enter your text here")


def on_enter(event):
    # Change the text color to blue when the mouse enters the button
    button1['fg'] = 'black'

def on_leave(event):
    # Change the text color back to black when the mouse leaves the button
    button1['fg'] = 'white'

button1 = tk.Button(
    text="Find Citizen Civil registry",
    command=handle_clickevent_1,
    master=window,
    width=20,
    height=2,
    bg="blue",
    fg="white",
    borderwidth=2,
    relief="groove",
    padx=10,  # Add horizontal padding
    pady=10   # Add vertical padding
)
button1.pack(pady=(0, 20))

# Bind the functions to the button
button1.bind("<Enter>", on_enter)
button1.bind("<Leave>", on_leave)






def on_enter(event):
    # Change the text color to blue when the mouse enters the button
    button2['fg'] = 'black'

def on_leave(event):
    # Change the text color back to black when the mouse leaves the button
    button2['fg'] = 'white'



button2 = tk.Button(
    text="Find Archived Case",
    command=handle_clickevent_2,
    master=window,
    width=20,
    height=2,
    bg="blue",
    fg="white",
    borderwidth=2,
    relief="groove"
)
button2.pack(pady=(0, 10))

button2.pack(pady=(0, 20))


button2.bind("<Enter>", on_enter)
button2.bind("<Leave>", on_leave)




def on_enter(event):
    # Change the text color to blue when the mouse enters the button
    button3['fg'] = 'black'

def on_leave(event):
    # Change the text color back to black when the mouse leaves the button
    button3['fg'] = 'white'



button3 = tk.Button(
    text="Find Related Law",
    command=handle_clickevent_3,
    master=window,
    width=20,
    height=2,
    bg="blue",
    fg="white",
    borderwidth=2,
    relief="groove"
)
button3.pack(pady=(0, 10))

button3.pack(pady=(0, 20))

button3.bind("<Enter>", on_enter)
button3.bind("<Leave>", on_leave)




def on_enter(event):
    # Change the text color to blue when the mouse enters the button
    button4['fg'] = 'black'

def on_leave(event):
    # Change the text color back to black when the mouse leaves the button
    button4['fg'] = 'white'



button4 = tk.Button(
    text="Find Related Articles",
    command=handle_clickevent_4,
    master=window,
    width=20,
    height=2,
    bg="blue",
    fg="white",
    borderwidth=2,
    relief="groove"
)
button4.pack(pady=(0, 10))

button4.pack(pady=(0, 20))

button4.bind("<Enter>", on_enter)
button4.bind("<Leave>", on_leave)




# text = tk.Text(window)
text = tk.Text(window, height=26, width=180)


label.pack()
button1.pack()
button2.pack()
text.pack()

window.mainloop()
