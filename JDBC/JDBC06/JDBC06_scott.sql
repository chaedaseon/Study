SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY 1;
--==>>
/*
1	이윤수	010-1111-1111
2	임하성	010-3333-3333
3	김민지	010-4444-4444
*/


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-5555-5555');
--> 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '문정환', '010-5555-5555')
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBER
ORDER BY 1;
--==>>
/*
1	이윤수	010-1111-1111
2	임하성	010-3333-3333
3	김민지	010-4444-4444
4	문정환	010-5555-5555
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 데이터 전체 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;


--○ Test001.java 실행 후 확인
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	이윤수	010-1111-1111
2	임하성	010-3333-3333
3	김민지	010-4444-4444
4	문정환	010-5555-5555
5	정한울	010-6666-6666
*/


--○ Test002.java 실행 후 확인
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	이윤수	010-1111-1111
2	임하성	010-3333-3333
3	김민지	010-4444-4444
4	문정환	010-5555-5555
5	정한울	010-6666-6666
6	길현욱	010-7777-7777
7	이윤수	010-8888-8888
*/



