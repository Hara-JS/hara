#include <stdio.h>
#include <stdlib.h>

// 함수와 전역변수 
int a = 1, b = 2, c =3;
int f();

int main(void) {
	printf("%3d\n", f());
	printf("%3d %3d %3d\n" , a , b , c);
	return 0;
}

int f(){
	int b, c;
	a = b = c = 4;
	return (a + b + c);
}


