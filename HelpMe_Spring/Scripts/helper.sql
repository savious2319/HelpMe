CREATE SEQUENCE HELPER_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000;


--헬퍼 테이블
CREATE TABLE HELPER(
	HELPER_NO NUMBER(10),
	HELPER_ID VARCHAR2(50),
	PASSWORD VARCHAR2(50),
	NAME VARCHAR2(50),
	COUNTRY VARCHAR2(50),
	EMAIL VARCHAR2(50),
	BASIC_PAY NUMBER(10) DEFAULT 1800000,
	FARE NUMBER(10),
	AVG_RATING NUMBER(2,1) DEFAULT 0,
	RATING_CNT NUMBER(10) DEFAULT 0,
	TOTAL_RATING NUMBER(10) DEFAULT 0, 
	HELP_LOCATION VARCHAR2(50),
	KAKAO_URL VARCHAR(100),
	INTRO_TITLE VARCHAR2(60),
	DESCRIPTION VARCHAR2(4000),
	FLAG_URL VARCHAR2(100),
	CONSTRAINT PK_HELPER_ID PRIMARY KEY(HELPER_ID)
);

DROP TABLE HELPER;


--Gangnam-gu
--1
INSERT INTO HELPER(HELPER_NO, HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'brian', '1234', 'Brian B.', 'South Korea', 'brian@gmail.com', 
30000, 'Gangnam-gu', 'https://open.kakao.com/o/sGO81OEc', 'Let me help you experience the true entertainment in Gangnam',
'HIn your native language, you are excellent at expressing your thoughts and feelings with accuracy. The problem is that the level of confidence you have in your Business English skills is significantly less than the confidence in your business skills. This problem is a real issue in both your career and your personal life. You can not accurately express yourself when speaking to others and writing to clients and colleagues. One of the most frustrating feelings you have is when one of your colleagues or clients can not understand what you are trying to communicate. Although you are great at business, your lack of business English communication skills holds you back to excel in your future.
You fear that you will not advance in your career if you cannot increase your English communication confidence. Your English skills are holding you back, and this frustrates you. You are not free to reach your dreams and ambitions of earning high-level business executive jobs and compensation. These problems weigh heavily on you and affect your career, personal life, and current happiness level.
The majority of my clients felt precisely the same way when I started working with them. You are not alone. The great news is that there is a solution!', 'https://static.preply.com/images/new/flags-svg/4x3/kr.svg');

--2
INSERT INTO HELPER(HELPER_NO, HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'daniel', '1234', 'Daniel D.', 'United States of America', 'daniel@gmail.com', 31000, 'Gangnam-gu', 'https://open.kakao.com/o/swP52OEc', 'Qualified English Native Teacher with 2 Years of Experience', 'In your native language, you are excellent at expressing your thoughts and feelings with accuracy. The problem is that the level of confidence you have in your Business English skills is significantly less than the confidence in your business skills. This problem is a real issue in both your career and your personal life. You can not accurately express yourself when speaking to others and writing to clients and colleagues. One of the most frustrating feelings you have is when one of your colleagues or clients can not understand what you are trying to communicate. Although you are great at business, your lack of business English communication skills holds you back to excel in your future.
You fear that you will not advance in your career if you cannot increase your English communication confidence. Your English skills are holding you back, and this frustrates you. You are not free to reach your dreams and ambitions of earning high-level business executive jobs and compensation. These problems weigh heavily on you and affect your career, personal life, and current happiness level.
The majority of my clients felt precisely the same way when I started working with them. You are not alone. The great news is that there is a solution!', 'https://static.preply.com/images/new/flags-svg/4x3/us.svg');

--3
INSERT INTO HELPER(HELPER_NO, HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'grant', '1234', 'Grant F.', 'United Kingdom', 'grant@gmail.com', 
32000, 'Gangnam-gu', 'https://open.kakao.com/o/syTp4OEc', 'Former CEO & Investment Professional',
'In your native language, you are excellent at expressing your thoughts and feelings with accuracy. The problem is that the level of confidence you have in your Business English skills is significantly less than the confidence in your business skills. This problem is a real issue in both your career and your personal life. You can not accurately express yourself when speaking to others and writing to clients and colleagues. One of the most frustrating feelings you have is when one of your colleagues or clients can not understand what you are trying to communicate. Although you are great at business, your lack of business English communication skills holds you back to excel in your future.
You fear that you will not advance in your career if you cannot increase your English communication confidence. Your English skills are holding you back, and this frustrates you. You are not free to reach your dreams and ambitions of earning high-level business executive jobs and compensation. These problems weigh heavily on you and affect your career, personal life, and current happiness level.
The majority of my clients felt precisely the same way when I started working with them. You are not alone. The great news is that there is a solution!
', 'https://static.preply.com/images/new/flags-svg/4x3/au.svg');

--4
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'elliot', '1234', 'Elliot L.', 'Sweden', 'elliot@gmail.com', 
33000, 'Gangnam-gu', 'https://open.kakao.com/o/sRrX4OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/jp.svg');

--5
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'charles', '1234', 'Charles T.', 'France', 'charles@gmail.com', 
34000, 'Gangnam-gu', 'https://open.kakao.com/o/snfn5OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/cn.svg');

--6
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'travis', '1234', 'Travis H.', 'United States of America', 'travis@gmail.com', 
35000, 'Gangnam-gu', 'https://open.kakao.com/o/slRE5OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/gb.svg');

