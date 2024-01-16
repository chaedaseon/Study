SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 데이터 수정(UPDATE → TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = '경기'
WHERE DEPTNO = 50;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	연구부	    경기
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


--○ 데이터 수정
UPDATE TBL_DEPT
SET DNAME = '연구부', LOC = '인천'
WHERE DEPTNO = 50;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	연구부	    인천
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	연구부	    인천
*/


--○ 데이터 삭제(DELETE → TBL_DEPT)
DELETE TBL_DEPT
WHERE DEPTNO = 50;

SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 50	연구부	인천

DELETE 
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------------------------

--■■■ ORDER BY 절 ■■■--

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP;
--==>> 
/*
SMITH	20	CLERK	     800	 9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO ASC;        -- DEPTNO → 정렬 기준 : 부서번호
                            -- ASC    → 정렬 유형 : 오름차순
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO;            -- ASC → 정렬 유형 : 오름차순 → 생략 가능~!!!
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY DEPTNO DESC;        -- DEPTNO → 정렬 기준 : 부서번호
                             -- DESC   → 정렬 유형 : 내림차순
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	     950	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	     800	 9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 연봉 DESC; 
--==>>
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
SMITH	20	CLERK	     800	 9600
*/

SELECT *
FROM EMP;

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 2;        -- 부서번호 오름차순
--> EMP 테이블이 갖고있는 테이블의 고유한 컬럼 순서(2→ENAME)가 아니라
--  SELECT 처리 되는 두 번째 컬럼(2→DEPTNO, 부서번호)을 기준으로 정렬
--  ASC는 생략된 상태 → 오름차순 정렬
--  오라클에서의 기본 인덱스는 자바와 달리 1부터 시작
--  최종적으로... 현재 『ORDER BY 2』구문은 → 『ORDER BY DEPNO ASC』이다.
--==>> 
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME "사원명", DEPTNO "부서번호", JOB "직종", SAL "급여"
     , SAL * 12 + NVL(COMM, 0) "연봉"
FROM EMP
ORDER BY 2, 4; 
-- 부서번호, 급여 기준 오름차순 정렬
-- (1차)     (2차)
--==>>
/*
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
SMITH	20	CLERK	     800	 9600
ADAMS	20	CLERK	    1100	13200
JONES	20	MANAGER	    2975	35700
SCOTT	20	ANALYST	    3000	36000
FORD	20	ANALYST	    3000	36000
JAMES	30	CLERK	     950	11400
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
BLAKE	30	MANAGER	    2850	34200
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC; 
-- ① 2      → DEPTNO(부서번호) 기준 오름차순 정렬
-- ② 3      → JOB(직종명) 기준 오름차순 정렬
-- ③ 4 DESC → SAL(급여) 기준 내림차순(DESC) 정렬
-- (3차 정렬 수행)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	     800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	     950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/


--------------------------------------------------------------------------------

--○ CONCAT()
SELECT ENAME || JOB "COL1"
     , CONCAT(ENAME, JOB) "COL2"
FROM EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/

-- 문자열 기반으로 데이터 결합을 수행하는 함수 CONCAT()
-- 오로지 2개의 문자열만 결합시킬 수 있다.
SELECT '서로' || '배려하며' || '지내자' "COL1"
     , CONCAT('서로', '배려하며', '지내자') "COL2"
FROM DUAL;
--==>> 에러 발생
--     (ORA-00909: invalid number of  arguments)


-- 사원명, 직종명, 부서번호 
SELECT ENAME || JOB || DEPTNO "COL1"
     , CONCAT(ENAME, CONCAT(JOB, DEPTNO)) "COL2"
FROM EMP;
--==>> 
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30	    ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10	    KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/


--> 내부적인 형 변환이 일어나며 결합을 수행하게 된다.
--  CONCAT()은 문자열과 문자열을 결합시켜주는 함수이지만
--  내부적으로 숫자나 날짜를 문자로 변환해주는 과정이 포함되어 있다.

/*
obj.substring()
---
문자열 → 문자열.substring(n, m);
                           ----
                           문자열의 n부터 m-1까지... (인덱스는 0부터...)
*/

--○ SUBSTR() 갯수 기반 / SUBSTRB() 바이트 기반

SELECT ENAME "COL1"
     , SUBSTR(ENAME, 1, 2) "COL2"
FROM EMP;
--> 문자열을 추출하는 기능을 가진 함수
--  첫 번째 파라미터 값은 대상 문자열(추출의 대상, TARGET)
--  두 번째 파라미터 값은 추출을 시작하는 위치(인덱스, START) → 인덱스는 1부터 시작...
--  세 번째 파라미터 값은 추출할 문자열의 갯수(갯수, COUNT) → 생략 시... 문자열 길이 끝까지...
--==>>
/*
SMITH	SM
ALLEN	AL
WARD	WA
JONES	JO
MARTIN	MA
BLAKE	BL
CLARK	CL
SCOTT	SC
KING	KI
TURNER	TU
ADAMS	AD
JAMES	JA
FORD	FO
MILLER	MI
*/

SELECT ENAME "COL1"
     , SUBSTR(ENAME, 3, 2) "COL2"
     , SUBSTR(ENAME, 3, 5) "COL3"
     , SUBSTR(ENAME, 3) "COL4"
     , SUBSTR(ENAME, 6, 1) "COL5"
FROM EMP;
--==>>
/*
SMITH	IT	ITH	    ITH	
ALLEN	LE	LEN	    LEN	
WARD	RD	RD	    RD	
JONES	NE	NES	    NES	
MARTIN	RT	RTIN	RTIN	N
BLAKE	AK	AKE	    AKE	
CLARK	AR	ARK	    ARK	
SCOTT	OT	OTT	    OTT	
KING	NG	NG	    NG	
TURNER	RN	RNER	RNER	R
ADAMS	AM	AMS	    AMS	
JAMES	ME	MES	    MES	
FORD	RD	RD	    RD	
MILLER	LL	LLER	LLER	R
*/

--○ TBL_SAWON 테이블에서 성별이 남성인 사원만
--   사원번호, 사원명, 주민번호, 급여 항목을 조회한다.
--   단, SUBSTR() 함수를 활용하여 처리할 수 있도록 한다.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1'
   OR SUBSTR(JUBUN, 7, 1) = '3';
--==>>
/*
1001	강혜성	9710171234567	3000
1008	선동열	6909101234567	2000
1009	이이경	0505053234567	1500
1011	이윤수	9501061234567	4000
1013	남진	6511111234567	2000
1014	이주형	9904171234567	2000
1015	남궁민	0202023234567	2300
*/

SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3');
--==>>
/*
1001	강혜성	9710171234567	3000
1008	선동열	6909101234567	2000
1009	이이경	0505053234567	1500
1011	이윤수	9501061234567	4000
1013	남진	6511111234567	2000
1014	이주형	9904171234567	2000
1015	남궁민	0202023234567	2300
*/


--○ LENGTH() 글자 수 / LENGTHB() 바이트 수
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM EMP;
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/

--○ INSTR()
SELECT 'ORACLE ORAHOME BIORA' "COL1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"    -- 1
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"    -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"    -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "COL5"       -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL6"    -- 0
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0
--> 첫 번째 파라미터 값에 해당하는 문자열에서... (대상 문자열, TARGET)
--  두 번째 파라미터 값을 통해 넘겨준 문자열이 등장하는 위치를 찾아라~!!!
--  세 번째 파라미터 값은 찾기 시작하는(스캔을 시작하는) 위치
--  네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정 → (1일 경우 생략 가능)
SELECT '나의오라클 집으로오라 합니다.' "COL1"
     , INSTR('나의오라클 집으로오라 합니다.', '오라', 1) "COL2"    -- 3
     , INSTR('나의오라클 집으로오라 합니다.', '오라', 2) "COL3"    -- 3
     , INSTR('나의오라클 집으로오라 합니다.', '오라', 10) "COL4"   -- 10
     , INSTR('나의오라클 집으로오라 합니다.', '오라', 11) "COL5"   -- 0
FROM DUAL;
--==>> 나의오라클 집으로오라 합니다.	3	3	10	0
--> 마지막 파라미터 값을 생략한 형태로 사용 → 마지막 파라미터 → 1


--○ REVERSE()
SELECT 'ORACLE' "COL1"
     , REVERSE('ORACLE') "COL2"
     , REVERSE('오라클') "COL3"
FROM DUAL;
--==>> ORACLE	ELCARO  ???
-- 대상 문자열을 거꾸로 반환한다. (단, 한글은 제외 - 사용 불가)


--○ 실습 테이블 생성(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO        NUMBER(3)
, FILENAME      VARCHAR2(100)
);
--==>> Table TBL_FILES이(가) 생성되었습니다.

--○ 데이터 입력(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'C:\SHARE\F\TEST\FLOWER.PNG');
INSERT INTO TBL_FILES VALUES(7, 'E:\STUDY\ORACLE\20231020_01_SCOTT.SQL');
--==>> 행 이(가) 삽입되었습니다 *7

--○ 확인
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT
6	C:\SHARE\F\TEST\FLOWER.PNG
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 확인
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT
6	C:\SHARE\F\TEST\FLOWER.PNG
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL
*/

SELECT FILENO "파일번호"
     , FILENAME "파일명"
FROM TBL_FILES;
--==>> 
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT
6	C:\SHARE\F\TEST\FLOWER.PNG
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL
*/

--○ TBL_FILES 테이블을 조회하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	FLOWER.PNG
7	20231020_01_SCOTT.SQL
*/

SELECT FILENO "파일번호"
     , SUBSTR(FILENAME, INSTR(FILENAME, '\', -1)+1) "파일명"
FROM TBL_FILES;

SELECT FILENO "파일번호"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\' , 1)-1)) "파일명"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	FLOWER.PNG
7	20231020_01_SCOTT.SQL
*/

SELECT FILENO "파일번호"
     , FILENAME "파일명"
FROM TBL_FILES
WHERE FILENO = 1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC

SELECT FILENO "파일번호"
     , FILENAME "경로포함 파일명"
     , SUBSTR(FILENAME, 16, 9) "파일명"
FROM TBL_FILES
WHERE FILENO = 1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "파일번호"
     , FILENAME "경로포함 파일명"
     , SUBSTR(FILENAME, 16, 9) "파일명"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	            SALES.DOC
2	C:\AAA\PANMAE.XXLS	                    XLS
3	D:\RESEARCH.PPT	                        (null)                        
4	C:\DOCUMENTS\STUDY.HWP	                UDY.HWP
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT	    MP\HOMEWO
6	C:\SHARE\F\TEST\FLOWER.PNG	            \FLOWER.P
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL	\20231020
*/

SELECT FILENO "파일번호"
     , REVERSE(FILENAME) "거꾸로된파일명"
FROM TBL_FILES;
--==>>
/*
1	COD.SELAS               \CCC\BBB\AAA\:C             → 최초 『\』 등장위치 : 10 → 1~9 추출
2	SLXX.EAMNAP             \AAA\:C                     → 최초 『\』 등장위치 : 12 → 1~11 추출 
3	TPP.HCRAESER            \:D                         → 최초 『\』 등장위치 : 13 → 1~12 추출
4	PWH.YDUTS               \STNEMUCOD\:C               → 최초 『\』 등장위치 : 10 → 1~9 추출
5	TXT.LQS                 \KROWEMOH\PMET\STNEMUCOD\:C → 최초 『\』 등장위치 :  8 → 1~7 추출
    6	GNP.REWOLF          \TSET\F\ERAHS\:C            → 최초 『\』 등장위치 : 10 → 1~9 추출
7	LQS.TTOCS_10_02013202   \ELCARO\YDUTS\:E            → 최초 『\』 등장위치 : 22 → 1~21 추출
*/

SELECT FILENO "파일번호"
     , FILENAME "경로포함파일명"
     , REVERSE(FILENAME) "거꾸로된경로및파일명"
     , SUBSTR(대상문자열, 추출시작위치, 최초 『\』 등장위치 - 1) "거꾸로된파일명"
FROM TBL_FILES;

SELECT FILENO "파일번호"
     , FILENAME "경로포함파일명"
     , REVERSE(FILENAME) "거꾸로된경로및파일명"
     , SUBSTR(REVERSE(FILENAME), 1, 최초 『\』 등장위치 - 1) "거꾸로된파일명"
FROM TBL_FILES;


-- 최초 『\』 등장위치
-- → INSTR(REVERSE(FILENAME), '\', 1, 1)
-- → INSTR(REVERSE(FILENAME), '\', 1)

SELECT FILENO "파일번호"
     , FILENAME "경로포함파일명"
     , REVERSE(FILENAME) "거꾸로된경로및파일명"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1) "거꾸로된파일명"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	            COD.SELAS\CCC\BBB\AAA\:C	            COD.SELAS
2	C:\AAA\PANMAE.XXLS	S                   LXX.EAMNAP\AAA\:C	                    SLXX.EAMNAP
3	D:\RESEARCH.PPT	                        TPP.HCRAESER\:D	                        TPP.HCRAESER
4	C:\DOCUMENTS\STUDY.HWP	                PWH.YDUTS\STNEMUCOD\:C	                PWH.YDUTS
5	C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT	    TXT.LQS\KROWEMOH\PMET\STNEMUCOD\:C	    TXT.LQS
6	C:\SHARE\F\TEST\FLOWER.PNG	            GNP.REWOLF\TSET\F\ERAHS\:C	            GNP.REWOLF
7	E:\STUDY\ORACLE\20231020_01_SCOTT.SQL	LQS.TTOCS_10_02013202\ELCARO\YDUTS\:E	LQS.TTOCS_10_02013202
*/

SELECT FILENO "파일번호"
     , FILENAME "경로포함파일명"
     , REVERSE(FILENAME) "거꾸로된경로및파일명"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1) "거꾸로된파일명"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1)) "파일명"
FROM TBL_FILES;
--==>>
/*
파일번호    경로포함파일명                          거꾸로된경로및파일명                    거꾸로된파일명          파일명
=========================================================================================================================================
1	        C:\AAA\BBB\CCC\SALES.DOC	            COD.SELAS\CCC\BBB\AAA\:C	            COD.SELAS	            SALES.DOC
2	        C:\AAA\PANMAE.XXLS	                    SLXX.EAMNAP\AAA\:C	                    SLXX.EAMNAP	            PANMAE.XXLS
3	        D:\RESEARCH.PPT	                        TPP.HCRAESER\:D	                        TPP.HCRAESER	        RESEARCH.PPT
4	        C:\DOCUMENTS\STUDY.HWP	                PWH.YDUTS\STNEMUCOD\:C	                PWH.YDUTS	            STUDY.HWP
5	        C:\DOCUMENTS\TEMP\HOMEWORK\SQL.TXT	    TXT.LQS\KROWEMOH\PMET\STNEMUCOD\:C	    TXT.LQS	                SQL.TXT
6	        C:\SHARE\F\TEST\FLOWER.PNG	            GNP.REWOLF\TSET\F\ERAHS\:C	            GNP.REWOLF	            FLOWER.PNG
7	        E:\STUDY\ORACLE\20231020_01_SCOTT.SQL	LQS.TTOCS_10_02013202\ELCARO\YDUTS\:E	LQS.TTOCS_10_02013202	20231020_01_SCOTT.SQL
*/

SELECT FILENO "파일번호"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1)) "파일명"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	FLOWER.PNG
7	20231020_01_SCOTT.SQL
*/


