#include <stdio.h> 

int main(void) {

	int a, b;

	a = 4 * (1 / 2);
	b = a++;
	printf("%d", b);
	return 0;
}