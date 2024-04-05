
#include <stdio.h>

int main(void) {

	// 최대공약수 
	int a = 1, sum = 0;
	while (a++ <= 5) {
		if (a % 2 != 0)
			continue;
		sum = sum + a;
	}
	printf("%d\n", sum);
	return 0;
}


