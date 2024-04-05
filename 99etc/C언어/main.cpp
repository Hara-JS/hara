#include <stdio.h> // printf() 
#include <stdlib.h> // srand()
#include <time.h> // time(NULL)


int main(void) {

	srand(time(NULL));
	printf("%d\n", rand);
	int n = rand() % 6 + 1;
	printf("%d ", n);
	
	return 0;
}

// main()
