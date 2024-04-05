#include <stdio.h>

int main(void) {
	// 포인터변수 (일반변수의 주소를 저장할수있다.)
	int* p = 0;
	int n = 10;

	p = &n;

	/*
		포인터변수의 기능
		*p ==> 저장된주소가있으면 주소로이동해 값을 출력한다.
	*/

	printf("%d %d\n", *p , n); // 값출력
	printf("%d %d\n", p, &n);  // 주소출력

	return 0;
}

