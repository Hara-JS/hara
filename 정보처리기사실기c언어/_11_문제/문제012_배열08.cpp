#include <stdio.h>
#include <stdlib.h> // srand();
#include <time.h> // time(NULL)

int main(void) {
	int hits[16] = { 0, };
	int n, i = 0;
	srand(time(NULL));

	do {
		i++;
		n = rand() % 6 + 1;
		hits[i] = n;
	} while (i < 6);

	for (i = 0; i < 6; i++) {
		printf("h[%d] = %d \n", i, hits[i]);
	}
	
	return 0;
}


