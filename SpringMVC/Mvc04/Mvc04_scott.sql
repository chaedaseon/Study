SELECT USER
FROM DUAL;
--==>> SCOTT


--¡Û ½Ç½À Å×ÀÌºí »ý¼º (Áö¿ª : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER          -- Áö¿ª ¾ÆÀÌµð   -- PK
, REGIONNAME    VARCHAR2(30)    -- Áö¿ª ¸í
, CONSTRAINT REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGIONÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ½ÃÄö½º »ý¼º (Áö¿ª : REGIONSEQ)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Áö¿ª µ¥ÀÌÅÍ ÀÔ·Â
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '¼­¿ï');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '°æ±â');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, 'ÀÎÃµ');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '´ëÀü');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '±¤ÁÖ');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '´ë±¸');
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù. * 6


--¡Û Áö¿ª ¸®½ºÆ® È®ÀÎ
SELECT REGIONID, REGIONNAME
FROM REGION;
--> ÇÑ ÁÙ ±¸¼º
SELECT REGIONID, REGIONNAME FROM REGION
;
--==>>
/*
1	¼­¿ï
2	°æ±â
3	ÀÎÃµ
4	´ëÀü
5	±¤ÁÖ
6	´ë±¸
*/

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ½Ç½À Å×ÀÌºí »ý¼º (Á÷À§ : POSITION)
CREATE TABLE POSITION
( POSITIONID        NUMBER          -- Á÷À§ ¾ÆÀÌµð   -- PK
, POSITIONNAME      VARCHAR2(30)    -- Á÷À§ ¸í
, MINBASICPAY       NUMBER          -- ÃÖ¼Ò ±âº»±Þ
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITIONÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ½ÃÄö½º »ý¼º (Á÷À§ : POSITIONSEQ)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Á÷À§ µ¥ÀÌÅÍ ÀÔ·Â
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '»ç¿ø', 1000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '´ë¸®', 2000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '°úÀå', 3000000);
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, 'ºÎÀå', 4000000);
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù. * 4


--¡Û Á÷À§ ¸®½ºÆ® È®ÀÎ
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;
--> ÇÑ ÁÙ ±¸¼º
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
--==>> 
/*
1	»ç¿ø	1000000
2	´ë¸®	2000000
3	°úÀå	3000000
4	ºÎÀå	4000000
*/


--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ½Ç½À Å×ÀÌºí »ý¼º (ºÎ¼­ : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID          NUMBER
, DEPARTMENTNAME        VARCHAR2(30)
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENTÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ½ÃÄö½º »ý¼º (ºÎ¼­ : DEPARTMENTSEQ)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ºÎ¼­ µ¥ÀÌÅÍ ÀÔ·Â
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)
VALUES(DEPARTMENTSEQ.NEXTVAL, '°³¹ßºÎ');
--> ÇÑ ÁÙ ±¸¼º
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '°³¹ßºÎ');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '±âÈ¹ºÎ');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, '¿µ¾÷ºÎ');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'ÀÚÀçºÎ');
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù. * 4


--¡Û ºÎ¼­ ¸®½ºÆ® È®ÀÎ
SELECT DEPARTMENTID, DEPARTMENTNAME
FROM DEPARTMENT;
--> ÇÑ ÁÙ ±¸¼º
SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;
--==>>
/*
1	°³¹ßºÎ
2	±âÈ¹ºÎ
3	¿µ¾÷ºÎ
4	ÀÚÀçºÎ
*/


