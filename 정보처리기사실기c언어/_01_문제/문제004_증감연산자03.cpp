#include <stdio.h>

int main(void) {

	int a = 3, b = 4, c = 2;
	int r1, r2, r3;

	r1 = b <= 4 || c == 2;
	r2 = (a > 0) && (b < 5);

	printf("%d\n", r1 + r2);
	return 0;
}

