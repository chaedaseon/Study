SELECT USER
FROM DUAL;
--==>> SCOTT


--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 사원들의
--   사원명, 직종명, 부서번호 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE DEPTNO ^= 20;      
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

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE DEPTNO != 20;
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

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE DEPTNO <> 20;
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
--> 『^=』, 『!=』, 『<>』은 같은 표현.


--○ TBL_EMP 테이블에서 커미션이 NULL이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT EMPNO "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--==>>
/*
7499	SALESMAN	1600	 300
7521	SALESMAN	1250	 500
7654	SALESMAN	1250	1400
7844	SALESMAN	1500	   0
*/

SELECT EMPNO "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
--WHERE COMM != NULL;
--WHERE COMM ^= NULL;
WHERE COMM <> NULL;
--==>> 조회 결과 없음.

SELECT EMPNO "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>>
/*
7499	SALESMAN	1600	 300
7521	SALESMAN	1250	 500
7654	SALESMAN	1250	1400
7844	SALESMAN	1500	   0
*/


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며, 연봉 내역에 포함된다.
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, COMM 커미션, SAL*12+COMM 연봉
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		
7782	CLARK	2450		
7788	SCOTT	3000		
7839	KING	5000		
7844	TURNER	1500	   0	18000
*/
--> NULL이 포함되면 연산이 되지 않아 NULL 반환.

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, COMM 커미션, SAL*12 연봉
FROM TBL_EMP;

--○ NVL()
SELECT NULL "COL1", NVL(NULL, 10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (null)   10	5
-- 첫 번째 파라미터 값이 NULL이면, 두 번째 파라미터 값을 반환한다.
-- 첫 번째 파라미터 값이 NULL이 아니면, 그 값을 그래도 반환한다.

SELECT ENAME "사원명", COMM "수당"
FROM TBL_EMP;

SELECT ENAME "사원명", NVL(COMM, 1234) "수당"
FROM TBL_EMP;

--○ NVL()을 활용 ①
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, COMM 커미션, NVL(SAL*12+COMM, SAL*12) 연봉
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
*/

--○ NVL()을 활용 ②
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, COMM 커미션, (SAL*12)+NVL(COMM, 0) 연봉
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
*/


--○ NVL2()
--> 첫 번째 파라미터 값이 NULL이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL인 경우, 세 번째 파라미터 값을 반환한다.

SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려') "수당 확인"
FROM TBL_EMP;

--○ NVL2()를 활용 ①
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", SAL*12+NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
7900	JAMES	 950		    11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
*/

--○ NVL2()를 활용 ②
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션", NVL2(COMM, SAL*12+COMM, SAL*12) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
7900	JAMES	 950		    11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
*/


--○ COALESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.
--  맨 앞에 있는 매개변수부터 차례로 NULL인지 아닌지 확인하여
--  NULL이 아닐 경우 그 값을 반환하고
--  NULL인 경우에는 그 다음 매개변수의 값을 반환한다.
--  NVL()이나 NVL2()와 비교했을 때
--  모~~든 경우의 수를 고려할 수 있다는 특징을 갖는다.

SELECT NULL "COL1"
     , COALESCE(NULL, NULL, NULL, 40) "COL2"
     , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "COL3"
     , COALESCE(NULL, NULL, 30, NULL, NULL, 60) "COL4"
     , COALESCE(10, NULL, NULL, NULL, NULL, 60) "COL5"
FROM DUAL;
--==>> (null)	40	100	30	10

--○ 실습을 위한 데이터 추가 입력

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '현우기', 'SALESMAN', 7369, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '다서니', 'SALESMAN', 7369, SYSDATE, 10, 10);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_EMP;
--==>>
/*
            :
8000	현우기	SALESMAN	7369	2023-10-19	(null)	(null)	10
8001	다서니	SALESMAN	7369	2023-10-19	(null)	    10	10
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며, 연봉 내역에 포함된다.

--○ COALESCE()를 활용 ①
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
     , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800		     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
7900	JAMES	 950		    11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
8000	현우기			            0
8001	다서니		      10	   10
*/


