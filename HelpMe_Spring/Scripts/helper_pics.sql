CREATE TABLE HELPER_PICS(
	HELPER_ID VARCHAR2(50),
	MAIN_FILENAME VARCHAR2(100),
	PIC1_FILENAME VARCHAR2(100),
	PIC2_FILENAME VARCHAR2(100),
	PIC3_FILENAME VARCHAR2(100),
	PIC4_FILENAME VARCHAR2(100),
	PIC5_FILENAME VARCHAR2(100),
	CONSTRAINT FK_PICS FOREIGN KEY(HELPER_ID)
	REFERENCES HELPER(HELPER_ID)
);


DROP TABLE HELPER_PICS;

INSERT INTO HELPER_PICS
VALUES('brian', 'images/brian/brian.jpeg', 'images/brian/add_picture.png', 'images/brian/add_picture.png', 'images/brian/add_picture.png', 'images/brian/add_picture.png', 'images/brian/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('sky', 'images/sky/sky.jpg', 'images/sky/add_picture.png', 'images/sky/add_picture.png', 'images/sky/add_picture.png', 'images/sky/add_picture.png', 'images/sky/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('nicole', 'images/nicole/nicole.jpg', 'images/nicole/add_picture.png', 'images/nicole/add_picture.png', 'images/nicole/add_picture.png', 'images/nicole/add_picture.png', 'images/nicole/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('gareth', 'images/gareth/gareth.jpg', 'images/gareth/add_picture.png', 'images/gareth/add_picture.png', 'images/gareth/add_picture.png', 'images/gareth/add_picture.png', 'images/gareth/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('dave', 'images/dave/dave.jpg', 'images/dave/add_picture.png', 'images/dave/add_picture.png', 'images/dave/add_picture.png', 'images/dave/add_picture.png', 'images/dave/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('charles', 'images/charles/charles.jpg', 'images/charles/add_picture.png', 'images/charles/add_picture.png', 'images/charles/add_picture.png', 'images/charles/add_picture.png', 'images/charles/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('daniel', 'images/daniel/daniel.jpg', 'images/daniel/add_picture.png', 'images/daniel/add_picture.png', 'images/daniel/add_picture.png', 'images/daniel/add_picture.png', 'images/daniel/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('elliot', 'images/elliot/elliot.jpg', 'images/elliot/add_picture.png', 'images/elliot/add_picture.png', 'images/elliot/add_picture.png', 'images/elliot/add_picture.png', 'images/elliot/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('emily', 'images/emily/emily.jpg', 'images/emily/add_picture.png', 'images/emily/add_picture.png', 'images/emily/add_picture.png', 'images/emily/add_picture.png', 'images/emily/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('eric', 'images/eric/eric.jpg', 'images/eric/add_picture.png', 'images/eric/add_picture.png', 'images/eric/add_picture.png', 'images/eric/add_picture.png', 'images/eric/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('grant', 'images/grant/grant.jpg', 'images/grant/add_picture.png', 'images/grant/add_picture.png', 'images/grant/add_picture.png', 'images/grant/add_picture.png', 'images/grant/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('hamish', 'images/hamish/hamish.jpg', 'images/hamish/add_picture.png', 'images/hamish/add_picture.png', 'images/hamish/add_picture.png', 'images/hamish/add_picture.png', 'images/hamish/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('jesse', 'images/jesse/jesse.jpg', 'images/jesse/add_picture.png', 'images/jesse/add_picture.png', 'images/jesse/add_picture.png', 'images/jesse/add_picture.png', 'images/jesse/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('joel', 'images/joel/joel.jpg', 'images/joel/add_picture.png', 'images/joel/add_picture.png', 'images/joel/add_picture.png', 'images/joel/add_picture.png', 'images/joel/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('natalie', 'images/natalie/natalie.jpg', 'images/natalie/add_picture.png', 'images/natalie/add_picture.png', 'images/natalie/add_picture.png', 'images/natalie/add_picture.png', 'images/natalie/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('travis', 'images/travis/travis.jpg', 'images/travis/add_picture.png', 'images/travis/add_picture.png', 'images/travis/add_picture.png', 'images/travis/add_picture.png', 'images/travis/add_picture.png');

INSERT INTO HELPER_PICS
VALUES('vic', 'images/vic/vic.jpg', 'images/vic/add_picture.png', 'images/vic/add_picture.png', 'images/vic/add_picture.png', 'images/vic/add_picture.png', 'images/vic/add_picture.png');




SELECT * FROM HELPER_PICS WHERE HELPER_ID = 'sky';

DROP TABLE HELPER_PICS;