/*==================================
  ���� �÷��� (Collection) ����
===================================*/

// Test163 Ŭ������ �ϼ��Ͽ� ���� ����� ���� ���α׷��� �����Ѵ�.

/*
���� ��)

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 1

1��° ��� �Է� : ������
1��° ��� �Է� ����~!!!
��� �Է� ���(Y/N)? : y

2��° ��� �Է� : ä�ټ�
2��° ��� �Է� ����~!!!
��� �Է� ���(Y/N)? : n

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 2

[���� ��ü ���]
������
ä�ټ�
���� ��ü ��� �Ϸ�~!!!

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 3

�˻��� ��� �Է� : ä�ټ�

[�˻� ��� ���]
�׸��� �����մϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 3

�˻��� ��� �Է� : ������

[�˻� ��� ���]
�׸��� �������� �ʽ��ϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 4

������ ��� �Է� : ���ѿ�

[���� ��� ���]
�׸��� �������� �ʾ� ������ �� �����ϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 4

������ ��� �Է� : ������

[���� ��� ���]
������ �׸��� �����Ǿ����ϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 5

������ ��� �Է� : ���ϼ�

[���� ��� ���]
������ ����� �������� �ʽ��ϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 5

������ ��� �Է� : ä�ټ�
������ ���� �Է� : ������

[���� ��� ���]
������ �Ϸ�Ǿ����ϴ�.

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 2

[���� ��ü ���]
������
���� ��ü ��� �Ϸ�~!!!

	[ �޴� ���� ]=========
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	======================
>> �޴� ����(1~6) : 

���α׷� ����~!!!
����Ϸ��� �ƹ� Ű�� ��������...
*/

import java.util.Vector;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Enumeration;

class Menus		// �� �ϼ�
{
	public static final int E_ADD = 1;			//-- ��� �߰�
	public static final int E_DISP = 2;			//-- ��� ���
	public static final int E_FIND = 3;			//-- ��� �˻�
	public static final int E_DEL = 4;			//-- ��� ����
	public static final int E_CHA = 5;			//-- ��� ����
	public static final int E_EXIT = 6;			//-- ����
}


public class Test163
{
	// �ֿ� �Ӽ� ���� �� �Ϸ�
	private static final Vector<Object> vt;	//-- �ڷᱸ��
	private static BufferedReader br;		//-- �Է� �� Ȱ��
	private static Integer sel;				//-- ���� ��
	private static String con;				//-- ��� ���� ����
	
	// static �ʱ�ȭ �� �� �ϼ�
	static
	{
		// Vectpr �ڷᱸ�� ����
		vt = new Vector<Object>();

		// BufferedReader ��ü ����
		br = new BufferedReader(new InputStreamReader(System.in));

		// ����� �Է°� �ʱ�ȭ
		sel = 1;
		con = "Y";
	}



	// �޴� ��� �޼ҵ�
	public static void menuDisp()
	{
		// ����ڿ��� �ȳ��ϱ� ���� �޼������� ����ϴ� ���
		// �޴��� �����ϴ� ����� �޼ҵ�(menuSelect())�� ������ �����߱� ������ 
		// �� ���������� ������� ���ð��� �޾ƿ��� �ʾƵ� ������.

		/* ���� �ۼ��� �ڵ���----------------------------
		System.out.println("\t[ �޴� ���� ]=========");
		System.out.println("\t1. ��� �߰�");
		System.out.println("\t2. ��� ���");
		System.out.println("\t3. ��� �˻�");
		System.out.println("\t4. ��� ����");
		System.out.println("\t5. ��� ����");
		System.out.println("\t6. ����");
		System.out.println("\t======================");
		System.out.print(">> �޴� ����(1~6) : ");
		-------------------------------------------------------*/

		System.out.println("\n\n\t[ �޴� ���� ]=========");
		System.out.println("\t1. ��� �߰�");
		System.out.println("\t2. ��� ���");
		System.out.println("\t3. ��� �˻�");
		System.out.println("\t4. ��� ����");
		System.out.println("\t5. ��� ����");
		System.out.println("\t6. ����");
		System.out.println("\t==========================");

		System.out.print(">> �޴� ����(1~6) : ");
		
	}

	// �޴� ���� �޼ҵ�
	public static void menuSelect() throws IOException, NumberFormatException
	{
		// ������ �޴��� ���� ��� �б��
		// munuRun()���� ó���� �����̱� ������
		// �Է°��� �޾ƿ��� ��ɸ� ����

		/* ���� �ۼ��� �ڵ���--------------
		try
		{
			sel = Integer.parseInt(br.readLine());
		}
		catch (NumberFormatException e)
		{
			System.out.println(e.toString());
			System.out.println(">> ���� ������ �����͸� �Է��ؾ� �մϴ�.");
			sel = 0;
		}
		
		System.out.println();	
		---------------------------------------*/

		sel = Integer.parseInt(br.readLine());

	}

	// ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
	public static void menuRun() throws IOException
	{
		// �޴� Ŭ������ Ȱ���Ͽ� ó��
		switch (sel)
		{
		case Menus.E_ADD : addElement(); break;
		case Menus.E_DISP : disElement(); break;
		case Menus.E_FIND : findElement(); break;
		case Menus.E_DEL : delElement(); break;
		case Menus.E_CHA : chaElement(); break;
		case Menus.E_EXIT : exit(); break;	
		default : System.out.println("\t�߸��� �޴� ��ȣ�� �Է��Ͽ����ϴ�.");
		}
	}

