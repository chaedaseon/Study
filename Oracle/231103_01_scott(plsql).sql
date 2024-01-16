SELECT USER
FROM DUAL;
--==>> SCOTT

--���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (�� ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[( �Ű�������1 �ڷ���
, �Ű�������2 �ڷ���
)]
RETURN ������Ÿ��
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���๮;
    ...
    RETURN (��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/

--�� ����� ���� �Լ�(������ �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.


--�� TBL_INSA ���̺� ���� ���� Ȯ�� �Լ� ����(����)
--   --------------------
--   �Ű����� ����(����) �� '771212-1022432' �� 'YYMMDD-NNNNNNN'

-- �Լ��� : FN_GENDER()
--                   �� �ֹε�Ϲ�ȣ �� '771212-1022432'

CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)    -- �Ű�����   : �ڸ���(����) ���� ����
RETURN VARCHAR2                                         -- ��ȯ�ڷ��� : �ڸ���(����) ���� ����
IS
    -- ����� �� �ֿ� ���� ����(�� �ʱ�ȭ)
    V_RESULT    VARCHAR2(20);
BEGIN
    -- ����� �� ���� �� ó��(�׸��� ����� ��ȯ)
    IF ( SUBSTR(V_SSN, 8, 1) IN ('1', '3') )
        THEN V_RESULT := '����';
    ELSIF ( SUBSTR(V_SSN, 8, 1) IN ('2', '4') )
        THEN V_RESULT := '����';
    ELSE 
        V_RESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ����� ��ȯ       CHECK~!!!
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.


--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾� �� (A, B)
--   A�� B���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   ��, ������ ����Ŭ ���� �Լ��� �̿����� �ʰ�, �ݺ����� Ȱ���Ͽ� �ۼ��Ѵ�.
-- �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000
*/
-- ���� Ǯ���� ����
CREATE OR REPLACE FUNCTION FN_POW( A   NUMBER, B   NUMBER )
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;      
    I           NUMBER := 1;      
BEGIN
    WHILE I <= B LOOP
        V_RESULT := V_RESULT * A;
        I := I + 1;
    END LOOP;
    
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
CREATE OR REPLACE FUNCTION FN_POW( A   NUMBER, B   NUMBER )
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;        -- ��ȯ ����� ���� �� 1�� �ʱ�ȭ~!!!   CHECK~!!!
    V_NUM       NUMBER;             -- ���� ����
BEGIN
    -- �ݺ��� ����
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;   -- V_RESULT *= A;
    END LOOP;
    
    -- ���� ����� ��ȯ
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� ��(�⺻��*12)+���硻 ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��+����)
-- ���� Ǯ���� ����
CREATE OR REPLACE FUNCTION FN_PAY(V_BASICPAY    NUMBER, V_SUDANG    NUMBER)
RETURN NUMBER
IS
    V_PAY   NUMBER;
BEGIN
    V_PAY := (V_BASICPAY*12)+V_SUDANG;
    
    RETURN V_PAY;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
--> TBL_INSA ���̺��� ���� �������δ� BASICPAY�� SUDANG �� �� NULL�� ���� 
--  ������, �Լ��� ���� ���� NULL�� ����Ͽ� ������ �ۼ��ؾ���!
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY    NUMBER, VSUDANG    NUMBER)
RETURN NUMBER
IS
    -- �ֿ� ���� ����
    VRESULT   NUMBER;
BEGIN
    -- ���� �� ó��
    VRESULT := (NVL(VBASICPAY, 0)*12)+NVL(VSUDANG, 0);
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺��� 
--   �Ի����� �������� ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)
-- ���� Ǯ���� ����
-- 1.
CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE   DATE)
RETURN NUMBER
IS
    V_RESULT  NUMBER;

BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 1);
    
    RETURN V_RESULT;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.

-- 2.
CREATE OR REPLACE FUNCTION FN_WORKYEAR(V_IBSADATE   DATE)
RETURN VARCHAR2
IS
    V_RESULT  VARCHAR2(50);

BEGIN
    V_RESULT := TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 0)) || '��'
                || TO_CHAR(TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, V_IBSADATE) / 12, 1)*12)) || '����';
    
    RETURN V_RESULT;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����

-- 1.
SELECT MONTHS_BETWEEN(SYSDATE, IBSADATE) / 12
FROM TBL_INSA;

-- 2.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, IBSADATE) / 12) || '��' || 
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, IBSADATE), 12)) || '����'
FROM TBL_INSA;

