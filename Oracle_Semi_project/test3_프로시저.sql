-- 프로시저 
-- 관리자정보 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_ADMIN_PW
( V_ADMIN_NO IN ADMIN.ADMIN_NO%TYPE         -- 관리자 코드
, V_ADMIN_NAME IN ADMIN.ADMIN_NAME%TYPE     -- 관리자 이름
, V_ADMIN_ID IN ADMIN.ADMIN_ID%TYPE         -- 관리자 아이디
, V_ADMIN_SSN IN ADMIN.ADMIN_SSN%TYPE       -- 관리자 주민번호
)
IS
    V_ADMIN_PW  ADMIN.ADMIN_PW%TYPE;        -- 관리자 패스워드를 담을 변수 
BEGIN
    
--    IF (V_ADMIN_SSN IN )
--        THEN
--    END IF;
    
    -- 입력한 주민번호 뒷자리를 패스워드로 설정
    V_ADMIN_PW:=SUBSTR(V_ADMIN_SSN, 8);    
    
    -- INSERT
    INSERT INTO ADMIN(ADMIN_NO, ADMIN_NAME, ADMIN_ID, ADMIN_PW, ADMIN_SSN) 
    VALUES (V_ADMIN_NO, V_ADMIN_NAME, V_ADMIN_ID, V_ADMIN_PW, V_ADMIN_SSN);
    
    -- 커밋
    COMMIT;
    
END;

-- 관리자정보 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_ADMIN_UPDATE
( V_ADMIN_NO IN ADMIN.ADMIN_NO%TYPE         -- 관리자 코드
, V_ADMIN_NAME IN ADMIN.ADMIN_NAME%TYPE     -- 관리자 이름
, V_ADMIN_PW    IN ADMIN.ADMIN_PW%TYPE      -- 관리자 패스워드
)
IS
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;
    
    AD_COUNT    NUMBER;