--○ LPAD()
--> Byte 를 확보하여 왼쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "COL1"
     , LPAD('ORACLE', 10, '*') "COL2"
FROM DUAL;
--> ① 10Byte 공간을 확보한다.                  → 두 번째 파라미터 값에 의해...
--  ② 확보한 공간에 'ORACLE' 문자열을 담는다.  → 첫 번째 파라미터 값에 의해...
--  ③ 남아있는 Byte 공간을 왼쪽부터 세 번째 파라미터 값으로 채운다.
--  ④ 이렇게 구성된 최종 결과값을 반환한다.
--==>> ORACLE	****ORACLE


--○ RPAD()
--> Byte 를 확보하여 오른쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "COL1"
     , RPAD('ORACLE', 10, '*') "COL2"
FROM DUAL;
--> ① 10Byte 공간을 확보한다.                  → 두 번째 파라미터 값에 의해...
--  ② 확보한 공간에 'ORACLE' 문자열을 담는다.  → 첫 번째 파라미터 값에 의해...
--  ③ 남아있는 Byte 공간을 오른쪽부터 세 번째 파라미터 값으로 채운다.
--  ④ 이렇게 구성된 최종 결과값을 반환한다.
--==>> ORACLE	ORACLE****


--○ LTRIM() --> 공백제거 시 많이 사용!
SELECT 'ORAORAORAORACLEORACLE' "COL1"
     , LTRIM('ORAORAORAORACLEORACLE', 'ORA') "COL2"
     , LTRIM('AAAAAAAAAORACLEORACLE', 'ORA') "COL3"
     , LTRIM('ORAORAoRAORACLEORACLE', 'ORA') "COL4"
     , LTRIM('ORAORA ORAORACLEORACLE', 'ORA') "COL5"
     , LTRIM('                ORACLE', ' ') "COL6"  -- 왼쪽 공백 제거
     , LTRIM('                ORACLE') "COL7"       -- 두 번째 파라미터 생략
