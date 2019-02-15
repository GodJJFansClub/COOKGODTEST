���

DROP TABLE DISH;
DROP SEQUENCE DISH_SEQ;

CREATE TABLE DISH (
 DISH_ID                  VARCHAR2(6)    NOT NULL,
 DISH_NAME                VARCHAR2(30)   NOT NULL,
 DISH_STATUS              VARCHAR2(2)      NOT NULL,
 DISH_PIC                 BLOB,
 DISH_RESUME              CLOB ,
 DISH_PRICE               NUMBER(6),
 PRIMARY KEY (DISH_ID));
 

 
 CREATE SEQUENCE DISH_SEQ
   START WITH 1
   INCREMENT BY 1 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE;
   
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'�����p�N','D1',NULL,'���8�س����`�ơA�S�O�O�d�M�N�ɺ��X����ح�ġA�[�J�հs�P�v���ժ����N���ץġA�ɥήɦ��H�L�ıa�������V����AŨ���X���ת��A�������C�Y��_��1��28��}��w�ʡA�⧹����A�n�R�n�֭�I','1280');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'����K�_���L��','D1',NULL,'�D�p�S��W�����ͻP�h�جöQ�����A�H���n�B�����Ժ�L4�p�ɡA�����|���A�O���i���l���i�ίʪ��@�D�\�Ҥj��','3600');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'�j�Ǧ��n�s','D1',NULL,'��ŧ���Φ�����i�դ�k�A�S��2������n�Ӥ��C�L4�p�ɡA���s���ťզ⪺�����A���@�Ӥ����A�A�[�J�󳽰��B��y���B���w��B�a�m�סB�ᵬ�B���ѤΥ]�ߥյ�A����A�T�N2�p�ɡA�N��y���Э������B���w�᪺�۵M�᭻�B�n����ؤή������觹������b�������F�n���ֺ��h�ܱo���K�n��B�]�ߥյ�Ƥf�^�̡B�l�����ġC�@�f���A�[�W�@�f�ơA��Ź�ȭ̤f�f�ͭ��B�f�f�����C','1380');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'���N����Prime����','D1',NULL,'��ά���̰�����Prime���סA�׽�P�תդ��G��ҳ��ٳ̨ΡC�ը������²�믫�A�i�s�u�k�o����ӿ��A�H�¤ѵM�ĩʾM�ƾM�{�û��X�����@�p�ɡA���׭����M����B�n�Ʀ׽�A��h�o�צb�N�N�L�{���A�����J�}��A�����@���ץġA�̫�ȥH�ֶq�Q�ڻP�J�ԯ��I�X�@�p�׭��A�����Ť��ת���l������ɨ�i�{�I','1880');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'�ĵ�զ���','D1',NULL,'�D�p�S��W�����ͻP�h�جöQ�����A�H���n�B�����Ժ�L4�p�ɡA�����|���A�O���i���l���i�ίʪ��@�D�\�Ҥj��','900');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'�����Ļ��Q�m�L','D1',NULL,'�Y��W���ޫ�L(�@����600g)�A���t�S�h���{���A�A�H�D�p�S�խ��Ƥνը��ƾM�s�@�Ѥ@�]�A�j����X��η�O����έ��ƺ�1.5�p�ɼ����J����A�A�H200�װ��Ūo���������רùF���ֶp�����ĪG�A�̫�O�W�D�p����H�x�W���a���̡B�гJ���z���A�[�W�h�ثn�v�����ƽջs�Ӧ������������Ļ���A�Y�����@�D�~�ֶp�ܡB�׹�h�Ħ��״I�h���f�P���޸}�Ʋz�C','880');
   INSERT INTO DISH(DISH_ID,DISH_NAME,DISH_STATUS,DISH_PIC,DISH_RESUME,DISH_PRICE) VALUES ('D'||LPAD((DISH_SEQ.NEXTVAL),5,'0'),'���s�_���I��','D1',NULL,'������a�����p�ơA�_�󭻤J��A�P���s�@�P���N5�p�ɡA�n��ƶ��n�J�f','1580');
   
--------------------------------------------------------------------------------------------------------------

�D�p�׾¤峹

DROP TABLE FORUM_ART;
DROP SEQUENCE FORUM_ART_SEQ;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT ='yyyy-mm-dd hh24:mi';


CREATE TABLE FORUM_ART(
 FORUM_ART_ID		        VARCHAR2(6)      NOT NULL,
 FORUM_ART_NAME		        VARCHAR2(90)   NOT NULL,
 FORUM_ART_CON		        CLOB ,  
 FORUM_ART_START		    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FORUM_ART_PIC		        BLOB,
 FORUM_ART_STATUS	        VARCHAR2(2) ,
 CHEF_ID			        VARCHAR2(6) ,
 
 CONSTRAINT FORUM_ART_FK FOREIGN KEY (CHEF_ID) REFERENCES CHEF (CHEF_ID),
 PRIMARY KEY (FORUM_ART_ID));
 
 CREATE SEQUENCE FORUM_ART_SEQ
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE
 NOCYCLE
 NOCACHE;
 
 INSERT INTO FORUM_ART (FORUM_ART_ID,FORUM_ART_NAME,FORUM_ART_CON,FORUM_ART_PIC,FORUM_ART_STATUS,CHEF_ID) VALUES ('A'||LPAD((FORUM_ART_SEQ.NEXTVAL),5,'0'),'�������߽�','�����g��Ʋz�A�ĻĻ������ܶ}�G�U���A����갵�k��²��A�ǳƪ������]���|�Ӧh�A�A�X�b�a�ۤv�ոլݡI',NULL,'D1','C02121');
 
