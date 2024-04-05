
#include <stdio.h>

int main(void) {

	int i, sum = 0;
	for (i = 1; i <= 10; i += 2) {
		if (i % 2 && i % 3) continue;
		// if (i % 2 != 0 && i % 3 != 0) continue;
		printf("%d\n", i);
		sum += i;
	}
	printf("%d\n", sum);
	return 0;
}


