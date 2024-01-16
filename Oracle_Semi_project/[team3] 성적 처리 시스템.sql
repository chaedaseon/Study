--○ 제약조건 확인 뷰 생성
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "TEAM3"
    , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
    , UC.TABLE_NAME "TABLE_NAME"
    , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
    , UCC.COLUMN_NAME "COLUMN_NAME"
    , UC.SEARCH_CONDITION "SEARCH_CONDITION"
    , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK이(가) 생성되었습니다.

--------------------------------------------------------------------------------
-- 테이블
--○ 1. 관리자 테이블 생성
CREATE TABLE ADMIN
( ADMIN_NO      VARCHAR2(10)
, ADMIN_NAME    VARCHAR2(30) CONSTRAINT ADMIN_NAME_NN NOT NULL
, ADMIN_ID      VARCHAR2(30) CONSTRAINT ADMIN_ID_NN NOT NULL
, ADMIN_PW      VARCHAR2(20) CONSTRAINT ADMIN_PW_NN NOT NULL
, ADMIN_SSN     VARCHAR2(14) CONSTRAINT ADMIN_DATE_NN NOT NULL
, ADMIN_DATE    DATE DEFAULT SYSDATE
, CONSTRAINT ADMIN_NO_PK PRIMARY KEY (ADMIN_NO)
, CONSTRAINT ADMIN_ID_UK UNIQUE (ADMIN_ID)
, CONSTRAINT ADMIN_SSN_UK UNIQUE (ADMIN_SSN)
);


--○ 2. 교수 테이블 생성
CREATE TABLE PROF
( PRF_NO	VARCHAR2(10)	            
, PRF_NAME	VARCHAR2(30)	CONSTRAINT PRF_NAME_NN NOT NULL            
, PRF_ID	VARCHAR2(30)	CONSTRAINT PRF_ID_NN NOT NULL          
, PRF_PW	VARCHAR2(20)	CONSTRAINT PRF_PW_NN NOT NULL            
, PRF_SSN	VARCHAR2(14)	CONSTRAINT PRF_SSN_NN NOT NULL            
, PRF_TEL	VARCHAR2(20)	                    
, PRF_DATE	DATE	       	DEFAULT SYSDATE    
, CONSTRAINT PROF_NO_PK PRIMARY KEY(PRF_NO)
, CONSTRAINT PROF_ID_UK UNIQUE (PRF_ID)
, CONSTRAINT PROF_SSN_UK UNIQUE (PRF_SSN)
);

--○ 3. 학생 테이블 생성
CREATE TABLE STUDENTS
( STD_NO    VARCHAR2(10)                                        -- 학생코드
, STD_NAME  VARCHAR2(30) CONSTRAINT STUDENT_NAME_NN NOT NULL    -- 학생명
, STD_ID    VARCHAR2(30) CONSTRAINT STUDENT_ID_NN NOT NULL      -- 아이디
, STD_PW    VARCHAR2(20) CONSTRAINT STUDENT_PW_NN NOT NULL      -- 패스워드
, STD_SSN   VARCHAR2(14) CONSTRAINT STUDENT_SSN_NN NOT NULL     -- 주민번호
, STD_TEL   VARCHAR2(20)                                        -- 전화번호
, STD_DATE  DATE         DEFAULT SYSDATE                        -- 등록일자
, CONSTRAINT STUDENT_NO_PK PRIMARY KEY(STD_NO)
, CONSTRAINT STUDENT_ID_UK UNIQUE (STD_ID)
, CONSTRAINT STUDENT_SSN_UK UNIQUE (STD_SSN)
);

--○ 4. 강의실 테이블 생성
CREATE TABLE CLASSROOM
( ROOM_NO       VARCHAR2(10)    
, ROOM_NAME     VARCHAR2(30)    CONSTRAINT CLASSROOM_NAME_NN NOT NULL
, CONSTRAINT CLASSROOM_NO_PK PRIMARY KEY(ROOM_NO)
, CONSTRAINT CLASSROOM_NAME_UK UNIQUE(ROOM_NAME)
);


--○ 5. 교재 테이블 생성
CREATE TABLE BOOK
( BOOK_NO       VARCHAR2(10)
, BOOK_NAME     VARCHAR2(100)    CONSTRAINT BOOK_NAME_NN NOT NULL
, CONSTRAINT BOOK_NO_PK PRIMARY KEY(BOOK_NO)
, CONSTRAINT BOOK_NAME_UK UNIQUE(BOOK_NAME)
);


--○ 6. 과목 테이블 생성
CREATE TABLE SUBJECT
( SUBJECT_NO    VARCHAR2(10)
, SUBJECT_NAME  VARCHAR2(30)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_NO_PK PRIMARY KEY(SUBJECT_NO)
, CONSTRAINT SUBJECT_NAME_UK UNIQUE(SUBJECT_NAME)
);


