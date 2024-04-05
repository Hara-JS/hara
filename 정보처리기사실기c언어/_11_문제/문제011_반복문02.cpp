
#include <stdio.h>

int main(void) {
	int i = 1;
	int c = 0;
	for (i = 1; i <= 2023; i++) {
		if (i % 4 == 0) c++;
	}
	printf("%d\n", c);

	return 0;
}


