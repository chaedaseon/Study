/*======================================================
  ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=======================================================*/

import java.util.Stack;

public class Test155
{
	// ���� ���ڿ� �迭 ���� �� �ʱ�ȭ
	private static final String[] colors = {"����", "���", "�ʷ�", "�Ķ�", "����"};
	
	// ������
	public Test155()
	{
		// st��� Stack �ڷᱸ�� ����
		// ���ʸ��� Ȱ���Ͽ� �ڷᱸ���� ���� �����Ϳ� ���� ǥ�� �� ��<String>��
		 Stack<String> st = new Stack<String>();

		 // st ��� Stack �ڷᱸ���� ������(colors) ���
		 //st = colors;					// �̷��� ��Ƴ��°� �ƴ�!!
			
		 /*
		 st.push(colors[0]);		// st.add(colors[0]);  �̷��Ե� ���� �� ����!
		 st.push(colors[1]);		// st.add(colors[1]);
		 st.push(colors[2]);		// st.add(colors[2]);
		 st.push(colors[3]);		// st.add(colors[3]);
		 st.push(colors[4]);		// st.add(colors[4]);
		 st.push(colors[5]);		// st.add(colors[5]);
		 */
		
		 /*
		 for (int i=0; i<colors.length; i++)
		 {
			 st.push(colors[i]);	// st.add(colors[i]);  ������ ����~!
		 }
		 */

		 // ���� for each������ �ٽ� �ۼ��غ���~! �� for ���̶� ������ �ǹ�
		 for (String color : colors )
		 {
			 st.push(color);		//st.add(colors);
		 }

		 //st.push(10.0);				���ʸ����� String�� ��ڴٰ� �����߱� ������  String�� �ƴϸ� ���� �� ����.
		 //st.push(10);
		 //--==>> ���� �߻�(������ ����)
		 //-- ���ʸ� ǥ������ ���� �����ϰ� �ִ�
		 //	  String �� �ƴ� �ٸ� �ڷ���(double �̳� int)��
		 //	  ���� �ڷᱸ�� st�� push() �Ϸ��� �߱� ������....

		 st.push("����");				// �̰� String�̶� ���� �� �ִ�.!

		 // ��� �޼ҵ� ȣ��
		 popStack(st);
		 
	 }

	// ��� �޼ҵ�
	private void popStack(Stack<String> st)		// ������ �̸��� st�� �ٽ� �� �� �ִ�.
	{
		System.out.print("pop : ");
		//System.out.println(st);				// �̷��� ���� �ȵȴ�.
		while (!st.empty())						// empty() = isEmpty()�� ����~!  
		{
			System.out.print(st.pop() + " " );
		}
		System.out.println();
		
	}

	public static void main (String[] args)
	{
		new Test155();
	}
}

// ���� ���

// pop : ���� �Ķ� �ʷ� ��� ����

// pop : ���� ���� �Ķ� �ʷ� ��� ����