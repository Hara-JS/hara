
#include <stdio.h>

int main(void) {

	int j;
	int sum = 0;
	for (j = 2; j <= 70; j += 5)
		sum = sum + 1;
	printf("%d\n", sum);

	return 0;
}


