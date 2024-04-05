#include <stdio.h>

void plus(int a, int b) {
	printf("%d\n", a + b);
}
void minus(int a, int b) {
	printf("%d\n", a - b);
}

int main(void) {
	plus(10, 3);
	minus(10, 3);

	return 0;
}