-----------------------------------------------------------------------------------------------------------------

�D�p�׾¯d��

DROP TABLE FORUM_MSG;
DROP SEQUENCE FORUM_MSG_SEQ;

ALTER SESSION SET NLS_TIMESTAMP_FORMAT ='yyyy-mm-dd hh24:mi';

CREATE TABLE FORUM_MSG(
 FORUM_MSG_ID		      VARCHAR(6)     NOT NULL,
 FORUM_MSG_CON		      CLOB   ,
 FORUM_MSG_START		  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FORUM_MSG_STATUS		  VARCHAR(2) ,
 FORUM_ART_ID		      VARCHAR(6) ,
 CUST_ID			      VARCHAR2(6) ,
 CONSTRAINT FORUM_MSG_FK1 FOREIGN KEY (FORUM_ART_ID) REFERENCES FORUM_ART (FORUM_ART_ID), 
 CONSTRAINT FORUM_MSG_FK2 FOREIGN KEY (CUST_ID)      REFERENCES CUST (CUST_ID),
 PRIMARY KEY (FORUM_MSG_ID));
 
 CREATE SEQUENCE FORM_MSG_SEQ
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE
 NOCYCLE
 NOCACHE;
 
INSERT INTO FORUM_MSG (FORUM_MSG_ID,FORUM_MSG_CON,FORUM_MSG_STATUS,FORUM_ART_ID,CUST_ID) VALUES ('MS'||LPAD(FORM_MSG_SEQ.NEXTVAL,4,'0'),'�U�Z�� ���W�����a�H�Y�Y��','D1','A00001','C02121');
------------------------------------------------------------------------------------------------------------------
���ϥέ���

DROP TABLE DISH_FOOD;

CREATE TABLE DISH_FOOD (
 DISH_ID                  VARCHAR2(6)    ,
 FOOD_ID                  VARCHAR2(6)   ,
 DISH_F_QTY               NUMBER(4)      ,
 DISH_F_UNIT              VARCHAR(4),
 
 CONSTRAINT DISH_FOOD_FK1 FOREIGN KEY (DISH_ID) REFERENCES DISH (DISH_ID),
 CONSTRAINT DISH_FOOD_FK2 FOREIGN KEY (FOOD_ID) REFERENCES FOOD (FOOD_ID),
 PRIMARY KEY (DISH_ID,FOOD_ID));
 
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00001',30,'g');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00022',2,'kg');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00023',30,'g');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00024',30,'g');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00025',1,'Kg');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00026',150,'g');
INSERT INTO DISH_FOOD(DISH_ID,FOOD_ID,DISH_F_QTY,DISH_F_UNIT) VALUES('D00003','F00027',1,'kg');


 ---------------------------------------------------------------------------------------
�M�\���

DROP TABLE MENU_DISH;


CREATE TABLE MENU_DISH (
 MENU_ID                  VARCHAR2(6) ,
 DISH_ID                  VARCHAR2(6) ,
 
 CONSTRAINT MENU_DISH_FK1 FOREIGN KEY (DISH_ID) REFERENCES DISH (DISH_ID),
 CONSTRAINT MENU_DISH_FK2 FOREIGN KEY (MENU_ID) REFERENCES MENU (MENU_ID),
 PRIMARY KEY (DISH_ID,MENU_ID));
 
 --CREATE SEQUENCE MENU_DISH_SEQ
    --START WITH 1
    --INCREMENT BY 1
    --NOMAXVALUE
    --NOCYCLE
    --NOCACHE;
 
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00002','M00001');
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00003','M00001');
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00004','M00001');
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00005','M00001');
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00006','M00001');
 INSERT INTO MENU_DISH (DISH_ID,MENU_ID) VALUES('D00007','M00001');
-----------------------------------------------------------------------------------------

����

DROP SEQUENCE FOOD_SEQ;
DROP TABLE FOOD;

CREATE TABLE FOOD (
 FOOD_ID                  VARCHAR2(6)   NOT NULL,
 FOOD_NAME                VARCHAR2(30)  NOT NULL,
 PRIMARY KEY (FOOD_ID));
 
 CREATE SEQUENCE FOOD_SEQ
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE
 NOCYCLE
 NOCACHE;

INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'�󳽰�');
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'���n');
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'��y��'); 
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'���w��'); 
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'�a�m��'); 
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'�ᵬ');
INSERT INTO  FOOD (FOOD_ID,FOOD_NAME) VALUES('F'||LPAD(FOOD_SEQ.NEXTVAL,5,'0'),'�]�ߥյ�');

-------------------------------------------------------------------------------------------




 