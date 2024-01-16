--○ 접속된 사용자 계정 조회
SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 테이블 생성(DEPT)
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
);
--==>> Table DEPT이(가) 생성되었습니다.


--○ 테이블 생성(EMP)
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP이(가) 생성되었습니다.


INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 행 이(가) 삽입되었습니다. *18


--○ 테이블 생성(BONUS)
CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
);
--==>> Table BONUS이(가) 생성되었습니다.


--○ 테이블 생성(SALGRADE)
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>> Table SALGRADE이(가) 생성되었습니다.


INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>> 1 행 이(가) 삽입되었습니다. *5


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ SCOTT 계정이 갖고있는(소유하고 있는) 테이블 조회
SELECT *
FROM TAB;
--==>>
/*
BONUS	    TABLE	
DEPT	    TABLE	
EMP	        TABLE	
SALGRADE	TABLE	
*/

SELECT *
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
EMP	        USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
BONUS	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
SALGRADE	USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
*/



--○ 위에서 조회한 각각의 테이블들이 
--   어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS
EMP	        USERS
BONUS	    USERS
SALGRADE	USERS
*/

--○ 테이블 생성(TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
( NO    NUMBER(4)
, NAME  VARCHAR2(20)
, ADDR  VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1이(가) 생성되었습니다.

--○ 테이블 생성(TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO    NUMBER(4)
, NAME  VARCHAR2(20)
, ADDR  VARCHAR2(20)
) TABLESPACE TBS_EDUA;
--==>> Table TBL_EXAMPLE2이(가) 생성되었습니다.

--○ TBL_EXAMPLE1 과 TBL_EXAMPLE2 테이블이
--   각각 어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	        USERS
EMP         	USERS
BONUS	        USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/


-------------------------------------------------------------------------------

--■■■ 관계형 데이터베이스(RDBMS) ■■■--

-- 각각의 데이터를 테이블의 형태로 연결시켜 저장해놓은 구조
-- 그리고 이들 각각의 테이블들 간의 관계를 설정하여 연결시켜 놓은 구조

/*===================================
            ★ 암 기 ★
  ※ SELECT 문의 처리(PARSING) 순서
  
     SELECT 컬럼명     -- ⑤ ┐
     FROM 테이블명     -- ① ┘
     WHERE 조건절      -- ② +
     GROUP BY 절       -- ③ +
     HAVING 조건절     -- ④ +
     ORDER BY 절       -- ⑥ +
     
===================================*/

--○ SCOTT 소유의 테이블 조회
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE   -- 보너스(BONUS) 데이터 테이블
DEPT	        TABLE	-- 부서(DEPARTMENT) 데이터 테이블
EMP	            TABLE	-- 사원(EMPLOYEES) 데이터 테이블
SALGRADE	    TABLE	-- 급여(SAL) 데이터 테이블

TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/


--○ 각 테이블의 데이터 조회
SELECT *
FROM BONUS;
--==>> 조회 결과 없음(조회된 데이터가 존재하지 않음)

SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/


SELECT * 
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	 800		    20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	 300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	 500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	   0	30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	 950		    30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

SELECT *
FROM SALGRADE;
--==>>
/*
1	 700    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/

--○ DEPT 테이블에 존재하는 컬럼의 구조 확인
DESCRIBE DEPT;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13)
*/

-- DEPTNO   DNAME   LOC
-- 부서번호 부서명  부서위치
-----------------------------
--  10      인사부  서울      → 데이터 입력 가능
--  20              대전      → 데이터 입력 가능
--          개발부  경기      → 데이터 입력 불가~!!!

------------------------------------------------------

--■■■ 오라클 주요 자료형(DATA TYPE) ■■■--
/*
cf) MSSQL 서버의 정수 표현 타입
    tinyint     0 ~ 255             1Byte
    smallint    -32,768 ~ 32,767    2Byte
    int         -21억 ~ 21억        4Byte 
    bigint      엄청 큼             8Byte

    MSSQL 서버의 실수 표현 타입
    float, real
    
    MSSQL 서버의 숫자 표현 타입
    decimal, numeric
    
    MSSQL 서버의 문자 표현 타입
    char, varchar, Nvarchar
    
※ ORACLE 은 숫자 표현 타입이 한 가지로 통일되어 있다.

1. 숫자형 NUMBER       → -10의 38승-1 ~ 10의 38승
          NUMBER(3)    → -999 ~ 999
          NUMBER(4)    → -9999 ~ 9999
          NUMBER(4, 1) → -999.9 ~ 999.9
          
※ ORACLE 의 문자 표현 타입

2. 문자형 CHAR         → 고정형 크기
                          (무조건 지정된 크기 소모)
          CHAR(10)     ←← '강의장'        6Byte 이지만 10Byte 를 소모
          CHAR(10)     ←← '잠든김동민'   10Byte
          CHAR(10)     ←← '오잠깬김동민' 10Byte 를 초과하므로 입력 불가
                          
          VARCHAR2     → 가변형 크기
                          (상황에 따라 크기가 변경)
          VARCHAR2(10) ←← '강의장'        6Byte
          VARCHAR2(10) ←← '잠든김동민'   10Byte
          VARCHAR2(10) ←← '오잠깬김동민' 10Byte 를 초과하므로 입력 불가
                          
          NCHAR        → 유니코드 기반 고정형 크기(글자 수)
          NCHAR(10)    ←← 10글자

          NVARCHAR2    → 유니코드 기반 가변형 크기(글자 수)
          NVARCHAR2(10)←← 10글자
          
3. 날짜형 DATE
*/

SELECT HIREDATE
FROM EMP;

DESCRIBE EMP;

DESC EMP;
--==>>
/*
            :
HIREDATE          DATE
            :
*/

--※ 날짜 형식에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18

--※ 날짜 형식에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18 12:05:05

--※ 날짜 형식에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2023-10-18 12:05:55
--==>> 2023-10-18 14:07:47


--○ EMP 테이블에서 사원번호, 사원명, 급여, 커미션 데이터만 조회한다.

SELECT EMPNO, ENAME, SAL, COMM
FROM EMP;
--==>>
/*
7369	SMITH	 800	
7499	ALLEN	1600	 300
7521	WARD	1250	 500
7566	JONES	2975	
7654	MARTIN	1250	1400
7698	BLAKE	2850	
7782	CLARK	2450	
7788	SCOTT	3000	
7839	KING	5000	
7844	TURNER	1500	   0
7876	ADAMS	1100	
7900	JAMES	 950	
7902	FORD	3000	
7934	MILLER	1300	
*/


--○ EMP 테이블에서 부서번호가 20번인 직원들의 데이터들 중
--   사원번호, 사원명, 직종, 급여, 부서번호 조회
SELECT 사원번호, 사원명, 직종, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO가 20;

--SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
--FROM EMP
--WHERE DEPTNO == 20;
--==>> 에러 발생

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	 800	20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB 직종명, SAL "급   여", DEPTNO "부서 번호"
FROM EMP;

--※ 테이블을 조회하는 과정에서
--   각 칼럼의 이름에는 별칭(ALIAS)을 부여할 수 있다.
--   기본 구문의 형식은 『컬럼명 AS "별칭이름"』의 형태로 작성되며
--   이 때, 『AS』는 생략이 가능하다.
--   또한, 별칭 이름을 감싸는 『""』도 생략이 가능하지만
--   『""』를 생략할 경우 별칭 내에서 공백은 사용할 수 없다.
--   공백의 등장은 해당 컬럼의 표현에 대한 종결을 의미하므로
--   별칭(ALIAS)의 이름 내부에 공백을 사용해야 할 경우
--   『""』를 사용하여 별칭을 부여할 수 있도록 한다.


--○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 데이터들 중
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
--   단, 별칭(ALIAS)을 사용한다.
/*
EMP 테이블에서                           → FROM EMP
부서번호가 20번과 30번                   → 조건
사원번호, 사원명, 직종명, 급여, 부서번호 → SELECT 컬럼명
*/

SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20과 30;

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO가 20과 30;

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO가 20 DEPTNO가 30;

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
--FROM EMP
--WHERE DEPTNO = 20 || DEPTNO = 30;
--==>> 에러 발생

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK	     800	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	     950	30
7902	FORD	ANALYST	    3000	20
*/

--※ 위의 구문은 IN 연산자를 활용하여
--   다음과 같이 처리할 수 있으며
--   위 구문의 처리 결과와 같은 결과를 반환한다.

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO IN (20, 30);
--==>>
/*
7369	SMITH	CLERK	     800	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	     950	30
7902	FORD	ANALYST	    3000	20
*/


--○ EMP 테이블에서 직종이 CLERK 인 사원들의 데이터를 모두 조회한다.
SELECT *
FROM EMP
WHERE 직종이 CLERK;

SELECT *
FROM EMP
WHERE JOB CLERK;

SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	 800		20
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	 950		30
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/

SELECT *
FROM EMP
WHERE JOB = 'clerk';
--==>> 조회 결과 없음

SELECT *
FROM EMP
WHERE JOB = 'Clerk';
--==>> 조회 결과 없음

--※ 오라클에서... 입력된 데이터의 값 만큼은...
--   반.드.시. 대소문자 구분을 한다.

--○ EMP 테이블에서 직종이 CLERK 인 사원들 중
--   20번 부서에서 근무하는 사원들의
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
--   ALIAS 사용~!!!
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	 800	20
7876	ADAMS	CLERK	1100	20
*/

--○ EMP 테이블의 구조와 데이터를 확인해서
--   이와 똑같은 데이터가 들어있는 테이블의 구조를 생성한다.
--   (팀별로... EMP1, EMP2, EMP3, EMP4)
CREATE TABLE EMP3
( EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
);
--==>> Table EMP3이(가) 생성되었습니다

INSERT INTO EMP3 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP3 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
COMMIT;
--==>> 커밋 완료.

SELECT *
FROM EMP3;

-- 1. 복사할 대상 테이블의 구조 확인
DESCRIBE EMP;
DESC EMP;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)
*/

-- 2. 대상 테이블의 구조에 따라 새로운 테이블 생성
CREATE TABLE EMP5
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)
, HIREDATE  DATE
, SAL       NUMBER(7,2)
, COMM      NUMBER(7,2)
, DEPTNO    NUMBER(2)
);
--==>> Table EMP5이(가) 생성되었습니다.

