USE LEBANESE_LAW;

INSERT INTO LAW (ID, Title, Issuance_date, Law_Definition)
VALUES (1, 'قانون العقوبات', '1943-3-1', 'قانون شامل يحكم الجرائم والعقوبات في لبنان.'),
(2, 'قانون الأسلحة والذخائر', '2011-8-28', 'ينظم قانون الأسلحة والذخائر اللبناني حيازة الأسلحة النارية والذخائر والاتجار بها.'),
(3, 'قانون الجرائم الإلكترونية والاتصالات الإلكترونية', '2011-8-29', 'يُجرم قانون الجرائم الإلكترونية والاتصالات الإلكترونية اللبناني الأفعال الضارة التي تُرتكب عبر الإنترنت ويُحدد عقوبات صارمة لها.'),
(4, 'قانون الأحوال الشخصية اللبناني', '1925-1-1', 'ينظم قانون الأحوال الشخصية اللبناني أمورًا شخصية مثل الزواج والطلاق والميراث حسب الطائفة الدينية لكل فرد.'),
(5, 'قانون الجنسية اللبنانية', '2015-11-12', 'ينظم قانون الجنسية اللبنانية اكتساب الجنسية ونقلها وفقدانها، ويمكن الحصول عليها بالولادة أو التجنيس.');

INSERT INTO LAW_KEYWORDS(Law_id, Law_keywords)
VALUES (1,'قتل'),(1,'قتله'),(1,'أطلق النار'),(1,'قتيل'),(2,'بندقية صيد'),(2,'سلاح'),(3,'تحرش'),(4,'هوية'),(5,'جنسية');

INSERT INTO RELATED_ARTICLES(Law_id, Related_article)
VALUES (1,'https://menarights.org/sites/default/files/2016-12/LBN_PenalCode1943_AR.pdf'),
(1,'https://www.abaadmena.org/resources//'),
(1,'https://lp.gov.lb/ContentRecordDetails?Id=13675'),
(2,'http://muqtafi.birzeit.edu/pg/getleg.asp?id=12441'),
(2,'https://alyassir.com8%D8%B9%D8%B6-%D8%A7%D9%84%D8%AD%D9%83%D8%A7%D9%85-%D9%81/'),
(3,'https://kms.uac-org.org/content/uploads/InvestmentSu%D8%AA%D8%B%D9%86%D8%A7%D9%86.pdf');

INSERT INTO CATEGORY (ID, Legal_classification)
VALUES
(1, 'القانون الجنائي'),
(2, 'القانون الإداري'),
(3, 'القانون الجنائي'),
(4, 'قانون الأسرة'),
(5, 'القانون الإداري');

INSERT INTO BELONGS (Law_id, Category_id)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4),
(5, 2);

INSERT INTO ENTERED_CASE (ID,CASE_DEFINITION)
VALUES
(1,'‏تراكمت الخلافات بين هادي ورب عمله المدعو أحمد وبدأ الأخير يضايقه بعمله حتى صمم هادي على قتله فقام باستدراجه إلى منزله بحجة قيامه بتحضير القهوة واستلّ بندقية الصيد وأطلق النار عليه من الخلف أرداه قتيلا'),
(2,'‏قام هادي بسرقة ابن عمه وكان المبلغ 10,000 دولار بالإضافة إلى خمسة كيلو غرامات من الذهب'),
(3,'‏قام أحمد بالتحرش إلكترونيا بفتاة على مواقع التواصل الاجتماعي'),
(4,'‏قام ساجد بدهس فتاتان كانت تمران على الرصيف ما أدى إلى قتلهما'),
(5,'‏قامت مروة الإخلال بعمل المهنة في شرها تسريب عدة معلومات حساسة ما أدى إلى خسارة الشركة');

INSERT INTO  ENTERED_CASE_KEYWORDS(Entered_case_id, Entered_case_keyword)
VALUES
(1,'قتله'),
(2,'بندقية الصيد'),
(3,'أطلق النار'),
(4,'قتيلا'),
(5,'استدراجه');

INSERT INTO CASE_MATCH(Law_id, Entered_case_id, Accuracy_percentage, Entered_Case_result)
VALUES (1,1,90,'‏جريمة قتل عمدي قام بها هادي بحق ‫رب‬ عمله تطبق عليه المادة 549 من قانون العقوبات ونتيجتها الإعدام'),
(2,1,90,'‏جريمة حيازة سلاح بدون رخصة وفقا لقانون الأسلحة والذخائر المادة 73'),
(3,1,7,''),
(4,1,3,''),
(5,1,2,'');

