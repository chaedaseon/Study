SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;


-- 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

SELECT *
FROM TAB;


-- 기존 테이블 제거
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

DROP SEQUENCE MEMBERSEQ;


--------------------------------------------------------------------------------

--○ 실습 테이블 생성 (TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 시퀀스 생성 (MEMBERSEQ)
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-1111-1111');
--> 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-1111-1111')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 샘플 데이터 추가 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '정한울', '010-2222-2222')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '최혜인', '010-3333-3333')
;
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '길현욱', '010-4444-4444')
;
--==>> 1 행 이(가) 삽입되었습니다. *3


--○ 테이블 전체 조회 쿼리문 구성(리스트 확인)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	문정환	010-1111-1111
2	정한울	010-2222-2222
3	최혜인	010-3333-3333
4	길현욱	010-4444-4444
*/

--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 4


--○ 커밋
COMMIT;
--==>> 커밋 완료. 











