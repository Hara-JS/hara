#include <stdio.h>

int main(void) {
	int a = 1, b = 2, c = 3;
	{
		int b = 4, c = 5;
		a = b;
		{
			int c;
			c = b;
		}
		printf("%d %d %d\n", a, b, c); 
	}
	return 0;
}