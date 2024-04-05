
#include <stdio.h> 

int main(void) {

	int a, b;
	a = 2;
	b = 1;
	int c1 = b + a;
	int c2 = b - a;
	int c3 = b * a;
	int c4 = b / a; // 정수형은 몫이 저장된다. 
	int c5 = b % a;

	printf("%d\n", c1);
	printf("%d\n", c2);
	printf("%d\n", c3);
	printf("%d\n", c4);
	printf("%d\n", c5);
	return 0;
}