FROM DUAL;
--==>>
/*
ORAORAORAORACLEORACLE
CLEORACLE
CLEORACLE
oRAORACLEORACLE	
ORAORACLEORACLE
ORACLE	
ORACLE
*/
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  왼쪽부터 연속적으로 등장하는 두 번째 파라미터 값에서 지정한 글자와
--  같은 글자가 등장할 경우 이를 제거하고 남은 결과값을 반환한다.
--  단, 완성형으로 처리되지 않는다.

SELECT LTRIM('김이신이김김이이신김김김이김이김박이김신', '김신이') "COL1"
FROM DUAL;
--==>> 박이김신


--○ RTRIM()
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  오른쪽부터 연속적으로 등장하는 두 번째 파라미터 값에서 지정한 글자와
--  같은 글자가 등장할 경우 이를 제거하고 남은 결과값을 반환한다.
--  단, 완성형으로 처리되지 않는다.


--○ TRANSLATE()
--> 1 : 1 로 바꿔준다.
SELECT TRANSLATE('MY ORACLE SERVER'
               , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
               , 'abcdefghijklmnopqrstuvwxyz')"COL1"
FROM DUAL;
--==> my oracle server


SELECT TRANSLATE('010-9322-9643'
               , '0123456789'
               , '공일이삼사오육칠팔구')"COL1"
