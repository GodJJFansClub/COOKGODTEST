DROP TABLE BROADCAST;
DROP TABLE REPORT;
DROP TABLE FORUM_MSG;
DROP TABLE FORUM_ART;
DROP TABLE AUTH;
DROP TABLE FUN;
DROP TABLE EMP;
DROP TABLE MENU_DISH;
DROP TABLE MENU_ORDER;
DROP TABLE MENU;
DROP TABLE FEST_ORDER_DETAIL;
DROP TABLE FEST_ORDER;
DROP TABLE FEST_DISH;
DROP TABLE FEST_MENU;
DROP TABLE CHEF_OD_DETAIL;
DROP TABLE CHEF_ORDER;
DROP TABLE FOOD_OR_DETAIL;
DROP TABLE FOOD_ORDER;
DROP TABLE FOOD_MALL;
DROP TABLE FAV_FD_SUP;
DROP TABLE AD;
DROP TABLE FOOD_SUP;
DROP TABLE DISH_FOOD;
DROP TABLE FOOD;
DROP TABLE CHEF_DISH;
DROP TABLE DISH;
DROP TABLE CHEF_SCH;
DROP TABLE FAV_CHEF;
DROP TABLE CHEF;
DROP TABLE CUST;


DROP SEQUENCE BROADCAST_SEQ;
DROP SEQUENCE REPORT_SEQ;
DROP SEQUENCE FORM_MSG_SEQ;
DROP SEQUENCE FORUM_ART_SEQ;
DROP SEQUENCE FUN_SEQ;
DROP SEQUENCE EMP_SEQ;
DROP SEQUENCE MENU_SEQ;
DROP SEQUENCE FEST_ORDER_SEQ;
DROP SEQUENCE FEST_MENU_SEQ;
DROP SEQUENCE CHEF_ORDER_SEQ;
DROP SEQUENCE FOOD_ORDER_SEQ;
DROP SEQUENCE AD_SEQ;
DROP SEQUENCE FOOD_SUP_SEQ;
DROP SEQUENCE FOOD_SEQ;
DROP SEQUENCE DISH_SEQ;
DROP SEQUENCE CUST_SEQ;

-----------------------顧客自動編號器-------------------------------
CREATE SEQUENCE CUST_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-----------------------廣告自動編號器-------------------------------
CREATE SEQUENCE AD_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;


-----------------------員工自動編號器-------------------------------
CREATE SEQUENCE EMP_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
-----------------------功能自動編號器-------------------------------
CREATE SEQUENCE FUN_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-----------------------推播自動編號器-------------------------------
CREATE SEQUENCE BROADCAST_SEQ
NOMAXVALUE 
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-mm-dd';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
SET DEFINE OFF;

------------------------------------------------------------------
--建立表格:顧客--
CREATE TABLE CUST (
 CUST_ID                 VARCHAR2(6)   NOT NULL,
 CUST_ACC                VARCHAR2(15)  NOT NULL,
 CUST_PWD                VARCHAR2(15)  NOT NULL,
 CUST_NAME               VARCHAR2(30)  NOT NULL,
 CUST_SEX                VARCHAR2(1)   NOT NULL,
 CUST_TEL                VARCHAR2(20)    NOT NULL,
 CUST_ADDR               VARCHAR2(200) NOT NULL,
 CUST_PID                CHAR(10)      NOT NULL,
 CUST_MAIL               VARCHAR2(30)  NOT NULL,
 CUST_BRD                DATE,
 CUST_REG                DATE          NOT NULL,
 CUST_PIC                BLOB,
 CUST_STATUS             VARCHAR2(2)     NOT NULL,
 CUST_NINAME             VARCHAR2(30)  NOT NULL,
 PRIMARY KEY (CUST_ID),
 UNIQUE (CUST_ACC)
);

Insert into CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
values ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'cust','123','David','M','0910889862','桃園市中壢區中大路300號','H123456789','david123@yahoo.com',to_date('2019-02-01','YYYY-MM-DD'),to_date('2019-02-01','YYYY-MM-DD'),'a0','seafood');
Insert into CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME)
values ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'custa2','123456','Peter','M','0910889866','桃園市中壢區中大路301號','A123557799','peter123@yahoo.com',to_date('2000-01-01','YYYY-MM-DD'),to_date('2019-02-06','YYYY-MM-DD'),'a0','Peterseafood');
Insert into CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME)
values ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'custa3','123456','Amy','F','0910889867','桃園市中壢區中大路302號','A223456789','amy123@yahoo.com',to_date('1989-01-01','YYYY-MM-DD'),to_date('2019-02-01','YYYY-MM-DD'),'a0','Amy');
Insert into CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
values ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'cookb1','123456','Tom','M','0910889869','桃園市中壢區中大路305號','B124456789','tom123@yahoo.com',to_date('1990-01-01','YYYY-MM-DD'),to_date('2019-02-01','YYYY-MM-DD'),'a0','Tomcat');
Insert into CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
values ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'foodsupc2','123456','Candy','F','0910889864','桃園市中壢區中大路306號','C223456788','candy123@yahoo.com',to_date('1980-02-01'),to_date('2019-02-08'),'a0','Candyshop');

