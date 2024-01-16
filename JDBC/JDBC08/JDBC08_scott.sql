SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
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

TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> ��ȸ ��� ����

DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� CallableStatement �ǽ��� ���� ���ν��� �ۼ�
--   ���ν��� ��   : PRC_MEMBERINSERT
--   ���ν��� ��� : TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν��� 
CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE 
, V_TEL     IN TBL_MEMBER.TEL%TYPE
)
IS
    -- �ֿ� ���� ����
    V_SID   TBL_MEMBER.SID%TYPE;
BEGIN
    -- ���� SID �� �ִ밪 ������
    SELECT NVL(MAX(SID), 0) +1 INTO V_SID
    FROM TBL_MEMBER;
    
    -- ������ �Է�(INSERT ������ ����)
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES(V_SID, V_NAME, V_TEL);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_MEMBERINSERT��(��) �����ϵǾ����ϴ�.


--�� Test001.java ���� �� Ȯ��
SELECT*
FROM TBL_MEMBER;
--==>>
/*
1	��ٽ�	010-1111-1111
2	������	010-2222-2222
3	�����	010-3333-3333
4	�ڹ���	010-4444-4444
*/


--�� CallableStatement �ǽ��� ���� ���ν��� �ۼ�
--   ���ν��� ��   : PRC_MEMBERSELECT
--   ���ν��� ��� : TBL_MEMBER ���̺��� �����͸� �о���� ���ν���
--   �� ��SYS_REFCURSOR�� �ڷ����� �̿��Ͽ� Ŀ�� �ٷ��
CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR
)
IS
    -- �ֿ� ���� ����
    -- �� Ŀ�� ���� �� ��¿� �Ű������� ��ü
BEGIN
    OPEN VRESULT FOR
    SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
    
    --CLOSE VRESULT;    -- �����ϴ� ������ Ŀ�� ��� �ÿ��� Ŀ���� ���� ����. -> ����Ŭ���� ���� ���ϱ� ����...
    
    --COMMIT;           -- SELECT �����̹Ƿ� COMMIT �� �ʿ� ����.
END;
--==>> Procedure PRC_MEMBERSELECT��(��) �����ϵǾ����ϴ�.





















