CREATE USER TEAM3
IDENTIFIED BY java006$;
--==>> User TEAM3이(가) 생성되었습니다.

GRANT CONNECT, RESOURCE, UNLIMITED
TABLESPACE TO TEAM3;
--==>> Grant을(를) 성공했습니다.

ALTER USER TEAM3 DEFAULT TABLESPACE USERS;
--==>> User TEAM3이(가) 변경되었습니다.

SELECT *
FROM DBA_USERS;
--==>> TEAM3	50		OPEN		2024-05-08	USERS	TEMP	2023-11-10	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD

GRANT CREATE TABLE TO TEAM3; 
--==>> Grant을(를) 성공했습니다.

GRANT CREATE VIEW TO TEAM3;
--==>> Grant을(를) 성공했습니다.


CREATE USER test3
IDENTIFIED BY java006$;
--==>> User TEAM3이(가) 생성되었습니다.

GRANT CONNECT, RESOURCE, UNLIMITED
TABLESPACE TO test3;
--==>> Grant을(를) 성공했습니다.


ALTER USER test3 DEFAULT TABLESPACE USERS;
--==>> User TEAM3이(가) 변경되었습니다.

SELECT *
FROM DBA_USERS;
--==>> TEAM3	50		OPEN		2024-05-08	USERS	TEMP	2023-11-10	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD

GRANT CREATE TABLE TO test3; 
--==>> Grant을(를) 성공했습니다.

GRANT CREATE VIEW TO test3;
--==>> Grant을(를) 성공했습니다.

GRANT CREATE SEQUENCE TO TEST3;

GRANT CREATE TRIGGER TO TEST3;
