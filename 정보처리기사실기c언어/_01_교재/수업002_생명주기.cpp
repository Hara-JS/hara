#include <stdio.h> 

int main(void) { 

	int a = 1, b = 2, c = 3; 
	printf("%d %d %d\n", a, b, c);  

	{
		int a = 4;
		b = a;
		printf("%d %d %d\n", a, b, c);
		{
			int c = 60;
			a = c;
			printf("%d %d %d\n", a, b, c);
		}
	}
	return 0;
}