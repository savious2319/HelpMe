CREATE TABLE HELPER_WORK(
	HELPER_ID VARCHAR2(50),
	WORK_EXPERIENCE VARCHAR2(500),
	WORK_STARTYEAR NUMBER(4),
	WORK_ENDYEAR NUMBER(4),
	CONSTRAINT FK_WORK FOREIGN KEY(HELPER_ID)
	REFERENCES HELPER(HELPER_ID)
);
--brian, daniel, grant, elliot, charles, travis, vic, eric, hamish, joel, emily, jesse, sky, nicole, dave, gareth, natalie
--(KR)   (USA)  (AU)   (JP)    (CN)     (UK)  (FR) (AU) (BR)    (CA) (IT)    (USA) (KR)  (JP)  (CN)   (UK)   (FR)


INSERT ALL INTO HELPER_WORK
VALUES('brian', 'English Instructor', 2014, 2016)
INTO HELPER_WORK
VALUES('grant', 'Restaurant Manager', 2014, 2018)
INTO HELPER_WORK
VALUES('charles', 'Chinese Instructor', 2010, 2013)
INTO HELPER_WORK
VALUES('vic', 'Travel Guide', 2009, 2012)
INTO HELPER_WORK
VALUES('hamish', 'Scuba Diving Instructor', 2013, 2018)
INTO HELPER_WORK
VALUES('emily', 'Accountant', 2009, 2018)
INTO HELPER_WORK
VALUES('sky', 'Property Management Intern', 2014, 2018)
INTO HELPER_WORK
VALUES('nicole', 'Freelance Translator', 2010, 2018)
INTO HELPER_WORK
VALUES('natalie', 'Retail Store Clerk', 2009, 2012)
SELECT * FROM DUAL;


SELECT * FROM HELPER_WORK;

DROP TABLE HELPER_WORK;