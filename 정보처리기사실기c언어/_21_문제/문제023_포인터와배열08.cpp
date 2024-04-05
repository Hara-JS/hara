#include <stdio.h>

int main(void) {

	int array[] = {10, 11, 12, 13, 14};
	int * p;
	p = array;
	printf("%d\n", array[1]); 	// 11
	printf("%d\n", *p + 1);  	// 11
	printf("%d\n", *array + 1); // 11
	printf("%d\n", *p++); 		// 10
		
	return 0;
}

