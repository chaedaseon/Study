SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ 암호화 및 복호화 03 ■■■--

-- 테이블 생성
CREATE TABLE TBL_PACKAGETEST
( ID    NUMBER
, KEY   VARCHAR2(40)
, PW    VARCHAR2(40)
);
--==>> Table TBL_PACKAGETEST이(가) 생성되었습니다.


--○ 데이터 입력(비 암호화)
INSERT INTO TBL_PACKAGETEST(ID, PW) VALUES(1, 'abcd1234');
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_PACKAGETEST;
--==>> 1	(null)	abcd1234


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 다시 데이터 입력(암호화)
INSERT INTO TBL_PACKAGETEST(ID, KEY, PW) 
VALUES(1, 'abcd1234', CRYPTPACK.ENCRYPT('abcd1234', 'abcd1234'));
-- 'abcd1234' (패스워드)를
-- 'abcd1234' (키)로 암호화 처리
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인 (→ 복호화 과정을 수행하지 않고 일반적인 조회를 수행)
SELECT *
FROM TBL_PACKAGETEST;
--==>> 1	abcd1234	c":5?

--○ 데이터 조회 (복호화 → 암호화 과정에서 설정한 KEY 가 아닌 잘못된 KEY 를 통해 복호화)
SELECT ID, CRYPTPACK.DECRYPT(PW, '1111') "결과확인"
FROM TBL_PACKAGETEST;
--==>> 1	?f+??

--○ 데이터 조회 (복호화 → 암호화 과정에서 설정한 KEY 가 아닌 잘못된 KEY 를 통해 복호화)
SELECT ID, CRYPTPACK.DECRYPT(PW, 'abcd') "결과확인"
FROM TBL_PACKAGETEST;
--==>> 1	G?"!?


--○ 데이터 조회 (복호화 → 암호화 과정에서 설정한 KEY 를 통해 복호화)
SELECT ID, CRYPTPACK.DECRYPT(PW, 'abcd1234') "결과확인"
FROM TBL_PACKAGETEST;
--==>> 1	abcd1234


