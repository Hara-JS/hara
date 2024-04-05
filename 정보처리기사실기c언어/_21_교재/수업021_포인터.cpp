#include <stdio.h>

int main(void) {

	int a = 10;
	printf("%d \n", a);
	printf("%d \n", &a); // 10진수로 표현
	printf("%p \n", &a); // 16진수로 표현
	return 0;
}

