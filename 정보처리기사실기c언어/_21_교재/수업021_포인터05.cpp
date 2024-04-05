#include <stdio.h>

int main(void) {

	char c; // 1
	int n;  // 4
	double d; // 8
	printf("%d %d %d \n\n\n", sizeof(c), sizeof(n), sizeof(d));
	char* cpt;
	int* npt;
	double* dpt;

	printf("%d %d %d  \n\n\n", sizeof(cpt), sizeof(npt), sizeof(dpt));
	return 0;
}