--○ 7. 과정 테이블 생성
CREATE TABLE COURSE
( COURSE_NO    VARCHAR2(10)                                     -- 과정코드
, COURSE_NAME  VARCHAR2(100) CONSTRAINT COURSE_NAME_NN NOT NULL -- 과정명
, CONSTRAINT COURSE_NO_PK PRIMARY KEY(COURSE_NO)
, CONSTRAINT COURSE_NAME_UK UNIQUE(COURSE_NAME)
);

--○ 8. 과정개설 테이블 생성
CREATE TABLE CR_DETAIL
(CR_NO          VARCHAR2(10)   
,CR_BEGIN       DATE           
,CR_END         DATE          
,CR_DATE        DATE            DEFAULT SYSDATE 

,COURSE_NO      VARCHAR2(10)    
,ROOM_NO        VARCHAR2(10)    
,PRF_NO         VARCHAR2(10)    

,CONSTRAINT DETAIL_CR_NO_PK PRIMARY KEY(CR_NO) 
,CONSTRAINT DETAIL_COURSE_NO_FK FOREIGN KEY(COURSE_NO) 
             REFERENCES COURSE(COURSE_NO)
,CONSTRAINT DETAIL_ROOM_NO_FK FOREIGN KEY(ROOM_NO)
            REFERENCES CLASSROOM(ROOM_NO)
,CONSTRAINT DETAIL_PRF_NO_FK FOREIGN KEY(PRF_NO) 
            REFERENCES PROF(PRF_NO)
);

--○ 9. 과목개설 테이블 생성
CREATE TABLE SUB_DETAIL
( SUB_NO	        VARCHAR2(10)	
, SUB_BEGIN	        DATE	
, SUB_END	        DATE
, SUB_DATE	        DATE	        DEFAULT SYSDATE
, ATTEND_POINT	    NUMBER(3)	
, WRITE_POINT	    NUMBER(3)	
, PRACTICE_POINT	NUMBER(3)	
, SUBJECT_NO	    VARCHAR2(10)	
, BOOK_NO	        VARCHAR2(10)	
, CR_NO             VARCHAR2(10)
, CONSTRAINT SDET_SUB_NO_PK PRIMARY KEY(SUB_NO)
, CONSTRAINT SDET_SUBJECT_NO_FK FOREIGN KEY(SUBJECT_NO)
            REFERENCES SUBJECT(SUBJECT_NO)
, CONSTRAINT SDET_BOOK_NO_FK FOREIGN KEY(BOOK_NO)
            REFERENCES BOOK(BOOK_NO)
, CONSTRAINT SDET_CR_NO_FK FOREIGN KEY(CR_NO)
            REFERENCES CR_DETAIL(CR_NO)  
, CONSTRAINT SDET_ATTEND_POINT CHECK(ATTEND_POINT >= 0)
, CONSTRAINT SDET_WRITE_POINT CHECK(WRITE_POINT >= 0)
, CONSTRAINT SDET_PRACTICE_POINT CHECK(PRACTICE_POINT >= 0)
);

--○ 10. 수강신청 테이블 생성
CREATE TABLE APPLY
( APPLY_NO      VARCHAR2(10)
, APPLY_DATE    DATE DEFAULT SYSDATE
, CR_NO         VARCHAR2(10)
, STD_NO        VARCHAR2(10)
, CONSTRAINT APPLY_NO_PK PRIMARY KEY (APPLY_NO)

, CONSTRAINT APPLY_CR_NO_FK FOREIGN KEY(CR_NO)
             REFERENCES CR_DETAIL(CR_NO)
, CONSTRAINT APPLY_STD_NO_FK FOREIGN KEY(STD_NO)
             REFERENCES STUDENTS(STD_NO)
);

--○ 11. 성적처리 테이블 생성
CREATE TABLE SCORE
( SCORE_NO	    VARCHAR2(10)	                
, ATTEND_SC	    NUMBER(3)		    DEFAULT 0      
, WRITE_SC	    NUMBER(3)		    DEFAULT 0      
, PRACTICE_SC	NUMBER(3)		    DEFAULT 0      
, SCORE_DATE	DATE	    	    DEFAULT SYSDATE
, APPLY_NO	    VARCHAR2(10)	    CONSTRAINT APPLYNO_NN   NOT NULL
, SUB_NO        VARCHAR2(10)	    CONSTRAINT SUBNO_NN     NOT NULL
, CONSTRAINT SCORE_PK PRIMARY KEY(SCORE_NO)
, CONSTRAINT SCORE_APPLYNO_FK FOREIGN KEY(APPLY_NO)
            REFERENCES APPLY(APPLY_NO)
, CONSTRAINT SCORE_SUBNO_FK FOREIGN KEY(SUB_NO)
            REFERENCES SUB_DETAIL(SUB_NO)
, CONSTRAINT SCORE_ATTEND_SC CHECK(ATTEND_SC>=0 AND ATTEND_SC <= 100)
, CONSTRAINT SCORE_WRITE_SC CHECK(WRITE_SC>=0 AND WRITE_SC <= 100)
, CONSTRAINT SCORE_PRACTICE_SC CHECK(PRACTICE_SC>=0 AND PRACTICE_SC <= 100)
);

