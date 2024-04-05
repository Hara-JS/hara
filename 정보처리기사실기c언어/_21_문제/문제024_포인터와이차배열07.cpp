
#include <stdio.h>
#include <stdlib.h>

int main(void) {
	// 심화 pass
	int arr[2][3] = {10, 20, 30, 40, 50, 60};
	int(*p)[3] = NULL;
	p = arr;
	printf("%d\n" , *(p[0] + 1));
	printf("%d\n" , *(p[1] + 2));
	printf("%d\n" , *(*(p + 1) + 0));
	printf("%d\n" , *(*(p + 1) + 1));

	return 0;
}


