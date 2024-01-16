/*=============================================
  ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
  - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
  - Calendar Ŭ����
==============================================*/

/*
�� java.util.Calendar Ŭ������
   ��¥�� �ð��� ��ü �𵨸�ȭ �� Ŭ������
   ��, ��, ��, ����, ��, ��, �� ������
   �ð��� ��¥�� ���õ� ������ �����Ѵ�.
   �׸���, Calendar Ŭ������ �߻�Ŭ�����̹Ƿ� ���� ��ü�� ������ �� ������
   �������� �޼ҵ� ������ Calendar Ŭ������ ���� Ŭ������
   GregorianCalendar Ŭ������ ���ǵǾ� �ִ�.

   �ý������κ��� ���� �ý��� �ð� ������ ���� ��
   getInstance() ��� ����(static) �޼ҵ带 �̿��Ͽ� ��ü�� ������ �� �ִ�.
   ������ Calendar Ŭ���� ��ü�� �ý����� ���� ��¥�� �ð� ������ ������,
   �� ��ü�� �����Ǹ� ���� �ִ� �ð� ��������
   get() �޼ҵ带 �̿��Ͽ� ���� ������(�����) �� �ִ�.

   getInstance() �޼ҵ�� ���������� GregorianCalendar ��ü�� �����Ͽ�
   ��ȯ�� �ֱ� ������ GregorianCalendar ��ü�� ���� �����Ͽ� ��¥ �ð� ������
   ���� ���� �ִ�.
*/

/*
�� �ǽ� ����
   
   ����ڷκ��� ��, ���� �Է� �޾�
   �޷��� �׷��ִ�(����ϴ�) ���α׷��� �����Ѵ�.
   ��, Calendar Ŭ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
   �� API Document �����Ͽ� getActualMaximum() �޼ҵ��� Ȱ�� ��� ������ �� ~!!!

���� ��_
���� �Է� : 0
���� �Է� : 2024
�� �Է�   : -10
�� �Է�   : 13
�� �Է� : 5

	[ 2024�� 5�� ]

 ��  ��  ȭ  ��  ��  ��  ��
===========================
              1   2   3   4
  5   6   7   8   9  10  11
 12  13  14  15  16  17  18
 19  20  21  22  23  24  25
 26  27  28  29 30  31
===========================


*/

/* ���� �ۼ��� �ڵ�-------------------------------------------------------
import java.util.Scanner;
import java.util.Calendar;
import java.util.Calendar;


public class Test143 
{
	public static void main(String[] args) 
	{
		Scanner sc = new Scanner(System.in);

		int y, m, d;
		d=1;

		do
		{
			System.out.print("���� �Է� : ");
			y = sc.nextInt();
		}
		while (y<1);

		do
		{
			System.out.print("�� �Է� : ");
			m = sc.nextInt()+1;
		}
		while (m<1 || m>12);

		System.out.printf("	[ %d�� %d�� ]\n", y, m-1);
		System.out.println();
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("============================");

		

		Calendar cal = Calendar.getInstance();

		cal.set(y, m, d);

		d = cal.get(Calendar.DAY_OF_WEEK);


		for (int i=0; i<=d; i++)
		{
			System.out.print("    ");						
		}

		 
		for (int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++ )
		{
			System.out.printf("%4d", i);
			d++;
	
			if (d%7==6 || i==cal.getActualMaximum(Calendar.DATE))
			{
				System.out.println();
			}
		}

		System.out.println("============================");

	}
}
------------------------------------------------------------------------------*/

// ���� �ۼ��� �ڵ�
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Calendar;


