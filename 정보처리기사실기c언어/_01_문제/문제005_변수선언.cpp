#include <stdio.h>

int main(void) {

	int a = (10, 20);
	printf("%d\n", a);  

	int b = (10, 20, 30);
	printf("%d\n", b); 

	int c = (10, (20, 30), 40);
	printf("%d\n", c);  

	return 0;
}