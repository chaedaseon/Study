SELECT USER
FROM DUAL;
--==>> HR



--○ %TYPE

-- 1. 특정 테이블에 포함되어 있는 컬럼의 데이터타입(자료형)을 참조하는 데이터타입

-- 2. 형식 및 구조
-- 변수명 테이블.컬럼명%TYPE [:=초기값];

SET SERVEROUTPUT ON;

-- HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장
DECLARE
    --V_NAME  VARCHAR2(20);
    V_NAME  EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
--==>>
/*
Alexander


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ EMPLOYEES 테이블을 대상으로 108번 사원(Nancy)의
--   SALARY 를 변수에 담아 출력하는 PL/SQL 구문을 작성한다.
DECLARE
    SAL EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT SALARY INTO SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 108;
    
    DBMS_OUTPUT.PUT_LINE(SAL);
END;
--==>> 
/*
12008


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ EMPLOYEES 테이블의 특정 레코드 항목 여러 개를 변수에 저장
--   103번 사원의 FIRST_NAME, PHONE_NUMBER, EMAIL 항목을 변수에 저장하여 출력
--   출력 형태 Alexander, 590.43.4567, AHUNOLD
DECLARE
    V_NAME    EMPLOYEES.FIRST_NAME%TYPE;
    V_PHONE   EMPLOYEES.PHONE_NUMBER%TYPE;
    V_EMAIL   EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL INTO V_NAME, V_PHONE, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ', ' || V_PHONE || ', ' || V_EMAIL);
END;
--==>> Alexander, 590.423.4567, AHUNOLD


--○ %ROWTYPE

-- 1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러 개의 컬럼)

-- 2. 형식 및 구조
-- 변수명 테이블명%ROWTYPE;
DECLARE
--    V_FIRST_NAME    EMPLOYEES.FIRST_NAME%TYPE;
--    V_PHONE_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
--    V_EMAIL         EMPLOYEES.EMAIL%TYPE;
    
    V_EMP   EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    --DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_PHONE_NUMBER || ', ' || V_EMAIL);
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME || ', ' || V_EMP.PHONE_NUMBER || ', ' || V_EMP.EMAIL);
END;
--==>>
/*
Alexander, 590.423.4567, AHUNOLD


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ EMPLOYEES 테이블의 전체 레코드 항목 여러 개를 변수에 저장
--   모든 사원의 FIRST_NAME, PHONE_NUMBER, EMAIL 항목을 변수에 저장하여 출력
DECLARE
    V_EMP   EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
           INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME || ', ' || V_EMP.PHONE_NUMBER || ', ' || V_EMP.EMAIL);
END;
--==>> 에러 발생
--     (ORA-01422: exact fetch returns more than requested number of rows)

--> 여러 개의 행(ROWS) 정보를 얻어와 담으려고 하면
--  단일 변수에 저장하는 것 자체가 불가능해진다.