--○ 12. 중도탈락사유 테이블 생성
CREATE TABLE FAIL_REASON
( FR_NO	VARCHAR2(10)	
, FR	VARCHAR2(300)	CONSTRAINT FRS_FR_NN    NOT NULL
, CONSTRAINT FRS_FR_NO_PK PRIMARY KEY(FR_NO)
, CONSTRAINT FRS_FR_UK UNIQUE(FR)
);

--○ 13. 중도탈락 테이블 생성
CREATE TABLE FAIL
(FAIL_NO    VARCHAR2(10)                                
,FAIL_DATE  DATE            DEFAULT SYSDATE          
,FR_NO      VARCHAR2(10)                             
,APPLY_NO   VARCHAR2(10)                                 

,CONSTRAINT FAIL_FAIL_NO_PK PRIMARY KEY(FAIL_NO)       
,CONSTRAINT FAIL_FR_NO_FK FOREIGN KEY(FR_NO)            
            REFERENCES FAIL_REASON(FR_NO)
,CONSTRAINT FAIL_APPLY_NO_FK FOREIGN KEY(APPLY_NO)      
            REFERENCES APPLY(APPLY_NO)
);

SELECT *
FROM TAB;
--==>>
/*
ADMIN
APPLY
BOOK
CLASSROOM
COURSE
CR_DETAIL
FAIL
FAIL_REASON
PROF
SCORE
STUDENTS
SUBJECT
SUB_DETAIL
*/

-------------------------------------------------------------------------------- 테이블 생성 완료
-- 시퀀스 
--○ 관리자 시퀀스 생성
CREATE SEQUENCE SEQ_M
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 교수 시퀀스 생성
CREATE SEQUENCE SEQ_P
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 학생 시퀀스 생성
CREATE SEQUENCE SEQ_S
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 강의실 시퀀스 생성
CREATE SEQUENCE SEQ_CL
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 교재 시퀀스 생성
CREATE SEQUENCE SEQ_BK
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 과목 시퀀스 생성
CREATE SEQUENCE SEQ_SJ
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 과정 시퀀스 생성
CREATE SEQUENCE SEQ_CR
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 과정개설 시퀀스 생성
CREATE SEQUENCE SEQ_CD
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 과목개설 시퀀스 생성
CREATE SEQUENCE SEQ_SD
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 수강신청 시퀀스 생성
CREATE SEQUENCE SEQ_AP
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 성적처리 시퀀스 생성
CREATE SEQUENCE SEQ_SC
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 중도탈락사유 시퀀스 생성
CREATE SEQUENCE SEQ_FR
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

--○ 중도탈락 시퀀스 생성
CREATE SEQUENCE SEQ_FA
START WITH 1
INCREMENT BY 1
MAXVALUE 999
NOCACHE;

-------------------------------------------------------------------------------- 식별코드 시퀀스 생성 완료
-- 프로시저 
-- 관리자정보 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_ADMIN_PW
( V_ADMIN_NO    IN ADMIN.ADMIN_NO%TYPE      -- 관리자 코드
, V_ADMIN_NAME  IN ADMIN.ADMIN_NAME%TYPE    -- 관리자 이름
, V_ADMIN_ID    IN ADMIN.ADMIN_ID%TYPE      -- 관리자 아이디
, V_ADMIN_SSN   IN ADMIN.ADMIN_SSN%TYPE     -- 관리자 주민번호
)
IS
    V_ADMIN_PW  ADMIN.ADMIN_PW%TYPE;        -- 관리자 패스워드를 담을 변수 