SELECT *
FROM EMP5;

-- 3. 대상 테이블의 데이터 조회
SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 00:00:00	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20 00:00:00	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22 00:00:00	1250	500	30
7566	JONES	MANAGER	7839	1981-04-02 00:00:00	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28 00:00:00	1250	1400	30
7698	BLAKE	MANAGER	7839	1981-05-01 00:00:00	2850		30
7782	CLARK	MANAGER	7839	1981-06-09 00:00:00	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13 00:00:00	3000		20
7839	KING	PRESIDENT		1981-11-17 00:00:00	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08 00:00:00	1500	0	30
7876	ADAMS	CLERK	7788	1987-07-13 00:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 00:00:00	950		30
7902	FORD	ANALYST	7566	1981-12-03 00:00:00	3000		20
7934	MILLER	CLERK	7782	1982-01-23 00:00:00	1300		10
*/

-- 4. 대상 테이블의 데이터를 복사할 테이블에 입력
INSERT INTO EMP5 VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP5 VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP5 VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP5 VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP5 VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP5 VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP5 VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP5 VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP5 VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP5 VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP5 VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP5 VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP5 VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 행 이(가) 삽입되었습니다. *14

-- 5. 확인
SELECT *
FROM EMP5;

-- 6. 커밋
COMMIT;
--==>> 커밋 완료.

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM EMP5;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	 800		    20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	 300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	 500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	   0	30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	 950		    30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