	// �ڷᱸ���� ��� �߰�(�Է�) �޼ҵ�
	public static void addElement() throws IOException
	{	
		/* ���� �ۼ��� �ڵ���--------
		do
		{
			int n = vt.size()+1;
			System.out.printf("%d��° ��� �Է� : ", n);
			String name = br.readLine();
			vt.add(name);
			System.out.printf("%d��° ��� �Է� ����~!!!\n",n);
			System.out.print("��� �Է� ���(Y/N)? : ");
			con = br.readLine();	
			
			if (con.toUpperCase().equals("N"))
			{
				break;
			}
			System.out.println();
		}
		while(!con.equals("y") || !con.equals("Y"));
		
		System.out.println();
		--------------------------------*/
		do
		{
			System.out.printf("\n\t%d��° ��� �Է� : ", vt.size()+1);
			String element = br.readLine();
			boolean b = vt.add(element);
			if (b)
			{
				System.out.printf("\n\t%d��° ��� �Է� ����~!!!\n", vt.size());
			}

			System.out.print("\n\t��� �Է� ���(Y/N) : ");
			con = br.readLine().toUpperCase();
		}
		while (con.equals("Y"));
	
			
	}

	// �ڷᱸ�� ��ü ��� ��� �޼ҵ�
	public static void disElement()
	{
		/* ���� �ۼ��� �ڵ���------------------------	
		System.out.println("[���� ��ü ���]");

		for (Object names : vt)
			System.out.println(names);
		
		System.out.println("���� ��ü ��� �Ϸ�~!!!");
		
		System.out.println();
		-------------------------------------------*/
		
		System.out.println("\n\t[���� ��ü ���]");
		for (Enumeration e = vt.elements(); e.hasMoreElements(); )
		{
			System.out.printf("\t%10s\n", e.nextElement());
		}
		System.out.println("\t���� ��ü ��� �Ϸ�~!!!");

	}

	// �ڷᱸ�� �� ��� �˻� �޼ҵ�
	public static void findElement() throws IOException
	{
		/* ���� �ۼ��� �ڵ���------------------
		String str1;
		System.out.print("�˻��� ��� �Է� : ");
		str1 = br.readLine();
		
		System.out.println();
		
		int i = vt.indexOf(str1);
		
		System.out.println("[�˻� ��� ���]");
		if (vt.contains(str1))
		{
			System.out.println("�׸��� �����մϴ�.");
		}
		else
			System.out.println("�׸��� �������� �ʽ��ϴ�");
			System.out.println();
			----------------------------------------*/

		System.out.println("�˻��� ��� �Է� : ");
		String element = br.readLine();

		System.out.println("\n\t[�˻� ��� ���]");
		if (vt.contains(element))
		{
			System.out.println("�׸��� �����մϴ�.");

			// �߰� Ȯ��
			int i = vt.indexOf(element);
			System.out.println("\t(" + element + " ��ġ : " + i + ")");			// ��Ұ� ��� �ִ��� Ȯ���ϴ� �ڵ���� �߰�����
		}
		else
		{	
			System.out.println("�׸��� �������� �ʽ��ϴ�.");
		}
	}


	// �ڷᱸ�� �� ��� ���� �޼ҵ�
	public static void delElement() throws IOException
	{
		/* ���� �ۼ��� �ڵ���-----------
		String str2;
		System.out.print("������ ��� �Է� : ");
		str2 = br.readLine();
		
		System.out.println();
		
		int i = vt.indexOf(str2);
		
		System.out.println("[���� ��� ���]");
		if (vt.contains(str2))
		{
			vt.remove(i);
			System.out.printf("%s �׸��� �����Ǿ����ϴ�.", str2);
			System.out.println();
		}
		else
			System.out.println("�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		
		System.out.println();
		--------------------------------*/

		System.out.print("\n\t������ ��� �Է� : ");
		String element = br.readLine();

		System.out.print("\n\t[���� ��� ���]");
		if (vt.contains(element))
		{
			int i = vt.indexOf(element);
			vt.remove(i);

			System.out.println("\t" + element + " �׸��� �����Ǿ����ϴ�.");

		}
		else
		{
			System.out.println("\t�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		}
		
	}

	// �ڷᱸ�� �� ��� ����(����) �޼ҵ�
	public static void chaElement() throws IOException
	{
		/* ���� �ۼ��� �ڵ���----------------------------------------
		String str3, str4;
		System.out.print("������ ��� �Է� : ");
		str3 = br.readLine();
		
		int i = vt.indexOf(str3);
		
		if (vt.contains(str3))
		{
			System.out.print("������ ���� �Է� : ");
			str4 = br.readLine();
			
			vt.set(i, str4);
			
			System.out.println();
			System.out.println("[���� ��� ���]");
			System.out.println("������ �Ϸ�Ǿ����ϴ�.");
			System.out.println();
		}
		else
		{
			System.out.println();
			System.out.println("[���� ��� ���]");
			System.out.println("������ ����� �������� �ʽ��ϴ�.");
			System.out.println();
		}
		------------------------------------------------------*/
		
		System.out.print("\n\t������ ��� �Է� : ");
		String oldElement = br.readLine();

		if (vt.contains(oldElement))
		{
			int i = vt.indexOf(oldElement);

			System.out.print("\t������ ���� �Է� : ");
			String newElement = br.readLine();

			vt.set(i, newElement);

			System.out.println("\n\t[���� ��� ���]");
			System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
		}
		else
		{
			System.out.println("\n\t[���� ��� ���]");
			System.out.println("\t������ ����� �������� �ʽ��ϴ�.");
		}
		

	
	}
 
	// ���α׷� ���� �޼ҵ� �� �ϼ�
	public static void exit()
	{
		System.out.println("\n���α׷� ����~!!!");
		System.exit(-1);
	}

	// main() �޼ҵ� �� �ϼ�
	public static void main(String[] args) throws IOException, NumberFormatException
	{
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	}
}

// equals ���� == ���� �� �ȵǴ°�?? �� String!