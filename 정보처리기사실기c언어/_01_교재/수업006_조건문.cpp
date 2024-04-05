#include <stdio.h>

int main(void) {
	/*
		조건문은 내용이 한줄일경우 {} 를 생략할수있다. 
	*/
	int a = 10;
	if (a == 10) a = 30;
	else a = 20;
	printf("%d\n", a);
	return 0;
}