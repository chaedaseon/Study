SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν����� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/
-- ���� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ     IN TBL_���.����ȣ%TYPE
, V_�����Ҽ���   IN TBL_���.������%TYPE
)
IS   
    V_������  TBL_��ǰ.������%TYPE;
    V_������  TBL_���.������%TYPE;
    -- ����� ���� ���� 
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    SELECT ������ INTO V_������         -- ��ǰ ���̺��� ���� ������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = (SELECT ��ǰ�ڵ� FROM TBL_��� WHERE ����ȣ = V_����ȣ);
    
    SELECT ������ INTO V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    IF ((V_������+V_������) < V_�����Ҽ���)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- TBL_��� �� UPDATE
    UPDATE TBL_���
    SET ������ = V_�����Ҽ���  
    WHERE ����ȣ = V_����ȣ;
    
    -- TBL_��ǰ �� UPDATE
    UPDATE TBL_��ǰ
    SET ������ = (V_������+V_������) - V_�����Ҽ���
    WHERE ��ǰ�ڵ� = (SELECT ��ǰ�ڵ� FROM TBL_��� WHERE ����ȣ = V_����ȣ);
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    COMMIT;
    
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( 
  -- �� �Ű����� ���� 
  V_����ȣ     IN TBL_���.����ȣ%TYPE
, V_������     IN TBL_���.������%TYPE            -- ������ ������
)
IS   
    -- �� �ʿ��� ���� ����
    V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������    TBL_���.������%TYPE;
    V_������        TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
    -- �� ������ ������ �� ��Ƴ���
    -- ��
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- �� ��� ������࿩�� �Ǵ� �ʿ�
    --    ���� ������ ������ �� ������ ������ Ȯ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- �� �ľ��� �������� ���� ������ ���� �ǽ� ���� �Ǵ�
    --    (��������+���������� < �������������� ��Ȳ�̶��... ��������� ���� �߻�)
    IF (V_������ + V_���������� < V_������)
        -- THEN ��������� ���� �߻� 
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �� ����� ������ üũ(UPDATE �� TBL_��� / UPDATE �� TBL_��ǰ)
    UPDATE TBL_���
    SET ������ = V_������
    WHERE ����ȣ = V_����ȣ;
    
    -- �� 
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_���������� - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- �� ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- �� Ŀ��
    COMMIT;

END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
/*
1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
2. PRC_�԰�_DELETE(�԰��ȣ)
3. PRC_���_DELETE(����ȣ)
*/

-- 1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
CREATE OR REPLACE PROCEDURE PRC_�԰�_UPDATE
( V_�԰��ȣ    IN TBL_�԰�.�԰��ȣ%TYPE
, V_�԰����    IN TBL_�԰�.�԰����%TYPE
)
IS
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�����԰����    TBL_�԰�.�԰����%TYPE;
    V_������  TBL_��ǰ.������%TYPE;
    
    -- ����� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ������ ������ �� ��Ƴ���
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_������ + V_�԰���� - V_�����԰���� < 0) 
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- TBL_�԰� �� UPDATE
    UPDATE TBL_�԰�
    SET �԰���� = V_�԰����
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- TBL_��ǰ �� UPDATE
    UPDATE TBL_��ǰ
    SET ������ = V_������ + V_�԰���� - V_�����԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_�԰�_UPDATE��(��) �����ϵǾ����ϴ�.

-- 2. PRC_�԰�_DELETE(�԰��ȣ)
CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
( V_�԰��ȣ    IN TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������    TBL_��ǰ.������%TYPE;
    V_�԰����        TBL_�԰�.�԰����%TYPE;
    
    -- ����� ���� ���� 
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ������ ������ �� ��Ƴ���
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_����������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_�԰���� > V_����������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- TBL_�԰� �� DELETE
    DELETE
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- TBL_��ǰ �� UPDATE
    UPDATE TBL_��ǰ
    SET ������ = V_���������� - V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_�԰�_DELETE��(��) �����ϵǾ����ϴ�.

-- 3. PRC_���_DELETE(����ȣ)
CREATE OR REPLACE PROCEDURE PRC_���_DELETE
( V_����ȣ    IN TBL_���.����ȣ%TYPE
)
IS
    V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������    TBL_��ǰ.������%TYPE;
    V_������        TBL_���.������%TYPE; 
BEGIN
    -- ������ ������ �� ��Ƴ���
    SELECT ������, ��ǰ�ڵ� INTO V_������, V_��ǰ�ڵ�
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    SELECT ������ INTO V_����������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;   
    
    -- TBL_��� �� DELETE
    DELETE 
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- TBL_��ǰ �� UPDATE
    UPDATE TBL_��ǰ
    SET ������ = V_���������� + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ó��
    EXCEPTION
        WHEN OTHERS 
            THEN ROLLBACK;
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_���_DELETE��(��) �����ϵǾ����ϴ�.



