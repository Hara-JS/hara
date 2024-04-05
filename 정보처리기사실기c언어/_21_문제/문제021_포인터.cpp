#include <stdio.h>

int main(void) {

	int A = 10, B;
	int* C = &B;
	B = A--;
	B += 20;
	printf("%d", *C);

	return 0;
}

