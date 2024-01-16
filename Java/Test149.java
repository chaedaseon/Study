/*==============================================
  ���� ���� ó�� (Excptoin Handling) ����
==============================================*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test149
{
	private String[] data = new String[3];

	public void proc() // throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n=0;

		try
		{
			System.out.print("�̸� �Է�(����:Ctrl+z) : ");
			while ((str=br.readLine()) != null)
			{
				data[n++] = str;
				System.out.print("�̸� �Է�(����:Ctrl+z) : ");
			}

			System.out.println("�Էµ� ����............");
			for (String s : data)
			{
				if (s != null)
				{
					System.out.println(s);
				}
			}			
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
			System.out.println("�� checked exception �� ���� ó��");
		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			System.out.println("�迭 �ε��� ���� ���� �߻�~!!!");
			System.out.println("e.getMessage() : " + e.getMessage());
			System.out.println("e.toString() : " + e.toString());
			System.out.println("printStackTrace..........................");
			e.printStackTrace();
		}




	}


	public static void main(String[] args)				// ������ try~catch�� ���� ó�� ���༭ throws IOException ���ص� ��(EOD�� �ͼ� ��ź �ذ�����)
	{
		Test149 ob = new Test149();
		ob.proc();
		
	}
}