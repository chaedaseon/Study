/*=============================================
  ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
  - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
  - Random Ŭ����
==============================================*/

/*
�� java.util.Ranodm Ŭ������

   ���� ������ ������ �߻����� �����ϴ� Ŭ�����̴�.
   Math Ŭ������ ���� �޼ҵ��� random() �޼ҵ嵵 ������ �����ϴ� �޼ҵ�������
   0.0 ~ 1.0 ������ �Ǽ� ���¸� �߻��ϰ� �ǹǷ�
   �ʿ��� ������ ������ ������ ���ؼ��� �߰����� ������ ���� ���·� �����ؾ� �Ѵ�.
   �׷��� �ڹٴ� ���� ������ ������ �߻������ִ�
   ���� Ŭ������ Random Ŭ������ ������ �����ϰ� �ִ�.
*/

// �ζ� ��ȣ ����(���� �߻� ���α׷�)

// ���α׷��� ����Ǹ�...
// �⺻������ �ζ� 5������ �����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
//   3 12 15 24 31 41
//   1 12 18 36 41 52
//   4  9 12 13 22 30
//   5 10 13 14 22 40
//  22 31 36 40 43 44
// ����Ϸ��� �ƹ� Ű�� ��������...

/* ���� �ۼ��� �ڵ�-----------------------------------------------
import java.util.Random;

class Lotto
{
	// �迭 ���� ���� �� �޸� �Ҵ� �� �ζ� ��ȣ�� ��Ƶ� �迭�� 6ĭ
	private int[] num;

	// ������
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		sorting();
		return num;
	}

	// 6���� ������ �߻���Ű�� �޼ҵ� ����
	public void start()
	{
		Random rd = new Random();
		for (int i=0; i<6; i++)
		{
			num[i] = rd.nextInt(45)+1;
			
			for (int j=0; j<i; j++)
			{
				if (num[i] == num[j])
				{
					i--;
				}
			}
		}
		
	}
	
	// ���� �޼ҵ� ����
	private void sorting()
	{
		for (int i=0 ;i<num.length-1 ;i++ )
		{
			for (int j=i+1; j<num.length; j++)
			{
				if (num[i]>num[j])
				{
					num[i]=num[i]^num[j];
					num[j]=num[j]^num[i];
					num[i]=num[i]^num[j];
				}
			}
		}
	}

}
	

public class Test146
{
	public static void main(String[] args)
	{
		// Lotto Ŭ���� ��� �ν��Ͻ� ����
		Lotto lotto = new Lotto();
		
		// �⺻ 5����

		for (int i=0; i<5; i++)
		{
			// �ζ� 1���� ����
			lotto.start();
			int[] rdArr = lotto.getNum();
			
			// ��� ���
			for (int j=0; j<6; j++)
			{
				System.out.printf("%3d", rdArr[j]);
			}
			System.out.println();
		
		}
	}
}
--------------------------------------------------------------*/

// ���� �ۼ��� �ڵ�

import java.util.Random;
import java.util.Arrays;

class Lotto
{
	// �迭 ���� ���� �� �޸� �Ҵ� �� �ζ� ��ȣ�� ��Ƶ� �迭�� 6ĭ
	private int[] num;

	// ������
	Lotto()
	{
		num = new int[6];
	}

	public int[] getNum()
	{
		return num;
	}

	// 6���� ������ �߻���Ű�� �޼ҵ� ����
	public void start()
	{
		// Random �ν��Ͻ� ����
		Random rd = new Random();
		int n;
		int cnt = 0;

		jump:							// ����� ����������. �����ݷ� �ƴ� �ݷ� ���! ����� ����� ����

		while (cnt < 6)					// cnt �� 0 1 2 3 4 5
		{
			n = rd.nextInt(45) + 1;		// 0 ~ 44 �� ��+1�� �� 1 ~ 45

			for (int i=0; i<cnt; i++)
			{
				// num[i] ��ҿ� n �� ��
				if (num[i] == n)
					continue jump;			// ���⿡�� �� �ڵ� ���� : �ߺ��� ���� ����� �׷� jump�ؼ� ���� ���������� �ٽ� ���غ���~
			}

			num[cnt++] = n;
		}

		// ���� �޼ҵ� ȣ��
		sorting();
		
	}
	
	// ���� �޼ҵ� ����
	private void sorting()
	{
		Arrays.sort(num);
	}

}




public class Test146
{
	public static void main(String[] args)
	{
		// Lotto Ŭ���� ��� �ν��Ͻ� ����
		Lotto lotto = new Lotto();

		// �⺻ 5 ����
		for (int i=1; i<=5; i++)
		{
			// �ζ� 1���� ����
			lotto.start();

			// ��� ���
			for (int n : lotto.getNum())
			{
				System.out.printf("%3d", n);
			}
			System.out.println();
		}
		
	}
}

// ���� ���
/*
  2 14 17 28 32 45
  7  9 21 28 35 44
  3  8 17 21 25 45
  2  4 11 27 29 35
 11 14 15 25 39 41
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

/*
  9 14 17 35 38 43
  5  9 24 29 33 37
  4 11 17 22 24 40
  5  8 15 25 30 43
  6 15 26 32 41 45
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/