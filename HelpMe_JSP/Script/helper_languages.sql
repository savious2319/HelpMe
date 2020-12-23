CREATE TABLE HELPER_LANGUAGES(
	HELPER_ID VARCHAR2(50),
	"LEVEL" VARCHAR2(50),
	"LANGUAGE" VARCHAR2(50),
	CONSTRAINT FK_HELPER_ID FOREIGN KEY(HELPER_ID)
	REFERENCES HELPER(HELPER_ID)
);
--brian, daniel, grant, elliot, charles, travis, vic, eric, hamish, joel, emily, jesse, sky, nicole, dave, gareth, natalie
--(KR)   (USA)  (AU)   (JP)    (CN)     (UK)  (FR) (AU) (BR)    (CA) (IT)    (USA) (KR)  (JP)  (CN)   (UK)   (FR)
--Beginner, Elementary, Intermediate, Upper Intermediate, Advance, Proficient

INSERT ALL INTO HELPER_LANGUAGES
VALUES('brian', 'Proficient', 'English')
INTO HELPER_LANGUAGES
VALUES('brian', 'Proficient', 'Korean')
INTO HELPER_LANGUAGES
VALUES('brian', 'Upper Intermediate', 'Japanese')
INTO HELPER_LANGUAGES
VALUES('daniel','Proficient', 'English')
INTO HELPER_LANGUAGES
VALUES('daniel','Elementary','Korean')
INTO HELPER_LANGUAGES
VALUES('grant', 'Proficient','English')
INTO HELPER_LANGUAGES
VALUES('elliot','Advance','English')
INTO HELPER_LANGUAGES
VALUES('elliot','Proficient','Japanese')
INTO HELPER_LANGUAGES
VALUES('charles', 'Proficient', 'Chinese')
INTO HELPER_LANGUAGES
VALUES('travis', 'Proficient', 'English')
INTO HELPER_LANGUAGES
VALUES('vic', 'Proficient', 'French')
INTO HELPER_LANGUAGES
VALUES('eric','Proficient','English')
INTO HELPER_LANGUAGES
VALUES('hamish', 'Proficient','Portuguese')
INTO HELPER_LANGUAGES
VALUES('joel','Proficient','English')
INTO HELPER_LANGUAGES
VALUES('emily','Proficient','Italian')
INTO HELPER_LANGUAGES
VALUES('jesse','Proficient','English')
INTO HELPER_LANGUAGES
VALUES('sky','Proficient','Korean')
INTO HELPER_LANGUAGES
VALUES('sky','Upper Intermediate','English')
INTO HELPER_LANGUAGES
VALUES('nicole','Proficient','Japanese')
INTO HELPER_LANGUAGES
VALUES('dave','Proficient','Chinese')
INTO HELPER_LANGUAGES
VALUES('gareth','Proficient','English')
INTO HELPER_LANGUAGES
VALUES('natalie','Proficient','French')
SELECT * FROM DUAL;


SELECT* FROM HELPER_LANGUAGES;


DROP TABLE HELPER_LANGUAGES;
