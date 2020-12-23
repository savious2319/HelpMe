CREATE SEQUENCE HELPME_LIKE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000;


CREATE TABLE HELPME_BOARD_LIKE(	
	CLIENT_NO NUMBER(10),
	CLIENT_ID VARCHAR2(50), 
	BOARD_NUM NUMBER(10),	
	CONSTRAINT HELPME_LIKE_CLIENT_FK FOREIGN KEY(CLIENT_NO) REFERENCES CLIENT(CLIENT_NO) ON DELETE CASCADE,
	CONSTRAINT HELPME_LIKE_BOARD_FK FOREIGN KEY(BOARD_NUM) REFERENCES HELPME_BOARD(BOARD_NUM) ON DELETE CASCADE
);

DROP TABLE HELPME_BOARD_LIKE;
DROP SEQUENCE HELPME_LIKE_SEQ;



SELECT * FROM HELPME_BOARD_LIKE;