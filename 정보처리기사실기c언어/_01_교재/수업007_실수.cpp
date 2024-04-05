#include <stdio.h>

int main(void) {

	/*
		실수 자료형
		double 8바이트
		float  4바이트
	*/
	float f_value = 5.65;
	float f_value2 = 5.61;
	printf("%f %f \n", f_value, f_value2 );

	// 자리수제한 .두번째 자리에서는 반올림한다. 
	printf("%.1f %.1f  \n", f_value, f_value2);


	return 0;
}