BEGIN

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
( V_ADMIN_NO    IN ADMIN.ADMIN_NO%TYPE      -- 관리자 코드
, V_ADMIN_NAME  IN ADMIN.ADMIN_NAME%TYPE    -- 관리자 이름
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
( V_PRF_NO      IN PROF.PRF_NO%TYPE     -- 교수자 코드
, V_PRF_NAME    IN PROF.PRF_NAME%TYPE   -- 교수자 이름
, V_PRF_ID      IN PROF.PRF_ID%TYPE     -- 교수자 아이디
, V_PRF_SSN     IN PROF.PRF_SSN%TYPE    -- 교수자 주민번호
, V_PRF_TEL     IN PROF.PRF_SSN%TYPE    -- 교수자 전화번호
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
( V_PRF_NO      IN PROF.PRF_NO%TYPE          -- 교수자 코드
, V_PRF_NAME    IN PROF.PRF_NAME%TYPE        -- 교수자 이름
, V_PRF_PW      IN PROF.PRF_PW%TYPE          -- 교수자 패스워드
, V_PRF_TEL     IN PROF.PRF_SSN%TYPE         -- 교수자 전화번호
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
    COMMIT;
    
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
    COMMIT;
    
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
            THEN RAISE_APPLICATION_ERROR(-20001, '중복된 정보를 확인해주세요.');
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
( V_CR_NO       IN CR_DETAIL.CR_NO%TYPE         -- 과정개설코드
, V_CR_BEGIN    IN CR_DETAIL.CR_BEGIN%TYPE      -- 과정시작일
, V_CR_END      IN CR_DETAIL.CR_END%TYPE        -- 과정종료일
, V_COURSE_NO   IN CR_DETAIL.COURSE_NO%TYPE     -- 과정코드
, V_ROOM_NO     IN CR_DETAIL.ROOM_NO%TYPE       -- 강의실코드
, V_PRF_NO      IN CR_DETAIL.PRF_NO%TYPE        -- 교수코드
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
, V_BOOK_NO      IN BOOK.BOOK_NO%TYPE           -- 교재코드
, V_CR_NO        IN CR_DETAIL.CR_NO%TYPE        -- 과정개설코드
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
            THEN RAISE_APPLICATION_ERROR(-20005, '선택한 과정에 중복된 과목과 기간이 존재합니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '선택한 과정에 중복된 기간이 존재합니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '선택한 과정에 중복된 과목이 존재합니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20008, '과목기간은 과정기간 내에 들어가야 합니다.');
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
    
    -- 배점의 합이 100이 아니면 에러 발생   
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
            THEN RAISE_APPLICATION_ERROR(-20004, '배점을 다시 입력하세요.(배점은 총 100점 만점)');
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
    COMMIT;

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
      AND (SUB_BEGIN < SYSDATE OR SUB_END +8 < SYSDATE);
      
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


SELECT *
FROM USER_PROCEDURES;
--==>>
/*
PRC_ADMIN_PW
PRC_ADMIN_UPDATE
PRC_APPLY_INSERT
PRC_CR_DETAIL_INSERT
PRC_CR_DETAIL_UPDATE
PRC_FAIL_INSERT
PRC_PROF_PW
PRC_PROF_UPDATE
PRC_SCORE_INSERT
PRC_SCORE_UPDATE
PRC_SD_UPDATE
PRC_STUDENTS_PW
PRC_STUDENTS_UPDATE
PRC_SUB_DETAIL_INSERT
PRC_SUB_DETAIL_UPDATE
*/

-------------------------------------------------------------------------------- 프로시저 생성 완료
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
        -- 강의중인 교수일 경우 삭제X
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

-- 생성되어있는 트리거 조회 구문
SELECT TRIGGER_NAME
FROM USER_TRIGGERS;
--==>>
/*
TRG_BOK_DELETE_01 교재 삭제
TRG_FAR_DELETE_01 중도탈락 삭제
TRG_SBJ_DELETE_01 과목 삭제
TRG_COS_DELETE_01 과정 삭제
TRG_CLR_DELETE_01 강의실 삭제
TRG_APL_DELETE_01 수강신청 삭제
TRG_STU_DELETE_01 학생 삭제
TRG_CRD_DELETE_01 개설과정 삭제
TRG_PRF_DELETE_01 교수 삭제
TRG_SBD_DELETE_01 개설과목 삭제
*/
-------------------------------------------------------------------------------- 트리거 생성 완료
-- 뷰
-- 수강신청한 학생 정보 조회
CREATE OR REPLACE VIEW APPLIED_VIEW
AS
SELECT S.STD_NO "학생코드", S.STD_NAME "학생명", S.SUBJECT_NAME "과목명", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "과목기간"
     , A.APPLY_NO "수강코드", SD.SUB_NO "개설과목코드"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO;
            
-- 현재 날짜 기준으로 성적처리 가능한 학생 정보
CREATE OR REPLACE VIEW POSSIBLE_VIEW
AS
SELECT S.STD_NO "학생코드", S.STD_NAME "학생명", S.SUBJECT_NAME "과목명", SD.SUB_BEGIN ||' ~ '||SD.SUB_END "과목기간"
     , A.APPLY_NO "수강코드", SD.SUB_NO "개설과목코드"
FROM STUDENTS S JOIN APPLY A
  ON S.STD_NO = A.STD_NO
    JOIN CR_DETAIL CD
      ON CD.CR_NO = A.CR_NO
        JOIN SUB_DETAIL SD
          ON CD.CR_NO = SD.CR_NO
            JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
WHERE SD.SUB_END < SYSDATE AND  SYSDATE <= SD.SUB_END+7;


-- <관리자> 과목 정보 출력 뷰 생성 (VIEW_SUB_INFO) 
CREATE OR REPLACE VIEW VIEW_SUB_INFO
AS
SELECT C.COURSE_NAME "과정명", R.ROOM_NAME "강의실명", S.SUBJECT_NAME "과목명"
     , (TO_CHAR(SD.SUB_BEGIN) || ' ~ ' || TO_CHAR(SD.SUB_END)) "과목기간", B.BOOK_NAME "교재명"
     , P.PRF_NAME "교수자명"
FROM SUB_DETAIL SD, BOOK B, SUBJECT S, CR_DETAIL CD, CLASSROOM R, COURSE C, PROF P 
WHERE SD.BOOK_NO = B.BOOK_NO
  AND SD.SUBJECT_NO = S.SUBJECT_NO
  AND SD.CR_NO = CD.CR_NO
  AND CD.COURSE_NO = C.COURSE_NO
  AND CD.ROOM_NO = R.ROOM_NO
  AND CD.PRF_NO = P.PRF_NO;


-- <관리자> 과정 정보 출력 뷰 생성 (VIEW_CR_INFO)
CREATE OR REPLACE VIEW VIEW_CR_INFO
AS
SELECT C3.COURSE_NAME "과정명", C1.ROOM_NAME "강의실명", J.SUBJECT_NAME "과목명",TO_CHAR(S1.SUB_BEGIN) ||' ~ '||
      TO_CHAR(S1.SUB_END) "과목기간", B.BOOK_NAME "교재명", P.PRF_NAME "교수자명"
FROM CLASSROOM C1 JOIN CR_DETAIL C2 
ON C1.ROOM_NO = C2.ROOM_NO
    JOIN COURSE C3
      ON C2.COURSE_NO = C3.COURSE_NO
        JOIN SUB_DETAIL S1
          ON C2.CR_NO = S1.CR_NO
                JOIN SUBJECT J
                  ON J.SUBJECT_NO = S1.SUBJECT_NO
                        JOIN BOOK B
                          ON B.BOOK_NO = S1.BOOK_NO
                                JOIN PROF P
                                  ON P.PRF_NO = C2.PRF_NO;

-- <관리자> 교수자 정보 출력 뷰 생성 (VIEW_PROF_INFO)
CREATE OR REPLACE VIEW VIEW_PROF_INFO
AS
SELECT P.PRF_NAME "교수명", S.SUBJECT_NAME "과목명",  SD.SUB_BEGIN || ' ~ ' || SD.SUB_END "과목기간"
     , B.BOOK_NAME "교재명", C.ROOM_NAME "강의실"
     , CASE WHEN TRUNC(SYSDATE) < SD.SUB_BEGIN THEN '예정'
            WHEN TRUNC(SYSDATE) >= SD.SUB_BEGIN AND TRUNC(SYSDATE) <= SD.SUB_END THEN '진행중'
            WHEN TRUNC(SYSDATE) > SD.SUB_END THEN '완료'
            ELSE '확인불가'
       END "강의진행여부"
FROM PROF P LEFT JOIN CR_DETAIL CD
    ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN CLASSROOM C
        ON CD.ROOM_NO = C.ROOM_NO
            LEFT JOIN SUB_DETAIL SD
            ON CD.CR_NO = SD.CR_NO
                LEFT JOIN SUBJECT S
                ON SD.SUBJECT_NO = S.SUBJECT_NO
                    LEFT JOIN BOOK B
                    ON SD.BOOK_NO = B.BOOK_NO;

-- <관리자> 학생 정보 출력 뷰 생성 (VIEW_STUDENT_INFO)
CREATE OR REPLACE VIEW VIEW_STUDENT_INFO
AS
SELECT ST.STD_NAME "학생명", C.COURSE_NAME "과정명" , S.SUBJECT_NAME "과목명" ,(ATTEND_SC + WRITE_SC + PRACTICE_SC) "총점"
FROM STUDENTS ST LEFT JOIN APPLY A
  ON ST.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
      ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN SUB_DETAIL SD
          ON SD.SUB_NO =SC.SUB_NO
            LEFT JOIN SUBJECT S
              ON S.SUBJECT_NO = SD.SUBJECT_NO
               LEFT JOIN CR_DETAIL CD
                 ON CD.CR_NO = SD.CR_NO
                   LEFT JOIN COURSE C 
                    ON C.COURSE_NO = CD.COURSE_NO;

-- <교수측> 성적 정보 출력 뷰 생성 (VIEW_SCORE_INFO)
/*
CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS
SELECT P.PRF_NAME 교수명
     , SB.SUBJECT_NAME 과목명
     , TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) 과목기간
     , B.BOOK_NAME 교재명
     , S.STD_NAME 학생명
     , SC.ATTEND_SC  출결
     , SC.WRITE_SC   필기
     , SC.PRACTICE_SC    실기
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) 과목총점
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) 과목등수
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  중도탈락여부
FROM APPLY A LEFT JOIN STUDENTS S
ON S.STD_NO = A.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SC.SUB_NO = SD.SUB_NO
                LEFT JOIN CR_DETAIL CD
                ON SD.CR_NO = CD.CR_NO
                    LEFT JOIN PROF P
                    ON CD.PRF_NO = P.PRF_NO
                    LEFT JOIN SUBJECT SB
                    ON SD.SUBJECT_NO = SB.SUBJECT_NO
                        LEFT JOIN BOOK B
                        ON SD.BOOK_NO = B.BOOK_NO;
*/
CREATE OR REPLACE VIEW VIEW_SCOREPRF_INFO
AS
SELECT P.PRF_NAME 교수명, S.SUBJECT_NAME 과목명, TO_CHAR(SD.SUB_BEGIN) || ' ~ ' ||  TO_CHAR(SD.SUB_END) 과목기간, B.BOOK_NAME 교재명
FROM PROF P LEFT JOIN CR_DETAIL CD
ON P.PRF_NO = CD.PRF_NO
    LEFT JOIN COURSE C
    ON CD.COURSE_NO = C.COURSE_NO
        LEFT JOIN SUB_DETAIL SD
        ON CD.CR_NO = SD.CR_NO
            LEFT JOIN SUBJECT S
            ON SD.SUBJECT_NO = S.SUBJECT_NO
                LEFT JOIN BOOK B
                ON SD.BOOK_NO = B.BOOK_NO;

CREATE OR REPLACE VIEW VIEW_SCORE_INFO
AS               
SELECT SB.SUBJECT_NAME 과목명
     , S.STD_NAME 학생명
     , SC.ATTEND_SC  출결
     , SC.WRITE_SC   필기
     , SC.PRACTICE_SC    실기
     , (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) 과목총점
     , RANK() OVER(PARTITION BY SB.SUBJECT_NAME ORDER BY NVL(SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC, 0) DESC) 과목등수
     , CASE WHEN F.FAIL_NO IS NOT NULL THEN 'Y'
            WHEN F.FAIL_NO IS NULL THEN 'N'
            ELSE 'ERROR'
       END  중도탈락여부
FROM APPLY A LEFT JOIN STUDENTS S
ON A. STD_NO = S.STD_NO
    LEFT JOIN SCORE SC
    ON A.APPLY_NO = SC.APPLY_NO
        LEFT JOIN FAIL F
        ON A.APPLY_NO = F.APPLY_NO
            LEFT JOIN SUB_DETAIL SD
            ON SD.SUB_NO = SC.SUB_NO
                LEFT JOIN SUBJECT SB
                ON SD.SUBJECT_NO = SB.SUBJECT_NO;

-- <학생> 성적 정보 출력 뷰 생성 (VIEW_STUDENTSC_INFO) 
CREATE OR REPLACE VIEW VIEW_STUDENTSC_INFO
AS
SELECT   S.STD_NO "학생코드"
       , S.STD_NAME "학생이름"
       , C.COURSE_NAME "과정명"
       , SB.SUBJECT_NAME "과목명"
       , TO_CHAR(CBD.CR_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(CBD.CR_END,'YYYY-MM-DD') "과정기간"
       , TO_CHAR(SBD.SUB_BEGIN,'YYYY-MM-DD') || ' ~ ' || TO_CHAR(SBD.SUB_END,'YYYY-MM-DD') "해당과목교육기간"
       , B.BOOK_NAME "교재명"
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC) ELSE 0 END "출결" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.WRITE_SC) ELSE 0 END "필기" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.PRACTICE_SC) ELSE 0 END "실기" 
       , CASE WHEN (SBD.SUB_END < SYSDATE) THEN (SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) ELSE 0 END "총점"
--       , SC.ATTEND_SC "출결" 
--       , SC.WRITE_SC "필기"
--       , SC.PRACTICE_SC "실기"
--       , SC.ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC "총점"
     , RANK() OVER (PARTITION BY SUBJECT_NAME ORDER BY (SC. ATTEND_SC + SC.WRITE_SC + SC.PRACTICE_SC) DESC) "등수"
     , F.FAIL_DATE "중도탈락일자"
     , FR.FR "탈락사유"
FROM COURSE C JOIN CR_DETAIL CBD
    ON C.COURSE_NO = CBD.COURSE_NO
    JOIN SUB_DETAIL SBD 
    ON SBD.CR_NO = CBD.CR_NO
    JOIN SUBJECT SB
    ON SBD.SUBJECT_NO = SB.SUBJECT_NO
    JOIN BOOK B
    ON B.BOOK_NO = SBD.BOOK_NO
    JOIN SCORE SC
    ON SC.SUB_NO = SBD.SUB_NO
    JOIN APPLY A
    ON A.APPLY_NO = SC.APPLY_NO
    JOIN STUDENTS S
    ON S.STD_NO = A.STD_NO
    LEFT JOIN FAIL F
    ON A.APPLY_NO = F.APPLY_NO
    LEFT JOIN FAIL_REASON FR
    ON  F.FR_NO = FR.FR_NO; 
    
SELECT *
FROM TAB;
--==>>
/*
VIEW_CR_INFO
VIEW_PROF_INFO
VIEW_SCOREPRF_INFO
VIEW_SCORE_INFO
VIEW_STUDENTSC_INFO
VIEW_STUDENT_INFO
VIEW_SUB_INFO
*/
-------------------------------------------------------------------------------- 뷰 생성 완료
-- 데이터 입력
-- 1. 관리자 데이터
EXEC PRC_ADMIN_PW ('M'||LPAD(TO_CHAR(SEQ_M.NEXTVAL), 3, '0'), '채다선', 'CDS','961023-2222222');

-- 관리자 업데이트 데이터 
--EXEC PRC_ADMIN_UPDATE('M001', '채다선', '961023');

--2. 교수 데이터
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '오수경', 'OSK','941111-2222223', '010-1111-1111');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '박가영', 'PKY','951010-2222224', '010-2222-2222');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '김경태', 'KKT','991111-1111111', '010-3333-3333');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '박범구', 'PPK','981111-1111112', '010-4444-4444');
EXEC PRC_PROF_PW ('P'||LPAD(TO_CHAR(SEQ_P.NEXTVAL), 3, '0'), '김수환', 'KSH','951212-1111113', '010-5555-5555');

