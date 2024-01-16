SELECT USER
FROM DUAL;
--==>> SCOTT

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 현재 날짜 및 시간으로부터...
--   수료일(2024-03-19 18:00:00) 까지
--   남은 기간을 다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
-------------------- --------------------- ------- ------ ------ ---------
현재 시간              수료일                 일     시간    분    초
-------------------- --------------------- ------- ------ ----- -----------
2023-10-20 17:09:10   2024-03-19 18:00:00   140       0     49   50
-------------------- --------------------- ------- ------ ----- -----------
*/

-- 내가 푼 풀이인데 너무 길어~!~!~!!!
SELECT SYSDATE "현재 시간"
     , TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
     , TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - (SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE))) *24) "시간"
     , TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - ((SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)) 
       + TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - (SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE))) *24)/24)) * (24*60)) "분"
     , TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') 
       - ((SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)) 
       + (TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - (SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24: MI:SS') - SYSDATE))) *24)/24) 
       + (TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - ((SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)) 
       + TRUNC((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - (SYSDATE + TRUNC(TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE))) *24)/24)) * (24*60))/(24*60)))) * (24*60*60))"초"   
FROM DUAL;

-- 같이 한 풀이

-- 『1일 2시간 3분 4초』를 『초』로 환산하면
SELECT (1*24*60*60) + (2*60*60) + (3*60) + 4
FROM DUAL;
--==>> 93784


--『93784초』를 다시 『일, 시간, 분, 초』로 환산하면
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)  "일"
, MOD(TRUNC(TRUNC(93784/60)/60), 24) "시간"
, MOD(TRUNC(93784/60), 60) "분" 
, MOD(93784, 60) "초"
FROM DUAL;
--==>> 1	2	3	4


-- 수료일까지 남은 기간 확인 (단위 : 초)
SELECT 남은일수 * (24*60*60)
FROM DUAL;


SELECT (수료일 - 현재일) * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)
FROM DUAL;
--==>> 148.350648148148148148148148148148148148

