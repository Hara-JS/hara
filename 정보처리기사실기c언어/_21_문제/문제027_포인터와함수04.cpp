#include <stdio.h>
#include <stdlib.h>

void change(int *px, int* py, int pc, int pd);

int main(void) {
	int a = 10, b = 20, c = 30, d = 40;
	change(&a, &b, c, d);
	printf("%d %d %d %d", a , b, c, d);
	return 0;
}

void change(int *px, int* py, int pc, int pd){
	*px = *py + pd;
	*py =pc + pd;
	pc = *px + pd;
	pd = *px + *py;
}



