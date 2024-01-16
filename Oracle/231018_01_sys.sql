--○ 접속된 사용자 계정 조회
SELECT USER
FROM DUAL;
--==>> SYS


------------------------------------------------------------------------------
-- SCOTT 계정을 활용할 수 있는 환경 설정

--○ 사용자 계정 생성(SCOTT / TIGER)
create user scott
identified by tiger;
--==>> User SCOTT이(가) 생성되었습니다.


--○ 사용자 계정에 권한(롤) 부여
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
--==>> Grant을(를) 성공했습니다.


--○ SCOTT 사용자 계정의 기본 테이블스페이스를 USERS 로 지정(설정)
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--==>> User SCOTT이(가) 변경되었습니다.


--○ SCOTT 사용자 계정의 임시 테이블스페이스를 TEMP로 지정(설정)
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
--==>> User SCOTT이(가) 변경되었습니다.


--○ 사용자 계정 확인
SELECT *
FROM DBA_USERS;
--==>>
/*
                :
                
SCOTT	49		OPEN		24/04/15	USERS	TEMP	23/10/18	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD

                :
*/


