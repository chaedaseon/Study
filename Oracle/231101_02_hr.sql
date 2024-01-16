SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES ���̺��� ������ SALARY �� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT'�� �����鸸 �����Ѵ�.
--   (����, �������� ���� ���� ��� Ȯ�� �� ROLLBACK �� �����Ѵ�~!!!)

-- ���� Ǯ���� ����
-- ���� �� Ȯ��
SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9000		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6000		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	4800		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	4800		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4200		103	60
*/
SELECT *
FROM DEPARTMENTS;

UPDATE (SELECT *
        FROM EMPLOYEES E, DEPARTMENTS D
        WHERE E. DEPARTMENT_ID = D.DEPARTMENT_ID)
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_NAME = 'IT';
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- ���� �� Ȯ��
SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
*/

ROLLBACK;
--==>> �ѹ� �Ϸ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
-- IT �μ� �������� FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE �μ��� = 'IT';

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE �μ��� = �μ����� 'IT'�� �μ��� �μ����̵�;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(�μ����� 'IT'�� �μ��� �μ����̵�);

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>>
/*
Alexander	Hunold	    9000	60
Bruce	    Ernst	    6000	60
David	    Austin	    4800	60
Valli	    Pataballa	4800	60
Diana	    Lorentz	    4200	60
*/

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
     , SALARY * 1.1 "10%�λ�ȱ޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- ������Ʈ �Ŀ��� �ݵ�� ���̺� ��ü�� ���� Ȯ���� ��!
SELECT *
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME='IT');
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
*/

-- �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


-- �� EMPLOYEES ���̺��� JOB_TITLE �� 'Sales Manager' �� �������
--    SALARY �� �ش� ����(����)�� �ְ�޿�(MAX_SALARY)�� �����Ѵ�.
--    ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���� ������ �� �ֵ��� ó���Ѵ�.
--    ����, ���濡 ���� ��� Ȯ�� �� ROLLBACK�� �����Ѵ�~!!!)

-- ���� Ǯ���� ����
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'           
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	     JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	14000	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	13500	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	12000	0.3	100	80
*/

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/

ROLLBACK;
--==>> �ѹ� �Ϸ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����
-- 'Sales Manager'�� MAX_SALARY
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

-- 'Sales Manager'�� JOB_ID
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN


SELECT *
FROM EMPLOYEES
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006      --> �������¿��� ��! 
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM EMPLOYEES
WHERE TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006
  AND JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager');
--==>>
/*
145	John	Russell	    JRUSSEL	    011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/


--�� EMPLOYEES ���̺��� SALARY ��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance �� 10% �λ�
--   Executive �� 15% �λ�
--   Accounting �� 20% �λ�
--   (�������� ���� ���� ��� Ȯ�� �� ROLLBACK ����~!!!)

-- ���� Ǯ���� ����
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM EMPLOYEES;
--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    24000			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    17000		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    17000		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    12008		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9000		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	8200		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	7700		108	100
112	Jose Manuel Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	7800		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	6900		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    12008		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	8300		205	110
*/

-- DECODE() ���
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance'), SALARY*1.1
                                  , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive'), SALARY * 1.15
                                  , (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting'), SALARY *1.2)
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- CASE WHEN THEN ELSE END ���
UPDATE EMPLOYEES
SET SALARY = CASE WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY*1.1
                  WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY * 1.15
                  WHEN DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY *1.2
                  ELSE SALARY
              END 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.                        


SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    27600			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    19550		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    19550		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    13208.8		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9900		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	9020		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	8580		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	7590		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    14409.6		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	9960		205	110
*/

ROLLBACK;
--==>> �ѹ� �Ϸ�.

--------------------------------------------------------------------------------
-- ���� Ǯ���� ����

-- 'Finance', 'Executive', 'Accounting' �μ��� �ش��ϴ� �μ���ȣ
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting');
--==>>
/*
90
100
110
*/

-- 'Finance', 'Executive', 'Accounting' �μ��� �Ҽӵ� ����
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));

-- 'Finance', 'Executive', 'Accounting' �μ��� �ٸ� �޿� �λ�� 
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'�� �μ����̵�) THEN SALARY * 1.1
                                WHEN ('Executive'�� �μ����̵�) THEN SALARY * 1.15
                                WHEN ('Accounting'�� �μ����̵�) THEN SALARY * 1.2
                                ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));

-- ('Finance'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--==>> 100

-- ('Executive'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--==>> 90

-- ('Accounting'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
--==>> 110


UPDATE EMPLOYEES                        --> UPDATE������ ��Ī ������� ����!
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Finance') 
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Executive') 
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID 
                                      FROM DEPARTMENTS 
                                      WHERE DEPARTMENT_NAME = 'Accounting') 
                                THEN SALARY * 1.2
                                ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--> �������� ���� ���������� WHERE���� ��� �ش� �μ� �����鸸 �޿��� ����ȴ�.
--  ������, �޸������� ���� �� WHERE���� �ִ� ���� �ٶ����ϴ�.

--==>>
/*
100	Steven	    King	    SKING	    515.123.4567	2003-06-17	AD_PRES	    27600			90
101	Neena	    Kochhar	    NKOCHHAR	515.123.4568	2005-09-21	AD_VP	    19550		100	90
102	Lex	        De Haan	    LDEHAAN	    515.123.4569	2001-01-13	AD_VP	    19550		100	90
108	Nancy	    Greenberg	NGREENBE	515.124.4569	2002-08-17	FI_MGR	    13208.8		101	100
109	Daniel	    Faviet	    DFAVIET	    515.124.4169	2002-08-16	FI_ACCOUNT	9900		108	100
110	John	    Chen	    JCHEN	    515.124.4269	2005-09-28	FI_ACCOUNT	9020		108	100
111	Ismael	    Sciarra	    ISCIARRA	515.124.4369	2005-09-30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	    JMURMAN	    515.124.4469	2006-03-07	FI_ACCOUNT	8580		108	100
113	Luis	    Popp	    LPOPP	    515.124.4567	2007-12-07	FI_ACCOUNT	7590		108	100
205	Shelley	    Higgins	    SHIGGINS	515.123.8080	2002-06-07	AC_MGR	    14409.6		101	110
206	William	    Gietz	    WGIETZ	    515.123.8181	2002-06-07	AC_ACCOUNT	9960		205	110
*/

--------------------------------------------------------------------------------

--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴµ� ����ϴ� ����

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��           �� FROM���� ���������ϳ� �������� �� ��!
-- [WHERE ������];

--> DELETE���� ó���ϱ� �� �ݵ�� SELECT���� �̿��Ͽ� ��ȸ ���� �غ���!

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;

--�� EMPLOYEES ���̺��� �������� �����͸� �����Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.
DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�� �����ϰ��� �ϴ� ��� ������)
--   �ٸ� ���ڵ忡 ���� �������ϰ� �ִ� ���
--   �������� ���� �� �ִٴ� ����� �����ϰ� �־�� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.