INSERT INTO CITIZEN_CIVIL_REGISTRY(ID, First_name, Last_name, Age, Nationality, Mental_health_record)
VALUES (53672845,'هادي','الموسوي',35,'لبناني',false),
(4356273,'أحمد','صبرا',40,'لبناني',false),
(202201705,'مروة','زين الدين',19,'لبنانية',false),
(202234536,'ساجد','حمدان',19,'لبناني',false),
(5463748,'منار','عاملي',22,'لبنانية',false);

INSERT INTO ACCUSED(Entered_case_id ,Citizen_id)
VALUES (1,53672845),(2,202201705),(2,202234536),(3,5463748),(3,4356273);

INSERT ARCHIVED_CASE(ID,CASE_CONTENT,Result)
VALUES (1,'قتل شادي زوجته بعدما أطلق النار عليها','الاعدام'),(2,'أطلق فريد النار باستخدام بندقية صيد','الحبس بسبب عدم الحيازة على رخصة سلاح'),(3,'سرق محمد 40000 من أمير بسبب أن الاخير يضايقه بعمله','الحبس لمدة معينة مع دفع تعويض'),(4,'أجهض الطبيب طفل الامرأة رغما عنها ','محاكمة الطبيب وسحب اذن مزاولة المهنة'),(5,'حادث مروري ادى الى وفاة عائلة والحق على الذي صدمهم كان سكرانا','الحبس مع دفع مبلغ تعويضي للعائلة');

INSERT INTO ARCHIVED_CASE_KEYWORDS(Archived_case_id ,Archived_case_keyword)
VALUES(1,'قتل'),(1,'أطلق النار'),(2,'صيد'),(2,'بندقية'),(3,'سلاح');

INSERT INTO COMPATIBILITY(Entered_case_id, Archived_case_id,Compatibility_percentage)
VALUES (1,1,95),(1,2,90),(1,3,0),(2,4,50),(1,5,40);

INSERT INTO USER_(ID , Role_, Password_)
VALUES (123, 'lawyer', 123),(1234, 'lawyer', 1234),(12345, 'judge', 12345),(123456, 'judge', 123456),(1234567, 'normal user', 1234567);

INSERT INTO NORMAL_USER(User_id , Basic_access)
VALUES (123, false),(1234, false),(12345, false),(123456, false),(1234567, true);

INSERT INTO LAWYER_JUDGE_USER(User_id , Premium_access)
VALUES(123, true),(1234, true),(12345, true),(123456, true),(1234567, false);

INSERT INTO ENTERS(User_id, Entered_case_id, Time_stamp)
VALUES (123,1,'2023-6-5 02:08:06'),(1234,2,'2022-2-4 12:07:56'),(12345,3,'2023-4-5 11:24:33'),(123456,4,'2022-11-14 07:45:32'),(1234567,5,'2022-1-1 07:45:32');

 INSERT INTO USER_FEEDBACK(ID, User_id, Feedback_content)
 VALUES (1,123,'pretty good experience'),(2,1234,'i liked how smooth this system is, all what a lawyer needs!'),(3,12345,'GREAT EXPERIENCE'),(4,123456,'i do recommend it.'),(5,1234567,'imagine the time this system');
 
 INSERT INTO PREVIOUS_CHARGE(Case_outcome, Accusation_date, Case_details)
 VALUES('غرامة مالية بقيمة 10,000 دولار','2020-11-2','‏انتهاك مصلحة أرض جاره والانتفاع منها بما يخالف القانون'),
 ('لا حكم عليه','2024-5-24','لا يوجد الى تاريخ اليوم'),
 ('الحبس لمدة سنة','2012-2-2','‏قام هادي بسرقة ابن عمه وكان المبلغ 10,000 دولار بالإضافة إلى خمسة كيلو غرامات من الذهب'),
('الحبس لمدة 5 اشهر مع غرامة','2020-3-5','‏قام أحمد بالتحرش إلكترونيا بفتاة على مواقع التواصل الاجتماعي'),
('حبس سنتان مع اشغال شاقة','2015-12-4','‏قام ساجد بدهس فتاتان كانت تمران على الرصيف ما أدى إلى قتلهما'),
('غرامة مالية','2021-7-14','غير معروف');
 
 INSERT INTO CRIMINAL_HISTORY(Citizen_id, Case_Outcome, Accusation_Date)
 VALUES(202201705,'لا حكم عليه','2024-5-24'),
 (53672845,'غرامة مالية بقيمة 10,000 دولار','2020-11-2'),
 (53672845,'الحبس لمدة سنة','2012-2-2'),
(4356273,'الحبس لمدة 5 اشهر مع غرامة','2020-3-5'),
(202234536,'حبس سنتان مع اشغال شاقة','2015-12-4'),
(5463748,'غرامة مالية','2021-7-14');









