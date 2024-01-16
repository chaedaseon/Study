/*==================================
  ���� �÷��� (Collection) ����
===================================*/
//�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�Test162 �߿�!!!�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
// �ڷᱸ�� ��ü ���� �� ���� ��
// ����� ���� Ŭ���� Ȱ��
// �� �ڷ���

import java.util.Vector;

// Ŭ���� �� ����� ���� �ڷ������� Ȱ��
class MyData
{
	// �ֿ� �Ӽ� ���� �� �ֿ� ���� ����(��� ����)
	private String name;		//-- �̸�
	private int age;			//-- ����

	// getter �� getXxx()
	// setter �� SetXxx()

	// getter �� setter ����
	public String getName()
	{
		return name;
	}

	public void setName(String name)			// ���� ����ִ� ���̱� ������ �� �ڸ����� ��ȯ�Ұ� ����
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	// ������ �� ����� ���� ������(�Ű����� 2���� ������)
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}

	// �� ����� ���� �����ڰ� ������ ���
	//	  default �����ڰ� �ڵ����� ���Ե��� �ʱ� ������
	//	  defautl ������ ������ �����ڸ� ����� ���� �����ڷ�
	//	  �߰� �����ϰ� �Ǵ� ���� �Ϲ����� Ŭ���� ���� ����
	//	  (�ݵ�� �����ؾ� �Ѵٴ� �������� ��Ģ�� ����.)

	// ������ �� ����� ���� ������(�Ű����� ���� ������)
	public MyData()
	{
		//this("", 0);		// �Ʒ� 2���̶� ���� �ڵ�
		name = "";
		age = 0;
	}
	
	/*
	@Override
	public String toString()
	{	
		return "�̸�:" + name + ", " + "����:" + age + "��";
	}
	*/
}

public class Test162
{
	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� ����
		Vector<MyData> v = new Vector<MyData>();			// MyData Ÿ�Ը� ��ҷ� ���� �� �ִ� ����

		// ���� �ڷᱸ�� v ��
		// ���ȯ 73�� / ������ 7�� / ������ 3��
		// ��Ƴ���

		// ��
		/*
		MyData st1 = new MyData();
		st1.setName("���ȯ");
		st1.setAge(74);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("������");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("������");
		st3.setAge(3);
		v.add(st3);
		*/

		// ��
		/*
		MyData st1 = new MyData("���ȯ", 73);
		v.add(st1);
		MyData st2 = new MyData("������", 7);
		v.add(st2);
		MyData st3 = new MyData("������", 3);
		v.add(st3);
		*/

		// ��
		v.add(new MyData("���ȯ", 73));			// ���Ϳ� add ���ִϱ� ������ �� �ִ� ����� ����, �׷��� MyData st1 = new MyData("���ȯ", 73);  v.add(st1);�̷��� ������� �ʰ� �ٷ� �־��൵ �ȴ�.
		v.add(new MyData("������", 7));
		v.add(new MyData("������", 3));

		// ���� �ڷᱸ�� v �� ��� ����(���) ��ü ����ϱ�
		// ���� ��)
		// �̸�:���ȯ, ����:73��
		// �̸�:������, ����:7��
		// �̸�:������, ����:3��

		// �� 
		for (MyData obj : v)
		{
			System.out.printf("�̸�:%s, ����:%d��\n", obj.getName(), obj.getAge());
		}
		System.out.println();
		//--==>> �̸�:���ȯ, ����:73��
		//		 �̸�:������, ����:7��
		//		 �̸�:������, ����:3��

		// ��
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("�̸�:%s, ����:%d��\n", v.elementAt(i).getName(), v.elementAt(i).getAge());
		}
		System.out.println();
		//--==>> �̸�:���ȯ, ����:73��
		//		 �̸�:������, ����:7��
		//		 �̸�:������, ����:3��

		// ��	
		for (int i=0; i<v.size(); i++)
		{
			System.out.printf("�̸�:%s, ����:%d��\n", v.get(i).getName(), v.get(i).getAge());
		}
		System.out.println();
		//--==>> �̸�:���ȯ, ����:73��
		//		 �̸�:������, ����:7��
		//		 �̸�:������, ����:3��

		// ��
		for (Object obj : v)
		{
			System.out.printf("�̸�:%s, ����:%d��\n", ((MyData)obj).getName(), ((MyData)obj).getAge());				//obj�� MyData�� �ٿ�ĳ����
		}
		System.out.println();
		//--==>> �̸�:���ȯ, ����:73��
		//		 �̸�:������, ����:7��
		//		 �̸�:������, ����:3��





		/*
		for (MyData data : v)
			System.out.println(data);
		*/
		/*
		for (int i=0 ;i<v.size() ;i++ )
			System.out.println("�̸�:" + v.get(i).getName() + "," + "����:" + v.get(i).getAge() + "��");
		*/

	}
}
