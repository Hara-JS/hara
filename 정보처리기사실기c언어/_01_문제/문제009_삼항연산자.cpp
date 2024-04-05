
#include <stdio.h>

int main(void) {
	int a, b;
	a = 20;
	b = (a > 10) ? a + a : a * a;
	printf("b=%d\n", b);
	return 0;

}


