SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ FUNCTION(함수) ■■■--

-- 1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로
--    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
--    직접 스토어드 함수를 만들 수 있다. (→ 사용자 정의 함수)
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나
--    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] FUNCTION 함수명
[( 매개변수명1 자료형
, 매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문;
    ...
    RETURN (값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;
*/

--※ 사용자 정의 함수(스토어드 함수)는
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,
--   FUNCTION 은 반드시 단일 값만 반환한다.


--○ TBL_INSA 테이블 전용 성별 확인 함수 정의(생성)
--   --------------------
--   매개변수 구조(형태) → '771212-1022432' → 'YYMMDD-NNNNNNN'

-- 함수명 : FN_GENDER()
--                   ↑ 주민등록번호 → '771212-1022432'

CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- 매개변수   : 자릿수(길이) 지정 안함
RETURN VARCHAR2                                         -- 반환자료형 : 자릿수(길이) 지정 안함
IS
    -- 선언부 → 주요 변수 선언(및 초기화)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- 실행부 → 연산 및 처리(그리고 결과값 반환)
    IF ( SUBSTR(V_SSN, 8, 1) IN ('1', '3') )
        THEN V_RESULT := '남자';
    ELSIF ( SUBSTR(V_SSN, 8, 1) IN ('2', '4') )
        THEN V_RESULT := '여자';
    ELSE 
        V_RESULT := '성별확인불가';
    END IF;
    
    -- 결과값 반환       CHECK~!!!
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.


--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨받아 → (A, B)
--   A의 B승의 값을 반환하는 사용자 정의 함수를 작성한다.
--   단, 기존의 오라클 내장 함수를 이용하지 않고, 반복문을 활용하여 작성한다.
-- 함수명 : FN_POW()
/*
사용 예)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000
*/
-- 내가 풀이한 내용
CREATE OR REPLACE FUNCTION FN_POW( A   NUMBER, B   NUMBER )
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;      
    I           NUMBER := 1;      
BEGIN
    WHILE I <= B LOOP
        V_RESULT := V_RESULT * A;
        I := I + 1;
    END LOOP;
    
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용
CREATE OR REPLACE FUNCTION FN_POW( A   NUMBER, B   NUMBER )
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;        -- 반환 결과값 변수 → 1로 초기화~!!!   CHECK~!!!
    V_NUM       NUMBER;             -- 루프 변수
BEGIN
    -- 반복문 구성
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;   -- V_RESULT *= A;
    END LOOP;
    
    -- 최종 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 『(기본급*12)+수당』 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급+수당)
-- 내가 풀이한 내용
CREATE OR REPLACE FUNCTION FN_PAY(V_BASICPAY    NUMBER, V_SUDANG    NUMBER)
RETURN NUMBER
IS
    V_PAY   NUMBER;
BEGIN
    V_PAY := (V_BASICPAY*12)+V_SUDANG;
    
    RETURN V_PAY;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용
--> TBL_INSA 테이블에서 현재 기점으로는 BASICPAY와 SUDANG 값 중 NULL인 값이 
--  없지만, 함수를 만들 때는 NULL도 고려하여 구문을 작성해야함!
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY    NUMBER, VSUDANG    NUMBER)
RETURN NUMBER
IS
    -- 주요 변수 선언
    VRESULT   NUMBER;
BEGIN
    -- 연산 및 처리
    VRESULT := (NVL(VBASICPAY, 0)*12)+NVL(VSUDANG, 0);
    
    -- 최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블에서 
--   입사일을 기준으로 현재까지의 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)
-- 내가 풀이한 내용
-- 1.
CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE   DATE)
RETURN NUMBER
IS
    V_RESULT  NUMBER;

BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 1);
    
    RETURN V_RESULT;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.

-- 2.
CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE   DATE)
RETURN VARCHAR2
IS
    V_RESULT  VARCHAR2(50);

BEGIN
    V_RESULT := TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 0)) || '년'
                || TO_CHAR(TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 1)*12)) || '개월';
    
    RETURN V_RESULT;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용

-- 1.
SELECT MONTHS_BETWEEN(SYSDATE, IBSADATE) / 12
FROM TBL_INSA;

-- 2.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, IBSADATE) / 12) || '년' || 
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, IBSADATE), 12)) || '개월'
FROM TBL_INSA;

-- FN_WORKYEAR 함수 생성
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE   DATE)
RETURN VARCHAR2
IS
    VRESULT  VARCHAR2(50);

BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12) || '년' || 
                TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '개월';
                
    RETURN VRESULT;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------

--※ 참고

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- 실행하면 자동으로 COMMIT 된다.

-- COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- 정적 PL/SQL문 → DML문, TCL문만 사용 가능하다.
-- 동적 PL/SQL문 → DML문, DDL문, DCL문, TCL문 사용 가능하다.


--------------------------------------------------------------------------------

--■■■ PROCEDURE(프로시저) ■■■--

-- 1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 없무의 흐름을
--    미리 작성하여 데이터베이스 내에 저장해 두었다가
--    필요할 때 마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[(매개변수 IN 데이터타입
, 매개변수 OUT 데이터타입
, 매개변수 INOUT 데이터타입
)]
IS
    [-- 주요 변수 선언]
BEGIN
    -- 실행 구문;
    
    ...
    
    [EXCEPTION
        -- 예외 처리 구문;]
END;
*/

--※ FUNCTION 과 비교했을 때 『RETURN 반환자료형』 부분이 존재하지 않으며, 
--   『RETURN』문 자체도 존재하지 않고,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN(입력), OUT(출력), INOUT(입출력) 으로 구분된다.

-- 3. 실행(호출)
/*
EXEC[UTE] 프로시저명[(인수1, 인수2, ...)];
*/


--※ 프로시저 실습을 위한 테이블 생성은...
--   『231103_02_scott.sql』 파일 참조~!!!

--○ 프로시저 생성
-- 프로시저명 : PRC_STUDENT_INSERT(아이디, 패스워드, 이름, 전화, 주소)

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW 테이블에 데이터 입력 → INSERT
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력 → INSERT
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.


--※ 프로시저 실습을 위한 테이블 생성은...
--   『231103_02_scott.sql』 파일 참조~!!!

--○ 데이터 입력 시 특정 항목의 데이터만 입력하면
--   내부적으로 다른 추가항목에 대한 처리가 함께 이루어질 수 있도록 하는
--   프로시저를 작성한다.(생성한다.)
--   프로시저명 : PRC_SUNGJUK_INSERT()
/*
문제 인식)
현재 TBL_SUNGJUK 테이블은
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE             
(학번, 이름, 국어점수, 영어점수, 수학점수, 총점, 평균, 등급)
컬럼으로 구성되어 있다.
이 테이블을 대상으로 특정 항목(학번, 이름, 국어점수, 영어점수, 수학점수)만 입력하면
추가 항목(총점, 평균, 등급)은 알아서 처리될 수 있도록 프로시저를 구성하라는 것이다.

실행 예)
EXEC PRC_SUNGJUK_INSERT(1, '김다슬', 90, 80, 70);

→ 이와 같은 프로시저 호출로 처리된 결과

학번  이름  국어점수 영어점수 수학점수  총점  평균  등급
 1   김다슬       90       80       70   240    80     B
*/
-- 내가 풀이한 내용
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN 
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT,0);
    V_AVG := V_TOT/3;
    
    IF V_AVG >= 90
        THEN V_GRADE := 'A';
    ELSIF V_AVG >= 80
        THEN V_GRADE := 'B';
    ELSIF V_AVG >= 70
        THEN V_GRADE := 'C';
    ELSIF V_AVG >= 60
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);

    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- 같이 풀이한 내용
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- 선언부
    -- INSERT 쿼리문을 수행하기 위해 필요한 추가 변수 구성
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    -- 선언부에 추가로 선언한 주요 변수들에 값을 담아내야 한다.
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT, 0);
    V_AVG := V_TOT/3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- 커밋
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.


--○ TBL_SUNGJUK 테이블에서 특정 학생의 점수
--   (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시
--   총점, 평균, 등급까지 함께 수정되는 프로시저를 생성한다.
--   프로시저명 : PRC_SUNGJUK_UPDATE()
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);

→ 이와 같은 프로시저 호출로 처리된 결과

학번  이름  국어점수 영어점수 수학점수  총점  평균  등급
 1   김다슬       90       80       70   240    80     B
 2   노은하       50       50       50   150    50     F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT         TBL_SUNGJUK.TOT%TYPE;
    V_AVG         TBL_SUNGJUK.AVG%TYPE;
    V_GRADE       TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT, 0);
    V_AVG := V_TOT/3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;

    
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.


--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는)
--   프로시저를 작성한다.
--   단, ID 와 PW 가 일치하는 경우에만 수정을 진행할 수 있도록 처리한다.
--   프로시저명 : PRC_STUDENTS_UPDATE()
/*
실행 예)
EXEC PRC_STUDENT_UPDATE('moon', 'java000', '010-9999-9999', '강원도 횡성');
-->> 데이터 수정 Ⅹ

EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '강원도 횡성');
-->> 데이터 수정 ○
*/
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS  
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND V_PW = (SELECT PW FROM TBL_IDPW WHERE V_ID = ID);
      
    
    COMMIT;
END;





