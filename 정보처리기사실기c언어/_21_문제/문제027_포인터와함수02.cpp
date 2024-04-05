#include <stdio.h>
#include <stdlib.h>

int foo(int a, int *b);

int main(void) {
	int a = 5;
	int b = 3;
	int c = 0;
	b = foo(a , &c);
	printf("a = %d b = %d c = %d\n", a , b, c);
	c = foo(b , &a);
	printf("a = %d b = %d c = %d\n", a , b, c);
	return 0;
}

int foo(int a, int *b){
	int c;
	*b = a + 1;
	c = a - 1;
	return c;
}


