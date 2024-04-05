
#include <stdio.h>

int main(void) {

	int i = 0;
	while (1) {
		if (i == 4) {
			break;
		}
		++i;
	}
	printf("i=%d\n", i);
	return 0;
}


