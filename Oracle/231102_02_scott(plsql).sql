SELECT USER
FROM DUAL;
--==>> SCOTT

--���� PL/SQL ����--

-- 1. PL/SQL(Procedural Language extension to SQL)��
--    ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�
--    ������ ���۰� ���� ������ PL/SQL�� ������ �ڵ� �ȿ� ���Եȴ�.
--    ����, PL/SQL �� ����ϸ� SQL�� �� �� ���� ������ �۾��� �����ϴ�.
--    ���⿡�� �����������̶�� �ܾ ������ �ǹ̴�
--    � ���� � ������ ���� ��� �Ϸ�Ǵ���
--    �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�.

-- 2. PL/SQL�� ���������� ǥ���ϱ� ����
--    ������ ������ �� �ִ� ���,
--    ���� ������ ������ �� �ִ� ���,
--    ���� �帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

-- 3. PL/SQL �� �� ������ �Ǿ� ������, 
--    ���� ���� �κ�, ���� �κ�, ���� ó�� �κ���
--    �� �κ����� �����Ǿ� �ִ�.
--    ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

-- 4. ���� �� ����
/*
[DECLARE]
    -- ����(DECLARATIONS)
BEGIN
    -- ���๮(STATEMENTS)
    
    [EXCEPTION]
        -- ���� ó����(EXCEPTION HANDLERS)
END;
*/


-- 5. ���� ����
/*
DECLARE
    ������ �ڷ���;
    ������ �ڷ��� := �ʱⰪ;
BEGIN
END;
*/


--�� ��(����)�� ���(�����Ͽ�) ����~!!! CHECK~!!!


--�� ��DBMS_OUTPUT.PUT_LINE()���� ����
--   ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����
SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.


--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    V1  NUMBER := 10;
    V2  VARCHAR2(30) := 'HELLO';
    V3  VARCHAR2(30) := 'Oracle';
BEGIN
    -- �����
    -- System.out.println(V1);      --> �ڹٷ� �����ڸ� ��±��� �Է��ϴ� �κ�
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>> 
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    V1  NUMBER := 10;
    V2  VARCHAR2(30) := 'HELLO';
    V3  VARCHAR2(30) := 'ORACLE';
BEGIN
    -- �����
    -- (���� �� ó��)
    V1 := V1 + 20;      -- JAVA) NUM1 = NUM1 + 20; �� NUM1 += 20;    --(��) 
                        -- ORACLE) ���տ����� ��� �Ұ���
    V2 := V2 || ' ���ѿ�';
    V3 := V3 || ' World~!!!';
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
30
HELLO ���ѿ�
ORACLE World~!!!


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� IF ��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL�� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN �� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
/*
IF ����
    THEN ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSE
    ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSE
    ó����;
END IF;
*/

/*
 --�� ����
 
 �÷��� ������Ÿ��;
 
 GRADE NUMBER;      -- �ִ밪
 
 GRADE CHAR         -- �ּҰ�
 
 --> ������Ÿ�Կ� ���̸� ������� ���� ��� NUMBER���� �ִ밪(38)���� �Է°���
                                             CHAR ���� �ּҰ�(1)�� �Է°���
*/

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
    
END;
--==>>
/*
FAIL


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
    
END;
--==>>
/*
BEST


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
    
END;
--==>>
/*
BEST


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
    
END;
--==>>
/*
BEST


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� CASE ��(���ǹ�)                     --> JAVA) SWITCH���� ���
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1 THEN ���๮;
    WHEN ��2 THEN ���๮;
    ELSE ���๮;
END CASE;
*/

ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';