-- 교수 업데이트 데이터 
--EXEC PRC_PROF_UPDATE('P001', '오수경', '2222223', '010-1111-2222');


--3. 학생 데이터
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '홍길동', 'STUDENT_01', '771212-1022432', '01123564528');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이순신', 'STUDENT_02', '801007-1544236', '01047586532');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이순애', 'STUDENT_03', '770922-2312547', '01042311236');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김정훈', 'STUDENT_04', '790304-1788896', '01952364221');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '한석봉', 'STUDENT_05', '811112-1566789', '01852113542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이기자', 'STUDENT_06', '780505-2978541', '01032145357');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '장인철', 'STUDENT_07', '780506-1625148', '01123452525');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김영년', 'STUDENT_08', '821011-2362514', '01622224444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '나윤균', 'STUDENT_09', '810810-1552147', '01911112222');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '김종서', 'STUDENT_10', '751010-1122233', '01132145555');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '유관순', 'STUDENT_11', '801010-2987897', '01088884422');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '정한국', 'STUDENT_12', '760909-1333333', '01822224242');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '조미숙', 'STUDENT_13', '790102-2777777', '01966664444');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '황진이', 'STUDENT_14', '810707-2574812', '01032145467');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이현숙', 'STUDENT_15', '800606-2954687', '01625483365');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이상헌', 'STUDENT_16', '781010-1666678', '01045261234');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '엄용수', 'STUDENT_17', '820507-1452365', '01032542542');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '이성길', 'STUDENT_18', '801028-1849534', '01813333333');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '박문수', 'STUDENT_19', '780710-1985632', '01747474848');
EXEC PRC_STUDENTS_PW ('S'||LPAD(TO_CHAR(SEQ_S.NEXTVAL), 3, '0'), '유영희', 'STUDENT_20', '800304-2741258', '01195958585');