BEGIN

    SELECT COUNT(ADMIN_NO) INTO AD_COUNT
    FROM ADMIN
    WHERE ADMIN_NO = V_ADMIN_NO;
    
    IF (AD_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE ADMIN
    SET ADMIN_NAME = V_ADMIN_NAME, ADMIN_PW = V_ADMIN_PW
    WHERE ADMIN_NO = V_ADMIN_NO;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '입력한 관리자코드는 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋
    COMMIT;
    
END;



-- 교수정보 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_PROF_PW
( V_PRF_NO IN PROF.PRF_NO%TYPE          -- 교수자 코드
, V_PRF_NAME IN PROF.PRF_NAME%TYPE      -- 교수자 이름
, V_PRF_ID IN PROF.PRF_ID%TYPE          -- 교수자 아이디
, V_PRF_SSN IN PROF.PRF_SSN%TYPE        -- 교수자 주민번호
, V_PRF_TEL IN PROF.PRF_SSN%TYPE        -- 교수자 전화번호
)
IS
    V_PRF_PW  PROF.PRF_PW%TYPE;         -- 교수자 패스워드를 담을 변수 선언
BEGIN

    -- 입력한 주민번호 뒷자리를 패스워드로 설정
    V_PRF_PW:=SUBSTR(V_PRF_SSN, 8);     
    
    -- INSERT
    INSERT INTO PROF(PRF_NO, PRF_NAME, PRF_ID, PRF_PW, PRF_SSN, PRF_TEL) 
    VALUES (V_PRF_NO, V_PRF_NAME, V_PRF_ID, V_PRF_PW, V_PRF_SSN, V_PRF_TEL);
    
    -- 커밋
    COMMIT;
    
END;

-- 교수정보 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_PROF_UPDATE
( V_PRF_NO IN PROF.PRF_NO%TYPE          -- 교수자 코드
, V_PRF_NAME IN PROF.PRF_NAME%TYPE      -- 교수자 이름
, V_PRF_PW IN PROF.PRF_PW%TYPE          -- 교수자 패스워드
, V_PRF_TEL IN PROF.PRF_SSN%TYPE        -- 교수자 전화번호
)
IS
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;
    
    PF_COUNT    NUMBER;
BEGIN

    SELECT COUNT(PRF_NO) INTO PF_COUNT
    FROM PROF
    WHERE PRF_NO = V_PRF_NO;
    
    IF (PF_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE PROF
    SET PRF_NAME = V_PRF_NAME, PRF_PW = V_PRF_PW, PRF_TEL = V_PRF_TEL
    WHERE PRF_NO = V_PRF_NO;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '입력한 교수코드는 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋
    --COMMIT;
    
END;


-- 학생정보 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_PW
( V_STD_NO      IN STUDENTS.STD_NO%TYPE         -- 학생 코드
, V_STD_NAME    IN STUDENTS.STD_NAME%TYPE       -- 학생 이름
, V_STD_ID      IN STUDENTS.STD_ID%TYPE         -- 학생 아이디
, V_STD_SSN     IN STUDENTS.STD_SSN%TYPE        -- 학생 주민번호
, V_STD_TEL     IN STUDENTS.STD_TEL%TYPE        -- 학생 전화번호
)
IS
    V_STD_PW  STUDENTS.STD_PW%TYPE;             -- 학생의 패스워드를 담을 변수 선언
BEGIN
    
    -- 입력한 주민번호 뒷자리를 패스워드로 설정
    V_STD_PW:=SUBSTR(V_STD_SSN, 8);     
    
    -- INSERT
    INSERT INTO STUDENTS(STD_NO, STD_NAME, STD_ID, STD_PW, STD_SSN, STD_TEL)
    VALUES (V_STD_NO, V_STD_NAME, V_STD_ID, V_STD_PW, V_STD_SSN, V_STD_TEL);
    
    -- 커밋
    COMMIT;
    
END;

-- 학생정보 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_STD_NO      IN STUDENTS.STD_NO%TYPE         -- 학생 코드
, V_STD_NAME    IN STUDENTS.STD_NAME%TYPE       -- 학생 이름
, V_STD_PW      IN STUDENTS.STD_PW%TYPE         -- 학생 패스워드  
, V_STD_TEL     IN STUDENTS.STD_TEL%TYPE        -- 학생 전화번호
)
IS
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;
    
    STD_COUNT    NUMBER;
BEGIN

    SELECT COUNT(STD_NO) INTO STD_COUNT
    FROM STUDENTS
    WHERE STD_NO = V_STD_NO;
    
    IF (STD_COUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE STUDENTS
    SET STD_NAME = V_STD_NAME, STD_PW = V_STD_PW, STD_TEL = V_STD_TEL
    WHERE STD_NO = V_STD_NO;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '입력한 학생코드는 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋
    --COMMIT;
    
END;

-- 개설과정 INSERT 프로시저 
--> 과정을 개설하는 프로시저
--  (이미 과정을 진행 중인 강의실이거나 교수자라면 그 기간에는 과정이 개설되지 않아야 한다.)         
CREATE OR REPLACE PROCEDURE PRC_CR_DETAIL_INSERT
( V_CR_NO       IN CR_DETAIL.CR_NO%TYPE         -- 개설과정 코드
, V_CR_BEGIN    IN CR_DETAIL.CR_BEGIN%TYPE      -- 개설과정 시작일
, V_CR_END      IN CR_DETAIL.CR_END%TYPE        -- 개설과정 종료일
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- 과정 코드
, V_ROOM_NO     IN CR_DETAIL.ROOM_NO%TYPE       -- 강의실 코드
, V_PRF_NO      IN CR_DETAIL.PRF_NO%TYPE        -- 교수 코드
)
IS
    -- 중복체크 변수
    JUNG_CHECK NUMBER := 0;     -- 강의 확인 할 변수     
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
     -- (같은 과정기간, 같은 강의실) 또는 (같은 과정기간, 같은 교수)인 경우 카운트
    SELECT COUNT(*) INTO JUNG_CHECK
    FROM CR_DETAIL
    WHERE (V_CR_BEGIN BETWEEN CR_BEGIN AND CR_END OR V_CR_END BETWEEN CR_BEGIN AND CR_END OR V_CR_BEGIN >= V_CR_END) 
    AND (ROOM_NO = V_ROOM_NO OR PRF_NO = V_PRF_NO);
    
    -- 카운트가 올라가면 에러 발생
    IF JUNG_CHECK > 0 THEN 
        RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- INSERT
    INSERT INTO CR_DETAIL(CR_NO, CR_BEGIN, CR_END, COURSE_NO, ROOM_NO, PRF_NO)
    VALUES(V_CR_NO, V_CR_BEGIN, V_CR_END, V_COURSE_NO, V_ROOM_NO, V_PRF_NO);
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20001, '중복된 정보를 확인해주세요!');
                 ROLLBACK;
                 
    -- 커밋
    COMMIT;           

END;



-- 개설과목 INSERT 프로시저 
--> 과목을 개설하는 프로시저
/*  (이미 개설된 과목 중 
        (1) 과목코드 O / 과목기간 O / 과정코드 O
        (2) 과목코드 X / 과목기간 O / 과정코드 O
        (3) 과목코드 O / 과목기간 O / 과정코드 X
    위의 조건에 해당되면 개설되지 않아야 한다.)         
*/
CREATE OR REPLACE PROCEDURE PRC_SUB_DETAIL_INSERT
( V_SUB_NO       IN SUB_DETAIL.SUB_NO%TYPE      -- 과목개설코드
, V_SUB_BEGIN    IN SUB_DETAIL.SUB_BEGIN%TYPE   -- 과목시작일자
, V_SUB_END      IN SUB_DETAIL.SUB_END%TYPE     -- 과목종료일자
, V_SUBJECT_NO   IN SUBJECT.SUBJECT_NO%TYPE     -- 과목코드
, V_BOOK_NO      IN BOOK.BOOK_NO%TYPE           -- 교재코드
, V_CR_NO        IN CR_DETAIL.CR_NO%TYPE        -- 과정개설코드
)
IS
    -- 중복체크 변수
    SUB_CHECK NUMBER := 0;  
    SUB_CHECK1 NUMBER := 0;
    SUB_CHECK2 NUMBER := 0;
    CR_CHECK NUMBER := 0;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;   
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    USER_DEFINE_ERROR4   EXCEPTION;
BEGIN
    
    -- 과목코드가 같고, 과목기간이 같고, 과정코드가 같으면 카운트
    SELECT COUNT(*) INTO SUB_CHECK
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))
      AND CR_NO = V_CR_NO;      
    
    -- 과목코드가 다르며, 과목기간이 같고, 과정코드가 같으면 카운트
    SELECT COUNT(*) INTO SUB_CHECK1
    FROM SUB_DETAIL
    WHERE SUBJECT_NO != V_SUBJECT_NO
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))  
      AND CR_NO = V_CR_NO;  
    
    -- 과목코드가 같고, 과정코드가 같고, 과목기간이 다르면 카운트
    SELECT COUNT(*) INTO SUB_CHECK2
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO
      AND ((V_SUB_BEGIN <= SUB_BEGIN OR V_SUB_BEGIN <= SUB_END) OR (V_SUB_END <= SUB_BEGIN OR V_SUB_END <= SUB_END))  
      AND CR_NO = V_CR_NO;  
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (SUB_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (SUB_CHECK1 > 0)
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (SUB_CHECK2 > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (V_SUB_END <= V_SUB_BEGIN)
        THEN RAISE USER_DEFINE_ERROR3;
     ELSE
        -- 과정기간 내 과목기간이 포함되는지 카운트 확인
        SELECT COUNT(*) INTO CR_CHECK
        FROM CR_DETAIL
        WHERE CR_NO = V_CR_NO
          AND ((V_SUB_BEGIN BETWEEN CR_BEGIN AND CR_END) AND (V_SUB_END BETWEEN CR_BEGIN AND CR_END));
        
        -- 과정기간 내 과목기간이 포함된다면 (즉, 카운트가 올라간다면)
        IF CR_CHECK > 0
            THEN
            -- INSERT
            INSERT INTO SUB_DETAIL(SUB_NO, SUB_BEGIN, SUB_END, SUBJECT_NO, BOOK_NO, CR_NO)
            VALUES(V_SUB_NO, V_SUB_BEGIN, V_SUB_END, V_SUBJECT_NO, V_BOOK_NO, V_CR_NO);
            -- 과정기간 내 과목기간이 포함되지 않는다면 에러 발생
            ELSE
                RAISE USER_DEFINE_ERROR4;
        END IF;
    END IF;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '선택한 과정에 중복된 과목과 기간이 존재합니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20003, '선택한 과정에 중복된 기간이 존재합니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20004, '선택한 과정에 중복된 과목이 존재합니다.');
                 ROLLBACK; 
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20005, '과목종료일이 과목시작일보다 빠를 수 없습니다.');
                 ROLLBACK; 
         WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20006, '과목기간은 과정기간 내에 들어가야 합니다.');
                 ROLLBACK; 
    
    -- 커밋             
    COMMIT;
    