--※ 날짜에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 컬럼과 컬럼의 연결(결합)
SELECT 1, 2
FROM DUAL;

SELECT 1 + 2
FROM DUAL;

SELECT '혜성이', '수환이'
FROM DUAL;

SELECT '혜성이' + '수환이'
FROM DUAL;
--==>> 에러 발생
--     (ORA-01722: invalid number)

SELECT '혜성이' || '수환이'
FROM DUAL;
--==>> 혜성이수환이

SELECT ENAME, JOB
FROM TBL_EMP;

SELECT ENAME || JOB
FROM TBL_EMP;
--==>>
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
현우기SALESMAN
다서니SALESMAN
*/

SELECT '지민이는', SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;
--==>> 지민이는	2023-10-19 10:42:02	에 연봉	   500	   억을 원한다.
--     -------- ------------------- -------    ---     ------------
--     문자타입 날짜타입            문자타입 숫자타입  문자타입

--○ 현재 날짜 및 시간을 반환하는 함수
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 2023-10-19 10:43:22	2023-10-19 10:43:22	23/10/19 10:43:22.000000000

SELECT '지민이는 ' || SYSDATE || '에 연봉 ' || 500 || '억을 원한다.'
FROM DUAL;
--==>> 지민이는 2023-10-19 10:44:47에 연봉 500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형(TYPE)을 변환하는 별도의 과정 없이
--   『||』만 삽입해 주면 간단히 컬럼과 컬럼(서로 다른 종류의 데이터)을
--   결합하는 것이 가능하다.
--   cf) MSSQL 에서는 모든 데이터를 문자열로 CONVERT 해야 한다.

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   『SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
--     ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
--                      :
--                      :
--     다서니의 현재 연봉은 10인데 희망 연봉은 20이다.』
--   단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT *
FROM TBL_EMP;

SELECT ENAME || '의 현재 연봉은 ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0) || '인데 희망 연봉은 ' || COALESCE((SAL*12+COMM)*2, SAL*12*2, COMM*2, 0) || '이다.'
FROM TBL_EMP;
--==>>
/*
SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
WARD의 현재 연봉은 15500인데 희망 연봉은 31000이다.
JONES의 현재 연봉은 35700인데 희망 연봉은 71400이다.
MARTIN의 현재 연봉은 16400인데 희망 연봉은 32800이다.
BLAKE의 현재 연봉은 34200인데 희망 연봉은 68400이다.
CLARK의 현재 연봉은 29400인데 희망 연봉은 58800이다.
SCOTT의 현재 연봉은 36000인데 희망 연봉은 72000이다.
KING의 현재 연봉은 60000인데 희망 연봉은 120000이다.
TURNER의 현재 연봉은 18000인데 희망 연봉은 36000이다.
ADAMS의 현재 연봉은 13200인데 희망 연봉은 26400이다.
JAMES의 현재 연봉은 11400인데 희망 연봉은 22800이다.
FORD의 현재 연봉은 36000인데 희망 연봉은 72000이다.
MILLER의 현재 연봉은 15600인데 희망 연봉은 31200이다.
현우기의 현재 연봉은 0인데 희망 연봉은 0이다.
다서니의 현재 연봉은 10인데 희망 연봉은 20이다.
*/


