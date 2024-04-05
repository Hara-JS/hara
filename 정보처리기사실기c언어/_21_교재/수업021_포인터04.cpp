#include <stdio.h>

int main(void) {

	int* p = 0;
	int n = 10;
	p = &n;

	printf("%d\n", &n);
	printf("%d\n", p);
	printf("%d\n", *&p);
	printf("%d\n", &p);


	return 0;
}

