#include <stdio.h>

int main(void) {

	int a = (10, 20);
	printf("%d\n", a);  // 20

	int b = (10, (20, 30));
	printf("%d\n", b);  // 30


	int c = (10, (20, 30) ,40 , 50);
	printf("%d\n", c);  // 50
	
	return 0;
}