--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   『SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
--     ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
--                          :
--     다서니's 입사일은 2023-10-19이다. 그리고 급여는 0이다.』
--   단, 레코드마다 위와 같은 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT ENAME || '''s 입사일은 ' || HIREDATE || '이다. 그리고 급여는 ' || NVL(SAL, 0) || '이다.'
FROM TBL_EMP;
--==>>
/*
SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
WARD's 입사일은 1981-02-22이다. 그리고 급여는 1250이다.
JONES's 입사일은 1981-04-02이다. 그리고 급여는 2975이다.
MARTIN's 입사일은 1981-09-28이다. 그리고 급여는 1250이다.
BLAKE's 입사일은 1981-05-01이다. 그리고 급여는 2850이다.
CLARK's 입사일은 1981-06-09이다. 그리고 급여는 2450이다.
SCOTT's 입사일은 1987-07-13이다. 그리고 급여는 3000이다.
KING's 입사일은 1981-11-17이다. 그리고 급여는 5000이다.
TURNER's 입사일은 1981-09-08이다. 그리고 급여는 1500이다.
ADAMS's 입사일은 1987-07-13이다. 그리고 급여는 1100이다.
JAMES's 입사일은 1981-12-03이다. 그리고 급여는 950이다.
FORD's 입사일은 1981-12-03이다. 그리고 급여는 3000이다.
MILLER's 입사일은 1982-01-23이다. 그리고 급여는 1300이다.
현우기's 입사일은 2023-10-19이다. 그리고 급여는 0이다.
다서니's 입사일은 2023-10-19이다. 그리고 급여는 0이다.
*/

--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--   홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다.
--   홑따옴표 하나 (『'』)는 문자열의 시작을 나타내고,
--   홑따옴표 두 개(『''』)는 문자열 영역 안에서 어퍼스트로피를 나타내며
--   다시 마지막에 등장하는 홑따옴표 하나(『'』)는 문자열 영역의 종료를 의미하게 되는 것이다.

SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';
--==>> 
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	 1600	 300	30
7521	WARD	SALESMAN	7698	1981-02-22	 1250	 500	30
7654	MARTIN	SALESMAN	7698	1981-09-28	 1250	1400	30
7844	TURNER	SALESMAN	7698	1981-09-08	 1500	   0	30
8000	현우기	SALESMAN	7369	2023-10-19	(null)		    10
8001	다서니	SALESMAN	7369	2023-10-19	(null)	  10	10
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==>> 조회 결과 없음.

SELECT *
FROM TBL_EMP
WHERE JOB = 'SalesMan';
--==>> 조회 결과 없음.


--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
     , UPPER('oRaCLe') "COL2"
     , LOWER('oRaCLe') "COL3"
     , INITCAP('oRaCLe') "COL4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
-- UPPER()는 모두 대문자로 변환
-- LOWER()는 모두 소문자로 변환
-- INITCAP()은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환

--※ 실습을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '임하성', 'salesman', 7369, SYSDATE, 20, 100);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_EMP;
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
8000	현우기	SALESMAN	7369	2023-10-19			        10
8001	다서니	SALESMAN	7369	2023-10-19		      10	10
8002	임하성	salesman	7369	2023-10-19		     100	20
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_EMP 테이블을 대상으로 영업사원(세일즈맨)의 
--   사원번호, 사원명, 직종명을 조회한다.
--   또한, 검색값이 'sALeSmAN'인 조건으로 검색을 수행하더라도
--   해당 사원들을 조회할 수 있도록 쿼리문을 구성한다.
SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE JOB = 'sALeSmAN';
--==>> 조회 결과 없음.

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN');
--SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
--FROM TBL_EMP
--WHERE JOB = 'SALESMAN';
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
*/

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN');
--SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
--FROM TBL_EMP
--WHERE JOB = 'salesman';
--==>> 8002	임하성	salesman

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE JOB = LOWER('sALeSmAN')
   OR JOB = UPPER('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종명"
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');
--WHERE LOWER(JOB) = LOWER('sALeSmAN');
--WHERE INITCAP(JOB) = INITCAP('sALeSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	현우기	SALESMAN
8001	다서니	SALESMAN
8002	임하성	salesman
*/


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';
--==>> MARTIN	SALESMAN	1981-09-28

DESC TBL_EMP;
--==>> HIREDATE    DATE

--○ TO_DATE() : DATE 타입으로 변환해주는 함수
SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--                        ----------    → 숫자 타입
--                       ------------   → 문자 타입
--               -----------------------------------    → 날짜 타입
--==>> MARTIN	SALESMAN	1981-09-28


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)
--   입사한 직원의 사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
현우기	SALESMAN	2023-10-19
다서니	SALESMAN	2023-10-19
임하성	salesman	2023-10-19
*/

--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다.
--   오라클에서는 날짜 데이터에 대한 크기 비교 시
--   과거보다 미래를 더 큰 값으로 간주한다.


--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
--   1981년 9월 28일 사이에 입사한 직원들의
--   사원명 직종명, 입사일 항목을 조회한다. (해당일 포함)
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')
  AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--○ BETWEEN ⓐ AND ⓑ

SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD')
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--○ TBL_EMP 테이블에서 급여(SAL)가 2450 에서 3000 까지의 직원들을 모두 조회한다.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000; 
--==>> 
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/

--○ TBL_EMP 테이블에서 직원들의 이름이
--   'C'로 시작하는 이름부터 'S'로 시작하는 이름인 경우
--   모든 항목을 조회한다.
SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';        -- 사전식 배열 기준
--==>>
/*
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7900	JAMES	CLERK	    7698	1981-12-03	 950		    30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';  
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	 800		    20
7521	WARD	SALESMAN	7698	1981-02-22	1250	 500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	   0	30
7900	JAMES	CLERK	    7698	1981-12-03	 950		    30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

--※ 『BETWEEN ⓐ AND ⓑ』는 날짜형, 숫자형, 문자형 데이터 모두에 적용된다.
--   단, 문자형이 경우 아스키코드 순서를 따르기 때문에(사전식 배열)
--   대문자가 앞쪽에 위치하고, 소문자가 뒤쪽에 위치한다.
--   또한, 『BETWEEN ⓐ AND ⓑ』는 해당 구문이 수행되는 시점에서
--   오라클 내부적으로는 부등호 연산자의 형태로 바뀌어 연산 처리된다.


--○ ASCII()
--   매개변수로 넘겨받은 해당 문자의 아스키 코드 값을 반환한다.
SELECT ASCII('A')"COL1"
     , ASCII('B')"COL2"
     , ASCII('a')"COL3"
     , ASCII('b')"COL4"
FROM DUAL;
--==>> 65	66	97	98

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLERK';
--==>> 
/*
SMITH	   CLERK	 800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	   CLERK	1100
JAMES	   CLERK	 950
MILLER	   CLERK	1300
현우기	SALESMAN	
다서니	SALESMAN	
*/

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN('SALESMAN', 'CLERK');

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLERK');

--※ 위의 3가지 유형의 쿼리문은 모두 같은 결과를 반환한다.
--   하지만, 맨 위의 쿼리문(OR)이 가장 빠르게 처리된다. (정말 얼마 안되지만...)
--   물론 메모리에 대한 내용이 아니라 CPU 에 대한 내용이므로
--   이 부분까지 감안하여 쿼리문을 구성하게 되는 경우는 많지 않다.
--   → 『IN』과 『=ANY』는 위 상황에서 모두 같은 연산자 효과를 가진다.
--      이들 모두는 내부적으로 『OR』구조로 변경되어 연산 처리된다.

--------------------------------------------------------------------------------

--○ 추가 실습 테이블 구성(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE        DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>> Table TBL_SAWON이(가) 생성되었습니다.

SELECT *
FROM TBL_SAWON;
--==>> 조회 결과 없음

DESC TBL_SAWON;
--==>>
/*
이름     널? 유형           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)   
*/


--○ 생성된 테이블에 데이터 입력(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '강혜성', '9710171234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '박가영', '9511182234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '박나영', '9902082234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '최혜인', '9708112234567', TO_DATE('2010-05-06', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '아이유', '0502034234567', TO_DATE('2015-10-19', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '이하이', '0609304234567', TO_DATE('2012-06-17', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '인순이', '6510102234567', TO_DATE('1999-08-22', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '선동열', '6909101234567', TO_DATE('1998-01-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '이이경', '0505053234567', TO_DATE('2011-05-06', 'YYYY-MM-DD'), 1500);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '선우용녀', '6611112234567', TO_DATE('2000-01-16', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '이윤수', '9501061234567', TO_DATE('2009-09-19', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '선우선', '0606064234567', TO_DATE('2011-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '남진', '6511111234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '이주형', '9904171234567', TO_DATE('2009-11-11', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '남궁민', '0202023234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 2300);

--==>> 1 행 이(가) 삽입되었습니다. *15

SELECT * 
FROM TBL_SAWON;
--==>>
/*
1001	강혜성	    9710171234567	2005-01-03	3000
1002	박가영	    9511182234567	1999-11-23	4000
1003	박나영	    9902082234567	2006-08-10	4000
1004	최혜인	    9708112234567	2010-05-06	5000
1005	아이유	    0502034234567	2015-10-19	1000
1006	이하이	    0609304234567	2012-06-17	1000
1007	인순이	    6510102234567	1999-08-22	2000
1008	선동열	    6909101234567	1998-01-10	2000
1009	이이경	    0505053234567	2011-05-06	1500
1010	선우용녀	6611112234567	2000-01-16	1300
1011	이윤수	    9501061234567	2009-09-19	4000
1012	선우선	    0606064234567	2011-11-11	2000
1013	남진	    6511111234567	1999-11-11	2000
1014	이주형	    9904171234567	2009-11-11	2000
1015	남궁민	    0202023234567	2010-10-10	2300
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_SAWON 테이블에서 '이주형' 사원의 데이터를 조회한다.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '이주형';
--==>> 1014	이주형	9904171234567	2009-11-11	2000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '이주형';
--==>> 1014	이주형	9904171234567	2009-11-11	2000

--※ LIKE : 동사 → 좋아하다 (Ⅹ)
--          부사 → ~와 같이, ~처럼 (○)


--※ WILD CARD(CHARACTER) → 『%』
--   『LIKE』와 함께 사용되는 『%』는 모든 글자를 의미하고 
--   『LIKE』와 함께 사용되는 『_』는 아무 글자 한 개를 의미한다.

--○ TBL_SAWON 테이블에서 성씨가 『강』씨인 사원의 
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT 사원명, 주민번호, 급여
FROM TBL_SAWON
WHERE 성씨가 '강';

SELECT SANAME 사원명, JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE SANAME='강';
--==>> 조회 결과 없음

SELECT SANAME 사원명, JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE SANAME='강__';
--==>> 조회 결과 없음

SELECT SANAME 사원명, JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '강__';
--==>> 강혜성	9710171234567	3000

SELECT SANAME 사원명, JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '강%';
--==>> 강혜성	9710171234567	3000


--○ TBL_SAWON 테이블에서 성씨가 『이』씨인 사원의
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이%';
--==>>
/*
이하이	0609304234567	1000
이이경	0505053234567	1500
이윤수	9501061234567	4000
이주형	9904171234567	2000
*/

--○ TBL_SAWON 테이블에서 사원의 이름이 『영』으로 끝나는 사원의
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%영';
--==>>
/*
박가영	9511182234567	4000
박나영	9902082234567	4000
*/

--○ TBL_SAWON 테이블에서 사원의 이름에 '이' 라는 글자가
--   하나라도 포함되어 있다면 그 사원의
--   사원번호, 사원명, 급여 항목을 조회한다.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%';
--==>>
/*
1005	아이유	1000
1006	이하이	1000
1007	인순이	2000
1009	이이경	1500
1011	이윤수	4000
1014	이주형	2000
*/

--○ TBL_SAWON 테이블에서 사원의 이름에 '이'라는 글자가
--   두 번 들어있는 사원의 사원번호, 사원명, 급여 항목을 조회한다.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%이%';
--==>> 
/*
1006	이하이	1000
1009	이이경	1500
*/

--○ TBL_SAWON 테이블에서 사원의 이름에 '이'라는 글자가
--   연속으로 두 번 들어있는 사원의 사원번호, 사원명, 급여 항목을 조회한다.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이이%';
--==>> 1009	이이경	1500


--○ TBL_SAWON 테이블에서 사원의 이름의 두 번째 글자가 '혜'인 사원의
--   사원번호, 사원명, 급여 항목을 조회한다.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '_혜%';
--==>>
/*
1001	강혜성	3000
1004	최혜인	5000
*/


--○ TBL_SAWON 테이블에서 성씨가 '선'씨인 사원의
--   사원번호, 사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '선%';
--==>>
/*
1008	6909101234567	2000
1010	6611112234567	1300
1012	0606064234567	2000
*/

--※ 데이터 베이스 설계 과정에서
--   성과 이름을 분리하여 처리할 업무 계획이 있다면
--   (지금 당장은 아니더라도...)
--   테이블에서 성 컬럼과 이름 컬럼을 분리하여 구성해야 한다.


--○ TBL_SAWON 테이블에서 여직원들의
--   사원명, 주민번호, 급여 항목을 조회한다.
DESC TBL_SAWON;
--==>>
/*
이름       널? 유형           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%'
   OR JUBUN LIKE '______4%';
--WHERE JUBUN LIKE '______2______'
--   OR JUBUN LIKE '______4______';
--==>>
/*
박가영	    9511182234567	4000
박나영	    9902082234567	4000
최혜인	    9708112234567	5000
아이유	    0502034234567	1000
이하이	    0609304234567	1000
인순이	    6510102234567	2000
선우용녀	6611112234567	1300
선우선	    0606064234567	2000
*/


--○ 실습 테이블 생성(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TBL_WATCH이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('금시계', '순금 99.99% 함유된 최고급 시계');

INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('은시계', '고객만족도 99.99점을 획득한 최고의 시계');

--==>> 1 행 이(가) 삽입되었습니다. *2


--○ 확인
SELECT *
FROM TBL_WATCH;
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객만족도 99.99점을 획득한 최고의 시계
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_WATCH 테이블의 BIGO(비고) 컬럼에 
--   『99.99%』라는 글자가 포함된(들어있는) 행(레코드)의
--   데이터를 조회한다.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객만족도 99.99점을 획득한 최고의 시계
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객만족도 99.99점을 획득한 최고의 시계
*/


-- ESCAPE
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> 금시계	순금 99.99% 함유된 최고급 시계

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> 금시계	순금 99.99% 함유된 최고급 시계

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99@%%' ESCAPE '@';
--==>> 금시계	순금 99.99% 함유된 최고급 시계


--※ ESCAPE로 정한 문자의 다음 한 글자를 와일드카드에서 탈출시켜라...
--   일반적으로 사용 빈도가 낮은 특수문자(특수기호)를 사용한다.


--------------------------------------------------------------------------------

--■■■ COMMIT / ROLLBACK ■■■--

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 데이터 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/

-- 50번 개발부 서울...
-- 이 데이터는 TBL_DEPT 테이블이 저장되어 있는
-- 하드디스크상에 물리적으로 적용되어 저장된 것이 아니다.
-- 메모리(RAM) 상에 입력된 것이다.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50번 개발부 서울...에 대한 데이터가 소실되었음을 확인(존재하지 않음)

--○ 다시 데이터 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>> 1 행 이(가) 삽입되었습니다.


--○ 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/

-- 50번 개발부 서울...
-- 이 데이터는 TBL_DEPT 테이블이 저장되어 있는 하드디스크상에 저장된 것이 아니라
-- 메모리(RAM) 상에 입력된 것이다.
-- 이를... 실제 하드디스크상에 물리적으로 저장된 상황을 확정하기 위해서는
-- COMMIT 을 수행해야 한다.


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 커밋 이후 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 롤백 이후 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/
--> 롤백(ROLLBACK)을 수행했음에도 불구하고 
--  50번 개발부 서울...의 행 데이터는 소실되지 않았음을 확인

--※ COMMIT 을 실행한 이후로 DML(INSERT, UPDATE, DELETE) 구문을 통해
--   변경된 데이터를 취소할 수 있는 것일 뿐...
--   DML 명령을 사용한 후 COMMIT 을 수행하고나서 ROLLBACK을 실행해봐야
--   아무 소용이 없다.


--○ 데이터 수정(UPDATE → TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = '경기'
WHERE DEPTNO = 50;














