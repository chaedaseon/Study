SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY 1;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
*/


--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '����ȯ', '010-5555-5555');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '����ȯ', '010-5555-5555')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBER
ORDER BY 1;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
4	����ȯ	010-5555-5555
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ������ ��ü ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;


--�� Test001.java ���� �� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
4	����ȯ	010-5555-5555
5	���ѿ�	010-6666-6666
*/


--�� Test002.java ���� �� Ȯ��
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	������	010-1111-1111
2	���ϼ�	010-3333-3333
3	�����	010-4444-4444
4	����ȯ	010-5555-5555
5	���ѿ�	010-6666-6666
6	������	010-7777-7777
7	������	010-8888-8888
*/



