USE LEBANESE_LAW;
-- First Query
SELECT CITIZEN_CIVIL_REGISTRY.Id, PREVIOUS_CHARGE.Case_outcome
FROM CITIZEN_CIVIL_REGISTRY JOIN CRIMINAL_HISTORY ON CITIZEN_CIVIL_REGISTRY.Id = CRIMINAL_HISTORY.Citizen_id
	JOIN PREVIOUS_CHARGE ON CRIMINAL_HISTORY.Case_Outcome = PREVIOUS_CHARGE.Case_outcome AND
	CRIMINAL_HISTORY.Accusation_Date = PREVIOUS_CHARGE.Accusation_date
WHERE 
	CITIZEN_CIVIL_REGISTRY.Id = 'provided ID';



-- Second Query

SELECT DISTINCT LAW.ID, LAW.Title
FROM LAW
JOIN LAW_KEYWORDS ON LAW.ID = LAW_KEYWORDS.Law_id
JOIN ENTERED_CASE_KEYWORDS ON LAW_KEYWORDS.Law_keywords = ENTERED_CASE_KEYWORDS.Entered_case_keyword;


-- Third Query
SELECT USER_.ID , USER_FEEDBACK.Feedback_content
FROM USER_ JOIN USER_FEEDBACK ON USER_.ID = USER_FEEDBACK.User_id;

-- Fourth Query
SELECT ARCHIVED_CASE.CASE_CONTENT, ARCHIVED_CASE.Result 
FROM  COMPATIBILITY JOIN ARCHIVED_CASE ON ARCHIVED_CASE.ID=COMPATIBILITY.Archived_case_id WHERE COMPATIBILITY.Compatibility_percentage >= 90  ;

-- Fifth Query
SELECT Law_Id, Title, Issuance_date,Law_Definition
FROM ENTERED_CASE
 JOIN CASE_MATCH ON ENTERED_CASE.ID = CASE_MATCH.Entered_case_id
 JOIN LAW ON CASE_MATCH.Law_id = LAW.ID
WHERE Accuracy_percentage >= 90;

-- Sixth Query
SELECT ARCHIVED_CASE.Result
FROM ARCHIVED_CASE
WHERE ARCHIVED_CASE.ID = (
  SELECT COMPATIBILITY.Archived_case_id
  FROM COMPATIBILITY
  WHERE COMPATIBILITY.Compatibility_percentage = (
    SELECT MAX(COMPATIBILITY.Compatibility_percentage)
    FROM COMPATIBILITY
    WHERE COMPATIBILITY.Compatibility_percentage >= 90
  )
);
-- Seventh Query
SELECT Law_Definition
FROM LAW
WHERE ID = (
  SELECT MAX(Law_id)
  FROM CASE_MATCH
  WHERE Accuracy_percentage >= 90
  GROUP BY Entered_case_id
);

-- eighth Query
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

-- Ninth Query

    SELECT ACCUSED.Citizen_id
    FROM ACCUSED
    JOIN ENTERED_CASE ON ENTERED_CASE.ID = ACCUSED.Entered_case_id
    JOIN CITIZEN_CIVIL_REGISTRY ON ACCUSED.Citizen_id = CITIZEN_CIVIL_REGISTRY.ID
    WHERE CITIZEN_CIVIL_REGISTRY.Mental_health_record = false;


-- Tenth Query
SELECT * FROM USER_ WHERE Role_='lawyer' OR Role_='judge';