FROM DUAL;
--==>> 공일공-구삼이이-구육사삼


--○ REPLACE()
SELECT REPLACE('MY ORACLE SERVER ORAHOME', 'ORA', '오라')"COL1"
FROM DUAL;
--==>> MY 오라CLE SERVER 오라HOME

--------------------------------------------------------------------------------

--○ ROUND() 반올림을 처리해 주는 함수
SELECT 48.678 "COL1"            -- 48.678
     , ROUND(48.678, 2)"COL2"   -- 48.68    -- 소수점 이하 둘째자리까지 표현 → 두 번째 파라미터에 의해서
     , ROUND(48.674, 2)"COL3"   -- 48.67
     , ROUND(48.674, 1)"COL4"   -- 48.7
     , ROUND(48.68, 0)"COL5"    -- 49
     , ROUND(48.68)"COL6"       -- 49       -- 두 번째 파라미터 값이 0일 경우 생략 가능     
     , ROUND(48.68, -1)"COL7"   -- 50       -- 10의 자리까지 표현
     , ROUND(48.68, -2)"COL8"   -- 0        -- 100의 자리까지 표현
     , ROUND(48.68, -3)"COL9"   -- 0        -- 1000의 자리까지 표현
FROM DUAL;

--○ TRUNC() 절삭을 처리해 주는 함수
SELECT 48.678 "COL1"            -- 48.678
     , TRUNC(48.678, 2)"COL2"   -- 48.67    -- 소수점 이하 둘째자리까지 표현 → 두 번째 파라미터에 의해서
     , TRUNC(48.674, 2)"COL3"   -- 48.67
     , TRUNC(48.674, 1)"COL4"   -- 48.6
     , TRUNC(48.68, 0)"COL5"    -- 48
     , TRUNC(48.68)"COL6"       -- 48       -- 두 번째 파라미터 값이 0일 경우 생략 가능     
     , TRUNC(48.68, -1)"COL7"   -- 40       -- 10의 자리까지 표현
     , TRUNC(48.68, -2)"COL8"   -- 0        -- 100의 자리까지 표현
     , TRUNC(48.68, -3)"COL9"   -- 0        -- 1000의 자리까지 표현
