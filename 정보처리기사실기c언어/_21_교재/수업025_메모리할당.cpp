
#include <stdio.h>
#include <stdlib.h>

int main(void) {
	// mallic은 pass
	int * p = (int*)malloc(12);
	free(p);
	p = NULL;
	return 0;
}