INSERT INTO CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
VALUES ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'CUST','123456','AAA','M','0987654321','桃園市中壢區1號','A123456789','TEST_01@GMAIL.COM',TO_DATE('2000-01-01','YYYY-MM-DD'),TO_DATE('2019-02-11','YYYY-MM-DD'),'a0','DAVID_01');

INSERT INTO CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
VALUES ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'CHEF','123456','BBB','M','0987654322','桃園市中壢區2號','B223456789','TEST_02@GMAIL.COM',TO_DATE('2000-02-02','YYYY-MM-DD'),TO_DATE('2019-02-11','YYYY-MM-DD'),'a0','DAVID_02');

INSERT INTO CUST (CUST_ID,CUST_ACC,CUST_PWD,CUST_NAME,CUST_SEX,CUST_TEL,CUST_ADDR,CUST_PID,CUST_MAIL,CUST_BRD,CUST_REG,CUST_STATUS,CUST_NINAME) 
VALUES ('C'||LPAD(TO_CHAR (CUST_SEQ.NEXTVAL), 5, '0'),'FOOD_SUP','123456','CCC','M','0987654323','桃園市中壢區3號','C323456789','TEST_03@GMAIL.COM',TO_DATE('2000-03-03','YYYY-MM-DD'),TO_DATE('2019-02-11','YYYY-MM-DD'),'a0','DAVID_03');



--建立表格:廣告--
CREATE TABLE AD (
 AD_ID                    VARCHAR2(8)      NOT NULL,
 AD_STATUS                VARCHAR2(2)      NOT NULL,
 AD_START                 TIMESTAMP        NOT NULL,
 AD_END                   TIMESTAMP        NOT NULL,
 AD_TYPE                  VARCHAR2(2)      NOT NULL,
 AD_TITLE                 VARCHAR2(300)    NOT NULL,
 AD_PIC					  BLOB,
 AD_CON                   VARCHAR2(300)    NOT NULL,
 FOOD_SUP_ID              VARCHAR2(6),
 CONSTRAINT AD_FK FOREIGN KEY (FOOD_SUP_ID) REFERENCES FOOD_SUP (FOOD_SUP_ID),
 PRIMARY KEY (AD_ID) 
);
REM INSERTING into AD
SET DEFINE OFF;
Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID) 
values ('AD'||LPAD(TO_CHAR (AD_SEQ.NEXTVAL), 6, '0'),'d0',to_timestamp('2019-02-13 04.35.21'),to_timestamp('2019-04-18 12.32.29'),'e0','阿基師春節限定','阿基師特選寶島復古料理四天王，「滑溜溜佛跳牆」「五花大綁肉」「溫煮牛肉湯」「功夫老雞煲」 讓你吃得巧，吃到飽～','C00001');
Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID)
values ('AD'||LPAD(TO_CHAR (AD_SEQ.NEXTVAL), 6, '0'),'d1',to_timestamp('2019-02-28 04.42.39'),to_timestamp('2019-04-14 04.42.44'),'e0','帝王感蟹季','在遙遠南極的海下，科學家曾發現超過100萬只巨型帝王蟹。它們是石蟹科的甲殼類，不是真正的螃蟹。這種生物主要分布在寒冷的海域， 素有蟹中之王的美譽，聽了是不是都流口水了?','C00001');
Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID)
values ('AD'||LPAD(TO_CHAR (AD_SEQ.NEXTVAL), 6, '0'),'d2',to_timestamp('2019-02-27 08.57.09'),to_timestamp('2019-04-24 08.57.15'),'e0','人氣日本和牛','找日本人問何謂人氣「和牛」，可能沒幾個日本人能回答你的問題。這篇要告訴你何謂人氣和牛，又，哪裡可以吃到這些知名和牛呢？','C00001');
Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID)
values ('AD'||LPAD(TO_CHAR (AD_SEQ.NEXTVAL), 6, '0'),'d1',to_timestamp('2019-01-27 08.57.09'),to_timestamp('2019-04-24 08.57.15'),'e0','高人氣披薩','新品嘗鮮 ，披薩口味，獨門雞料理，精選美食。','C00002');
Insert into AD (AD_ID,AD_STATUS,AD_START,AD_END,AD_TYPE,AD_TITLE,AD_CON,FOOD_SUP_ID)
values ('AD'||LPAD(TO_CHAR (AD_SEQ.NEXTVAL), 6, '0'),'d1',to_timestamp('2019-01-27 08.57.09'),to_timestamp('2019-04-24 08.57.15'),'e0','自己在家也能做出龍蝦生猛海鮮大餐!!!','C00003');
------------------------------------------------------------------
--建立表格:員工--
CREATE TABLE EMP(
 EMP_ID		               VARCHAR2(6)      NOT NULL,
 EMP_ACC		           VARCHAR2(15)     NOT NULL,
 EMP_PWD		           VARCHAR2(15)     NOT NULL,
 EMP_NAME	               VARCHAR2(30)     NOT NULL,
 EMP_PIC		           BLOB             NOT NULL,
 PRIMARY KEY (EMP_ID)
);

