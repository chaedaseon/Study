SELECT USER
FROM DUAL;
--==>> SCOTT

/*
   - 사용 계정 : scott
   - 테이블 : TBL_STUDENT
     ·테이블 구조 : SID		NUMBER		-- PK
                   , NAME		VARCHAR2(30)
                   , TEL		VARCHAR2(40)
   - 테이블 : TBL_GRADE
     ·테이블 구조 : SID		NUMBER		-- PK
                   , SUB1		NUMBER(3)
                   , SUB2		NUMBER(3)
                   , SUB3		NUMBER(3)
   - 뷰 : STUDENTVIEW
     ·뷰 구조 : SID, NAME, TEL, SUB
                                 --- 참조 레코드 수
   - 뷰 : GRADEVIEW
     ·뷰 구조 : SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
                                              ---  ---  --
                                             총점 평균 등급(합격, 과락, 불합격)
*/

--○ 실습 테이블 생성
CREATE TABLE TBL_STUDENT
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_STUDENT이(가) 생성되었습니다.



--○ 데이터 입력
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(1, '정현욱', '010-1111-1111');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(2, '이윤수', '010-2222-2222');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(3, '강혜성', '010-3333-3333');
INSERT INTO TBL_STUDENT(SID, NAME, TEL)
VALUES(4, '박범구', '010-4444-4444');
--==>> 1 행 이(가) 삽입되었습니다. * 4


--○ 확인
SELECT *
FROM TBL_STUDENT;
--==>>
/*
1	정현욱	010-1111-1111
2	이윤수	010-2222-2222
3	강혜성	010-3333-3333
4	박범구	010-4444-4444
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.



--○ 실습 테이블 생성
CREATE TABLE TBL_GRADE
( SID   NUMBER
, SUB1  NUMBER(3)
, SUB2  NUMBER(3)
, SUB3  NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_STUDENT(SID)
, CONSTRAINT GRADE_SUB1_CK CHECK(SUB1 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB2_CK CHECK(SUB2 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB3_CK CHECK(SUB3 BETWEEN 0 AND 100)
);
--==>> Table TBL_GRADE이(가) 생성되었습니다.


--○ 데이터 입력
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(1, 90, 90, 80);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(2, 92, 92, 82);
INSERT INTO TBL_GRADE(SID, SUB1, SUB2, SUB3)
VALUES(3, 70, 60, 50);
--==>> 1 행 이(가) 삽입되었습니다. * 3


--○ 확인
SELECT *
FROM TBL_GRADE;
--==>>
/*
1	90	90	80
2	92	92	82
3	70	60	50
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 뷰 생성(STUDENTVIEW)
CREATE OR REPLACE VIEW STUDENTVIEW
AS
SELECT S.SID AS SID
     , S.NAME AS NAME
     , S.TEL AS TEL
     , (SELECT COUNT(*)
        FROM TBL_GRADE
        WHERE SID = S.SID) AS SUB
FROM TBL_STUDENT S;
--==>> View STUDENTVIEW이(가) 생성되었습니다.


--○ 뷰 생성(GRADEVIEW)
CREATE OR REPLACE VIEW GRADEVIEW
AS
SELECT S.SID AS SID
     , S.NAME AS NAME
     , NVL(G.SUB1, -1) AS SUB1
     , NVL(G.SUB2, -1) AS SUB2
     , NVL(G.SUB3, -1) AS SUB3
     , NVL((G.SUB1 + G.SUB2 + G.SUB3), -1) AS TOT
     , NVL(ROUND((G.SUB1 + G.SUB2 + G.SUB3)/3, 1), -1) AS AVG 
     , (CASE WHEN NVL((G.SUB1 + G.SUB2 + G.SUB3)/3, -1) <= 60 THEN '불합격'
             WHEN (G.SUB1<=40) OR (G.SUB2<=40) OR (G.SUB3<=40) THEN '과락'
             ELSE '합격'
             END) AS CH
FROM TBL_STUDENT S LEFT JOIN TBL_GRADE G
ON S.SID = G.SID;
--==>> View GRADEVIEW이(가) 생성되었습니다.


--○ 뷰(STUDENTVIEW) 조회
SELECT SID, NAME, TEL, SUB
FROM STUDENTVIEW
ORDER BY SID;
--==>>
/*
1	정현욱	010-1111-1111	1
2	이윤수	010-2222-2222	1
3	강혜성	010-3333-3333	1
4	박범구	010-4444-4444	0
*/


--○ 뷰(GRADEVIEW) 조회
SELECT SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
FROM GRADEVIEW
ORDER BY SID;
--==>>
/*
1	정현욱	90	90	80	260	86.7	합격
2	이윤수	92	92	82	266	88.7	합격
3	강혜성	70	60	50	180	  60	불합격
4	박범구	-1	-1	-1	-1	  -1	불합격
*/


--○ 인원 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_STUDENT;
--==>> 4


--○ 아이디 검색 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_STUDENT
WHERE SID=1;


--○ 학생번호 최대값 구하는 쿼리문 구성
SELECT MAX(SID)
FROM TBL_STUDENT;


--○ 학생 데이터 수정 쿼리문 구성
UPDATE TBL_STUDENT
SET NAME='', TEL=''
WHERE SID=1;


--○ 학생 데이터 삭제 쿼리문 구성
DELETE
FROM TBL_STUDENT
WHERE SID=1;


--○ 성적 데이터 삭제 쿼리문 구성
DELETE
FROM TBL_GRADE
WHERE SID=1;


--○ 성적 데이터 수정 쿼리문 구성
UPDATE TBL_GRADE
SET SUB1=90, SUB2=80, SUB3=70
WHERE SID=1;


--○ 아이디로 성적데이터 검색 쿼리문 구성
SELECT SID, NAME, SUB1, SUB2, SUB3
FROM GRADEVIEW
WHERE SID=1;