--7
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'vic', '1234', 'Vic T.', 'Australia', 'vic@gmail.com', 
35000, 'Gangnam-gu', 'https://open.kakao.com/o/sA145OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/fr.svg');

--8
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'eric', '1234', 'Eric A.', 'Germany', 'eric@gmail.com', 
36000, 'Gangnam-gu', 'https://open.kakao.com/o/sKAh6OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/au.svg');

--9
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'hamish', '1234', 'Hamish O.', 'Spain', 'hamish@gmail.com', 
37000, 'Gangnam-gu', 'https://open.kakao.com/o/sXOz6OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/br.svg');

--10
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'joel', '1234', 'Joel W.', 'Mexico', 'joel@gmail.com', 
38000, 'Gangnam-gu', 'https://open.kakao.com/o/sx186OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/ca.svg');

--11
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'emily', '1234', 'Emily W.', 'Japan', 'emily@gmail.com', 
39000, 'Gangnam-gu', 'https://open.kakao.com/o/siTx9OEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/it.svg');

--Yeongdeungpo-gu
--1
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'jesse', '1234', 'Jesse G.', 'Italy', 'jesse@gmail.com', 
40000, 'Yeongdeungpo-gu', 'https://open.kakao.com/o/sURC0WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/us.svg');

--2
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'sky', '1234', 'Sky B.', 'South Korea', 'sky@gmail.com', 
32000, 'Yeongdeungpo-gu', 'https://open.kakao.com/o/sqLK0WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/kr.svg');

--3
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'nicole', '1234', 'Nicole W.', 'China', 'nicole@gmail.com', 
34000, 'Yeongdeungpo-gu', 'https://open.kakao.com/o/sMEr1WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/jp.svg');

--Jongno-gu
--1
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'dave', '1234', 'Dave W.', 'United States of America', 'dave@gmail.com', 
36000, 'Jongno-gu', 'https://open.kakao.com/o/swGu1WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/cn.svg');

--2
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'gareth', '1234', 'Gareth M.', 'Thailand', 'gareth@gmail.com', 
35000, 'Jongno-gu', 'https://open.kakao.com/o/seWD1WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/gb.svg');

--Dongdaemun-gu
INSERT INTO HELPER(HELPER_NO,HELPER_ID, PASSWORD, NAME, COUNTRY, EMAIL, FARE, HELP_LOCATION, KAKAO_URL, INTRO_TITLE, DESCRIPTION, FLAG_URL)
VALUES(HELPER_SEQ.NEXTVAL, 'natalie', '1234', 'Natalie P.', 'New Zealand', 'natalie@gmail.com', 
37000, 'Dongdaemun-gu', 'https://open.kakao.com/o/sa2H1WEc', 'Certified teacher with experience tutoring adults',
'Evidence exists that shows that 360 million people speak English. Would you like to join the English speaking community, or 
just improve your vocabulary, grammar, pronunciation, or writing? Are you willing to get messy and make a painting with me? 
I focus my lessons on individual learners'' needs and craft my lessons toward your interests. When I earned a bachelor''s degree from Northern Arizona University, 
I graduated from the Honors Program which is intensive in English and writing. I taught as an elementary school for one year. 
Now I live in Italy pursuing my Master''s Degree in art. My experience ranges from teaching art to writing and education. I hope we work together in the future. 
Please book a trial lesson with me so we can begin your learning.', 'https://static.preply.com/images/new/flags-svg/4x3/fr.svg');



SELECT HELPER_ID, AVG_RATING, RATING_CNT, TOTAL_RATING FROM HELPER;

SELECT HELPER_ID, FARE FROM HELPER;

SELECT * FROM HELPER WHERE HELPER_ID = 'daniel';

SELECT * FROM HELPER WHERE HELPER_ID = 'sky';

SELECT * FROM HELPER;