Insert into EMP (EMP_ID,EMP_ACC,EMP_PWD,EMP_NAME,EMP_PIC) values ('E'||LPAD((EMP_SEQ.NEXTVAL),5,'0'),'emp1','123456','boss',hextoraw('453d7a34'));
Insert into EMP (EMP_ID,EMP_ACC,EMP_PWD,EMP_NAME,EMP_PIC) values ('E'||LPAD((EMP_SEQ.NEXTVAL),5,'0'),'emp2','123456','bill',hextoraw('453d7a34'));
Insert into EMP (EMP_ID,EMP_ACC,EMP_PWD,EMP_NAME,EMP_PIC) values ('E'||LPAD((EMP_SEQ.NEXTVAL),5,'0'),'emp3','123456','cindy',hextoraw('453d7a34'));
-------------------------------------------------------------------
--建立表格:功能--
CREATE TABLE FUN(
 FUN_ID		              VARCHAR2(6)      NOT NULL,		
 FUN_NAME	              VARCHAR2(100)     NOT NULL,	
 PRIMARY KEY (FUN_ID)
);
REM INSERTING into FUN
SET DEFINE OFF;
Insert into FUN (FUN_ID,FUN_NAME) values ('FU'||LPAD((FUN_SEQ.NEXTVAL),4,'0'),'廣告管理');
Insert into FUN (FUN_ID,FUN_NAME) values ('FU'||LPAD((FUN_SEQ.NEXTVAL),4,'0'),'菜色管理');
Insert into FUN (FUN_ID,FUN_NAME) values ('FU'||LPAD((FUN_SEQ.NEXTVAL),4,'0'),'合作廠商管理');
Insert into FUN (FUN_ID,FUN_NAME) values ('FU'||LPAD((FUN_SEQ.NEXTVAL),4,'0'),'顧客資料管理');

-------------------------------------------------------------------------
--建立表格:權限--
CREATE TABLE AUTH(
 EMP_ID		             VARCHAR2(6)      NOT NULL,
 FUN_ID		             VARCHAR2(6)      NOT NULL,
 CONSTRAINT AUTH_FK1 FOREIGN KEY (EMP_ID) REFERENCES EMP (EMP_ID),
 CONSTRAINT AUTH_FK2 FOREIGN KEY (FUN_ID) REFERENCES FUN (FUN_ID),
 CONSTRAINT AUTH_PK  PRIMARY KEY (EMP_ID,FUN_ID)
);
REM INSERTING into AUTH
SET DEFINE OFF;
Insert into AUTH (EMP_ID,FUN_ID) values ('E00001','FU0001');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00001','FU0002');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00001','FU0003');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00001','FU0004');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00002','FU0001');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00002','FU0002');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00002','FU0003');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00002','FU0004');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00003','FU0001');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00003','FU0002');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00003','FU0003');
Insert into AUTH (EMP_ID,FUN_ID) values ('E00003','FU0004');

-----------------------------------------------------------------
--建立表格:推播通知--
CREATE TABLE BROADCAST(
 BROADCAST_ID		          VARCHAR2(6)    NOT NULL,	
 BROADCAST_START		      TIMESTAMP,
 BROADCAST_CON		          VARCHAR2(100),
 BROADCAST_STATUS		      VARCHAR2(2)    NOT NULL,  
 CUST_ID		              VARCHAR2(6)    NOT NULL,
 CONSTRAINT BROADCAST_FK FOREIGN KEY (CUST_ID) REFERENCES CUST (CUST_ID),
 PRIMARY KEY(BROADCAST_ID)
);


INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00001');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00002');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00003');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00004');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00005');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00006');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00007');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00008');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B0','C00001');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00002');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00003');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD((BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推撥通知','B1','C00004');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD(TO_CHAR(BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推播通知；您所訂購的嚴選套餐訂單已通過審核','B0','C00001');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD(TO_CHAR(BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推播通知；您所訂購的嚴選套餐訂單未通過審核','B0','C00001');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD(TO_CHAR(BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推播通知；您所訂購的節慶主題套餐訂單中套餐已出貨','B0','C00002');
INSERT INTO BROADCAST(BROADCAST_ID,BROADCAST_START,BROADCAST_CON,BROADCAST_STATUS,CUST_ID) 
VALUES('B'||LPAD(TO_CHAR(BROADCAST_SEQ.NEXTVAL),5,'0'),SYSDATE,'訂單推播通知；您所訂購的嚴選食材訂單中食材已出貨','B0','C00003');



COMMIT;





