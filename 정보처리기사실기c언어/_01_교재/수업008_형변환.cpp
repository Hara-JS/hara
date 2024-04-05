#include <stdio.h>

int main(void) {

	/*
		실수 자료형
		double 8바이트
		float  4바이트
	*/

	float f_value = 5.61;
	double d_value = 5.65;
	int n1 = (int)f_value;
	int n2 = (int)d_value;
	printf("%d %d\n", n1, n2);
	return 0;
}

