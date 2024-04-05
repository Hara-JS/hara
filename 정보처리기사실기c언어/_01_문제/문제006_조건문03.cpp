#include <stdio.h>

int main(void) {

	int a = 20, b = 30;
	if (a++ <= 20 || ++b > 30) b++;
	printf("%d %d\n", a++ , b);
	return 0;
}