--○ 대상 테이블의 내용에 따라 테이블 생성(TBL_EMP)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

--○ 복사한 테이블 조회
SELECT *
FROM TBL_EMP;


--○ DEPT 테이블을 복사하여 위와 같이 TBL_DEPT 테이블을 생성한다.
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT이(가) 생성되었습니다.

--○ 복사한 테이블 확인
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 테이블의 커멘트 정보 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
EMP3	        TABLE	
EMP5	        TABLE	
TBL_EMP	        TABLE	
TBL_DEPT	    TABLE	
*/


--○ 테이블 레벨의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원 정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	
TBL_EMP	        TABLE	사원 정보
EMP5	        TABLE	
EMP3	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/


--○ TBL_DEPT 테이블을 대상으로 테이블 레벨의 커멘트 데이터 입력
--   → 부서 정보
COMMENT ON TABLE TBL_DEPT IS '부서 정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 후 다시 확인(TBL_DEPT)
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	부서 정보
TBL_EMP	        TABLE	사원 정보
EMP5	        TABLE	
EMP3	        TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP         	TABLE	
DEPT	        TABLE	
*/


--○ 컬럼(COLUMN) 레벨의 커멘트 데이터 확인
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
TBL_EMP	JOB	
EMP3	JOB	
DEPT	LOC	
BONUS	COMM	
TBL_DEPT	LOC	
SALGRADE	LOSAL	
TBL_DEPT	DEPTNO	
EMP5	EMPNO	
EMP5	ENAME	
TBL_EMP	MGR	
TBL_EMP	EMPNO	
EMP5	DEPTNO	
EMP3	MGR	
EMP	DEPTNO	
SALGRADE	HISAL	
EMP	EMPNO	
TBL_DEPT	DNAME	
DEPT	DEPTNO	
DEPT	DNAME	
EMP3	HIREDATE	
TBL_EMP	SAL	
TBL_EXAMPLE2	NO	
TBL_EMP	ENAME	
BONUS	JOB	
TBL_EXAMPLE1	NO	
EMP5	HIREDATE	
EMP3	COMM	
EMP	ENAME	
TBL_EMP	COMM	
EMP5	MGR	
EMP	JOB	
TBL_EXAMPLE2	NAME	
BONUS	SAL	
EMP	SAL	
EMP3	EMPNO	
EMP5	SAL	
EMP3	DEPTNO	
EMP3	ENAME	
TBL_EMP	HIREDATE	
TBL_EXAMPLE1	NAME	
EMP	COMM	
SALGRADE	GRADE	
TBL_EXAMPLE1	ADDR	
TBL_EXAMPLE2	ADDR	
TBL_EMP	DEPTNO	
EMP	HIREDATE	
EMP3	SAL	
EMP	MGR	
EMP5	JOB	
EMP5	COMM	
BONUS	ENAME	
*/

