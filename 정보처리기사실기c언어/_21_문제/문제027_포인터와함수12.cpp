#include <stdio.h>
void func();

int a = 10;
int b = 20;
int c = 30;

int main(void) {
	func();
	func();
	printf("%d %d %d\n" , a , b , c);	
	
	return 0;
}

void func(){
	static int a = 100;
	int b = 200;
	a ++;
	b ++;
	c = a;
}

