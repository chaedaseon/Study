-- MybatisWork02_scott.sql

SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ���� ���̺� ����
DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(TBL_MEMBERLIST)
CREATE TABLE TBL_MEMBERLIST
(MID        NUMBER
, NAME      VARCHAR2(30)
, TELEPHONE VARCHAR2(40)
, CONSTRAINT MEMBERLIST_MID_PK PRIMARY KEY(MID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� ���� ������ ����
DROP SEQUENCE MEMBERLISTSEQ;
--==>> Sequence MEMBERLISTSEQ��(��) �����Ǿ����ϴ�.


--�� �ǽ� ������ ����(MEMBERLISTSEQ)
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
--==>> Sequence MEMBERLISTSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '��ٽ�', '010-2334-4456');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ����Ʈ ��ȸ ������ ����
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
--==>> 1	��ٽ�	010-2334-4456


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ο� �� Ȯ��
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
--==>> 1


--�� ������ �߰� �Է�
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '�ڳ���', '010-4455-9988');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ���� ������ ����
DELETE
FROM TBL_MEMBERLIST
WHERE MID=1;










