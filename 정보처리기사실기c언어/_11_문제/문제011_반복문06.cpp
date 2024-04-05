
#include <stdio.h>

int main(void) {

	int a, b;
	a = 2;
	while (a-- > 0) {
		printf("a = %d\n", a);
	}
	for (b = 0; b < 2; b++) {
		printf("a = %d\n", a++);
	}
	return 0;
}


