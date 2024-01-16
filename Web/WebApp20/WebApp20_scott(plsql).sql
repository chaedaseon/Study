SELECT USER
FROM TBL_BOARD;
--==>> SCOTT


DESC TBL_BOARD;
--==>>
/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL             VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR            VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE 
*/

DECLARE
    V_NUM      NUMBER(9)        := 1;      
    V_NAME     VARCHAR2(30);   
    V_PWD      VARCHAR2(20);   
    V_EMAIL    VARCHAR2(50);   
    V_SUBJECT  VARCHAR2(100);  
    V_CONTENT  VARCHAR2(4000); 
    V_IPADDR   VARCHAR2(20);   
    V_HITCOUNT NUMBER;         
    V_CREATED  DATE             :=TO_DATE('2020-12-12', 'YYYY-MM-DD'); 
BEGIN
    LOOP
        EXIT WHEN V_NUM > 684;
        
        V_NUM := V_NUM + 1;
        
        IF (MOD(V_NUM, 5)=0) THEN
            V_PWD := 'java006$';
            V_CONTENT := '영화관련 내용물 작성';
            V_IPADDR := '211.238.142.160';
            V_NAME := '노';
            V_SUBJECT := '취미';
        ELSIF (MOD(V_NUM, 3)=0) THEN
            V_PWD := 'java007$';
            V_CONTENT := '떡볶이관련 내용물 작성';
            V_IPADDR := '211.238.142.165';
            V_NAME := '박';
            V_SUBJECT := '음식';
        ELSIF (MOD(V_NUM, 7)=0) THEN
            V_PWD := 'java008$';
            V_CONTENT := '축구관련 내용물 작성';
            V_IPADDR := '211.238.142.170';
            V_NAME := '채';
            V_SUBJECT := '운동';
        ELSE
            V_PWD := 'java002$';
            V_CONTENT := '눈보라관련 내용물 작성';
            V_IPADDR := '211.238.142.175';
            V_NAME := '김';
            V_SUBJECT := '날씨';
        END IF;
        
        V_NAME := V_NAME || '윤수' || LTRIM(TO_CHAR(V_NUM));
        V_SUBJECT := V_SUBJECT || '에 대해 작성한 게시물' || LTRIM(TO_CHAR(V_NUM));
        
        V_CREATED := V_CREATED + 1;
        
        IF (MOD(V_NUM, 2)=0) THEN
            V_EMAIL := 'apple' || V_NUM || '@test.com';
            V_HITCOUNT := 29;
        ELSIF (MOD(V_NUM, 3)=0) THEN
            V_EMAIL := 'test' || V_NUM || '@test.com';
            V_HITCOUNT := 34;
        ELSIF (MOD(V_NUM, 4)=0) THEN
            V_EMAIL := 'study' || V_NUM || '@test.com';
            V_HITCOUNT := 47;
        ELSE
            V_EMAIL := 'snow' || V_NUM || '@test.com';
            V_HITCOUNT := 11; 
        END IF;
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_NUM, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
        
    END LOOP;
END;
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

COMMIT;
--==>> 커밋 완료.

















