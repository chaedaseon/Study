-- 트리거
--교수(PROF) 데이터 삭제시
CREATE OR REPLACE TRIGGER TRG_PRF_DELETE_01
    BEFORE
    DELETE ON PROF                -- 교수 테이블에 트리거 생성
    FOR EACH ROW
DECLARE
    V_PRF_CHECK       PROF.PRF_NO%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT COUNT(*)     INTO V_PRF_CHECK
    FROM CR_DETAIL
    WHERE PRF_NO = :OLD.PRF_NO;
    
    IF (V_PRF_CHECK != 0)
        -- 강의중인 교수일 경우 삭제 X
        THEN RAISE USER_DEFINE_ERROR;
    ELSE
        DELETE    -- 과정개설T
        FROM CR_DETAIL
        WHERE PRF_NO = :OLD.PRF_NO;
    END IF;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '강의중인 교수입니다.');
END;



--과정개설(CR_DETAIL) 데이터 삭제 시
CREATE OR REPLACE TRIGGER TRG_CRD_DELETE_01
    BEFORE
    DELETE ON CR_DETAIL                -- 과정개설 테이블에 트리거 생성
    FOR EACH ROW
BEGIN
    DELETE     -- 과목개설T
    FROM SUB_DETAIL
    WHERE CR_NO = :OLD.CR_NO;
    
    DELETE     -- 수강신청T
    FROM APPLY
    WHERE CR_NO = :OLD.CR_NO;

END;



--과목개설(SUB_DETAIL) 데이터 삭제 시
CREATE OR REPLACE TRIGGER TRG_SBD_DELETE_01
    BEFORE
    DELETE ON SUB_DETAIL                -- 과목개설 테이블에 트리거 생성
    FOR EACH ROW
BEGIN
    
    DELETE     -- 성적처리 T
    FROM SCORE
    WHERE SUB_NO = :OLD.SUB_NO;

END;


--------------학생정보 삭제시-----------------
--학생 (STUDENTS) 데이터 삭제 시
CREATE OR REPLACE TRIGGER TRG_STU_DELETE_01
    BEFORE
    DELETE ON STUDENTS
    FOR EACH ROW
BEGIN
    DELETE      -- 수강신청T
    FROM APPLY
    WHERE STD_NO = :OLD.STD_NO;
END;



-- 수강신청(APPLY) 데이터 삭제 시
CREATE OR REPLACE TRIGGER TRG_APL_DELETE_01
    BEFORE
    DELETE ON APPLY
    FOR EACH ROW
BEGIN
    DELETE     -- 성적처리T
    FROM SCORE
    WHERE APPLY_NO = :OLD.APPLY_NO;
    
    DELETE     -- 중도탈락T
    FROM FAIL
    WHERE APPLY_NO = :OLD.APPLY_NO;
END;

--강의실(CLASSROOM) 데이터 삭제시
CREATE OR REPLACE TRIGGER TRG_CLR_DELETE_01
    BEFORE
    DELETE ON CLASSROOM
    FOR EACH ROW
BEGIN
    DELETE     -- 과정개설T
    FROM CR_DETAIL
    WHERE ROOM_NO = :OLD.ROOM_NO;
END;



--과정(COURSE) 데이터 삭제시
CREATE OR REPLACE TRIGGER TRG_COS_DELETE_01
    BEFORE
    DELETE ON COURSE
    FOR EACH ROW
BEGIN
    DELETE     -- 과정T
    FROM CR_DETAIL
    WHERE COURSE_NO = :OLD.COURSE_NO;
END;


--과목(SUBJECT) 데이터 삭제시
CREATE OR REPLACE TRIGGER TRG_SBJ_DELETE_01
    BEFORE
    DELETE ON SUBJECT
    FOR EACH ROW
BEGIN
    DELETE     -- 과정T
    FROM SUB_DETAIL
    WHERE SUBJECT_NO = :OLD.SUBJECT_NO;
END;

--중도탈락사유(FAIL_REASON) 데이터 삭제시
CREATE OR REPLACE TRIGGER TRG_FAR_DELETE_01
    BEFORE
    DELETE ON FAIL_REASON
    FOR EACH ROW
BEGIN 
    DELETE  
    FROM FAIL       -- 중도탈락 T
    WHERE FR_NO = :OLD.FR_NO;
END;

-- 교재(BOOK) 데이터 삭제 시
CREATE OR REPLACE TRIGGER TRG_BOK_DELETE_01
    BEFORE
    DELETE ON BOOK
    FOR EACH ROW
BEGIN
    DELETE
    FROM SUB_DETAIL     -- 과목개설T
    WHERE BOOK_NO = :OLD.BOOK_NO;

END;



--DROP TRIGGER TRG_PROF_DELETE;

-- 생성되어있는 트리거 조회 구문
SELECT TRIGGER_NAME
FROM USER_TRIGGERS;