DECLARE
    -- �����
    -- (�ֿ� ���� ����)
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(20) := 'Ȯ�κҰ�';
BEGIN
    -- �����
    -- (�׽�Ʈ)
    --DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    --> JAVA) System.out.ptintln("sel : " + sel);
    --DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
    
    -- (���� �� ó��)
    /*
    CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
    END CASE;
    */
    
    CASE SEL
        WHEN 1 THEN RESULT := '����';
        WHEN 2 THEN RESULT := '����';
        ELSE RESULT := 'Ȯ�κҰ�';
    END CASE;
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE('ó�� ����� ' || RESULT || '�Դϴ�.');
END;
--==>>
/*
�����Դϴ�


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--==>>
/*
ó�� ����� �����Դϴ�.


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� �ܺ� �Է� ó��
-- ACCEPT ����
-- ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- ��&�ܺκ����� ���·� �����ϰ� �ȴ�.


--�� ������ ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
-- ���� ��)
-- ù ��° ������ �Է��ϼ��� �� 10
-- �� ��° ������ �Է��ϼ��� �� 20
--==>> 10 + 20 = 30

ACCEPT NUM1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT NUM2 PROMPT '�� ��° ������ �Է��ϼ���';

DECLARE
    VAL1 NUMBER := &NUM1;
    VAL2 NUMBER := &NUM2;
    RESULT NUMBER;
BEGIN
    RESULT := VAL1 + VAL2;
    DBMS_OUTPUT.PUT_LINE(VAL1 || ' + ' || VAL2 || ' = ' || RESULT);
END;
--==>>
/*
10 + 20 = 30


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

13 + 24 = 37


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, �Է¿� ���� ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� : 990

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/

-- ���� Ǯ���� ����
ACCEPT VAL PROMPT '�ݾ� �Է�';

DECLARE
    NUM NUMBER := &VAL;
    N1 NUMBER(3);
    N2 NUMBER(3);
    N3 NUMBER(3);
    N4 NUMBER(3);
    RESULT NUMBER;
BEGIN
    N1 := TRUNC(NUM/500, 0);
    N2 := TRUNC((NUM-N1*500)/100, 0);
    N3 := TRUNC((NUM-(N1*500)-(N2*100))/50, 0);
    N4 := TRUNC((NUM-(N1*500)-(N2*100)-(N3*50))/10, 0);

    
    -- �׽�Ʈ
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : '|| NUM || '��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� '||N1||', ��� '||N2||', ���ʿ� '||N3||', �ʿ� '||N4);
    
END;
--==>>
/*
�Է¹��� �ݾ� �Ѿ� : 620��
ȭ����� : ����� 1, ��� 1, ���ʿ� 0, �ʿ� 2


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/
--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
ACCEPT INPUT PROMPT '�ݾ� �Է�';
DECLARE
    --�� �ֿ� ���� ����
    MONEY   NUMBER := &INPUT;           -- ������ ���� �Է°��� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT;           -- ��� ����� ���� �Է°��� ��Ƶ� ����
                                        -- (MONEY ������ ������ ó���ϴ� �������� ���� ���ϱ� ������...)
                                        
    M500    NUMBER;                     -- 500�� ¥�� ������ ��Ƶ� ����
    M100    NUMBER;                     -- 100�� ¥�� ������ ��Ƶ� ����
    M50     NUMBER;                     --  50�� ¥�� ������ ��Ƶ� ����
    M10     NUMBER;                     --  10�� ¥�� ������ ��Ƶ� ����
BEGIN
    --�� ���� �� ó��
    -- MONEY �� 500���� ������ ���� ���ϰ� �������� ������.   �� 500���� ����
    M500 := TRUNC(MONEY/500);
    
    -- MONEY �� 500���� ������ ���� ������ �������� ���Ѵ�.   �� 500���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY�� ����
    MONEY := MOD(MONEY, 500);
    
    -- MONEY �� 100���� ������ ���� ���ϰ� �������� ������.   �� 100���� ����
    M100 := TRUNC(MONEY/100);
    
    -- MONEY �� 100���� ������ ���� ������ �������� ���Ѵ�.   �� 100���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY�� ����
    MONEY := MOD(MONEY, 100);
    
    -- MONEY �� 50���� ������ ���� ���ϰ� �������� ������.    �� 50���� ����
    M50 := TRUNC(MONEY/50);
    
    -- MONEY �� 50���� ������ ���� ������ �������� ���Ѵ�.    �� 50���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� �ݾ����� MONEY�� ����
    MONEY := MOD(MONEY, 50);
    
    -- MONEY �� 10���� ������ ���� ���ϰ� �������� ������.    �� 10���� ����
    M10 := TRUNC(MONEY/10);
    
    --�� ��� ���
    -- ���յ� ���(ȭ�� ������ ����)�� ���Ŀ� �°� ���� ����Ѵ�.
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : ' || MONEY2 || '��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� ' || M500 || ', ��� ' || M100 || ', ���ʿ� ' || M50 || ', �ʿ� ' || M10);
END;
--==>
/*
�Է¹��� �ݾ� �Ѿ� : 780��
ȭ����� : ����� 1, ��� 2, ���ʿ� 1, �ʿ� 3


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����.

-- 2. ���� �� ����
/*
LOOP
    -- ���๮
    
    EXIT WHEN ����;   -- ������ ���� ��� �ݺ����� ����������.
    
END LOOP;
*/

