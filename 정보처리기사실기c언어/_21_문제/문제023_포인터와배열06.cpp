
#include <stdio.h>

int main(void) {

	int num[4] = {1, 2, 3, 4};
	int*pt = num;
	
	pt++;
	*pt++ = 5;
	*pt++ = 10;
	 pt --;
	*pt++ += 20;
	printf("%d, %d, %d %d\n", num[0], num[1], num[2], num[3]);
		
	return 0;
}