--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ½Ç½À Å×ÀÌºí »ý¼º (Á÷¿ø : EMPLOYEE)
-- »ç¿ø¹øÈ£, »ç¿ø¸í, ÁÖ¹Î¹øÈ£, »ý³â¿ùÀÏ, ¾çÀ½·Â, ÀüÈ­¹øÈ£, ºÎ¼­, Á÷À§, Áö¿ª, ±âº»±Þ, ¼ö´ç
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- »ç¿ø ¹øÈ£   -- PK
, NAME          VARCHAR2(30)            -- »ç¿ø ¸í
, SSN           VARCHAR2(20)            -- ÁÖ¹Î¹øÈ£    -- ¾ÏÈ£È­ ±â´É Àû¿ë(TYPE CHECK~!!!)
, BIRTHDAY      DATE                    -- »ý³â¿ùÀÏ
, LUNAR         NUMBER(1) DEFAULT 0     -- ¾çÀ½·Â      -- CK (¾ç·Â0, À½·Â1)
, TELEPHONE     VARCHAR2(40)            -- ÀüÈ­¹øÈ£
, DEPARTMENTID  NUMBER                  -- ºÎ¼­ ¾ÆÀÌµð -- FK
, POSITIONID    NUMBER                  -- Á÷À§ ¾ÆÀÌµð -- FK
, REGIONID      NUMBER                  -- Áö¿ª ¾ÆÀÌµð -- FK
, BASICPAY      NUMBER                  -- ±âº»±Þ
, EXTRAPAY      NUMBER                  -- ¼ö´ç
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENTID_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGIONID_FK FOREIGN KEY(REGIONID)
             REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEEÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ½ÃÄö½º »ý¼º (Á÷¿ø : EMPLOYEESEQ)
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Á÷¿ø µ¥ÀÌÅÍ ÀÔ·Â (==Äõ¸®¹® Æó±â==)
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY)
VALUES(EMPLOYEESEQ.NEXTVAL, '°­Çý¼º', CRYPTPACK.ENCRYPT('9710171234567', '9710171234567'), TO_DATE('1997-10-17', 'YYYY-MM-DD'), 0, '010-6380-7047', 1, 2, 1, 2500000, 1500000);
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.


--¡Ø ¼¼¼Ç ¼³Á¤
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> SessionÀÌ(°¡) º¯°æµÇ¾ú½À´Ï´Ù.


--¡Û È®ÀÎ
SELECT *
FROM EMPLOYEE;
--==>> 1	°­Çý¼º	?o??^????	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000


--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


DESC EMPLOYEE;
--==>>
/*
¸§           ³Î?       À¯Çü           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
SSN                   VARCHAR2(20) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER    
*/


--¡Û Á÷¿ø µ¥ÀÌÅÍ Á¶È¸ Äõ¸®¹® ±¸¼º
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '¾ç·Â', 1, 'À½·Â') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> 1	°­Çý¼º	?o??^????	1997-10-17	0	¾ç·Â	010-6380-7047	1	°³¹ßºÎ	2	´ë¸®	1	¼­¿ï	2500000	1500000	4000000


