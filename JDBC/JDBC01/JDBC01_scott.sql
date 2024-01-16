SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.


--○ 실습 테이블 생성
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, '홍길동', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_MEMBER;
--==>> 1	홍길동	010-1111-1111

--○ 커밋 CHECK~!!!
COMMIT;
--==>> 커밋 완료.


--○ 자바에서 Test003.java 실행 후 다시 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	홍길동	010-1111-1111
2	채다선	010-2694-8958
*/
-------------------------------------------------------------------------------- ▲ 23/11/21

--○ 자바에서 Test004.java 실행 후 다시 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	홍길동	010-1111-1111
2	채다선	010-2694-8958
3	박나영	010-3333-3333
4	정현욱	010-4444-4444
5	김민지	010-5555-5555
*/

--○ 자바에서 Test005.java 에서 실행할 조회 쿼리문 준비
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성(자바에 가져갈 때 확인 후 가져가기 위해 세미콜론은 개행)
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	홍길동	010-1111-1111
2	채다선	010-2694-8958
3	박나영	010-3333-3333
4	정현욱	010-4444-4444
5	김민지	010-5555-5555
*/

--○ 자바에서 Test006.java 에서 실행할 조회 쿼리문 준비
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP;


