#include <stdio.h>
#include <stdlib.h>

double h(double *f, int d, double x){
	int i;
	double res = 0.0;
	for(i = d-1; i >= 0; i--){
		res = res * x + f[i];
		printf("%3.1f \n" , res);
	}
	return res;
}

int main(void) {
	double f[] = {1, 2, 3, 4};
	double res = h(f, 4, 2);
	printf("%3.1f \n" , res);
	return 0;
}


// 102번 


