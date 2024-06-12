CREATE SCHEMA LEBANESE_LAW;

USE LEBANESE_LAW;

CREATE TABLE LAW(
	ID INT NOT NULL,
    Title VARCHAR(100),
    Issuance_date DATE,
    Law_Definition TEXT,
    PRIMARY KEY(ID),
    UNIQUE(ID , Title)
);

CREATE TABLE LAW_KEYWORDS(
	Law_id INT,
    Law_keywords VARCHAR(100),
    PRIMARY KEY(Law_id , Law_keywords),
    FOREIGN KEY(Law_id) REFERENCES LAW(ID)
);

CREATE TABLE RELATED_ARTICLES(
	Law_id INT,
    Related_article VARCHAR(300),
    PRIMARY KEY(Law_id , Related_article),
    FOREIGN KEY(Law_id) REFERENCES LAW(ID) 
);

CREATE TABLE CATEGORY(
	ID INT NOT NULL,
    Legal_classification VARCHAR(200),
    PRIMARY KEY(ID)
);

CREATE TABLE BELONGS(
	Law_id INT,
    Category_id INT,
    PRIMARY KEY(Law_id , Category_id),
    FOREIGN KEY(Law_id) REFERENCES LAW(ID),
    FOREIGN KEY(Category_id) REFERENCES CATEGORY(ID) 
);

CREATE TABLE ENTERED_CASE(
	ID INT NOT NULL,
    CASE_DEFINITION VARCHAR(300),
    PRIMARY KEY(ID)
);

CREATE TABLE ENTERED_CASE_KEYWORDS(
	Entered_case_id INT,
    Entered_case_keyword VARCHAR(200),
    PRIMARY KEY(Entered_case_id , Entered_case_keyword),
    FOREIGN KEY(Entered_case_id) REFERENCES ENTERED_CASE(ID)
);

CREATE TABLE CASE_MATCH(
	Law_id INT,
    Entered_case_id INT,
    Accuracy_percentage FLOAT,
    Entered_Case_result VARCHAR(200),
    PRIMARY KEY(Law_id , Entered_case_id),
    FOREIGN KEY(Law_id) REFERENCES LAW(ID),
	FOREIGN KEY(Entered_case_id) REFERENCES ENTERED_CASE(ID)
);

CREATE TABLE CITIZEN_CIVIL_REGISTRY(
	ID INT NOT NULL,
    First_name VARCHAR(200),
    Last_name VARCHAR(200),
    Age INT,
    Nationality VARCHAR(100),
    Mental_health_record VARCHAR(250),
    PRIMARY KEY(ID)
);

CREATE TABLE ACCUSED(
	Entered_case_id INT,
    Citizen_id INT,
    PRIMARY KEY(Entered_case_id , Citizen_id),
    FOREIGN KEY(Entered_case_id) REFERENCES ENTERED_CASE(ID),
	FOREIGN KEY(Citizen_id) REFERENCES CITIZEN_CIVIL_REGISTRY(ID) ON DELETE CASCADE
);

CREATE TABLE ARCHIVED_CASE(
	ID INT NOT NULL,
    CASE_CONTENT VARCHAR(300),
    Result VARCHAR(200),
    PRIMARY KEY(ID)
);

CREATE TABLE ARCHIVED_CASE_KEYWORDS(
	Archived_case_id Int,
    Archived_case_keyword VARCHAR(200),
    PRIMARY KEY(Archived_case_id , Archived_case_keyword),
    FOREIGN KEY(Archived_case_id) REFERENCES ARCHIVED_CASE(ID)
);

CREATE TABLE COMPATIBILITY(
	Entered_case_id INT,
    Archived_case_id INT,
    Compatibility_percentage FLOAT,
    PRIMARY KEY(Entered_case_id , Archived_case_id),
    FOREIGN KEY(Entered_case_id) REFERENCES ENTERED_CASE(ID),
	FOREIGN KEY(Archived_case_id) REFERENCES ARCHIVED_CASE(ID)
);

CREATE TABLE USER_(
	ID INT NOT NULL,
    Role_ VARCHAR(200),
    Password_ VARCHAR(26),
    PRIMARY KEY(ID)
    
);

CREATE TABLE NORMAL_USER(
	User_id INT,
    Basic_access BOOLEAN,
    PRIMARY KEY(User_id),
    FOREIGN KEY(User_id) REFERENCES USER_(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LAWYER_JUDGE_USER(
	User_id INT,
    Premium_access BOOLEAN,
    PRIMARY KEY(User_id),
    FOREIGN KEY(User_id) REFERENCES USER_(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ENTERS(
	User_id INT,
	Entered_case_id INT NOT NULL,
    Time_stamp DATETIME,
    PRIMARY KEY(User_id , Entered_case_id),
    FOREIGN KEY(User_id) REFERENCES USER_(ID)
);

CREATE TABLE USER_FEEDBACK(
	ID INT NOT NULL,
    User_id INT,
    Feedback_content VARCHAR(250),
    PRIMARY KEY(ID),
    FOREIGN KEY(User_id) REFERENCES USER_(ID)
);

CREATE TABLE PREVIOUS_CHARGE(
	Case_outcome VARCHAR(250),
    Accusation_date DATE,
    Case_details VARCHAR(250),
    PRIMARY KEY(Case_outcome , Accusation_date)
);

CREATE TABLE CRIMINAL_HISTORY(
	Citizen_id INT,
    Case_Outcome VARCHAR(250),
	Accusation_Date DATE,
	PRIMARY KEY(Citizen_id ,Case_outcome , Accusation_date),
    FOREIGN KEY(Citizen_id) REFERENCES CITIZEN_CIVIL_REGISTRY(ID),
	Foreign KEY(Case_Outcome , Accusation_Date) REFERENCES PREVIOUS_CHARGE(Case_outcome , Accusation_date) ON UPDATE CASCADE
);