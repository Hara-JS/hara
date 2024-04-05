#include <stdio.h>

int main(void) {

	int a[4] = {1, 2, 3};
	int*p = a;
	
	p++;
	*p++ = 10;
	*p += 10;
	 
	printf("%d, %d, %d\n", a[0], a[1], a[2]);
		
	return 0;
}

