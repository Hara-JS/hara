
#include <stdio.h>

int main(void) {

	int i, j, sum = 0;
	for (i = 1; i < 10; i++) {
		for (j = 1; j < 10; j++) {
			if (j % 3 == 0) continue;
			if (i % 4 == 0) break;
			printf("[%d, %d]", i , j);
			sum++;
		}
		printf("\n");
	}
	printf("%d\n", sum);
	return 0;
}


