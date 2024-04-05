#include <stdio.h>

int main(void) {

	/*
		실수 자료형
		double 8바이트
		float  4바이트
	*/
	double d_value = 5.65;
	double d_value2 = 5.61;
	printf("%f %f \n", d_value, d_value2);

	// 자리수제한 .두번째 자리에서 반올림한다. 
	printf("%.1f %.1f \n", d_value, d_value2);

	return 0;
}

