#include <stdio.h>

int main(void) {

	int i;
	int a[] = { 10, 20, 30, 40, 50, 60, 70, 80 , 90, 100 };
	int* ptr = a + 3;
	printf("%d\n", *ptr);
	printf("%d\n", *ptr + 1);
	printf("%d\n", ptr);
	printf("%d\n", ptr + 1);
	printf("%d\n", ptr - 3);
	printf("%d\n", ptr + 1 - 3);
	printf("%d\n", *ptr + 1);
	printf("%d\n", *(ptr + 1));
	printf("%d\n", *ptr + 1 - 3);
	printf("%d\n", *(ptr + 1) - 3);
	
	return 0;
}