-- 학생 업데이트 데이터 
--EXEC PRC_STUDENTS_UPDATE('S020', '유영희', '2741258', '01095958585');

SELECT *
FROM STUDENTS;

--4. 강의실 데이터
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'F강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'C강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'G강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'H강의실');
INSERT INTO CLASSROOM(ROOM_NO, ROOM_NAME)
VALUES('CL'||LPAD(TO_CHAR(SEQ_CL.NEXTVAL), 3, '0'), 'A강의실');



--5. 교재 데이터
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '채쌤의 자바 프로그래밍 핵심');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '오라클로 배우는 데이터베이스 개론과 실습');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '자바의 정석');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), 'HTML + CSS + 자바스크립트 웹 표준의 정석');
INSERT INTO BOOK(BOOK_NO, BOOK_NAME)
VALUES('BK'||LPAD(TO_CHAR(SEQ_BK.NEXTVAL), 3, '0'), '스프링 5 마스터');



--6. 과목 데이터
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Java');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Oracle Database');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'HTML/CSS/JavaScript');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'Spring Framework');
INSERT INTO SUBJECT(SUBJECT_NO, SUBJECT_NAME)
VALUES('SJ'||LPAD(TO_CHAR(SEQ_SJ.NEXTVAL), 3, '0'), 'JSP');