--¡Û ºä »ý¼º(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
     , E.NAME
     , E.SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR
     , DECODE(E.LUNAR, 0, '¾ç·Â', 1, 'À½·Â') AS LUNARNAME
     , E.TELEPHONE
     , E.DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY
     , E.EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEWÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Áö¿ª µ¥ÀÌÅÍ Á¶È¸ Äõ¸®¹® ±¸¼º
--   ´Ü, Áö¿ª µ¥ÀÌÅÍ »èÁ¦ °¡´É¿©ºÎ(DELCHECK) È®ÀÎ Æ÷ÇÔ
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>>
/*
  REGIONID REGIONNAME                       DELCHECK
---------- ------------------------------ ----------
         1 ¼­¿ï                                    1  ¡æ »èÁ¦ ºÒ°¡
         2 °æ±â                                    0  ¡æ »èÁ¦ °¡´É
         3 ÀÎÃµ                                    0  ¡æ »èÁ¦ °¡´É
         4 ´ëÀü                                    0  ¡æ »èÁ¦ °¡´É
         5 ±¤ÁÖ                                    0  ¡æ »èÁ¦ °¡´É
         6 ´ë±¸                                    0  ¡æ »èÁ¦ °¡´É
*/
--> ¡º¼­¿ï¡»ÀÇ Áö¿ª µ¥ÀÌÅÍ´Â »èÁ¦°¡ ºÒ°¡´ÉÇÑ »óÈ²ÀÌ¸ç
--  ¡º°æ±â¡»¡ºÀÎÃµ¡»¡º´ëÀü¡»¡º±¤ÁÖ¡»¡º´ë±¸¡»ÀÇ Áö¿ª µ¥ÀÌÅÍ´Â
-- »èÁ¦°¡ °¡´ÉÇÑ »óÈ²ÀÓÀ» ÆÇº°ÇÒ ¼ö ÀÖ´Â Äõ¸®¹®

SELECT * FROM REGIONVIEW
;


--¡Û ºä »ý¼º(REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT R.REGIONID, R.REGIONNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID=R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEWÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Á÷À§ µ¥ÀÌÅÍ Á¶È¸ Äõ¸®¹® ±¸¼º
--   ´Ü, Á÷À§ µ¥ÀÌÅÍ »èÁ¦ °¡´É¿©ºÎ(DELCHECK) È®ÀÎ Æ÷ÇÔ
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>>
/*
POSITIONID POSITIONNAME                   MINBASICPAY   DELCHECK
---------- ------------------------------ ----------- ----------
         1 »ç¿ø                               1000000          0
         2 ´ë¸®                               2000000          2
         3 °úÀå                               3000000          0
         4 ºÎÀå                               4000000          0
         5 »ç¿ø                               1000000          0
         6 ´ë¸®                               2000000          0
         7 °úÀå                               3000000          0
         8 ºÎÀå                               4000000          0
*/


--¡Û ºä »ý¼º(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS
SELECT P.POSITIONID, P.POSITIONNAME, P.MINBASICPAY
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE POSITIONID=P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEWÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û ºÎ¼­ µ¥ÀÌÅÍ Á¶È¸ Äõ¸®¹® ±¸¼º
--   ´Ü, ºÎ¼­ µ¥ÀÌÅÍ »èÁ¦ °¡´É¿©ºÎ(DELCHECK) È®ÀÎ Æ÷ÇÔ
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>>
/*
DEPARTMENTID DEPARTMENTNAME                   DELCHECK
------------ ------------------------------ ----------
           1 °³¹ßºÎ                                  1
           2 ±âÈ¹ºÎ                                  0
           3 ¿µ¾÷ºÎ                                  0
           4 ÀÚÀçºÎ                                  0
*/


--¡Û ºä »ý¼º(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT D.DEPARTMENTID, D.DEPARTMENTNAME
     , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE DEPARTMENTID=D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEWÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


--¡Û Á÷À§º° ÃÖ¼Ò ±âº»±Þ Á¶È¸ Äõ¸®¹® ±¸¼º
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     -- »ç¿ø
--> ÇÑ ÁÙ ±¸¼º
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000

--------------------------------------------------------------------------------

--¡Û ·Î±×ÀÎ, ·Î±×¾Æ¿ô °úÁ¤ Ãß°¡

-- ID ¿Í PW ÄÃ·³ µ¥ÀÌÅÍ¸¦ ´ã°í ÀÖ´Â Å×ÀÌºíÀÌ º°µµ·Î Á¸ÀçÇÏÁö ¾Ê´Â »óÈ²ÀÌ´Ù.
-- ÀÌ¿Í °ü·ÃÇÏ¿© EMPLOYEEID(»ç¿ø¾ÆÀÌµð)¿Í SSN(ÁÖ¹Î¹øÈ£) µÚ 7ÀÚ±âÀÇ ¼ýÀÚ¸¦
-- °¢°¢ ¾ÆÀÌµð, ÆÐ½º¿öµå·Î ÀÌ¿ëÇÒ ¼ö ÀÖµµ·Ï ±¸¼ºÇÑ´Ù.

--¡Ø ±âÁ¸ Å×ÀÌºí ±¸Á¶ º¯°æ
--¨ç
-- EMPLOYEE(Á÷¿ø µ¥ÀÌÅÍ) Å×ÀÌºíÀÇ SSN(ÁÖ¹Î¹øÈ£) ÄÃ·³À» ºÐ¸®ÇÑ´Ù.
-- SSN --------------------> SSN1, SSN2
-- SSN1 ¡æ ÁÖ¹Î¹øÈ£ ¾Õ 6ÀÚ¸®
-- SSN2 ¡æ ÁÖ¹Î¹øÈ£ µÚ 7ÀÚ¸® ¡æ ¾ÏÈ£È­ Àû¿ë ¡æ PW È°¿ë

--¨è
-- EMPLOYEE(Á÷¿ø µ¥ÀÌÅÍ) Å×ÀÌºíÀÇ GRADE(µî±Þ) ÄÃ·³À» Ãß°¡ÇÑ´Ù.
-- GRADE ¡æ 0:°ü¸®ÀÚ, 1:ÀÏ¹Ý»ç¿ø

--¡Û ÄÃ·³ ºÐÇÒ SSN ¡æ SSN1, SSN2

-- ÄÃ·³ Ãß°¡
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEEÀÌ(°¡) º¯°æµÇ¾ú½À´Ï´Ù.


SELECT *
FROM EMPLOYEE;

-- SSN ¡æ ¾ÏÈ£È­('9710171234567', '9710171234567')

-- SSN1 ¡æ SUBSTR(
(´ë»óµ¥ÀÌÅÍ, '9710171234567'), 1, 6) ¡æ '971017'
-- SSN2 ¡æ ¾ÏÈ£È­(SUBSTR(º¹È£È­(´ë»óµ¥ÀÌÅÍ, '9710171234567'), 7, 7)
--               , SUBSTR(º¹È£È­(´ë»óµ¥ÀÌÅÍ, '9710171234567'), 7, 7)) ¡æ ¾ÏÈ£È­µÈ '1234567'

UPDATE EMPLOYEE
SET SSN1 = SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'), 1, 6)
  , SSN2 = CRYPTPACK.ENCRYPT(SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'), 7, 7)
               , SUBSTR(CRYPTPACK.DECRYPT(SSN, '9710171234567'), 7, 7) );
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

SELECT *
FROM EMPLOYEE;
--==>> 1	°­Çý¼º	?o??^????	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.

-- ±âÁ¸ ÁÖ¹Î¹øÈ£(SSN) ÄÃ·³ Á¦°Å
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEEÀÌ(°¡) º¯°æµÇ¾ú½À´Ï´Ù.

DESC EMPLOYEE;
--==>>
/*
ÀÌ¸§           ³Î?       À¯Çü           
------------ -------- ------------ 
EMPLOYEEID   NOT NULL NUMBER       
NAME                  VARCHAR2(30) 
BIRTHDAY              DATE         
LUNAR                 NUMBER(1)    
TELEPHONE             VARCHAR2(40) 
DEPARTMENTID          NUMBER       
POSITIONID            NUMBER       
REGIONID              NUMBER       
BASICPAY              NUMBER       
EXTRAPAY              NUMBER       
SSN1                  CHAR(6)      
SSN2                  VARCHAR2(50) 
*/


-- ÄÃ·³ Ãß°¡ ¡æ GRADE ¡æ ±âº»°ª 1 À» ÀÏ¹Ý»ç¿øÀ¸·Î ±¸¼º
--                              0 À» °ü¸®ÀÚ·Î ±¸¼º
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEEÀÌ(°¡) º¯°æµÇ¾ú½À´Ï´Ù.

SELECT *
FROM EMPLOYEE;
--==>> 1	°­Çý¼º	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	1


--¡Û Á÷¿ø µ¥ÀÌÅÍ ÀÔ·Â
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY, SSN1, SSN2)
VALUES(EMPLOYEESEQ.NEXTVAL, '±æÇö¿í', TO_DATE('1999-02-11', 'YYYY-MM-DD'), 1, '010-6678-9867', 1, 1, 1, 1500000, 1500000, '990211', CRYPTPACK.ENCRYPT('1234567', '1234567'));
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

SELECT *
FROM EMPLOYEE;
--==>>
/*
1	°­Çý¼º	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	1
2	±æÇö¿í	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


-- °­Çý¼º »ç¿øÀ» °ü¸®ÀÚ·Î ÀÓ¸í
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

SELECT *
FROM EMPLOYEE;
--==>>
/*
1	°­Çý¼º	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	±æÇö¿í	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Ø Å×ÀÌºíÀÇ ±¸Á¶¸¦ º¯°æÇß±â ¶§¹®¿¡
--   ÀÌ¸¦ ±â¹ÝÀ¸·Î »ý¼ºÇÑ ºä(VIEW)ÀÇ ³»¿ë ¶ÇÇÑ »õ·Î ÀÛ¼º(¼öÁ¤)
--¡Û ºä »ý¼º(EMPLOYEEVIEW)
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
     , E.NAME AS NAME
     , E.SSN1 AS SSN
     , TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , E.LUNAR AS LUNAR
     , DECODE(E.LUNAR, 0, '¾ç·Â', 1, 'À½·Â') AS LUNARNAME
     , E.TELEPHONE AS TELEPHONE
     , E.DEPARTMENTID AS DEPARTMENTID
     , (SELECT DEPARTMENTNAME
        FROM DEPARTMENT
        WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
     , E.POSITIONID AS POSITIONID
     , (SELECT POSITIONNAME
        FROM POSITION
        WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
     , E.REGIONID AS REGIONID
     , (SELECT REGIONNAME
        FROM REGION
        WHERE REGIONID=E.REGIONID) AS REGIONNAME
     , E.BASICPAY AS BASICPAY
     , E.EXTRAPAY AS EXTRAPAY
     , NVL(E.BASICPAY, 0) + NVL(E.EXTRAPAY, 0) AS PAY
     , E.GRADE AS GRADE
FROM EMPLOYEE E;
--==>> View EMPLOYEEVIEWÀÌ(°¡) »ý¼ºµÇ¾ú½À´Ï´Ù.


DESC EMPLOYEEVIEW;
--==>>
/*
ÀÌ¸§             ³Î?       À¯Çü           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/

SELECT *
FROM EMPLOYEE;
--==>>
/*
1	°­Çý¼º	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	±æÇö¿í	1999-02-11	1	010-6678-9867	1	1	1	1500000	1500000	990211	=o???	1
*/

SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
1	°­Çý¼º	971017	1997-10-17	0	¾ç·Â	010-6380-7047	1	°³¹ßºÎ	2	´ë¸®	1	¼­¿ï	2500000	1500000	4000000	0
2	±æÇö¿í	990211	1999-02-11	1	À½·Â	010-6678-9867	1	°³¹ßºÎ	1	»ç¿ø	1	¼­¿ï	1500000	1500000	3000000	1
*/


--¡Û ÀÏ¹Ý »ç¿ø ·Î±×ÀÎ Äõ¸®¹®
--   (ID ¡æ EMPLOYEEID / PW ¡æ SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='ÀÔ·ÂID¹®ÀÚ¿­'
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID='ÀÔ·ÂID¹®ÀÚ¿­');

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2=(SELECT SSN2
            FROM EMPLOYEE
            WHERE EMPLOYEEID=2);
--==>> ±æÇö¿í

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234568', '1234568');
--==>> Á¶È¸ °á°ú ¾øÀ½ ¡æ ·Î±×ÀÎ ½ÇÆÐ 
   
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('1234567', '1234567');
--==>> ±æÇö¿í ¡æ ·Î±×ÀÎ ¼º°ø

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=[ÀÔ·ÂID]
  AND (SELECT SSN2
       FROM EMPLOYEE
       WHERE EMPLOYEEID=[ÀÔ·ÂID]) = CRYPTPACK.ENCRYPT([ÀÔ·ÂPW], [ÀÔ·ÂPW]);

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=[ÀÔ·ÂID]
  AND SSN2 = CRYPTPACK.ENCRYPT([ÀÔ·ÂPW], [ÀÔ·ÂPW]);
--> ÇÑ ÁÙ ±¸¼º      
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=[ÀÔ·ÂID] AND SSN2 = CRYPTPACK.ENCRYPT([ÀÔ·ÂPW], [ÀÔ·ÂPW])
;


--¡Û °ü¸®ÀÚ ·Î±×ÀÎ Äõ¸®¹®
--   (ID ¡æ EMPLOYEEID / PW ¡æ SSN2 / GRADE ¡æ 0)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE=0;
--==>> Á¶È¸ °á°ú ¾øÀ½ ¡æ °ü¸®ÀÚ ·Î±×ÀÎ ½ÇÆÐ

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE=0;
--==>> °­Çý¼º ¡æ °ü¸®ÀÚ ·Î±×ÀÎ ¼º°ø

--¡Ø °ü¸®ÀÚ ·Î±×ÀÎ ÇÑ ÁÙ Äõ¸®¹® ±¸¼º
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=[ÀÔ·ÂID] AND SSN2 = CRYPTPACK.ENCRYPT([ÀÔ·ÂPW], [ÀÔ·ÂPW]) AND GRADE=0
;


--¡Û Á÷¿ø µ¥ÀÌÅÍ »èÁ¦ Äõ¸®¹® ±¸¼º
DELETE
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> ÇÑ ÁÙ ±¸¼º
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;
--==>> 1 Çà ÀÌ(°¡) »èÁ¦µÇ¾ú½À´Ï´Ù.


--¡Û ·Ñ¹é
ROLLBACK;
--==>> ·Ñ¹é ¿Ï·á.


--¡Û Á÷¿ø µ¥ÀÌÅÍ ¼öÁ¤ Äõ¸®¹® ±¸¼º
UPDATE EMPLOYEE
SET NAME='±æÇö¿í'
  , BIRTHDAY=TO_DATE('1999-02-11', 'YYYY-MM-DD')
  , LUNAR=1
  , TELEPHONE='010-6678-9867'
  , DEPARTMENTID=1
  , POSITIONID=1
  , REGIONID=2
  , BASICPAY=1500000
  , EXTRAPAY=1500000
  , SSN1='990211'
  , SSN2=CRYPTPACK.ENCRYPT('1234568', '1234568')
  , GRADE=1
WHERE EMPLOYEEID=2;
--> ÇÑ ÁÙ ±¸¼º
UPDATE EMPLOYEE SET NAME='±æÇö¿í', BIRTHDAY=TO_DATE('1999-02-11', 'YYYY-MM-DD'), LUNAR=1, TELEPHONE='010-6678-9867', DEPARTMENTID=1, POSITIONID=1, REGIONID=2, BASICPAY=1500000, EXTRAPAY=1500000, SSN1='990211', SSN2=CRYPTPACK.ENCRYPT('1234568', '1234568'), GRADE=1 WHERE EMPLOYEEID=2
;
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

SELECT *
FROM EMPLOYEEVIEW;
--==>>
/*
1	°­Çý¼º	971017	1997-10-17	0	¾ç·Â	010-6380-7047	1	°³¹ßºÎ	2	´ë¸®	1	¼­¿ï	2500000	1500000	4000000	0
2	±æÇö¿í	990211	1999-02-11	1	À½·Â	010-6678-9867	1	°³¹ßºÎ	1	»ç¿ø	2	°æ±â	1500000	1500000	3000000	1
*/

SELECT *
FROM EMPLOYEE;
--==>>
/*
1	°­Çý¼º	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000	971017	=o???	0
2	±æÇö¿í	1999-02-11	1	010-6678-9867	1	1	2	1500000	1500000	990211	????	1
*/


--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ÀüÃ¼ ºÎ¼­ ¸®½ºÆ® Á¶È¸ Äõ¸®¹® ±¸¼º(DEPARTMENTVIEW)
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID;
--> ÇÑ ÁÙ ±¸¼º
SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID
;
--==>>
/*
1	°³¹ßºÎ	2
2	±âÈ¹ºÎ	0
3	¿µ¾÷ºÎ	0
4	ÀÚÀçºÎ	0
*/


--¡Û ºÎ¼­ µ¥ÀÌÅÍ ÀÔ·Â Äõ¸®¹® ±¸¼º(DEPARTMENT)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL, 'ÃÑ¹«ºÎ')
;
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

-- Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û ºÎ¼­ µ¥ÀÌÅÍ »èÁ¦ Äõ¸®¹® ±¸¼º(DEPARTMENT)
DELETE
FROM DEPARTMENT
WHERE DEPARTMENTID=3;
--> ÇÑ ÁÙ ±¸¼º
DELETE FROM DEPARTMENT WHERE DEPARTMENTID=3
;
--==>> 1 Çà ÀÌ(°¡) »èÁ¦µÇ¾ú½À´Ï´Ù.

-- ·Ñ¹é
ROLLBACK;
--==> ·Ñ¹é ¿Ï·á.

--¡Û ºÎ¼­ µ¥ÀÌÅÍ ¼öÁ¤ Äõ¸®¹® ±¸¼º(DEPARTMENT)
UPDATE DEPARTMENT
SET DEPARTMENTNAME='ÀÚ¿øºÎ'
WHERE DEPARTMENTID=2;
--> ÇÑ ÁÙ ±¸¼º
UPDATE DEPARTMENT SET DEPARTMENTNAME='ÀÚ¿øºÎ' WHERE DEPARTMENTID=2
;
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

-- ·Ñ¹é
ROLLBACK;
--==>> ·Ñ¹é ¿Ï·á.


--¡Û Áö¿ª ¸®½ºÆ® Á¶È¸ Äõ¸®¹® ±¸¼º(REGIONVIEW)
SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID;
--> ÇÑ ÁÙ ±¸¼º
SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID
;
--==>>
/*
1	¼­¿ï	1
2	°æ±â	1
3	ÀÎÃµ	0
4	´ëÀü	0
5	±¤ÁÖ	0
6	´ë±¸	0
*/

--¡Û Áö¿ª µ¥ÀÌÅÍ µî·Ï Äõ¸®¹® ±¸¼º(REGION)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '°­¿ø')
;
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

SELECT *
FROM REGION;
--==>>
/*
1	¼­¿ï
2	°æ±â
3	ÀÎÃµ
4	´ëÀü
5	±¤ÁÖ
6	´ë±¸
7	°­¿ø
*/

--¡Û Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û Áö¿ª µ¥ÀÌÅÍ »èÁ¦ Äõ¸®¹® ±¸¼º(REGION)
DELETE
FROM REGION
WHERE REGIONID=3;
--> ÇÑ ÁÙ ±¸¼º
DELETE FROM REGION WHERE REGIONID=3
;
--==>> 1 Çà ÀÌ(°¡) »èÁ¦µÇ¾ú½À´Ï´Ù.

-- ·Ñ¹é
ROLLBACK;
--==>> ·Ñ¹é ¿Ï·á.


--¡Û Áö¿ª µ¥ÀÌÅÍ ¼öÁ¤ Äõ¸®¹® ±¸¼º(REGION)
UPDATE REGION
SET REGIONNAME='Á¦ÁÖ'
WHERE REGIONID=4;
--> ÇÑ ÁÙ ±¸¼º
UPDATE REGION SET REGIONNAME='Á¦ÁÖ' WHERE REGIONID=4
;
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

-- Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.

--¡Û Áö¿ª DELCHECK °Ë»ö
SELECT DELCHECK
FROM REGIONVIEW
WHERE REGIONID=1;

--¡Û Áö¿ª ¾ÆÀÌµð °Ë»ö
SELECT REGIONNAME, DELCHECK
FROM REGIONVIEW
WHERE REGIONID=1;
--> ÇÑ ÁÙ ±¸¼º
SELECT REGIONNAME, DELCHECK FROM REGIONVIEW WHERE REGIONID=1
;




--¡Û ÀüÃ¼ Á÷À§ ¸®½ºÆ® Á¶È¸ Äõ¸®¹® ±¸¼º(POSITIONVIEW)
SELECT POSITIONID, POSITIONNAME, DELCHECK
FROM POSITIONVIEW
ORDER BY POSITIONID;
--> ÇÑ ÁÙ ±¸¼º
SELECT POSITIONID, POSITIONNAME, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID
;
--==>>
/*
1	»ç¿ø	1
2	´ë¸®	1
3	°úÀå	0
4	ºÎÀå	0
*/


--¡Û Á÷À§ µ¥ÀÌÅÍ ÀÔ·Â Äõ¸®¹® ±¸¼º(POSITION)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, '»ó¹«', 5000000)
;
--==>> 1 Çà ÀÌ(°¡) »ðÀÔµÇ¾ú½À´Ï´Ù.

