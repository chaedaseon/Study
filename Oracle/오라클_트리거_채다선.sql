SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_��� ���̺��� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� �ش� ��ǰ�� ���� ������ ���� Ʈ���� �ۼ�
--   Ʈ���Ÿ� : TRG_CHULGO
--   ���� ���ϸ� : ����Ŭ_Ʈ����_ä�ټ�.sql
--   ��� ���� ���� ���� ó���� ��
CREATE OR REPLACE TRIGGER TRG_CHULGO
        AFTER
        INSERT OR UPDATE OR DELETE ON TBL_���
        FOR EACH ROW
DECLARE
    V_������  TBL_��ǰ.������%TYPE;
BEGIN

    IF (INSERTING)
        THEN 
        
        SELECT ������ INTO V_������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
        
        IF (:NEW.������ > V_������)
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
        END IF;
         
        UPDATE TBL_��ǰ
        SET ������ = ������ - :NEW.������
        WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
         
    ELSIF (UPDATING)
        THEN
        
        SELECT ������ INTO V_������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
        
        IF (:NEW.������ > V_������ + :OLD.������)
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
        END IF;
        
        UPDATE TBL_��ǰ
        SET ������ = ������ + :OLD.������ - :NEW.������
        WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
        
    ELSIF (DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :OLD.������
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;  
END;
--==>> Trigger TRG_CHULGO��(��) �����ϵǾ����ϴ�.




