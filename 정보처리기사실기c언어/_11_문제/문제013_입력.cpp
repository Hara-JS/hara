#include <stdio.h>
#include <stdlib.h> // srand();
#include <time.h> // time(NULL)

int main(void) {
	// scanf 에 1, 2, 3, 4로 가정하면 9이된다. 
	int ary[4];
	int sum = 0;
	int i;
	for (i = 0; i < 4; i++) {
		scanf("%d", &ary[i]);
	}
	for (i = 3; i > 0; i--) {
		sum += ary[i];
	}
	printf("%d\n", sum);


	return 0;
}


