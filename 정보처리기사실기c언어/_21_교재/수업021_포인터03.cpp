#include <stdio.h>

int main(void) {
	
	int* p = 0;
	int n = 10;
	p = &n;

	n += 1;
	
	printf("%d \n", *p); 

	*p += 1;

	printf("%d \n", n);

	printf("%d \n", (*p)++);

	printf("%d \n", n);

	return 0;
}