-- 1 ���� 10������ �� ���(LOOP�� Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N >= 10;
        
        N := N + 1;         -- JAVA) N++;   N+=1;
        
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--    WHILE LOOP ������ ����Ѵ�.
--    ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
--    LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
--    LOOP �� ������ �� ������ FALSE �̸�, �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP   -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/


-- 1 ���� 10 ������ �� ���(WHILE LOOP �� Ȱ��)
DECLARE
    N   NUMBER := 1;
BEGIN
     
    WHILE N <= 10 LOOP
        
        DBMS_OUTPUT.PUT_LINE(N);
        
        N := N + 1;
        
    END LOOP;
    
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;

-- 1. �����ۼ������� 1�� �����Ͽ�
--    ������������ �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� IN [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮;
END LOOP;
*/

-- 1 ���� 10 ������ �� ���(FOR LOOP �� Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� �������� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : 2

2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
    :
2 * 9 = 18
*/

-- 1. LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    N   NUMBER := &NUM;
    I   NUMBER := 1;
BEGIN
    LOOP  
    
    DBMS_OUTPUT.PUT_LINE(N || ' * ' || I || ' = ' || N*I);
    I := I + 1;
    
    EXIT WHEN I = 10;
    
    END LOOP;
    
END;
--==>>
/*
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

-- 2. WHILE LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    N   NUMBER := &NUM;
    I   NUMBER := 1;
BEGIN
    WHILE I < 10 LOOP
    
    DBMS_OUTPUT.PUT_LINE(N || ' * ' || I || ' = ' || N*I);
    I := I + 1;
    
    END LOOP;
END;
--==>>
/*
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

-- 3. FOR LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';
DECLARE
    N   NUMBER := &NUM;
    I   NUMBER;
BEGIN
    FOR I IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || I || ' = ' || N*I);
    END LOOP;
END;
--==>>
/*
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ������ ��ü(2��~9��)�� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, ���� �ݺ���(�ݺ����� ��ø) ������ Ȱ���Ѵ�.
/*
���� ��)

==[2��]==
2 * 1 = 2
2 * 2 = 4
    :

==[3��]==
    :

==[9��]==
    :
9 * 9 = 81
*/

-- 1. LOOP��
DECLARE
    N   NUMBER := 1;
    M   NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('==[' || N || '��]==');
        M := 1;
        LOOP           
            DBMS_OUTPUT.PUT_LINE(N || ' * ' || M || ' = ' || N*M );
            M := M + 1;
            
            EXIT WHEN M = 10;
        END LOOP; 
        
        N := N + 1;
        
        EXIT WHEN N = 10;
    END LOOP;   
END;

-- 2. WHILE LOOP��
DECLARE
    N   NUMBER := 2;
    M   NUMBER := 1;
BEGIN
    WHILE N<10 LOOP
    
        M := 1;
       
        DBMS_OUTPUT.PUT_LINE('==[' || N || '��]==');
        
        
        WHILE M<10 LOOP
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || M || ' = ' || N*M);
        M := M + 1;
        END LOOP;
        N := N + 1;
   
    
    END LOOP;
END;

-- 3. FOR LOOP��
DECLARE
    N   NUMBER;
    M   NUMBER;
BEGIN
    FOR N IN 2 .. 9 LOOP
        
        DBMS_OUTPUT.PUT_LINE('==[' || N || '��]==');
        M := 1;
        FOR M IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(N || ' * ' || M || ' = ' || N*M);
        END LOOP;      
    END LOOP;
END;
--==>.
/*
==[2��]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18
==[3��]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27
==[4��]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
==[5��]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45
==[6��]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54
==[7��]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63
==[8��]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72
==[9��]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