FROM DUAL;


--○ MOD() 나머지를 반환하는 함수 → %
SELECT MOD(5, 2) "COL1"
FROM DUAL;
--> 5를 2로 나눈 나머지 결과값 반환
--==>> 1


--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5, 3)"COL1"
FROM DUAL;
--> 5의 3승을 결과값으로 반환
--==>> 125


--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2)"COL1"
FROM DUAL;
--> 루트 2에 대한 결과값 반환
--==>> 1.41421356237309504880168872420969807857


--○ LOG() 로그 함수 → 상용로그
SELECT LOG(10, 100)"COL1"
     , LOG(10, 20)"COL2"
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--○ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/
--> 각각 싸인, 코싸인, 탄젠트 결과값을 반환한다.

--○ 삼각함수의 역함수(범위 : -1 ~ 1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/


--○ SIGN() 서명, 부호, 특징
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다.
SELECT SIGN(5-2)"COL1"
     , SIGN(5-5)"COL2"
     , SIGN(5-7)"COL3"
FROM DUAL;
--==>> 1	0	-1
--> 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 종종 사용된다.


--○ ASCII(), CHR() → 서로 대응(상응)하는 함수
SELECT ASCII('A')"COL1"
     , CHR(65)"COL2"
FROM DUAL;
--==>> 65	A
-- 『ASCII()』 : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- 『CHR()』   : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.


--------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--※ 날짜 연산의 기본 단위는 일수(DAY)이다~!!! CHECK~!!!
SELECT SYSDATE "COL1"           -- 2023-10-20 15:38:26
     , SYSDATE + 1 "COL2"       -- 2023-10-21 15:38:26
     , SYSDATE - 2 "COL3"       -- 2023-10-18 15:38:26
     , SYSDATE + 30 "COL4"      -- 2023-11-19 15:38:26
FROM DUAL;

--○ 시간 단위 연산
SELECT SYSDATE "COL1"           -- 2023-10-20 15:41:57
     , SYSDATE + 1/24 "COL2"    -- 2023-10-20 16:41:57
     , SYSDATE - 2/24 "COL3"    -- 2023-10-20 13:41:57
FROM DUAL;


--○ 현재 시간과... 현재 시간 기준 1일 2시간 3분 4초 후를 조회한다.
/*
-------------------  -----------------------------
현재 시간            연산 후 시간
-------------------  -----------------------------
2023-10-20 15:41:57  2023-10-21 17:46:31
*/
SELECT SYSDATE "현재 시간"
     , SYSDATE +1+(2/24)+(3/(24*60))+(4/(24*60*60)) "연산 후 시간"
FROM DUAL;
--==>>
/*
2023-10-20 15:49:16	
2023-10-21 17:52:20
*/
-- 방법 1.
SELECT SYSDATE "현재시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "연산 후 시간"
FROM DUAL;
--==>> 
/*
2023-10-20 16:04:57	
2023-10-21 18:08:01
*/

-- 방법 2.
SELECT SYSDATE "현재시간"
     , SYSDATE + ((1*24*60*60) + (2*60*60) + 3*60 + 4) / (24*60*60) "연산 후 시간"
FROM DUAL;
--==>>
/*
2023-10-20 16:07:37	
2023-10-21 18:10:41
*/


--○ 날짜 - 날짜 → 일수
SELECT TO_DATE('2024-03-19', 'YYYY-MM-DD') - TO_DATE('2023-08-22', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 210


--○ 데이터 타입의 변환
SELECT TO_DATE('2023-10-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 2023-10-20 00:00:00

SELECT TO_DATE('2023-10-32', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01847: day of month must be between 1 and last day of month)

SELECT TO_DATE('2023-02-29', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01839: date not valid for month specified)

SELECT TO_DATE('2023-13-20', 'YYYY-MM-DD') "COL1"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01843: not a valid month)


--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.


--○ ADD_MONTHS() 개월 수를 더하거나 빼주는 함수
SELECT SYSDATE "COL1"
     , ADD_MONTHS(SYSDATE, 2) "COL2"
     , ADD_MONTHS(SYSDATE, 3) "COL3"
     , ADD_MONTHS(SYSDATE, -2) "COL4"
     , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>>
/*
2023-10-20 16:19:03	    → 현재
2023-12-20 16:19:03	    → 2개월 후
2024-01-20 16:19:03	    → 3개월 후
2023-08-20 16:19:03	    → 2개월 전
2023-07-20 16:19:03     → 3개월 전
*/


--○ MONTHS_BETWEEN() 
--> 첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환한다.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "COL1"
FROM DUAL;
--==>> 256.667163978494623655913978494623655914


--> 개월 수의 차이를 반환하는 함수
--  결과값의 부호가 『-』(음수)로 반환되었을 경우에는
--  첫 번째 인자값에 해당하는 날짜보다
--  두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.


--○ NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '월') "COL2"
FROM DUAL;
--==>> 2023-10-21 16:25:01	
--     2023-10-23 16:25:01


--※ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> 2023-10-21 16:28:12	
--     2023-10-23 16:28:12


--※ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ LAST_DAY()
--> 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT SYSDATE "COL1"                                       -- 2023-10-20
     , LAST_DAY(SYSDATE) "COL2"                             -- 2023-10-31
     , LAST_DAY(TO_DATE('2023-02-12', 'YYYY-MM-DD')) "COL3" -- 2023-02-28
     , LAST_DAY(TO_DATE('2020-02-12', 'YYYY-MM-DD')) "COL4" -- 2020-02-29
FROM DUAL;



--○ 오늘부로... 정환이가 군대에 다시 끌려(?)간다...
--   복무 기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.
SELECT ADD_MONTHS(SYSDATE, 22) "전역 일자"
FROM DUAL;
--==>> 2025-08-20

-- 2. 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면...
--    정환이가 몇 끼를 먹어야 집에 보내줄까...

--      복무기간 * 3
--      --------
--      (전역일자 - 현재일자)
--      (전역일자 - 현재일자) * 3

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "식사"
FROM DUAL;
--=>> 2010


--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

-- ○ 현재 날짜 및 시간으로부터...
--    수료일(2024-03-19 18:00:00) 까지 
--    남은 기간을... 다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
-------------------- --------------------- ------ ------- ----- -----
현재 시간            수료일                 일      시간    분    초
-------------------- --------------------- ------ ------- ----- -----
2023-10-20 17:09:10  2024-03-19 18:00:00   140       0     49     50 
-------------------- --------------------- ------ ------- ----- -----
*/
SELECT SYSDATE "현재시간"
     , TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE), 0) "일"
     , TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE 
        - TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE), 0)), 0) "시간"
     , TRUNC((TO_DATE('2023-10-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
        - TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE), 0)), 0)"분"
     , TRUNC((TO_DATE('2023-10-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) + (60*24), 0)  "초"
FROM DUAL;
--미완성

