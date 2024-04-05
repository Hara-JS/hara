
#include <stdio.h>

int main(void) {


	/*
	삼항연산자
	변수 = (조건) ? 참 : 거짓;
	조건이참이면 ? 뒤의값 이 변수에저장
	조건이거짓이면 : 뒤의 값이 변수에저장
*/
	int a, b;
	a = 10;
	b = (a != 10) ? a + a : a * a;
	printf("b=%d\n", b);
	return 0;
}


