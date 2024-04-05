#include <stdio.h>

void temp(int a, int b) {
	a = 30;
	b = 40;
	printf("temp() ==> %d %d \n", a, b);
}

int main(void) {

	int a = 10;
	int b = 20;
	temp(a, b);
	// 값이 전혀 바뀌지않는다. 
	printf("main() ==> %d %d \n", a , b);

	return 0;
}