-- FN_WORKYEAR �Լ� ����
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE   DATE)
RETURN VARCHAR2
IS
    VRESULT  VARCHAR2(50);

BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE) / 12) || '��' || 
                TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '����';
                
    RETURN VRESULT;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- ���� PL/SQL�� �� DML��, TCL���� ��� �����ϴ�.
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.


--------------------------------------------------------------------------------

--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[(�Ű����� IN ������Ÿ��
, �Ű����� OUT ������Ÿ��
, �Ű����� INOUT ������Ÿ��
)]
IS
    [-- �ֿ� ���� ����]
BEGIN
    -- ���� ����;
    
    ...
    
    [EXCEPTION
        -- ���� ó�� ����;]
END;
*/

--�� FUNCTION �� ������ �� ��RETURN ��ȯ�ڷ����� �κ��� �������� ������, 
--   ��RETURN���� ��ü�� �������� �ʰ�,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN(�Է�), OUT(���), INOUT(�����) ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/


--�� ���ν��� �ǽ��� ���� ���̺� ������...
--   ��231103_02_scott.sql�� ���� ����~!!!

--�� ���ν��� ����
-- ���ν����� : PRC_STUDENT_INSERT(���̵�, �н�����, �̸�, ��ȭ, �ּ�)

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW ���̺� ������ �Է� �� INSERT
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS ���̺� ������ �Է� �� INSERT
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���ν��� �ǽ��� ���� ���̺� ������...
--   ��231103_02_scott.sql�� ���� ����~!!!

--�� ������ �Է� �� Ư�� �׸��� �����͸� �Է��ϸ�
--   ���������� �ٸ� �߰��׸� ���� ó���� �Բ� �̷���� �� �ֵ��� �ϴ�
--   ���ν����� �ۼ��Ѵ�.(�����Ѵ�.)
--   ���ν����� : PRC_SUNGJUK_INSERT()
/*
���� �ν�)
���� TBL_SUNGJUK ���̺���
HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE             
(�й�, �̸�, ��������, ��������, ��������, ����, ���, ���)
�÷����� �����Ǿ� �ִ�.
�� ���̺��� ������� Ư�� �׸�(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
�߰� �׸�(����, ���, ���)�� �˾Ƽ� ó���� �� �ֵ��� ���ν����� �����϶�� ���̴�.

���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '��ٽ�', 90, 80, 70);

�� �̿� ���� ���ν��� ȣ��� ó���� ���

�й�  �̸�  �������� �������� ��������  ����  ���  ���
 1   ��ٽ�       90       80       70   240    80     B
*/
-- ���� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN 
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT,0);
    V_AVG := V_TOT/3;
    
    IF V_AVG >= 90
        THEN V_GRADE := 'A';
    ELSIF V_AVG >= 80
        THEN V_GRADE := 'B';
    ELSIF V_AVG >= 70
        THEN V_GRADE := 'C';
    ELSIF V_AVG >= 60
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);

    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- �����
    -- INSERT �������� �����ϱ� ���� �ʿ��� �߰� ���� ����
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �����
    -- ����ο� �߰��� ������ �ֿ� �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT, 0);
    V_AVG := V_TOT/3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����
--   (�й�, ��������, ��������, ��������) ������ ���� ��
--   ����, ���, ��ޱ��� �Բ� �����Ǵ� ���ν����� �����Ѵ�.
--   ���ν����� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);

�� �̿� ���� ���ν��� ȣ��� ó���� ���

�й�  �̸�  �������� �������� ��������  ����  ���  ���
 1   ��ٽ�       90       80       70   240    80     B
 2   ������       50       50       50   150    50     F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT         TBL_SUNGJUK.TOT%TYPE;
    V_AVG         TBL_SUNGJUK.AVG%TYPE;
    V_GRADE       TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := NVL(V_KOR, 0) + NVL(V_ENG, 0) + NVL(V_MAT, 0);
    V_AVG := V_TOT/3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT, TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;

    
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.


--�� TBL_STUDENTS ���̺��� ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�)
--   ���ν����� �ۼ��Ѵ�.
--   ��, ID �� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� ó���Ѵ�.
--   ���ν����� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENT_UPDATE('moon', 'java000', '010-9999-9999', '������ Ⱦ��');
-->> ������ ���� ��

EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '������ Ⱦ��');
-->> ������ ���� ��
*/
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS  
BEGIN
    
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND V_PW = (SELECT PW FROM TBL_IDPW WHERE V_ID = ID);
      
    
    COMMIT;
END;





