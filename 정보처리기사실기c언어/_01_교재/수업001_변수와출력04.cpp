#include <stdio.h>
#include <stdlib.h> // srand();
#include <time.h> // time(NULL)

int main(void) {
	
	srand(time(NULL));

	int n = rand() % 6 + 1; // 1~6
	printf("%d ", n);

	return 0;
}


