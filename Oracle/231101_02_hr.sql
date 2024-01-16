SELECT USER
FROM DUAL;
--==>> HR

--○ EMPLOYEES 테이블의 직원들 SALARY 를 10% 인상한다.
--   단, 부서명이 'IT'인 직원들만 한정한다.
--   (또한, 쿼리문에 대한 변경 결과 확인 후 ROLLBACK 을 수행한다~!!!)

-- 내가 풀이한 내용
-- 변경 전 확인
SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9000		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6000		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	4800		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	4800		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4200		103	60
*/
SELECT *
FROM DEPARTMENTS;

UPDATE (SELECT *
        FROM EMPLOYEES E, DEPARTMENTS D
        WHERE E. DEPARTMENT_ID = D.DEPARTMENT_ID)
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_NAME = 'IT';
--==>> 5개 행 이(가) 업데이트되었습니다.

-- 변경 후 확인
SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
*/

ROLLBACK;
--==>> 롤백 완료.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용
-- IT 부서 직원들의 FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE 부서명 = 'IT';

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE 부서명 = 부서명이 'IT'인 부서의 부서아이디;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(부서명이 'IT'인 부서의 부서아이디);

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>>
/*
Alexander	Hunold	    9000	60
Bruce	    Ernst	    6000	60
David	    Austin	    4800	60
Valli	    Pataballa	4800	60
Diana	    Lorentz	    4200	60
*/

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
     , SALARY * 1.1 "10%인상된급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>> 5개 행 이(가) 업데이트되었습니다.

-- 업데이트 후에는 반드시 테이블 전체를 먼저 확인할 것!
SELECT *
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
*/

-- 롤백
ROLLBACK;
--==>> 롤백 완료.


-- ○ EMPLOYEES 테이블에서 JOB_TITLE 이 'Sales Manager' 인 사원들의
--    SALARY 를 해당 직무(직종)의 최고급여(MAX_SALARY)로 수정한다.
--    단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한해 적용할 수 있도록 처리한다.
--    또한, 변경에 대한 결과 확인 후 ROLLBACK을 수행한다~!!!)

-- 내가 풀이한 내용
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'           
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	     JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	12000	0.3	100	80
*/

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>> 3개 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/

ROLLBACK;
--==>> 롤백 완료.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용
-- 'Sales Manager'의 MAX_SALARY
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

-- 'Sales Manager'의 JOB_ID
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN


SELECT *
FROM EMPLOYEES
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006      --> 숫자형태여야 함! 
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>> 3개 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM EMPLOYEES
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/


--○ EMPLOYEES 테이블에서 SALARY 를
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance → 10% 인상
--   Executive → 15% 인상
--   Accounting → 20% 인상
--   (쿼리문에 의한 변경 결과 확인 후 ROLLBACK 수행~!!!)

-- 내가 풀이한 내용
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM EMPLOYEES;
--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    24000			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    17000		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    17000		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    12008		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9000		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	8200		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	7700		108	100
112	Jose Manuel Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	7800		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	6900		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    12008		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	8300		205	110
*/

-- DECODE() 사용
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY*1.1
                                  , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                                  , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY *1.2)
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11개 행 이(가) 업데이트되었습니다.

-- CASE WHEN THEN ELSE END 사용
UPDATE EMPLOYEES
SET SALARY = CASE WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                  WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY * 1.15
                  WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY *1.2
                  ELSE SALARY
              END 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11개 행 이(가) 업데이트되었습니다.                        


SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    27600			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    19550		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    19550		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    13208.8		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9900		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	9020		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	8580		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	7590		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    14409.6		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	9960		205	110
*/

ROLLBACK;
--==>> 롤백 완료.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용

-- 'Finance', 'Executive', 'Accounting' 부서에 해당하는 부서번호
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting');
--==>>
/*
90
100
110
*/

-- 'Finance', 'Executive', 'Accounting' 부서에 소속된 직원
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));

-- 'Finance', 'Executive', 'Accounting' 부서별 다른 급여 인상률 
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'의 부서아이디) THEN SALARY * 1.1
                                WHEN ('Executive'의 부서아이디) THEN SALARY * 1.15
                                WHEN ('Accounting'의 부서아이디) THEN SALARY * 1.2
                                ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));

-- ('Finance'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--==>> 100

-- ('Executive'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--==>> 90

-- ('Accounting'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
--==>> 110


UPDATE EMPLOYEES                        --> UPDATE문에는 별칭 사용하지 않음!
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Finance') 
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Executive') 
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Accounting') 
                                THEN SALARY * 1.2
                                ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--> 논리적으로 위의 쿼리문에서 WHERE절이 없어도 해당 부서 직원들만 급여가 변경된다.
--  하지만, 메모리적으로 봤을 때 WHERE절이 있는 것이 바람직하다.

--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    27600			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    19550		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    19550		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    13208.8		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9900		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	9020		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	8580		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	7590		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    14409.6		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	9960		205	110
*/

--------------------------------------------------------------------------------

--■■■ DELETE ■■■--

-- 1. 테이블에서 지정된 행(레코드)을 삭제하는데 사용하는 구문

-- 2. 형식 및 구조
-- DELETE [FROM] 테이블명           → FROM절은 생략가능하나 생략하지 말 것!
-- [WHERE 조건절];

--> DELETE절을 처리하기 전 반드시 SELECT문을 이용하여 조회 먼저 해보기!

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;

--○ EMPLOYEES 테이블에서 직원들의 데이터를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.
DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> 에러 발생
--     (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)

--※ 실제로는 EMPLOYEES 테이블의 데이터가(→ 삭제하고자 하는 대상 데이터)
--   다른 레코드에 의해 참조당하고 있는 경우
--   삭제되지 않을 수 있다는 사실을 인지하고 있어야 하며...
--   그에 대한 이유도 알아야 한다.










