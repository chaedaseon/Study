  // [가이드라인]
  // 프로그램을 구성하는 클래스
  // 1. Record 클래스	→ 학생 한명을 의미하는 클래스 / 
  //    - 속성만 존해하는 클래스로 설계할 것 
 


public class Record
{
	// 학생 1면을 표현할 수 있는 속성들로 구성~~!!!

	String name;					// 학생 이름
	int kor, eng, mat;				// 국어, 영어, 수학 점수 선언	
	int[] score = new int[3];		// score[0] → 국어 점수 score[1] → 영어 점수 score[2] → 수학 점수 
	
	int tot;						// 총점
	double avg;						// 평균
	
	// 추가~~!!
	int rank;						// 등수

}