-- Ä¿¹Ô
COMMIT;
--==>> Ä¿¹Ô ¿Ï·á.


--¡Û Á÷À§ µ¥ÀÌÅÍ »èÁ¦ Äõ¸®¹® ±¸¼º(POSITION)
DELETE
FROM POSITION
WHERE POSITIONID=5;
--> ÇÑ ÁÙ ±¸¼º
DELETE FROM POSITION WHERE POSITIONID=5
;
--==>> 1 Çà ÀÌ(°¡) »èÁ¦µÇ¾ú½À´Ï´Ù.

-- ·Ñ¹é
ROLLBACK;
--==>> ·Ñ¹é ¿Ï·á.


--¡Û Á÷À§ µ¥ÀÌÅÍ ¼öÁ¤ Äõ¸®¹® ±¸¼º(POSITION)
UPDATE POSITION
SET POSITIONNAME='ÁÖÀÓ', MINBASICPAY=2000000
WHERE POSITIONID=2;
--> ÇÑ ÁÙ ±¸¼º
UPDATE POSITION SET POSITIONNAME='ÁÖÀÓ', MINBASICPAY=2000000 WHERE POSITIONID=2
;
--==>> 1 Çà ÀÌ(°¡) ¾÷µ¥ÀÌÆ®µÇ¾ú½À´Ï´Ù.

-- ·Ñ¹é
ROLLBACK;
--==>> ·Ñ¹é ¿Ï·á.


--¡Û Á÷¿ø °Ë»ö Äõ¸®¹® ±¸¼º(¾ÆÀÌµð¸¦ È°¿ëÇÏ¿© Á÷¿ø µ¥ÀÌÅÍ °Ë»ö)
SELECT EMPLOYEEID, NAME, SSN1
     , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY
     , LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
     , BASICPAY, EXTRAPAY
FROM EMPLOYEE
WHERE EMPLOYEEID=3;
--> ÇÑ ÁÙ ±¸¼º
SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=1
;
--==>> 1	°­Çý¼º	971017	1997-10-17	0	010-6380-7047	1	2	1	2500000	1500000

