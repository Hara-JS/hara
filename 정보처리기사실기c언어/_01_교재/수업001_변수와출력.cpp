#include <stdio.h> // printf 를 사용할수있게 해준다. 

int main(void) { // c언어는 main 함수를 필수로 만들어야한다. 

	// int 는 정수형 자료형이다. 
	// = 은 대입연산자이다.  
	// ; 은 문장의 마침표이다. 
	// c언어는 사용하는 모든변수를 미리선언하고 코딩한다. 

	//int a = 1; int b = 2; int c = 3; 

	int a = 1, b = 2, c = 3; // 변수는, 로 연속으로 선언할수있다. 

	printf("%d\n", a); // 각자 출력 
	printf("%d\n", b); // \n은 줄바꿈
	printf("%d\n", c);
	printf("%d %d %d\n", a, b, c);  // 한줄로 출력 
	
	return 0;
}