END;


-- 개설과정 UPDATE 프로시저   
CREATE OR REPLACE PROCEDURE PRC_CR_DETAIL_UPDATE
( V_CR_NO IN CR_DETAIL.CR_NO%TYPE               -- 과정개설코드
, V_CR_BEGIN IN CR_DETAIL.CR_BEGIN%TYPE         -- 과정시작일
, V_CR_END IN CR_DETAIL.CR_END%TYPE             -- 과정종료일
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- 과정코드
, V_ROOM_NO IN CR_DETAIL.ROOM_NO%TYPE           -- 강의실코드
, V_PRF_NO IN CR_DETAIL.PRF_NO%TYPE             -- 교수코드
)
IS
    -- 중복체크 변수 
    JUNG_CHECK      NUMBER := 0;
    DATE_JUNG_CHECK NUMBER := 0;
    CR_CHECK        NUMBER;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN
    -- 입력한 개설과정코드 존재여부 확인
    SELECT COUNT(CR_NO) INTO CR_CHECK
    FROM CR_DETAIL
    WHERE CR_NO = V_CR_NO;
    
    -- 입력한 개설과정코드가 존재하지 않는다면 에러발생
    IF (CR_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 해당 과정이 개설되지 않았는데 과목을 먼저 개설할 경우
    -- 해당 과정이 종료되었는데 과목이 종료되지 않은 경우
    SELECT COUNT(*)     INTO DATE_JUNG_CHECK
    FROM CR_DETAIL C, SUB_DETAIL S
    WHERE C.CR_NO = S.CR_NO
      AND S.CR_NO = V_CR_NO
      AND (V_CR_BEGIN<=(SELECT MIN(SUB_BEGIN)
                        FROM SUB_DETAIL
                        WHERE CR_NO = V_CR_NO)) 
      AND (V_CR_END>=(SELECT MAX(SUB_END)
                        FROM SUB_DETAIL
                        WHERE CR_NO = V_CR_NO));
    
    
    -- 과정코드가 다르고, 과목기간, 강의실, 교수자가 같은 경우 중복체크
    SELECT COUNT(*) INTO JUNG_CHECK
    FROM CR_DETAIL
    WHERE (V_CR_BEGIN BETWEEN CR_BEGIN AND CR_END OR V_CR_END BETWEEN CR_BEGIN AND CR_END)
    AND (ROOM_NO = V_ROOM_NO OR PRF_NO = V_PRF_NO)
    AND CR_NO != V_CR_NO;
    
    -- 과정코드가 다르고, 과목기간, 강의실, 교수자가 같은 경우 에러 발생
    IF (JUNG_CHECK > 0) THEN
        RAISE USER_DEFINE_ERROR;
    -- 해당 과정이 개설되지 않았는데 과목을 먼저 개설할 경우
    -- 해당 과정이 종료되었는데 과목이 종료되지 않은 경우 에러 발생
    ELSIF (DATE_JUNG_CHECK <= 0) THEN
        RAISE USER_DEFINE_ERROR1;
    END IF;
    
    -- UPDATE
    UPDATE CR_DETAIL
    SET CR_BEGIN=V_CR_BEGIN, CR_END=V_CR_END, COURSE_NO=V_COURSE_NO, ROOM_NO=V_ROOM_NO, PRF_NO=V_PRF_NO
    WHERE CR_NO = V_CR_NO;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '중복된 정보를 확인해주세요.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20008, '과정기간을 다시 확인해주세요.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20009, '입력한 개설과정코드가 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋
    COMMIT;
END;



-- 개설과목 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_SUB_DETAIL_UPDATE
( V_SUB_NO       IN SUB_DETAIL.SUB_NO%TYPE      -- 과목개설코드
, V_SUB_BEGIN    IN SUB_DETAIL.SUB_BEGIN%TYPE   -- 과목시작일
, V_SUB_END      IN SUB_DETAIL.SUB_END%TYPE     -- 과목종료일
, V_SUBJECT_NO   IN SUBJECT.SUBJECT_NO%TYPE     -- 과목코드
, V_BOOK_NO     IN BOOK.BOOK_NO%TYPE            -- 교재코드
, V_CR_NO      IN CR_DETAIL.CR_NO%TYPE          -- 과정개설코드
)
IS
    -- 중복체크 변수
    SUB_CHECK       NUMBER := 0;
    SUB_CHECK1      NUMBER := 0;
    SUB_CHECK2      NUMBER := 0;
    CR_CHECK        NUMBER := 0;
    DATE_JUNG_CHECK NUMBER := 0;
    SD_CHECK        NUMBER;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;   
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    USER_DEFINE_ERROR4   EXCEPTION;
BEGIN
    
    -- 입력한 개설과목코드 존재여부 확인
    SELECT COUNT(SUB_NO) INTO SD_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- 입력한 개설과목코드가 존재하지 않는다면 에러발생
    IF (SD_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;
    
    -- 해당 과정이 개설되지 않았는데 과목을 먼저 개설할 경우
    -- 해당 과정이 종료되었는데 과목이 종료되지 않은 경우
    SELECT COUNT(*)     INTO DATE_JUNG_CHECK
    FROM CR_DETAIL C, SUB_DETAIL S
    WHERE C.CR_NO = S.CR_NO
      AND S.CR_NO = V_CR_NO
      AND (V_SUB_BEGIN >= C.CR_BEGIN)
      AND (V_SUB_END <= C.CR_END);
    
    -- 과목코드가 같고, 과목기간이 같고, 과정코드가 같으면 카운트
    SELECT COUNT(*) INTO SUB_CHECK
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END)) 
      AND CR_NO = V_CR_NO    
      AND SUB_NO != V_SUB_NO;
    
    -- 과목코드가 다르고, 과목기간이 같고, 과정코드가 같으면 카운트
    SELECT COUNT(*) INTO SUB_CHECK1
    FROM SUB_DETAIL
    WHERE SUBJECT_NO != V_SUBJECT_NO 
      AND ((V_SUB_BEGIN BETWEEN SUB_BEGIN AND SUB_END) OR (V_SUB_END BETWEEN SUB_BEGIN AND SUB_END))    
      AND CR_NO = V_CR_NO    
      AND SUB_NO != V_SUB_NO;
      
    -- 과목코드가 같고, 과정코드가 같고, 과목기간이 다르면 카운트  
    SELECT COUNT(*) INTO SUB_CHECK2
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = V_SUBJECT_NO 
      AND ((V_SUB_BEGIN <= SUB_BEGIN OR V_SUB_BEGIN <= SUB_END) OR (V_SUB_END <= SUB_BEGIN OR V_SUB_END <= SUB_END))   
      AND CR_NO = V_CR_NO     
      AND SUB_NO != V_SUB_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (SUB_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (SUB_CHECK1 > 0)
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (SUB_CHECK2 > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF (DATE_JUNG_CHECK <= 0)
        THEN RAISE USER_DEFINE_ERROR3;
    ELSE
        -- 과정기간 내 과목기간이 포함되는지 카운트 확인
        SELECT COUNT(*) INTO CR_CHECK
        FROM CR_DETAIL
        WHERE CR_NO = V_CR_NO
          AND ((V_SUB_BEGIN BETWEEN CR_BEGIN AND CR_END) AND (V_SUB_END BETWEEN CR_BEGIN AND CR_END));
        -- 과정기간 내 과목기간이 포함된다면 (즉, 카운트가 올라간다면)
        IF CR_CHECK > 0
            THEN
                -- UPDATE
                UPDATE SUB_DETAIL
                SET SUB_BEGIN=V_SUB_BEGIN, SUB_END=V_SUB_END, SUBJECT_NO=V_SUBJECT_NO, BOOK_NO=V_BOOK_NO, CR_NO=V_CR_NO
                WHERE SUB_NO = V_SUB_NO;
            -- 과정기간 내 과목기간이 포함되지 않는다면 에러 발생
            ELSE
                RAISE USER_DEFINE_ERROR2;
        END IF;
    END IF;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '과목, 기간 확인 요망');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '기간 확인 요망');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '과목, 과정 확인 요망');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20008, '일자 확인 요망');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20009, '입력한 개설과목코드는 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋             
    COMMIT;
    