SELECT *
FROM TAB;

DROP TABLE TBL_EXAMPLE1;
--==>> Table TBL_EXAMPLE1이(가) 삭제되었습니다.

SELECT *
FROM TAB;

-- 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

SELECT *
FROM TAB;

--○ 컬럼(COLUMN) 레벨의 커멘트 데이터 확인(TBL_DEPT 테이블에 소속된 컬럼들만 조회)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';        -- 조건 추가
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--COMMENT ON TABLE 테이블명 IS '커멘트';

--○ 테이블에 소속된 컬럼에 대한 커멘트 데이터 입력
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서 번호';
--==>> Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서 이름';
--==>> Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.LOC IS '부서 위치';
--==>> Comment이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	부서 번호
TBL_DEPT	DNAME	부서 이름
TBL_DEPT	LOC	    부서 위치
*/


--○ TBL_EMP 테이블을 대상으로
--   테이블에 소속된(포함된) 컬럼에 대한 커멘트 데이터 입력(설정)
DESC TBL_EMP;
-- 사원 번호, 사원 이름, 직종 이름, 관리자 사원번호, 입사일, 급여, 수당, 부서 번호

COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원 번호';
COMMENT ON COLUMN TBL_EMP.ENAME IS '사원 이름';
COMMENT ON COLUMN TBL_EMP.JOB IS '직종 이름';
COMMENT ON COLUMN TBL_EMP.MGR IS '관리자 사원번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN TBL_EMP.SAL IS '급여';
COMMENT ON COLUMN TBL_EMP.COMM IS '수당';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서 번호';
--==>> Comment이(가) 생성되었습니다.

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	    사원 번호
TBL_EMP	ENAME	    사원 이름
TBL_EMP	JOB	        직종 이름
TBL_EMP	MGR	        관리자 사원번호
TBL_EMP	HIREDATE	입사일
TBL_EMP	SAL	        급여
TBL_EMP	COMM	    수당
TBL_EMP	DEPTNO	    부서 번호
*/


