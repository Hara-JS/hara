#include <stdio.h> 

int main(void) {

	int a = 5, b = 5;
	a *= 3 + b++;

	printf("%d %d\n", a, b);

	return 0;
}

/*
	[해설]
		a = 5, b = 5

		a *= 3 + b++;
		[1] x = 3 + b; // 8
		[2] a = a * x; // 40
		[3] b = b + 1; // 6
*/