SELECT (TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 12817170.99999999999999999999999999999999

SELECT SYSDATE "현재 시간"
     , TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC(TRUNC(TRUNC(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60)/24)  "일"
     , MOD(TRUNC(TRUNC(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60), 24) "시간"
     , MOD(TRUNC(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60), 60) "분" 
     , TRUNC(MOD(((TO_DATE('2024-03-19 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)), 60)) "초"
FROM DUAL;
--==>>
/*
-------------------- --------------------- ------- ------ ------ ---------
현재 시간              수료일                 일     시간    분    초
-------------------- --------------------- ------- ------ ----- -----------
2023-10-23 09:43:49   2024-03-19 18:00:00   148       8     16    21
-------------------- --------------------- ------- ------ ----- -----------
*/


--○ 각자 태어난 날짜 및 시각으로부터 현재까지
--   얼마만큼의 시간을 살고 있는지
--   다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
-------------------- --------------------- ------- ------ ------ ---------
현재 시간              생년월일                일     시간    분    초
-------------------- --------------------- ------- ------ ----- -----------
2023-10-23 09:43:49   1997-08-11 16:30:00   148       8     16    21
-------------------- --------------------- ------- ------ ----- -----------
*/

-- 초로 먼저 환산해보자!
SELECT (SYSDATE - TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)
FROM DUAL;

SELECT SYSDATE "현재 시간"
     , TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS') "생년월일" 
     , TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24)  "일"
     , MOD(TRUNC(TRUNC(((SYSDATE - TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60), 24) "시간"
     , MOD(TRUNC(((SYSDATE - TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60), 60) "분" 
     , TRUNC(MOD(((SYSDATE - TO_DATE('1997-08-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)), 60)) "초"
FROM DUAL;


--○ 날짜 관련 세셔 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 데이터를 대상으로 반올림, 절삭 등의 연산을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE "COL1"                   -- 2023-10-23   → 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "COL2"    -- 2024-01-01   → 연도까지 유효한 데이터 (상반기 / 하반기 기준)
     , ROUND(SYSDATE, 'MONTH') "COL3"   -- 2023-11-01   → 월까지 유효한 데이터 (15일 기준)
     , ROUND(SYSDATE, 'DD') "COL4"      -- 2023-10-23   → 일까지 유효한 데이터 (정오 기준)
     , ROUND(SYSDATE, 'DAY') "COL5"     -- 2023-10-22   → 일까지 유효한 데이터 (수요일 정오 기준)
FROM DUAL;

--○ 날짜 절삭
SELECT SYSDATE "COL1"                   -- 2023-10-23   → 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "COL2"    -- 2023-01-01   → 연도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "COL3"   -- 2023-10-01   → 월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "COL4"      -- 2023-10-23   → 일까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "COL5"     -- 2023-10-22   → 그 전 주에 해당하는 일요일
FROM DUAL;




--------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()   : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
-- TO_DATE()   : 문자 데이터를 날짜 타입으로 변환시켜주는 함수
-- TO_NUMBER() : 문자 데이터를 숫자 타입으로 변환시켜주는 함수

--○ 날짜형 → 문자형
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"    -- 2023-10-23
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"          -- 2023
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"          -- TWENTY TWENTY-THREE
     , TO_CHAR(SYSDATE, 'MM') "COL4"            -- 10
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"         -- 10월
     , TO_CHAR(SYSDATE, 'MON') "COL6"           -- 10월
     , TO_CHAR(SYSDATE, 'DD') "COL7"            -- 23
     , TO_CHAR(SYSDATE, 'MM-DD') "COL8"         -- 10-23   
     , TO_CHAR(SYSDATE, 'DAY') "COL9"           -- 월요일
     , TO_CHAR(SYSDATE, 'DY') "COL10"           -- 월
     , TO_CHAR(SYSDATE, 'HH24') "COL11"         -- 10
     , TO_CHAR(SYSDATE, 'HH') "COL12"           -- 10
     , TO_CHAR(SYSDATE, 'HH AM') "COL13"        -- 10 오전            -- 무조건 오전이 나오거나
     , TO_CHAR(SYSDATE, 'HH PM') "COL14"        -- 10 오후            -- 무조건 오후가 나오는 것이 아님! 현재 시간에 따라 오전 / 오후가 나옴
     , TO_CHAR(SYSDATE, 'MI') "COL15"           -- 31
     , TO_CHAR(SYSDATE, 'SS') "COL16"           -- 18
     , TO_CHAR(SYSDATE, 'SSSSS') "COL17"        -- 37971
     , TO_CHAR(SYSDATE, 'Q') "COL18"            -- 4
FROM DUAL;

SELECT 10 "COL1"        --        10       숫자는 오른쪽 정렬
     , '10' "COL2"      -- 10              문자는 왼쪽 정렬
FROM DUAL;

--※ 날짜나 통화 형식이 맞지 않을 경우
--   설정 값을 통해 세션을 설정할 수 있다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET MLS_CURRECNCY = '\';               -- ￦
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


-- ○ 슷자형 → 문자형
SELECT 7 "COL1"
     , '7' "COL2"
     , TO_CHAR(7) "COL3"
FROM DUAL;
--==>> 7	7	7
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!

SELECT '4' "COL1"
     , TO_NUMBER(4) "COL2"
     , 4 "COL3"
     , TO_CHAR('4') "COL4"
     , TO_CHAR('04') "COL5"
FROM DUAL;
--==>> 4	4	4	4	04
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!


--○ 현재 날짜에서 현재 년도(2023)를 숫자 형태로 조회(반환)
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>> 2023 (오른쪽 정렬로 결과가 나오니 숫자 형태임!)


--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2023 → 연도를 추출하여 문자 타입으로
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 10   → 월을 추출하여 문자 타입으로
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 23   → 일을 추출하여 문자 타입으로
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2023 → 연도를 추출하여 숫자 타입으로
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 10   → 월을 추출하여 숫자 타입으로
     , EXTRACT(DAY FROM SYSDATE) "COL6"     -- 23   → 일을 추출하여 숫자 타입으로
FROM DUAL;
--==>> 2023	10	23	2023	10	23
--> 년, 월, 일 이외의 다른 항목은 사용 불가~!!


--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000 "COL1"
     , TO_CHAR(60000, '99,999') "COL2"
     , TO_CHAR(60000, '$99,999') "COL3"
     , TO_CHAR(60000, 'L99,999') "COL4"         --> L : 언어에 맞는 통화를 반환,    ￦60,000(나라마다 통화 기호가 다르기 때문에 우선 공간을 확보해둔 것! 오른 쪽 정렬이 아닌 왼쪽 정렬이다!)
     , LTRIM(TO_CHAR(60000, 'L99,999')) "COL4"  --> 위에서 나온 공백 제거
FROM DUAL;
--==>> 60000	 60,000	 $60,000	        ￦60,000	￦60,000


--○ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE "현재시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1일 2시간 3분 4초 후"
FROM DUAL;
--==>> 2023-10-23 11:18:24	
--     2023-10-24 13:21:28


--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산 결과"
FROM DUAL;
--==>> 2023-10-23 11:22:25
--     2024-12-26 15:27:31





--------------------------------------------------------------------------------

--○ CASE 구문(조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2는 몰라요' END
FROM DUAL;
--==>> 5+2는 몰라요

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 WHEN 2 THEN '1+1=2' 
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 2+2 WHEN 2 THEN '2+2=2' 
                WHEN 3 THEN '2+2=3'
                WHEN 4 THEN '2+2=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 2+2=4

SELECT CASE 3+3 WHEN 2 THEN '3+3=2' 
                WHEN 3 THEN '3+3=3'
                WHEN 4 THEN '3+3=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 몰라

SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-1=3 THEN '6-1=3'
            WHEN 7+0=0 THEN '7+0=0'
            ELSE '몰라'
       END
FROM DUAL;

SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-1=3 THEN '6-1=3'
            WHEN 7+0=7 THEN '7+0=7'
            ELSE '몰라'
       END
FROM DUAL;
--==>> 7+0=7

--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2 몰라요') "확인"
FROM DUAL;
--==> 5-2=3

--○ CASE WHEN THEN ELSE END (조건문, 분기문) 활용

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5와2는 비교불가' 
       END "결과확인"
FROM DUAL;
--==>> 5>2

SELECT '5>2' "결과확인"
FROM DUAL;

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '윤수만세'
            WHEN 5>2 OR 2=3 THEN '하성만세'             -- 이것도 T이지만 앞에서 이미 T 값이 반환되었기 때문에 반환되지 않음
            ELSE '민지만세'
       END "결과확인"
FROM DUAL;
--==>> 윤수만세


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '현욱만세'
            WHEN 5<2 AND 2=3 THEN '나영만세'
            ELSE '혜성만세'
       END "결과확인"
FROM DUAL;
--==>> 현욱만세

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '현욱만세'
            WHEN 5<2 AND 2=3 THEN '나영만세'
            ELSE '혜성만세'
       END "결과확인"
FROM DUAL;
--==>> 혜성만세


--○ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	강혜성	9710171234567	2005-01-03	3000
1002	박가영	9511182234567	1999-11-23	4000
1003	박나영	9902082234567	2006-08-10	4000
1004	최혜인	9708112234567	2010-05-06	5000
1005	아이유	0502034234567	2015-10-19	1000
1006	이하이	0609304234567	2012-06-17	1000
1007	인순이	6510102234567	1999-08-22	2000
1008	선동열	6909101234567	1998-01-10	2000
1009	이이경	0505053234567	2011-05-06	1500
1010	선우용녀	6611112234567	2000-01-16	1300
1011	이윤수	9501061234567	2009-09-19	4000
1012	선우선	0606064234567	2011-11-11	2000
1013	남진	    6511111234567	1999-11-11	2000
1014	이주형	9904171234567	2009-11-11	2000
1015	남궁민	0202023234567	2010-10-10	2300
*/

--○ TBL_SAWON 테이블을 활용하여 다음과 같은 항목을 조회할 수 있도록 쿼리문을 구성한다.
--   『사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 정년퇴직일, 근무일수, 남은일수, 급여, 보너스』
--   단, 현재나이는 만나이 적용 이전 한국나이 계산법에 따라 연산을 수행한다.
--   또한, 정년 퇴직일은 해당 직원의 나이가 한국 나이로 60세가 되는 해의
--   그 직원의 입사 월, 일로 연산을 수행한다.
--   그리고, 보너스는 1000일 이상 2000일 미만 근무한 사원은 그 사원의 원래 급여 기준 30% 지급,
--   2000일 이상 근무한 사원은 그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.

-- EX) 1001 강혜성 9710171234567 남성 27 2005-01-03 2038-01-03 xxxx xxxxx 3000

-- 내가 풀었다!
SELECT SANO "사원번호"
     , SANAME "사원명"
     , JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3' THEN '남성' ELSE '여성' END "성별" 
     , TO_CHAR(SYSDATE, 'YYYY') 
       - (CASE WHEN TO_NUMBER(SUBSTR(JUBUN, 7,1)) =  3 OR TO_NUMBER(SUBSTR(JUBUN, 7,1)) = 4
               THEN 2000 + TO_NUMBER(SUBSTR(JUBUN, 1,2)) 
               ELSE 1900 + TO_NUMBER(SUBSTR(JUBUN, 1,2))
          END) +1 "나이"
     , HIREDATE "입사일"
     , TO_CHAR((CASE TO_NUMBER(SUBSTR(JUBUN, 1,1)) WHEN 0 THEN 2000 + TO_NUMBER(SUBSTR(JUBUN, 1,2)) 
                                ELSE 1900 + TO_NUMBER(SUBSTR(JUBUN, 1, 2)) 
        END) + 59) 
        || SUBSTR(HIREDATE, 5) "정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"
     , TRUNC(TO_DATE((CASE SUBSTR(JUBUN, 1,1) WHEN '0' THEN '20'||SUBSTR(JUBUN, 1,2) 
                                              ELSE '19'||SUBSTR(JUBUN, 1, 2) 
                      END) + 59 || SUBSTR(HIREDATE, 5)) - SYSDATE) "남은일수"
     , SAL "급여"
     , CASE WHEN (TRUNC(SYSDATE - HIREDATE)) >= 1000 AND (TRUNC(SYSDATE - HIREDATE)) < 2000
            THEN SAL*0.3
            WHEN (TRUNC(SYSDATE - HIREDATE)) >= 2000
            THEN SAL*0.5
            ELSE 0
       END "보너스"
FROM TBL_SAWON;


-- 같이 풀어봅시다요~!
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 정년퇴직일, 근무일수, 급여, 보너스

-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여 먼저 처리
SELECT SANO "사원명", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN 주민번호 7번째자리 1개가 '1' 또는 '3' THEN '남성'
            WHEN 주민번호 7번째자리 1개가 '2' 또는 '4' THEN '여성'
            ELSE '성별 확인 불가'
       END "성별"
FROM TBL_SAWON;

SELECT SANO "사원명", SANAME "사원명", JUBUN "주민번호"
     -- 성별
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
            ELSE '성별 확인 불가'
       END "성별"
     -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN 1900년대 생이라면 THEN 현재년도 - (주민번호앞두자리 + 1899)
            WHEN 2000년대 생이라면 THEN 현재년도 - (주민번호앞두자리 + 1999)
            ELSE '나이확인불가'
       END "현재나이"
FROM TBL_SAWON;

SELECT SANO "사원명", SANAME "사원명", JUBUN "주민번호"
     -- 성별
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
            ELSE '성별 확인 불가'
       END "성별"
     -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN 현재년도 - (주민번호앞두자리 + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN 현재년도 - (주민번호앞두자리 + 1999)
            ELSE '나이확인불가'
       END "현재나이"
FROM TBL_SAWON;

SELECT SANO "사원명", SANAME "사원명", JUBUN "주민번호"
     -- 성별
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
            ELSE '성별 확인 불가'
       END "성별"
     -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            --ELSE '나이확인불가'
            ELSE -1
       END "현재나이"
     -- 입사일
     , HIREDATE "입사일"
     , SAL "급여"
FROM TBL_SAWON;
--==>> 1차적으로 처리한 내용들
/*
1001	강혜성	9710171234567	남성	    27	2005-01-03	3000
1002	박가영	9511182234567	여성  	29	1999-11-23	4000
1003	박나영	9902082234567	여성	    25	2006-08-10	4000
1004	최혜인	9708112234567	여성	    27	2010-05-06	5000
1005	아이유	0502034234567	여성	    19	2015-10-19	1000
1006	이하이	0609304234567	여성  	18	2012-06-17	1000
1007	인순이	6510102234567	여성  	59	1999-08-22	2000
1008	선동열	6909101234567	남성  	55	1998-01-10	2000
1009	이이경	0505053234567	남성	    19	2011-05-06	1500
1010	선우용녀	6611112234567	여성	    58	2000-01-16	1300
1011	이윤수	9501061234567	남성  	29	2009-09-19	4000
1012	선우선	0606064234567	여성  	18	2011-11-11	2000
1013	남진	    6511111234567	남성  	59	1999-11-11	2000
1014	이주형	9904171234567	남성  	25	2009-11-11	2000
1015	남궁민	0202023234567	남성  	22	2010-10-10	2300
*/






SELECT  EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) "연봉", 연봉*2 "연봉두배"
FROM EMP;
--==>> 에러 발생
--     (ORA-00904: "연봉": invalid identifier)
--     파싱 순서에 의해 SELECT 문에서 부여한 별칭을 가지고 SELECT 문에서 연산하는 거 불가!


SELECT 사원번호, 사원명, 급여, 수당, 연봉, 연봉*2 "연봉두배"
FROM
(
    SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
    FROM EMP
);
-->> 인라인 뷰(서브쿼리의 일종)
--   조회한 테이블을 다시 FROM 에 넣어서
--   조회한 테이블 내에서 데이터를 뽑겠다! 라고 하면 별칭으로 SELECT 문 작성해도 오류 발생하지 않고 데이터 추출 가능!

--○ 뷰 생성
CREATE VIEW VIEW_EMP
AS
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
FROM EMP;
--==>> 에러 발생
--     (ORA-01031: insufficient privileges)

--○ SYS로 접속하여 SCOTT 계정에 CREATE VIEW 권한을 부여한 후 다시 실행
CREATE VIEW VIEW_EMP
AS
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
FROM EMP;
--==>> View VIEW_EMP이(가) 생성되었습니다.

SELECT *
FROM VIEW_EMP;


CREATE OR REPLACE VIEW VIEW_EMP                 -- OR REPLACE : 만약 VIEW_EMP라는 이름을 가진 VIEW가 존재한다면 덮어쓰기 해줘~! VIEW에서만 사용할 수 있는 구문!!
AS
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "수당", SAL*12+NVL(COMM,0) "연봉"
FROM EMP;
--==>> View VIEW_EMP이(가) 생성되었습니다.

SELECT *
FROM VIEW_EMP;

SELECT 사원번호, 사원명, 연봉
FROM VIEW_EMP;




-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 정년퇴직일, 근무일수, 급여, 보너스

SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    -- 정년퇴직일
    -- 정년퇴직년도 → 해당 직원의 나이가 한국나이로 60세가 되는 해
    -- 현재 나이가 57세라면 3년 후가 정년퇴직        2023 → 2026
    -- 현재 나이가 28세라면 32년 후가 정년퇴직       2023 → 2055
    -- ADD_MONTHS(SYSDATE, 남은년수*12)
    --                     --------
    --                      60 - 현재나이
    -- ADD_MONTHS(SYSDATE, (60-현재나이) * 12) → 특정 날짜
    -- TO_CHAR('특정날짜', 'YYYY')             → 정년퇴직 년도만 추출
    -- TO_CHAR('입사일', 'MM-DD')              → 입사월일만 추출
    -- TO_CHAR('특정날짜', 'YYYY') || '-' || TO_CHAR('입사일', 'MM-DD') → 정년퇴직일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    -- 근무일수
    -- 근무일수 = 현재일 - 입사일
     , TRUNC(SYSDATE - T.입사일) "근무일수"
    -- 남은일수
    -- 남은일수 = 정년퇴직일 - 현재일
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    -- 급여
     , T.급여
    -- 보너스
    -- 근무일수가 1000일 이상 2000일 미만 → 급여의 30%
    -- 근무일수가 2000일 이상             → 급여의 50%
    -- 근무일수가 1000일 미만 (나머지)    → 0
    ---------------------------------------------------
    -- 근무일수가 1000일 이상 2000일 미만 → SAL * 0.3
    -- 근무일수가 2000일 이상             → SAL * 0.5
    -- 근무일수가 1000일 미만 (나머지)    → 0
    ---------------------------------------------------
    -- 근무일수가 2000일 이상             → SAL * 0.5
    -- 근무일수가 1000일 이상             → SAL * 0.3
    -- 근무일수가 1000일 미만 (나머지)    → 0
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3
            ELSE 0 
       END "보너스"
    
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
                ELSE '성별 확인 불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;         -- FROM 내에 있는 내용을 T라는 테이블로 보겠다



-- 주석 제거한 최종 코드
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3
            ELSE 0 
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
                ELSE '성별 확인 불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;

--==>>
/*
1001	강혜성	9710171234567	남성	27	2005-01-03	2056-01-03	6867	11759	3000	1500
1002	박가영	9511182234567	여성	29	1999-11-23	2054-11-23	8735	11353	4000	2000
1003	박나영	9902082234567	여성	25	2006-08-10	2058-08-10	6283	12709	4000	2000
1004	최혜인	9708112234567	여성	27	2010-05-06	2056-05-06	4918	11883	5000	2500
1005	아이유	0502034234567	여성	19	2015-10-19	2064-10-19	2926	14971	1000	 500
1006	이하이	0609304234567	여성	18	2012-06-17	2065-06-17	4145	15212	1000	 500
1007	인순이	6510102234567	여성	59	1999-08-22	2024-08-22	8828	  303	2000	1000
1008	선동열	6909101234567	남성	55	1998-01-10	2028-01-10	9417	 1539	2000	1000
1009	이이경	0505053234567	남성	19	2011-05-06	2064-05-06	4553	14805	1500	 750
1010	선우용녀	6611112234567	여성	58	2000-01-16	2025-01-16	8681	  450	1300	 650
1011	이윤수	9501061234567	남성	29	2009-09-19	2054-09-19	5147	11288	4000	2000
1012	선우선	0606064234567	여성	18	2011-11-11	2065-11-11	4364	15359	2000	1000
1013	남진	    6511111234567	남성	59	1999-11-11	2024-11-11	8747	  384	2000	1000
1014	이주형	9904171234567	남성	25	2009-11-11	2058-11-11	5094	12802	2000	1000
1015	남궁민	0202023234567	남성	22	2010-10-10	2061-10-10	4761	13866	2300	1150 
*/


-- 위에서 처리한 내용을 기반으로
-- 특정 근무일수의 사원을 확인해야 한다거나
-- 특정 보너스 금액을 받는 사원을 확인해야 할 경우가 발생할 수 있다.
-- (즉, 추가적인 조회 조건이 발생하거나, 업무가 파생되는 경우)
-- 이와 같은 경우는 해당 쿼리문을 다시 구성해야 하는 번거로움을 줄일 수 있도록
-- 뷰(VIEW)를 만들어 저장해 둘 수 있다.

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이) * 12), 'YYYY') 
        || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3
            ELSE 0 
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
                ELSE '성별 확인 불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON이(가) 생성되었습니다.

SELECT *
FROM VIEW_SAWON;
--==>>
/*
1001	강혜성	9710171234567	남성	27	2005-01-03	2056-01-03	6867	11759	3000	1500
1002	박가영	9511182234567	여성	29	1999-11-23	2054-11-23	8735	11353	4000	2000
1003	박나영	9902082234567	여성	25	2006-08-10	2058-08-10	6283	12709	4000	2000
1004	최혜인	9708112234567	여성	27	2010-05-06	2056-05-06	4918	11883	5000	2500
1005	아이유	0502034234567	여성	19	2015-10-19	2064-10-19	2926	14971	1000	500
1006	이하이	0609304234567	여성	18	2012-06-17	2065-06-17	4145	15212	1000	500
1007	인순이	6510102234567	여성	59	1999-08-22	2024-08-22	8828	  303	2000	1000
1008	선동열	6909101234567	남성	55	1998-01-10	2028-01-10	9417	 1539	2000	1000
1009	이이경	0505053234567	남성	19	2011-05-06	2064-05-06	4553	14805	1500	750
1010	선우용녀	6611112234567	여성	58	2000-01-16	2025-01-16	8681	  450	1300	650
1011	이윤수	9501061234567	남성	29	2009-09-19	2054-09-19	5147	11288	4000	2000
1012	선우선	0606064234567	여성	18	2011-11-11	2065-11-11	4364	15359	2000	1000
1013	남진  	6511111234567	남성	59	1999-11-11	2024-11-11	8747	  384	2000	1000
1014	이주형	9904171234567	남성	25	2009-11-11	2058-11-11	5094	12802	2000	1000
1015	남궁민	0202023234567	남성	22	2010-10-10	2061-10-10	4761	13866	2300	1150
*/


SELECT *
FROM VIEW_SAWON
WHERE 근무일수 >= 5000;
--==>>
/*
1001	강혜성	9710171234567	남성	27	2005-01-03	2056-01-03	6867	11759	3000	1500
1002	박가영	9511182234567	여성	29	1999-11-23	2054-11-23	8735	11353	4000	2000
1003	박나영	9902082234567	여성	25	2006-08-10	2058-08-10	6283	12709	4000	2000
1007	인순이	6510102234567	여성	59	1999-08-22	2024-08-22	8828	  303	2000	1000
1008	선동열	6909101234567	남성	55	1998-01-10	2028-01-10	9417	 1539	2000	1000
1010	선우용녀	6611112234567	여성	58	2000-01-16	2025-01-16	8681	  450	1300	650
1011	이윤수	9501061234567	남성	29	2009-09-19	2054-09-19	5147	11288	4000	2000
1013	남진	    6511111234567	남성	59	1999-11-11	2024-11-11	8747	  384	2000	1000
1014	이주형	9904171234567	남성	25	2009-11-11	2058-11-11	5094	12802	2000	1000
*/

SELECT *
FROM VIEW_SAWON
WHERE 보너스 >= 2000;
--==>>
/*
1002	박가영	9511182234567	여성	29	1999-11-23	2054-11-23	8735	11353	4000	2000
1003	박나영	9902082234567	여성	25	2006-08-10	2058-08-10	6283	12709	4000	2000
1004	최혜인	9708112234567	여성	27	2010-05-06	2056-05-06	4918	11883	5000	2500
1011	이윤수	9501061234567	남성	29	2009-09-19	2054-09-19	5147	11288	4000	2000
*/


--○ 서브쿼리를 활용하여
--   TBL_SAWON 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.
/*
----------------------------------------------
  사원명   성별   현재나이   급여   나이보너스
----------------------------------------------
*/

-- VIEW_SAWON 을 이용하는 것이 아님.
-- 나이보너스는 현재 나이가 40세 이상이면 급여의 70%
-- 30세 이상 40세 미만이면 급여의 50%
-- 20세 이상 30세 미만이면 급여의 30%로 한다.

-- 또한, 이렇게 완성된 조회 구문을 통해
-- VIEW_SAWON2 라는 이름의 뷰(VIEW)를 생성할 수 있도록 한다.

-- 내가 혼자 한 풀이!!
SELECT T.사원명, T.성별, T.현재나이, T.급여
     , CASE WHEN T.현재나이 >= 30 AND T.현재나이 < 40 THEN T.급여 * 0.5
            WHEN T.현재나이 >= 20 AND T.현재나이 < 30 THEN T.급여 * 0.3 
            ELSE 0
       END "나이보너스"  
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN,7,1) IN ('2', '4') THEN '여성'
                ELSE '성별 판별 불가'
           END "성별"
          -- 현재나이 = 현재 날짜 - 태어난 날짜 + 1
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2')
                THEN (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))
                WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')
                THEN (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
)T;

--==>>
/*
강혜성	남성	27	3000	900
박가영	여성	29	4000	1200
박나영	여성	25	4000	1200
최혜인	여성	27	5000	1500
아이유	여성	19	1000	0
이하이	여성	18	1000	0
인순이	여성	59	2000	0
선동열	남성	55	2000	0
이이경	남성	19	1500	0
선우용녀	여성	58	1300	0
이윤수	남성	29	4000	1200
선우선	여성	18	2000	0
남진	    남성	59	2000	0
이주형	남성	25	2000	600
남궁민	남성	22	2300	690
*/

CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.사원명, T.성별, T.현재나이, T.급여
     , CASE WHEN T.현재나이 >= 30 AND T.현재나이 < 40 THEN T.급여 * 0.5
            WHEN T.현재나이 >= 20 AND T.현재나이 < 30 THEN T.급여 * 0.3 
            ELSE 0
       END "나이보너스"  
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN,7,1) IN ('2', '4') THEN '여성'
                ELSE '성별 판별 불가'
           END "성별"
          -- 현재나이 = 현재 날짜 - 태어난 날짜 + 1
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1', '2')
                THEN (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))
                WHEN SUBSTR(JUBUN,7,1) IN ('3', '4')
                THEN (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
)T;

SELECT *
FROM VIEW_SAWON2;