--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블에 주민등록번호 데이터를 담을 수 있는 컬럼 추가
ALTER TABLE TBL_EMP 
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT '01012345678'
FROM DUAL;
--==>> 01012345678

SELECT 01012345678
FROM DUAL;
--==>> 1012345678


--○ TBL_EMP 테이블의 구조 확인
DESC TBL_EMP;
--==>>
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)
*/
--> SSN(주민등록번호) 컬럼이 정상적으로 포함(추가)된 사항을 확인

--※ 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음.

SELECT *
FROM TBL_EMP;

SELECT EMPNO, ENAME, SSN
FROM TBL_EMP;

--○ TBL_EMP 테이블에 추가한 SSN(주민등록번호) 컬럼 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP이(가) 변경되었습니다.

DESC TBL_EMP;
--==>>
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)
*/

SELECT *
FROM TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 삭제(제거)되었음을 확인.

DELETE TBL_EMP;
--==>> 14개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--> 테이블의 구조(뼈대, 틀)는 그대로 남아있는 상태에서
--  데이터만 모두 소실(삭제)된 상황임을 확인.

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--==>> 에러 발생
--     (ORA-00942: table or view does not exist)

--> 테이블 자체가 구조적으로 제거된 상황.


--○ 테이블 다시 복사(생성)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.


--○ NULL의 처리

SELECT 10, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 10	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (null) (null) (null) (null) (null)


--※ 관찰의 결과
--   NULL은 상태의 값을 의미하며... 실제 존재하지 않는 값이기 때문에
--   이 NULL이 연산에 포함될 경우...
--   그 결과는 무조건 NULL이다.


--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> 조회 결과 없음

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (null);
--==>> 조회 결과 없음

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> 에러 발생
--     (ORA-01722: invalid number) 

--※ NULL 은 실제 존재하는 값이 아니기 때문에
--   일반적인 연산자를 활용하여 비교할 수 없다.
--   NULL 을 대상으로 사용할 수 없는 연산자들...
--   >=,<=, =, >, <, !=, <>, ^=
--                   -----------
--                   → 같지 않다는 의미

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL; -- COMM 이 NULL 이다.
--==>>
/*
SMITH	CLERK	     800	(null)
JONES	MANAGER	    2975	(null)
BLAKE	MANAGER	    2850	(null)
CLARK	MANAGER	    2450	(null)
SCOTT	ANALYST	    3000	(null)
KING	PRESIDENT	5000	(null)
ADAMS	CLERK	    1100	(null)
JAMES	CLERK	     950	(null)
FORD	ANALYST	    3000	(null)
MILLER	CLERK	    1300	(null)
*/


--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 사원들의
--   사원명, 직종명, 부서번호 항목을 조회한다.
SELECT ENAME, JOB, DEPTNO
FROM TBL_EMP
WHERE DEPTNO ^= 20;     --> 『^=』와 『!=』와 『<>』은 같은 표현 
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/






