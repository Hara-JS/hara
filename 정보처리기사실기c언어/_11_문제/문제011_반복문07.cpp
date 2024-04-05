
#include <stdio.h>

int main(void) {

	// 최대공약수 
	int a = 120, b = 45;
	while (a != b) {
		if (a > b) a = a - b;
		else b = b - a;
	}
	printf("%d\n", a);
	return 0;
}


