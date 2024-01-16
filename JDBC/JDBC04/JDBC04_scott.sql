SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 기존 실습에 이용했던 데이터들 정리
TRUNCATE TABLE TBL_SCORE;
--==>> Table TBL_SCORE이(가) 잘렸습니다.


--○ 기존 실습에 이용했던 시퀀스 제거
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.


--○ 시퀀스 다시 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.


--○ 쿼리문 준비

-- 1. 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '김지민', 90, 80, 70);
--> 한 줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '김지민', 90, 80, 70)
;
--==>> 1 행 이(가) 삽입되었습니다.
SELECT *
FROM TBL_SCORE;
--==>> 1	김지민	90	80	70

COMMIT;
--==>> 커밋 완료.


-- 2. 리스트 출력 쿼리문 구성(총점, 평균, 석차)
SELECT SID, NAME, KOR, ENG, MAT
     , KOR+ENG+MAT AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM TBL_SCORE
ORDER BY SID ASC;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE ORDER BY SID ASC
;
--==>> 1	김지민	90	80	70	240	80	1


-- 3. 인원 수 조회 쿼리문 구성
SELECT COUNT(*)
FROM TBL_SCORE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>> 1


-- 4. 이름 검색 쿼리문 구성(총점, 평균, 석차가 포함된 리스트 형태로 조회)
SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK
FROM
(
     SELECT SID, NAME, KOR, ENG, MAT
     , KOR+ENG+MAT AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
     FROM TBL_SCORE
)
WHERE NAME = '김지민';
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK FROM (SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE NAME='김지민'
;
--==>> 1	김지민	90	80	70	240	80	1


-- 5. 번호 검색 쿼리문 구성
SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK
FROM
(
     SELECT SID, NAME, KOR, ENG, MAT
     , KOR+ENG+MAT AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
     , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
     FROM TBL_SCORE
)
WHERE NAME = 1;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK FROM (SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE) WHERE SID=1
;


-- 6. 데이터 수정 쿼리문 구성
UPDATE TBL_SCORE
SET NAME='엄재용', KOR=100, ENG=90, MAT=80 
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_SCORE SET NAME='엄재용', KOR=100, ENG=90, MAT=80 WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SCORE;
--==>> 1	엄재용	100	90	80

COMMIT;
--==>> 커밋 완료.


-- 7. 데이터 삭제 쿼리문 구성
DELETE
FROM TBL_SCORE
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_SCORE WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.


ROLLBACK;
--==>> 롤백 완료.







