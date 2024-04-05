#include <stdio.h>

int main(void) {

	int arr[] = {8, 5, 3, 1, 2, 7, 9};
	
	int *p = arr + 2, a = 0, b = 0;
	a = *++p;
	b = (*p)++;
	printf("%d, %d\n", a, b);
		
	return 0;
}