public class Test143
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// Calendar �ν��Ͻ� ����
		Calendar cal = Calendar.getInstance();

		// �ֿ� ���� ����
		int y, m;		//-- ��, ��
		int w;			//-- ����
		int i;			//-- ���� ����

		do
		{
			System.out.print("���� �Է� : ");
			y = Integer.parseInt(br.readLine());
		}
		while (y<1);

		do
		{
			System.out.print("�� �Է�   : ");
			m = Integer.parseInt(br.readLine());
		}
		while (m<1 || m>12);

		// ����ڷκ��� �Է¹��� ��(y), ��(m)�� �̿��Ͽ�
		// �޷��� ��¥ ����
		cal.set(y, m-1, 1);				// ��� ���� 1�Ϻ��� �����ϴϱ� 1�� ����
		//-- �� ���� �� �Է°�(m)�� �״�� ����ϴ� ���� �ƴ϶�
		//	 �Է°����� 1�� �� ������ ���� �����ؾ� �Ѵ�.
		//-- �� ���� �� �Է¹��� ��, ���� �ش��ϴ� 1�Ϸ� �����ؾ� �Ѵ�.
		//	 1���� ������ Ȯ���ؾ� �޷��� �׸� �� �ִ�.


		// ���õ� �޷��� ��¥�κ��� ���� ��������
		w = cal.get(Calendar.DAY_OF_WEEK);

		// �׽�Ʈ(Ȯ��)
		//System.out.println("w : " + w);
		//--==>> ���� �Է� : 2023
		//		 �� �Է�   : 12
		//	     w : 6 �� 2023�� 12�� ���� �� �ݿ��� �� 2023�� 12�� 1���� �ݿ���~!!!


		// ��� ��� �� �޷� �׸���
		System.out.println();
		System.out.println("\t[ " + y + "��" + m + "�� ]\n");
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("============================");

		for (i=1; i<w; i++)
		{
			System.out.print("    ");	// ���� 4ĭ �߻�
		}

		// �׽�Ʈ(Ȯ��)
		//System.out.printf("%4d", 1);

		// �׽�Ʈ(Ȯ��)
		// System.out.println(cal.getActualMaximum(Calendar.DATE));

		// Calendar Ŭ���� ��getActualMaximum()�� �޼ҵ�		check~!!!	��ȿ�� �ִ밪�� �̾Ƴ��� �޼ҵ�	
		for (i=1; i<=cal.getActualMaximum(Calendar.DATE); i++)			
		{
			System.out.printf("%4d", i);
			w++;							//-- �ݺ����� �����ϸ� ��¥�� ������ �� ����
											//   ���ϵ� �Բ� ������ �� �ֵ��� ó��
			if (w%7==1)						//-- �̷��� ������ ������ �Ͽ����� �� �� ����
				System.out.println();		//   ���� �� ��µ� �� �ֵ��� ó��	 
		}
		
		if (w%7!=1)							//-- �Ͽ��� ������ ������� ���� ��쿡��...
			System.out.println();			//-- ���� ó��

		System.out.println("============================");
		
	}
}

// ���� ���
/*
���� �Է� : 2023
�� �Է�   : 9

        [ 2023��9�� ]

  ��  ��  ȭ  ��  ��  ��  ��
============================
                       1   2
   3   4   5   6   7   8   9
  10  11  12  13  14  15  16
  17  18  19  20  21  22  23
  24  25  26  27  28  29  30
============================
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/

/*
���� �Է� : -10
���� �Է� : 0
���� �Է� : 2024
�� �Է�   : -5
�� �Է�   : 13
�� �Է�   : 5

        [ 2024��5�� ]

  ��  ��  ȭ  ��  ��  ��  ��
============================
               1   2   3   4
   5   6   7   8   9  10  11
  12  13  14  15  16  17  18
  19  20  21  22  23  24  25
  26  27  28  29  30  31
============================
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
���� �Է� : 2024
�� �Է�   : 2

        [ 2024��2�� ]

  ��  ��  ȭ  ��  ��  ��  ��
============================
                   1   2   3
   4   5   6   7   8   9  10
  11  12  13  14  15  16  17
  18  19  20  21  22  23  24
  25  26  27  28  29
============================
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