END;


-- 배점입력 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_SD_UPDATE
( V_SUB_NO          IN SUB_DETAIL.SUB_NO%TYPE           -- 과목개설코드
, V_ATTEND_POINT    IN SUB_DETAIL.ATTEND_POINT%TYPE     -- 출결 배점
, V_WRITE_POINT     IN SUB_DETAIL.WRITE_POINT%TYPE      -- 필기 배점
, V_PRACTICE_POINT  IN SUB_DETAIL.PRACTICE_POINT%TYPE   -- 실기 배점
)
IS
    -- 중복체크 변수
    SUBJECTNO_JUNGCHECK   NUMBER := 0;
    SCORE_JUNGCHECK     NUMBER := 0;
    SD_CHECK            NUMBER;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;
    USER_DEFINE_ERROR4 EXCEPTION;
    
BEGIN
    
    -- 입력한 개설과목코드 존재여부 확인
    SELECT COUNT(SUB_NO) INTO SD_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- 입력한 개설과목코드가 존재하지 않는다면 에러발생
    IF (SD_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;
    
    
    -- 배점을 입력할 과목 존재 여부 확인
    SELECT COUNT(SUB_NO) INTO SUBJECTNO_JUNGCHECK
    FROM SUB_DETAIL
    WHERE V_SUB_NO IN SUB_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (SUBJECTNO_JUNGCHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;   
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생   
    IF(V_ATTEND_POINT + V_WRITE_POINT + V_PRACTICE_POINT <>100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 배점을 입력할 과목의 성적처리가 끝난 경우
    SELECT COUNT(SCORE_NO) INTO SCORE_JUNGCHECK
    FROM SCORE
    WHERE SUB_NO = V_SUB_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (SCORE_JUNGCHECK > 0)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- UPDATE
    UPDATE SUB_DETAIL
    SET ATTEND_POINT = V_ATTEND_POINT, WRITE_POINT = V_WRITE_POINT, PRACTICE_POINT = V_PRACTICE_POINT
    WHERE SUB_NO = V_SUB_NO;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '배점을 다시 입력하세요.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20006, '개설되지 않는 과목입니다.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20007, '이미 성적처리가 완료된 과목입니다.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR4
            THEN RAISE_APPLICATION_ERROR(-20009, '입력한 개설과목코드는 존재하지 않습니다.');
                 ROLLBACK;
    -- 커밋      
    COMMIT;
END;


-- 수강신청 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_APPLY_INSERT
( V_APPLY_NO    IN APPLY.APPLY_NO%TYPE      -- 수강신청코드    
, V_CR_NO       IN CR_DETAIL.CR_NO%TYPE     -- 과정개설코드
, V_STD_NO      IN STUDENTS.STD_NO%TYPE     -- 학생코드
)
IS
    -- 중복체크 변수
    APPLY_CHECK NUMBER := 0;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;

BEGIN

    -- 한 학생은 한 과정만 수강신청을 할 수 있음!
    -- 이미 수강신청을 완료한 학생인 경우
    SELECT COUNT(*) INTO APPLY_CHECK
    FROM APPLY 
    WHERE STD_NO = V_STD_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (APPLY_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    ELSE
        -- INSERT
        INSERT INTO APPLY(APPLY_NO, CR_NO, STD_NO)
        VALUES(V_APPLY_NO, V_CR_NO, V_STD_NO);       
    END IF;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20005, '이미 수강신청이 완료된 학생입니다.');
                     ROLLBACK;
    -- 커밋                 
    COMMIT;
    
END;


-- 성적처리 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_SCORE_INSERT
( V_SCORE_NO    IN SCORE.SCORE_NO%TYPE      -- 성적처리코드
, V_ATTEND_SC   IN SCORE.ATTEND_SC%TYPE     -- 출결 점수
, V_WRITE_SC    IN SCORE.WRITE_SC%TYPE      -- 필기 점수
, V_PRACTICE_SC IN SCORE.PRACTICE_SC%TYPE   -- 실기 점수
, V_APPLY_NO    IN SCORE.APPLY_NO%TYPE      -- 수강신청코드
, V_SUB_NO      IN SCORE.SUB_NO%TYPE        -- 과목개설코드
)
IS

    -- 해당 과목에 따른 배점을 담아둘 변수
    SD_ATTEND_POINT     SUB_DETAIL.ATTEND_POINT%TYPE;
    SD_WRITE_POINT      SUB_DETAIL.WRITE_POINT%TYPE;
    SD_PRACTICE_POINT   SUB_DETAIL.PRACTICE_POINT%TYPE;
    
    -- 배점에 따른 성적점수를 담을 변수
    V_ATTEND_SC1    SCORE.ATTEND_SC%TYPE := 0;
    V_WRITE_SC1     SCORE.WRITE_SC%TYPE := 0;
    V_PRACTICE_SC1  SCORE.PRACTICE_SC%TYPE := 0;
    
   -- 중복체크 변수
    APPLYNO_JUNGCHECK NUMBER := 0;   
    V_DATE_CHECK    NUMBER;
    V_FAIL_CHECK    NUMBER := 0;        
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;

BEGIN
    
    -- 해당 과목의 성적처리 가능일자
    -- 과목종료일보다 성적처리가 먼저 수행되면 안됨
    SELECT COUNT(*)   INTO V_DATE_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO
      AND (SUB_END+8 < SYSDATE OR SUB_END > SYSDATE);
         --12/26   >=   11/16     12/26     12/26
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (V_DATE_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 성적처리할 과목코드의 배점
    SELECT ATTEND_POINT, WRITE_POINT, PRACTICE_POINT INTO SD_ATTEND_POINT, SD_WRITE_POINT, SD_PRACTICE_POINT            
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- 배점에 따른 성적처리
    V_ATTEND_SC1 := SD_ATTEND_POINT / 100 * V_ATTEND_SC;
    V_WRITE_SC1 := SD_WRITE_POINT / 100 * V_WRITE_SC;
    V_PRACTICE_SC1 := SD_PRACTICE_POINT / 100 * V_PRACTICE_SC;
    
    -- 같은 수강신청코드에서 이미 성적처리된 과목코드인 경우
    SELECT COUNT(*) INTO APPLYNO_JUNGCHECK
    FROM SCORE
    WHERE APPLY_NO = V_APPLY_NO
    AND SUB_NO = V_SUB_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (APPLYNO_JUNGCHECK >= 1)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
   
    -- 같은 수강신청코드에서 이미 중도탈락이 된 경우
    SELECT COUNT(*) INTO V_FAIL_CHECK
    FROM FAIL F JOIN APPLY A
    ON F.APPLY_NO = A.APPLY_NO
    WHERE A.APPLY_NO = V_APPLY_NO
    AND F.FAIL_NO IS NOT NULL;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (V_FAIL_CHECK >= 1)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- INSERT
    INSERT INTO SCORE(SCORE_NO, ATTEND_SC, WRITE_SC, PRACTICE_SC, APPLY_NO, SUB_NO)
    VALUES(V_SCORE_NO, V_ATTEND_SC1, V_WRITE_SC1, V_PRACTICE_SC1, V_APPLY_NO, V_SUB_NO);
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '이미 입력된 수강코드입니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20011, '점수를 입력 할 수 없는 날짜입니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20012, '중도탈락한 학생은 성적처리를 할 수 없습니다.');
                 ROLLBACK;
    -- 커밋
    --COMMIT;

END;


-- <교수> 성적 UPDATE 프로시저
CREATE OR REPLACE PROCEDURE PRC_SCORE_UPDATE
( V_SCORE_NO    IN SCORE.SCORE_NO%TYPE      -- 성적처리코드
, V_ATTEND_SC   IN SCORE.ATTEND_SC%TYPE     -- 출결 점수
, V_WRITE_SC    IN SCORE.WRITE_SC%TYPE      -- 필기 점수
, V_PRACTICE_SC IN SCORE.PRACTICE_SC%TYPE   -- 실기 점수
)
IS  
    V_SUB_NO    SUB_DETAIL.SUB_NO%TYPE;
     
    -- 배점을 담아둘 변수
    SD_ATTEND_POINT SUB_DETAIL.ATTEND_POINT%TYPE;
    SD_WRITE_POINT SUB_DETAIL.WRITE_POINT%TYPE;
    SD_PRACTICE_POINT SUB_DETAIL.PRACTICE_POINT%TYPE;

    -- 배점에 따른 성적점수를 담을 변수
    V_ATTEND_SC1    SCORE.ATTEND_SC%TYPE := 0;
    V_WRITE_SC1     SCORE.WRITE_SC%TYPE := 0;
    V_PRACTICE_SC1  SCORE.PRACTICE_SC%TYPE := 0;
    
    -- 중복체크 변수
    V_DATE_CHECK      NUMBER;
    SC_CHECK          NUMBER;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR  EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;

BEGIN
    
    -- 성적처리코드 존재여부 확인
    SELECT COUNT(SCORE_NO) INTO SC_CHECK
    FROM SCORE
    WHERE SCORE_NO = V_SCORE_NO;
    
    -- 입력한 성적처리코드가 존재하지 않으면 에러발생
    IF (SC_CHECK = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 해당 과목의 성적처리 가능일자
    -- 과목시작일보다 성적처리가 먼저 수행되면 안됨
    -- 과목종료일 +7일까지 성적처리 수행되어야 함
    SELECT COUNT(*)   INTO V_DATE_CHECK
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO
      AND SUB_BEGIN < SYSDATE
      OR SUB_END +7 < SYSDATE;
      
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (V_DATE_CHECK > 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
       
    
    -- 입력한 성적처리코드에 해당하는 과목개설코드 
    SELECT SUB_NO INTO V_SUB_NO
    FROM SCORE
    WHERE SCORE_NO = V_SCORE_NO;
    
    -- 성적처리할 과목코드의 배점
    SELECT ATTEND_POINT, WRITE_POINT, PRACTICE_POINT INTO SD_ATTEND_POINT, SD_WRITE_POINT, SD_PRACTICE_POINT            
    FROM SUB_DETAIL
    WHERE SUB_NO = V_SUB_NO;
    
    -- 배점에 따른 성적처리
    V_ATTEND_SC1 := SD_ATTEND_POINT / 100 * V_ATTEND_SC;
    V_WRITE_SC1 := SD_WRITE_POINT / 100 * V_WRITE_SC;
    V_PRACTICE_SC1 := SD_PRACTICE_POINT / 100 * V_PRACTICE_SC;
    
    -- UPDATE
    UPDATE SCORE
    SET ATTEND_SC = V_ATTEND_SC1, WRITE_SC = V_WRITE_SC1, PRACTICE_SC = V_PRACTICE_SC1
    WHERE SCORE_NO = V_SCORE_NO;   
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '점수를 입력 할 수 없는 날짜입니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20012, '입력한 성적처리코드는 존재하지 않습니다.');
                 ROLLBACK;
                 
    -- 커밋
    COMMIT;
    
END;

-- 중도탈락 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_FAIL_INSERT
( V_FAIL_NO     FAIL.FAIL_NO%TYPE       -- 중도탈락코드
, V_FAIL_DATE   FAIL.FAIL_DATE%TYPE     -- 중도탈락일자
, V_FR_NO       FAIL.FR_NO%TYPE         -- 중도탈락사유코드
, V_APPLY_NO    FAIL.APPLY_NO%TYPE      -- 수강신청코드
)
IS
    V_CR_BEGIN     CR_DETAIL.CR_BEGIN%TYPE;
    V_CR_END     CR_DETAIL.CR_END%TYPE;
    V_CR_NO         CR_DETAIL.CR_NO%TYPE;
    V_COUNT         NUMBER;
    
    -- 사용자 정의 예외처리 변수
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    
BEGIN

    -- 입력한 수강신청코드에 해당하는 과정개설코드
    SELECT CR_NO INTO V_CR_NO 
    FROM APPLY
    WHERE APPLY_NO = V_APPLY_NO;

    -- 과정개설코드에 해당하는 과정시작일,과정종료일
    SELECT CR_BEGIN, CR_END INTO V_CR_BEGIN, V_CR_END
    FROM CR_DETAIL
    WHERE CR_NO =  V_CR_NO;

    -- 입력한 수강신청코드의 중복체크
    SELECT COUNT(*)  INTO V_COUNT 
    FROM FAIL
    WHERE APPLY_NO = V_APPLY_NO;
    
    -- 위의 중복체크 사항이 카운트되면 에러 발생
    IF (V_FAIL_DATE < V_CR_BEGIN OR V_FAIL_DATE > V_CR_END) -- 중도탈락은 과정시작 전이나 이후에 처리될 수 없다.
        THEN RAISE USER_DEFINE_ERROR1;
    ELSIF (V_COUNT > 0)                                     -- 중도 중복은 불가능하다.
        THEN RAISE USER_DEFINE_ERROR2;
    ELSIF(SYSDATE < V_FAIL_DATE )                           -- 중도탈락을 INSERT 하는 기간은 SYSDATE를 초과할 수 없다.
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    -- INSERT
    INSERT INTO FAIL(FAIL_NO, FAIL_DATE, FR_NO, APPLY_NO)
    VALUES(V_FAIL_NO, V_FAIL_DATE, V_FR_NO, V_APPLY_NO);
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '과정기간 외에는 중도탈락 할 수 없습니다..');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '이미 중도탈락처리된 학생입니다.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20008, '중도탈락처리일자를 확인해주세요.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- 커밋
    COMMIT;
END;