--7. 과정 데이터
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java를 활용한 Full-Stack개발자 양성과정');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '자바_스프링 기반 빅데이터 Full-stack 개발자 양성과정');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(자바)_AWS 활용한 Full-Stack 개발자 양성과정(A)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), 'Java(자바)_AWS 활용한 Full-Stack 개발자 양성과정(B)');
INSERT INTO COURSE(COURSE_NO, COURSE_NAME)
VALUES('CR'||LPAD(TO_CHAR(SEQ_CR.NEXTVAL), 3, '0'), '자바(Java)기반 Web_스마트플랫폼 Full-Stack 개발자 양성과정');


--8. 개설과정 데이터 
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD') , TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'CR002', 'CL002', 'P002');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15', 'YYYY-MM-DD') , TO_DATE('2024-08-07', 'YYYY-MM-DD') , 'CR003', 'CL003', 'P003');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13', 'YYYY-MM-DD') , TO_DATE('2024-06-10', 'YYYY-MM-DD'), 'CR004', 'CL004', 'P004');
EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR005', 'CL005', 'P005');

-- 개설과정 오류확인 데이터
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR005', 'CL005', 'P005');  -- 같은 과정정보
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL005', 'P005');  -- 같은 강의실, 교수, 과정기간 / 다른 과정
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P005');  -- 같은 과정기간, 교수 / 다른 과정, 강의실
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21' ,'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P001');  -- 같은 과정기간 / 다른 과정, 강의실, 교수
--EXEC PRC_CR_DETAIL_INSERT('CD'||LPAD(TO_CHAR(SEQ_CD.NEXTVAL), 3, '0'), TO_DATE('2023-08-27' ,'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'CR001', 'CL001', 'P005');

-- 개설과정 업데이트 데이터
--EXEC PRC_CR_DETAIL_UPDATE('CD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'CR001', 'CL001', 'P001');


--9. 개설과목 데이터 
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-25','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-04-26','YYYY-MM-DD'), TO_DATE('2024-06-27','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD001');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD002');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-12','YYYY-MM-DD'), TO_DATE('2024-08-08', 'YYYY-MM-DD'), 'SJ003', 'BK003', 'CD002');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-15','YYYY-MM-DD'), TO_DATE('2024-03-05','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD003');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-03-06','YYYY-MM-DD'), TO_DATE('2024-05-05','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD003');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-11-13','YYYY-MM-DD'), TO_DATE('2024-01-15','YYYY-MM-DD'), 'SJ002', 'BK002', 'CD004');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-03-11','YYYY-MM-DD'), 'SJ004', 'BK004', 'CD004');

EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-08-21','YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'SJ001', 'BK001', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-10-16','YYYY-MM-DD'), TO_DATE('2023-12-25','YYYY-MM-DD'), 'SJ003', 'BK003', 'CD005');
EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2023-12-26','YYYY-MM-DD'), TO_DATE('2024-03-18','YYYY-MM-DD'), 'SJ005', 'BK005', 'CD005');

-- 개설과목 오류확인 데이터
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001'); -- 중복된 과목, 중복된 과목기간
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-08-22','YYYY-MM-DD'), TO_DATE('2024-10-05','YYYY-MM-DD'), 'SJ002', 'BK001', 'CD001'); -- 중복된 과목기간
--EXEC PRC_SUB_DETAIL_INSERT('SD'||LPAD(TO_CHAR(SEQ_SD.NEXTVAL), 3, '0'), TO_DATE('2024-02-14','YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'SJ001', 'BK001', 'CD001'); -- 중복된 과목, 중복된 과정


-- 개설과목 업데이트 데이터
--EXEC PRC_SUB_DETAIL_UPDATE('SD200', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'),'SJ001', 'BK001', 'CD005');


--9. 개설과목(배점) 데이터
EXEC PRC_SD_UPDATE('SD001', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD002', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD003', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD004', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD005', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD006', 20, 40, 40);
EXEC PRC_SD_UPDATE('SD007', 40, 40, 20);
EXEC PRC_SD_UPDATE('SD008', 30, 40, 30);
EXEC PRC_SD_UPDATE('SD009', 30, 35, 35);
EXEC PRC_SD_UPDATE('SD010', 40, 20, 40);
EXEC PRC_SD_UPDATE('SD011', 40, 20, 40);

--10. 수강신청 데이터 
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S001');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S002');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD001', 'S003');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S004');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S005');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD002', 'S006');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S007');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S008');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD003', 'S009');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S010');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S011');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD004', 'S012');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S013');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S014');
EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S015');

EXEC PRC_APPLY_INSERT('AP'||LPAD(TO_CHAR(SEQ_AP.NEXTVAL), 3, '0'), 'CD005', 'S016');

--11. 성적처리 데이터
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 50, 100, 40, 'AP010', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 80, 100, 40, 'AP011', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP012', 'SD007');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 90, 80, 70, 'AP013', 'SD010');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 50, 30, 'AP014', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP014', 'SD011');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD009');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD010');
EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 100, 100, 100, 'AP015', 'SD011');

EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 60, 70, 80, 'AP016', 'SD009');
--EXEC PRC_SCORE_INSERT ('SC'||LPAD(TO_CHAR(SEQ_SC.NEXTVAL), 3, '0'), 60, 70, 80, 'AP016', 'SD010');

-- 성적처리 업데이트 데이터
--EXEC PRC_SCORE_UPDATE('SC020', 80, 80, 80);


--12. 중도탈락사유 데이터
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '취업');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '수업태도불량');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '개인사정');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '생계곤란');
INSERT INTO FAIL_REASON(FR_NO, FR)
VALUES('FR'||LPAD(TO_CHAR(SEQ_FR.NEXTVAL), 3, '0'), '확인불가(사라짐)');


--13. 중도탈락 데이터
EXEC PRC_FAIL_INSERT('FA'||LPAD(TO_CHAR(SEQ_FA.NEXTVAL), 3, '0'), SYSDATE, 'FR003', 'AP016');


-------------------------------------------------------------------------------- 데이터 입력 완료
-- 확인
SELECT *
FROM VIEW_CR_INFO;

SELECT *
FROM VIEW_PROF_INFO;
--
SELECT *
FROM VIEW_SCOREPRF_INFO;
SELECT *
FROM VIEW_SCORE_INFO
WHERE 과목명 = 'Java';
--
SELECT *
FROM VIEW_STUDENTSC_INFO;

SELECT *
FROM VIEW_STUDENT_INFO;

SELECT *
FROM VIEW_SUB_INFO;

SELECT *
FROM POSSIBLE_VIEW;

SELECT *
FROM APPLIED_VIEW;

-------------------------------------------------------------------------------- 확인 완료





