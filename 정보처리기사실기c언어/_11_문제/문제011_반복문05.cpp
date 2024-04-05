
#include <stdio.h>

int main(void) {

	int c = 0;
	int i = 0;
	while (i < 10) {
		i++;
		c *= i;
	}
	printf("%d\n", c);

	return 0;
}


