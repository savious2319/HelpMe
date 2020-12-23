CREATE TABLE HELPER_EDUCATION(
	HELPER_ID VARCHAR2(50),
	EDUCATION VARCHAR2(500),
	GRADUATE_YEAR NUMBER(4),
	CONSTRAINT FK_EDUCATION FOREIGN KEY(HELPER_ID)
	REFERENCES HELPER(HELPER_ID)
);
--brian, daniel, grant, elliot, charles, travis, vic, eric, hamish, joel, emily, jesse, sky, nicole, dave, gareth, natalie
--(KR)   (USA)  (AU)   (JP)    (CN)     (UK)  (FR) (AU) (BR)    (CA) (IT)    (USA) (KR)  (JP)  (CN)   (UK)   (FR)


INSERT ALL INTO HELPER_EDUCATION
VALUES('brian', 'Sogang University', 2013)
INTO HELPER_EDUCATION
VALUES('daniel', 'University of Southern California', 2010)
INTO HELPER_EDUCATION
VALUES('grant', 'University of Sydney', 2014)
INTO HELPER_EDUCATION
VALUES('elliot', 'University of Tokyo', 2016)
INTO HELPER_EDUCATION
VALUES('charles', 'Peking University', 2008)
INTO HELPER_EDUCATION
VALUES('travis', 'University of Manchester', 2010)
INTO HELPER_EDUCATION
VALUES('vic', 'Sorbonne Université', 2007)
INTO HELPER_EDUCATION
VALUES('eric', 'University of Melbourne', 2012)
INTO HELPER_EDUCATION
VALUES('hamish', 'University of São Paulo', 2014)
INTO HELPER_EDUCATION
VALUES('joel', 'University of British Columbia', 2015)
INTO HELPER_EDUCATION
VALUES('emily', 'University of Milan', 2010)
INTO HELPER_EDUCATION
VALUES('jesse', 'University of Columbia', 2016)
INTO HELPER_EDUCATION
VALUES('sky', 'Hanyang University', 2014)
INTO HELPER_EDUCATION
VALUES('nicole', 'Waseda University', 2016)
INTO HELPER_EDUCATION
VALUES('dave','Nanjing University', 2013)
INTO HELPER_EDUCATION
VALUES('gareth', 'Oxford University', 2015)
INTO HELPER_EDUCATION
VALUES('natalie', 'University of Paris', 2008)
SELECT * FROM DUAL;


SELECT * FROM HELPER_EDUCATION WHERE HELPER_ID = 'sky';

DROP TABLE HELPER_EDUCATION;
