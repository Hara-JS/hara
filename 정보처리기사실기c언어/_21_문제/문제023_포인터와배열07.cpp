#include <stdio.h>

int main(void) {

	int array[] = {100, 200, 300, 400, 500};
	int * ptr;
	ptr = array;
	printf("%d\n", *(ptr + 3) + 100);
		
	return 0;
}

