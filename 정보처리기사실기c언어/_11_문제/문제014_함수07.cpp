#include <stdio.h>
#include <stdlib.h>
int a = 10;
int b = 20;
int c = 30;

void func(void)
{
	static int a = 100;
	int b = 200;
	a++;
	b++;
	c = a;
}

int main(void) {
	func();
	func();
	
	printf("a = %d, b = %d, c = %d\n", a, b, c);
	
	return 0;
}


